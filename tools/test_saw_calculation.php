<?php
/**
 * Test SAW (Simple Additive Weighting) Calculation
 *
 * This script tests the SAW calculation logic to verify correctness
 * of the normalization and weighted scoring algorithms.
 *
 * Usage: php tools/test_saw_calculation.php
 */

// Test data: Sample criteria with weights and types
$test_criteria = [
    1 => ['id_criteria' => 1, 'criteria_name' => 'Grade', 'weight' => 0.30, 'type' => 'benefit'],
    2 => ['id_criteria' => 2, 'criteria_name' => 'Classification', 'weight' => 0.40, 'type' => 'benefit'],
    3 => ['id_criteria' => 3, 'criteria_name' => 'Inspection Period', 'weight' => 0.30, 'type' => 'cost'],
];

// Test data: Sample equipment with raw values
$test_equipment = [
    ['id' => 1, 'name' => 'Equipment A', 'raw' => [1 => 4, 2 => 5, 3 => 2]],
    ['id' => 2, 'name' => 'Equipment B', 'raw' => [1 => 3, 2 => 4, 3 => 4]],
    ['id' => 3, 'name' => 'Equipment C', 'raw' => [1 => 2, 2 => 3, 3 => 6]],
];

/**
 * Perform SAW normalization
 */
function normalize_saw($equipment, $criteria) {
    $normalized = [];
    
    // Calculate max and min for each criterion
    foreach ($criteria as $cid => $meta) {
        $values = array_map(fn($eq) => $eq['raw'][$cid] ?? 0, $equipment);
        $max_val = max($values);
        $min_val = min($values);
        
        foreach ($equipment as $eq) {
            $x = $eq['raw'][$cid] ?? 0;
            
            if ($meta['type'] === 'benefit') {
                // Benefit: higher is better (x / max)
                $r = ($max_val > 0) ? ($x / $max_val) : 0;
            } else {
                // Cost: lower is better (min / x)
                $r = ($x > 0) ? ($min_val / $x) : 0;
            }
            
            $normalized[$eq['id']][$cid] = $r;
        }
    }
    
    return $normalized;
}

/**
 * Calculate weighted scores
 */
function calculate_scores($normalized, $criteria, $equipment) {
    $results = [];
    
    foreach ($equipment as $eq) {
        $total = 0;
        
        foreach ($criteria as $cid => $meta) {
            $weight = (float) $meta['weight'];
            $norm_value = $normalized[$eq['id']][$cid] ?? 0;
            $total += $norm_value * $weight;
        }
        
        $results[$eq['id']] = [
            'name' => $eq['name'],
            'score' => $total
        ];
    }
    
    return $results;
}

/**
 * Run the SAW calculation test
 */
function run_test() {
    global $test_criteria, $test_equipment;
    
    echo "===========================================\n";
    echo "  SAW Calculation Test\n";
    echo "===========================================\n\n";
    
    // Display test criteria
    echo "Test Criteria:\n";
    echo "-------------\n";
    foreach ($test_criteria as $c) {
        printf("  %s: Weight=%.2f, Type=%s\n", 
            $c['criteria_name'], $c['weight'], $c['type']);
    }
    echo "\n";
    
    // Display raw values
    echo "Raw Values Matrix:\n";
    echo "-----------------\n";
    printf("%-15s", "Equipment");
    foreach ($test_criteria as $c) {
        printf("%-15s", $c['criteria_name']);
    }
    echo "\n";
    
    foreach ($test_equipment as $eq) {
        printf("%-15s", $eq['name']);
        foreach ($test_criteria as $cid => $c) {
            printf("%-15s", $eq['raw'][$cid]);
        }
        echo "\n";
    }
    echo "\n";
    
    // Perform normalization
    $normalized = normalize_saw($test_equipment, $test_criteria);
    
    echo "Normalized Values Matrix:\n";
    echo "------------------------\n";
    printf("%-15s", "Equipment");
    foreach ($test_criteria as $c) {
        printf("%-15s", $c['criteria_name']);
    }
    echo "\n";
    
    foreach ($test_equipment as $eq) {
        printf("%-15s", $eq['name']);
        foreach ($test_criteria as $cid => $c) {
            printf("%-15.4f", $normalized[$eq['id']][$cid]);
        }
        echo "\n";
    }
    echo "\n";
    
    // Calculate scores
    $results = calculate_scores($normalized, $test_criteria, $test_equipment);
    
    echo "Final Scores:\n";
    echo "-------------\n";
    
    // Sort by score descending
    uasort($results, fn($a, $b) => $b['score'] <=> $a['score']);
    
    $rank = 1;
    foreach ($results as $id => $res) {
        printf("  Rank %d: %s - Score: %.4f\n", 
            $rank++, $res['name'], $res['score']);
    }
    echo "\n";
    
    // Validation checks
    echo "Validation Tests:\n";
    echo "-----------------\n";
    
    $tests_passed = 0;
    $tests_total = 0;
    
    // Test 1: Check weights sum to approximately 1.0
    $tests_total++;
    $weight_sum = array_sum(array_column($test_criteria, 'weight'));
    if (abs($weight_sum - 1.0) < 0.001) {
        echo "  [PASS] Weights sum to 1.0 (actual: $weight_sum)\n";
        $tests_passed++;
    } else {
        echo "  [FAIL] Weights should sum to 1.0 (actual: $weight_sum)\n";
    }
    
    // Test 2: Check all normalized values are between 0 and 1
    $tests_total++;
    $all_in_range = true;
    foreach ($normalized as $eq_id => $values) {
        foreach ($values as $cid => $val) {
            if ($val < 0 || $val > 1) {
                $all_in_range = false;
                break 2;
            }
        }
    }
    if ($all_in_range) {
        echo "  [PASS] All normalized values are in [0, 1] range\n";
        $tests_passed++;
    } else {
        echo "  [FAIL] Some normalized values are outside [0, 1] range\n";
    }
    
    // Test 3: Check final scores are between 0 and 1
    $tests_total++;
    $scores_in_range = true;
    foreach ($results as $res) {
        if ($res['score'] < 0 || $res['score'] > 1) {
            $scores_in_range = false;
            break;
        }
    }
    if ($scores_in_range) {
        echo "  [PASS] All final scores are in [0, 1] range\n";
        $tests_passed++;
    } else {
        echo "  [FAIL] Some final scores are outside [0, 1] range\n";
    }
    
    // Test 4: Verify benefit normalization (max value should normalize to 1)
    $tests_total++;
    $benefit_test_passed = true;
    foreach ($test_criteria as $cid => $c) {
        if ($c['type'] === 'benefit') {
            $max_val = max(array_map(fn($eq) => $eq['raw'][$cid], $test_equipment));
            // Find first equipment with max value
            $eq_with_max = null;
            foreach ($test_equipment as $eq) {
                if ($eq['raw'][$cid] === $max_val) {
                    $eq_with_max = $eq;
                    break;
                }
            }
            if ($eq_with_max && abs($normalized[$eq_with_max['id']][$cid] - 1.0) >= 0.001) {
                $benefit_test_passed = false;
                break;
            }
        }
    }
    if ($benefit_test_passed) {
        echo "  [PASS] Benefit criteria: max values normalize to 1.0\n";
        $tests_passed++;
    } else {
        echo "  [FAIL] Benefit criteria: max values should normalize to 1.0\n";
    }
    
    // Test 5: Verify cost normalization (min value should normalize to 1)
    $tests_total++;
    $cost_test_passed = true;
    foreach ($test_criteria as $cid => $c) {
        if ($c['type'] === 'cost') {
            $min_val = min(array_map(fn($eq) => $eq['raw'][$cid], $test_equipment));
            // Find first equipment with min value
            $eq_with_min = null;
            foreach ($test_equipment as $eq) {
                if ($eq['raw'][$cid] === $min_val) {
                    $eq_with_min = $eq;
                    break;
                }
            }
            if ($eq_with_min && abs($normalized[$eq_with_min['id']][$cid] - 1.0) >= 0.001) {
                $cost_test_passed = false;
                break;
            }
        }
    }
    if ($cost_test_passed) {
        echo "  [PASS] Cost criteria: min values normalize to 1.0\n";
        $tests_passed++;
    } else {
        echo "  [FAIL] Cost criteria: min values should normalize to 1.0\n";
    }
    
    echo "\n===========================================\n";
    printf("  Results: %d/%d tests passed\n", $tests_passed, $tests_total);
    echo "===========================================\n";
    
    return $tests_passed === $tests_total;
}

// Run the test
$success = run_test();
exit($success ? 0 : 1);
?>
