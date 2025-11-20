<?php
// home.php
?>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home Page</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background: #F3F1EC;
            font-family: Poppins, sans-serif;
        }
        .HomePage {
            width: 1920px;
            height: 1089px;
            position: relative;
            margin: 0 auto;
            background: #F3F1EC;
            overflow: hidden;
        }
    </style>
</head>
<body>

<div data-layer="Home Page" class="HomePage">

  <!-- Semua kode yang kamu kirim dari Figma ditempel apa adanya -->
  <?php echo '
  <div data-layer="Home Page" class="HomePage" style="width: 1920px; height: 1089px; position: relative; background: #F3F1EC; box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25); overflow: hidden">
  <div data-layer="Rectangle 1" class="Rectangle1" style="width: 1920px; height: 139px; left: 0px; top: -9px; position: absolute; background: #8FABD4"></div>
  <div data-svg-wrapper data-layer="menu" class="Menu" style="left: 51px; top: 32px; position: absolute">
    <svg width="60" height="60" viewBox="0 0 60 60" fill="none" xmlns="http://www.w3.org/2000/svg">
    <path d="M7.5 45V40H52.5V45H7.5ZM7.5 32.5V27.5H52.5V32.5H7.5ZM7.5 20V15H52.5V20H7.5Z" fill="#FEF7FF"/>
    </svg>
  </div>
  <div data-layer="Rectangle 8" class="Rectangle8" style="width: 428.60px; height: 148.64px; left: 458px; top: 331.36px; position: absolute; background: white; border-radius: 30px"></div>
  <div data-layer="Rectangle 11" class="Rectangle11" style="width: 428.60px; height: 148.64px; left: 458px; top: 331.36px; position: absolute; background: white; border-radius: 30px"></div>
  <div data-svg-wrapper data-layer="Rectangle 14" class="Rectangle14" style="left: 458px; top: 331.36px; position: absolute">
    <svg width="23" height="149" viewBox="0 0 23 149" fill="none" xmlns="http://www.w3.org/2000/svg">
    <path d="M0 148.641H22.4884V0H0V148.641Z" fill="#00C8B3"/>
    </svg>
  </div>
  <div data-svg-wrapper data-layer="check_box" class="CheckBox" style="left: 807.15px; top: 383.53px; position: absolute">
    <svg width="51" height="45" viewBox="0 0 51 45" fill="none" xmlns="http://www.w3.org/2000/svg">
    <path d="M22.2414 29.9005L37.034 16.8882L34.0965 14.3042L22.2414 24.7325L16.2614 19.4722L13.3238 22.0562L22.2414 29.9005ZM10.4912 38.7599C9.33714 38.7599 8.34921 38.3984 7.5274 37.6755C6.70558 36.9526 6.29468 36.0836 6.29468 35.0685V9.22853C6.29468 8.21339 6.70558 7.34437 7.5274 6.62146C8.34921 5.89856 9.33714 5.53711 10.4912 5.53711H39.8667C41.0207 5.53711 42.0086 5.89856 42.8304 6.62146C43.6523 7.34437 44.0632 8.21339 44.0632 9.22853V35.0685C44.0632 36.0836 43.6523 36.9526 42.8304 37.6755C42.0086 38.3984 41.0207 38.7599 39.8667 38.7599H10.4912ZM10.4912 35.0685H39.8667V9.22853H10.4912V35.0685Z" fill="#1D1B20"/>
    </svg>
  </div>
  <div data-layer="Data Kriteria" class="DataKriteria" style="width: 263px; height: 62px; left: 520px; top: 381px; position: absolute; color: black; font-size: 30px; font-family: Poppins; font-weight: 700; letter-spacing: 3px; word-wrap: break-word">Data Kriteria</div>
  <div data-layer="Rectangle 8" class="Rectangle8" style="width: 428.60px; height: 148.64px; left: 458px; top: 521.83px; position: absolute; background: white; border-radius: 30px"></div>
  <div data-layer="Rectangle 11" class="Rectangle11" style="width: 428.60px; height: 148.64px; left: 458px; top: 521.83px; position: absolute; background: white; border-radius: 30px"></div>
  <div data-svg-wrapper data-layer="Rectangle 14" class="Rectangle14" style="left: 458px; top: 521.83px; position: absolute">
    <svg width="23" height="149" viewBox="0 0 23 149" fill="none" xmlns="http://www.w3.org/2000/svg">
    <path d="M0 148.64H22.4884V1.52588e-05H0V148.64Z" fill="#6155F5"/>
    </svg>
  </div>
  <div data-svg-wrapper data-layer="check" class="Check" style="left: 800.43px; top: 577.94px; position: absolute">
    <svg width="51" height="45" viewBox="0 0 51 45" fill="none" xmlns="http://www.w3.org/2000/svg">
    <path d="M20.0384 33.2226L8.07837 22.7021L11.0684 20.072L20.0384 27.9623L39.2898 11.0281L42.2798 13.6582L20.0384 33.2226Z" fill="#1D1B20"/>
    </svg>
  </div>
  <div data-layer="Data perhitungan" class="DataPerhitungan" style="width: 337px; height: 122px; left: 520px; top: 560px; position: absolute; color: black; font-size: 30px; font-family: Poppins; font-weight: 700; letter-spacing: 3px; word-wrap: break-word">Data <br/>perhitungan</div>
  <div data-layer="Rectangle 8" class="Rectangle8" style="width: 428.60px; height: 148.64px; left: 939.20px; top: 521.83px; position: absolute; background: white; border-radius: 30px"></div>
  <div data-layer="Rectangle 11" class="Rectangle11" style="width: 428.60px; height: 148.64px; left: 939.20px; top: 521.83px; position: absolute; background: white; border-radius: 30px"></div>
  <div data-svg-wrapper data-layer="Rectangle 14" class="Rectangle14" style="left: 939.20px; top: 521.83px; position: absolute">
    <svg width="23" height="149" viewBox="0 0 23 149" fill="none" xmlns="http://www.w3.org/2000/svg">
    <path d="M0 148.64H22.4884V1.52588e-05H0V148.64Z" fill="#FF383C"/>
    </svg>
  </div>
  <div data-svg-wrapper data-layer="tab" class="Tab" style="left: 1279.84px; top: 572.53px; position: absolute">
    <svg width="48" height="48" viewBox="0 0 48 48" fill="none" xmlns="http://www.w3.org/2000/svg">
    <path d="M7.87164 35.4227H39.3584V19.6793H25.583V11.8076H7.87164V35.4227ZM7.87164 39.3585C6.78928 39.3585 5.86272 38.9731 5.09195 38.2024C4.32118 37.4316 3.93579 36.505 3.93579 35.4227V11.8076C3.93579 10.7252 4.32118 9.79863 5.09195 9.02786C5.86272 8.25709 6.78928 7.8717 7.87164 7.8717H39.3584C40.4408 7.8717 41.3674 8.25709 42.1381 9.02786C42.9089 9.79863 43.2943 10.7252 43.2943 11.8076V35.4227C43.2943 36.505 42.9089 37.4316 42.1381 38.2024C41.3674 38.9731 40.4408 39.3585 39.3584 39.3585H7.87164Z" fill="#1D1B20"/>
    </svg>
  </div>
  <div data-layer="Data Hasil Akhir" class="DataHasilAkhir" style="width: 263px; height: 122px; left: 1006px; top: 564px; position: absolute; color: black; font-size: 30px; font-family: Poppins; font-weight: 700; letter-spacing: 3px; word-wrap: break-word">Data Hasil Akhir</div>
  <div data-layer="Rectangle 8" class="Rectangle8" style="width: 428.60px; height: 148.64px; left: 1420.40px; top: 521.83px; position: absolute; background: white; border-radius: 30px"></div>
  <div data-layer="Rectangle 11" class="Rectangle11" style="width: 428.60px; height: 148.60px; left: 1420.40px; top: 521.83px; position: absolute; background: white; border-radius: 30px"></div>
  <div data-svg-wrapper data-layer="Rectangle 14" class="Rectangle14" style="left: 1420.40px; top: 521.83px; position: absolute">
    <svg width="23" height="149" viewBox="0 0 23 149" fill="none" xmlns="http://www.w3.org/2000/svg">
    <path d="M0 148.64H22.4884V1.52588e-05H0V148.64Z" fill="#FFCC00"/>
    </svg>
  </div>
  <div data-svg-wrapper data-layer="today" class="Today" style="left: 1730.38px; top: 569.08px; position: absolute">
    <svg width="56" height="50" viewBox="0 0 56 50" fill="none" xmlns="http://www.w3.org/2000/svg">
    <path d="M20.9825 33.8378C19.3505 33.8378 17.9711 33.3422 16.8443 32.351C15.7174 31.3598 15.154 30.1464 15.154 28.7108C15.154 27.2753 15.7174 26.0619 16.8443 25.0707C17.9711 24.0795 19.3505 23.5839 20.9825 23.5839C22.6144 23.5839 23.9938 24.0795 25.1207 25.0707C26.2475 26.0619 26.8109 27.2753 26.8109 28.7108C26.8109 30.1464 26.2475 31.3598 25.1207 32.351C23.9938 33.3422 22.6144 33.8378 20.9825 33.8378ZM11.6569 45.117C10.3747 45.117 9.27696 44.7154 8.36383 43.9122C7.4507 43.109 6.99414 42.1434 6.99414 41.0155V12.3047C6.99414 11.1767 7.4507 10.2112 8.36383 9.40794C9.27696 8.60472 10.3747 8.20311 11.6569 8.20311H13.9883V4.10156H18.6511V8.20311H37.3022V4.10156H41.965V8.20311H44.2964C45.5786 8.20311 46.6763 8.60472 47.5894 9.40794C48.5026 10.2112 48.9591 11.1767 48.9591 12.3047V41.0155C48.9591 42.1434 48.5026 43.109 47.5894 43.9122C46.6763 44.7154 45.5786 45.117 44.2964 45.117H11.6569ZM11.6569 41.0155H44.2964V20.5077H11.6569V41.0155Z" fill="#1D1B20"/>
    </svg>
  </div>
  <div data-layer="Jadwal" class="Jadwal" style="width: 261px; height: 61px; left: 1489px; top: 572px; position: absolute; text-align: center; color: black; font-size: 30px; font-family: Poppins; font-weight: 700; letter-spacing: 3px; word-wrap: break-word">Jadwal</div>
  <div data-layer="Rectangle 8" class="Rectangle8" style="width: 428.60px; height: 148.64px; left: 939.20px; top: 331.36px; position: absolute; background: white; border-radius: 30px"></div>
  <div data-layer="Rectangle 11" class="Rectangle11" style="width: 428.60px; height: 148.64px; left: 939.20px; top: 331.36px; position: absolute; background: white; border-radius: 30px"></div>
  <div data-svg-wrapper data-layer="Rectangle 14" class="Rectangle14" style="left: 939.20px; top: 331.36px; position: absolute">
    <svg width="23" height="149" viewBox="0 0 23 149" fill="none" xmlns="http://www.w3.org/2000/svg">
    <path d="M0 148.641H22.4884V0H0V148.641Z" fill="#FF8D28"/>
    </svg>
  </div>
  <div data-svg-wrapper data-layer="check_box" class="CheckBox" style="left: 1278.28px; top: 383.53px; position: absolute">
    <svg width="51" height="45" viewBox="0 0 51 45" fill="none" xmlns="http://www.w3.org/2000/svg">
    <path d="M22.2414 29.9005L37.034 16.8882L34.0965 14.3042L22.2414 24.7325L16.2614 19.4722L13.3238 22.0562L22.2414 29.9005ZM10.4912 38.7599C9.33714 38.7599 8.34921 38.3984 7.5274 37.6755C6.70558 36.9526 6.29468 36.0836 6.29468 35.0685V9.22853C6.29468 8.21339 6.70558 7.34437 7.5274 6.62146C8.34921 5.89856 9.33714 5.53711 10.4912 5.53711H39.8667C41.0207 5.53711 42.0086 5.89856 42.8304 6.62146C43.6523 7.34437 44.0632 8.21339 44.0632 9.22853V35.0685C44.0632 36.0836 43.6523 36.9526 42.8304 37.6755C42.0086 38.3984 41.0207 38.7599 39.8667 38.7599H10.4912Z" fill="#1D1B20"/>
    </svg>
  </div>
  <div data-layer="Data Sub- Kriteria" class="DataSubKriteria" style="width: 325px; height: 123px; left: 1002px; top: 373px; position: absolute; color: black; font-size: 30px; font-family: Poppins; font-weight: 700; letter-spacing: 3px; word-wrap: break-word">Data <br/>Sub- Kriteria</div>
  <div data-layer="Rectangle 8" class="Rectangle8" style="width: 428.60px; height: 150px; left: 1420.40px; top: 330px; position: absolute; background: white; border-radius: 30px"></div>
  <div data-layer="Rectangle 11" class="Rectangle11" style="width: 428.60px; height: 150px; left: 1420.40px; top: 330px; position: absolute; background: white; border-radius: 30px"></div>
  <div data-svg-wrapper data-layer="Rectangle 14" class="Rectangle14" style="left: 1420.40px; top: 330px; position: absolute">
    <svg width="23" height="150" viewBox="0 0 23 150" fill="none" xmlns="http://www.w3.org/2000/svg">
    <path d="M0 150H22.4884V0H0V150Z" fill="#34C759"/>
    </svg>
  </div>
  <div data-svg-wrapper data-layer="mobile_friendly" class="MobileFriendly" style="left: 1778.50px; top: 383.64px; position: absolute">
    <svg width="51" height="45" viewBox="0 0 51 45" fill="none" xmlns="http://www.w3.org/2000/svg">
    <path d="M12.5896 42.8394C11.4355 42.8394 10.4476 42.4746 9.62579 41.7451C8.80397 41.0156 8.39307 40.1386 8.39307 39.1142V5.58771C8.39307 4.56329 8.80397 3.68633 9.62579 2.95682C10.4476 2.2273 11.4355 1.86255 12.5896 1.86255H33.5721C34.7261 1.86255 35.714 2.2273 36.5358 2.95682C37.3577 3.68633 37.7686 4.56329 37.7686 5.58771V13.038H33.5721V11.1755H12.5896V33.5265H33.5721V31.6639H37.7686V39.1142C37.7686 40.1386 37.3577 41.0156 36.5358 41.7451C35.714 42.4746 34.7261 42.8394 33.5721 42.8394H12.5896ZM12.5896 37.2516V39.1142H33.5721V37.2516H12.5896ZM31.3689 29.8013L22.4513 21.8853L25.3889 19.2777L31.3689 24.5861L43.224 14.0625L46.1616 16.6701L31.3689 29.8013ZM12.5896 7.4503H33.5721V5.58771H12.5896V7.4503Z" fill="#1D1B20"/>
    </svg>
  </div>
  <div data-layer="Data Alternatif" class="DataAlternatif" style="width: 264px; height: 123px; left: 1494px; top: 379px; position: absolute; color: black; font-size: 30px; font-family: Poppins; font-weight: 700; letter-spacing: 3px; word-wrap: break-word">Data Alternatif</div>
  <div data-layer="fluent:person-20-regular" class="FluentPerson20Regular" style="width: 70px; height: 70px; left: 1804px; top: 32px; position: absolute; overflow: hidden">
    <div data-svg-wrapper data-layer="Vector" class="Vector" style="left: 10.50px; top: 7px; position: absolute">
      <svg width="49" height="56" viewBox="0 0 49 56" fill="none" xmlns="http://www.w3.org/2000/svg">
      <path d="M24.5 0C20.787 0 17.226 1.475 14.6005 4.10051C11.975 6.72601 10.5 10.287 10.5 14C10.5 17.713 11.975 21.274 14.6005 23.8995C17.226 26.525 20.787 28 24.5 28C28.213 28 31.774 26.525 34.3995 23.8995C37.025 21.274 38.5 17.713 38.5 14C38.5 10.287 37.025 6.72601 34.3995 4.10051C31.774 1.475 28.213 0 24.5 0ZM14 14C14 11.2152 15.1062 8.54451 17.0754 6.57538C19.0445 4.60625 21.7152 3.5 24.5 3.5C27.2848 3.5 29.9555 4.60625 31.9246 6.57538C33.8938 8.54451 35 11.2152 35 14C35 16.7848 33.8938 19.4555 31.9246 21.4246C29.9555 23.3938 27.2848 24.5 24.5 24.5C21.7152 24.5 19.0445 23.3938 17.0754 21.4246C15.1062 19.4555 14 16.7848 14 14ZM7.0315 31.5C6.1096 31.4959 5.19596 31.6738 4.34304 32.0238C3.49012 32.3737 2.71473 32.8887 2.06138 33.5391C1.40803 34.1895 0.889592 34.9626 0.535841 35.8139C0.18209 36.6653 -9.33402e-06 37.5781 3.58843e-10 38.5C3.58844e-10 44.4185 2.9155 48.881 7.4725 51.7895C11.9595 54.649 18.0075 56 24.5 56C30.9925 56 37.0405 54.649 41.5275 51.7895C46.0845 48.8845 49 44.415 49 38.5C49 36.6435 48.2625 34.863 46.9497 33.5503C45.637 32.2375 43.8565 31.5 42 31.5H7.0315ZM3.5 38.5C3.5 36.5645 5.068 35 7.0315 35H42C42.9283 35 43.8185 35.3688 44.4749 36.0251C45.1312 36.6815 45.5 37.5717 45.5 38.5C45.5 43.0815 43.323 46.494 39.6445 48.8355C35.8995 51.226 30.5725 52.5 24.5 52.5C18.4275 52.5 13.1005 51.226 9.3555 48.8355C5.6805 46.4905 3.5 43.085 3.5 38.5Z" fill="white"/>
      </svg>
    </div>
  </div>
  <div data-layer="Nama" class="Nama" style="width: 181px; height: 51px; left: 1654px; top: 45px; position: absolute; color: white; font-size: 40px; font-family: Montserrat; font-weight: 700; word-wrap: break-word">Nama</div>
  <div data-layer="Rectangle 7" class="Rectangle7" style="width: 1404px; height: 80px; left: 445px; top: 177px; position: absolute; background: #BBD1F2; box-shadow: 0px 13px 30px rgba(0, 0, 0, 0.10); border-radius: 20px"></div>
  <div data-layer="Selamat Datang Name! Mau lihat apa hari ini?" class="SelamatDatangNameMauLihatApaHariIni" style="width: 945px; left: 716px; top: 188px; position: absolute; color: black; font-size: 36px; font-family: Baloo Paaji; font-weight: 400; letter-spacing: 3.60px; word-wrap: break-word">Selamat Datang Name! Mau lihat apa hari ini?</div>
  <div data-layer="Rectangle 17" class="Rectangle17" style="width: 408px; height: 1089px; left: -19px; top: 0px; position: absolute; background: #F3F1EC; box-shadow: 1px 1px 4px 6px rgba(0, 0, 0, 0.25)"></div>
  <div data-svg-wrapper data-layer="tab" class="Tab" style="left: 34.23px; top: 593.18px; position: absolute">
    <svg width="40" height="40" viewBox="0 0 40 40" fill="none" xmlns="http://www.w3.org/2000/svg">
    <path d="M6.5249 29.362H32.6244V16.3122H21.2059V9.78735H6.5249V29.362ZM6.5249 32.6245C5.62772 32.6245 4.85969 32.305 4.22079 31.6661C3.5819 31.0272 3.26245 30.2592 3.26245 29.362V9.78735C3.26245 8.89017 3.5819 8.12214 4.22079 7.48325C4.85969 6.84435 5.62772 6.5249 6.5249 6.5249H32.6244C33.5216 6.5249 34.2897 6.84435 34.9285 7.48325C35.5674 8.12214 35.8869 8.89017 35.8869 9.78735V29.362C35.8869 30.2592 35.5674 31.0272 34.9285 31.6661C34.2897 32.305 33.5216 32.6245 32.6244 32.6245H6.5249Z" fill="#1D1B20"/>
    </svg>
  </div>
  <div data-svg-wrapper data-layer="check" class="Check" style="left: 32.43px; top: 513px; position: absolute">
    <svg width="44" height="36" viewBox="0 0 44 36" fill="none" xmlns="http://www.w3.org/2000/svg">
    <path d="M17.1989 27L6.93359 18.45L9.49991 16.3125L17.1989 22.725L33.7224 8.96252L36.2887 11.1L17.1989 27Z" fill="#1D1B20"/>
    </svg>
  </div>
  <div data-svg-wrapper data-layer="mobile_friendly" class="MobileFriendly" style="left: 32.43px; top: 424px; position: absolute">
    <svg width="44" height="36" viewBox="0 0 44 36" fill="none" xmlns="http://www.w3.org/2000/svg">
    <path d="M10.8056 34.5C9.81508 34.5 8.96714 34.2062 8.26178 33.6188C7.55642 33.0312 7.20374 32.325 7.20374 31.5V4.5C7.20374 3.675 7.55642 2.96875 8.26178 2.38125C8.96714 1.79375 9.81508 1.5 10.8056 1.5H28.8148C29.8054 1.5 30.6533 1.79375 31.3587 2.38125C32.064 2.96875 32.4167 3.675 32.4167 4.5V10.5H28.8148V9H10.8056V27H28.8148V25.5H32.4167V31.5C32.4167 32.325 32.064 33.0312 31.3587 33.6188C30.6533 34.2062 29.8054 34.5 28.8148 34.5H10.8056ZM10.8056 30V31.5H28.8148V30H10.8056ZM26.9239 24L19.2699 17.625L21.7912 15.525L26.9239 19.8L37.0991 11.325L39.6204 13.425L26.9239 24ZM10.8056 6H28.8148V4.5H10.8056V6Z" fill="#1D1B20"/>
    </svg>
  </div>
  <div data-svg-wrapper data-layer="check_box" class="CheckBox" style="left: 32.43px; top: 336px; position: absolute">
    <svg width="44" height="36" viewBox="0 0 44 36" fill="none" xmlns="http://www.w3.org/2000/svg">
    <path d="M19.0899 24.3L31.7864 13.725L29.2651 11.625L19.0899 20.1L13.9572 15.825L11.4359 17.925L19.0899 24.3ZM9.00468 31.5C8.01417 31.5 7.16624 31.2063 6.46088 30.6188C5.75551 30.0312 5.40283 29.325 5.40283 28.5V7.5C5.40283 6.675 5.75551 5.96875 6.46088 5.38125C7.16624 4.79375 8.01417 4.5 9.00468 4.5H34.2176C35.2082 4.5 36.0561 4.79375 36.7615 5.38125C37.4668 5.96875 37.8195 6.675 37.8195 7.5V28.5C37.8195 29.325 37.4668 30.0312 36.7615 30.6188C36.0561 31.2063 35.2082 31.5 34.2176 31.5H9.00468Z" fill="#1D1B20"/>
    </svg>
  </div>
  <div data-layer="Rectangle 18" class="Rectangle18" style="width: 445px; height: 130px; left: 0px; top: 0px; position: absolute; background: #8FABD4"></div>
  <div data-svg-wrapper data-layer="check_box" class="CheckBox" style="left: 32.43px; top: 247px; position: absolute">
    <svg width="44" height="36" viewBox="0 0 44 36" fill="none" xmlns="http://www.w3.org/2000/svg">
    <path d="M19.0899 24.3L31.7864 13.725L29.2651 11.625L19.0899 20.1L13.9572 15.825L11.4359 17.925L19.0899 24.3ZM9.00468 31.5C8.01417 31.5 7.16624 31.2063 6.46088 30.6188C5.75551 30.0312 5.40283 29.325 5.40283 28.5V7.5C5.40283 6.675 5.75551 5.96875 6.46088 5.38125C7.16624 4.79375 8.01417 4.5 9.00468 4.5H34.2176C35.2082 4.5 36.0561 4.79375 36.7615 5.38125C37.4668 5.96875 37.8195 6.675 37.8195 7.5V28.5C37.8195 29.325 37.4668 30.0312 36.7615 30.6188C36.0561 31.2063 35.2082 31.5 34.2176 31.5H9.00468ZM9.00468 28.5H34.2176V7.5H9.00468V28.5Z" fill="black"/>
    </svg>
  </div>
  <div data-svg-wrapper data-layer="Home" data-size="48" class="Home" style="left: 32.43px; top: 162px; position: absolute">
    <svg width="44" height="36" viewBox="0 0 44 36" fill="none" xmlns="http://www.w3.org/2000/svg">
    <path d="M16.2084 33V18H27.0139V33M5.40283 13.5L21.6112 3L37.8195 13.5V30C37.8195 30.7956 37.44 31.5587 36.7645 32.1213C36.0891 32.6839 35.1729 33 34.2176 33H9.00468C8.04941 33 7.13327 32.6839 6.45779 32.1213C5.78231 31.5587 5.40283 30.7956 5.40283 30V13.5Z" stroke="#538CDF" stroke-width="4" stroke-linecap="round" stroke-linejoin="round"/>
    </svg>
  </div>
  <div data-layer="KeputusanEQU" class="Keputusanequ" style="width: 295.68px; height: 33px; left: 18.68px; top: 41px; position: absolute; color: white; font-size: 35px; font-family: Montserrat; font-weight: 700; word-wrap: break-word">KeputusanEQU</div>
  <div data-svg-wrapper data-layer="today" class="Today" style="left: 32.43px; top: 680px; position: absolute">
    <svg width="44" height="36" viewBox="0 0 44 36" fill="none" xmlns="http://www.w3.org/2000/svg">
    <path d="M16.2084 24.75C14.9477 24.75 13.8822 24.3875 13.0117 23.6625C12.1413 22.9375 11.7061 22.05 11.7061 21C11.7061 19.95 12.1413 19.0625 13.0117 18.3375C13.8822 17.6125 14.9477 17.25 16.2084 17.25C17.469 17.25 18.5346 17.6125 19.405 18.3375C20.2755 19.0625 20.7107 19.95 20.7107 21C20.7107 22.05 20.2755 22.9375 19.405 23.6625C18.5346 24.3875 17.469 24.75 16.2084 24.75ZM9.00468 33C8.01417 33 7.16624 32.7063 6.46088 32.1188C5.75551 31.5312 5.40283 30.825 5.40283 30V9C5.40283 8.175 5.75551 7.46875 6.46088 6.88125C7.16624 6.29375 8.01417 6 9.00468 6H10.8056V3H14.4075V6H28.8149V3H32.4167V6H34.2176C35.2082 6 36.0561 6.29375 36.7615 6.88125C37.4668 7.46875 37.8195 8.175 37.8195 9V30C37.8195 30.825 37.4668 31.5312 36.7615 32.1188C36.0561 32.7063 35.2082 33 34.2176 33H9.00468ZM9.00468 30H34.2176V15H9.00468V30Z" fill="#1D1B20"/>
    </svg>
  </div>
  <div data-layer="Data Alternatif" class="DataAlternatif" style="width: 293.71px; height: 38px; left: 92.36px; top: 429px; position: absolute; color: black; font-size: 25px; font-family: Montserrat; font-weight: 600; letter-spacing: 2.50px; word-wrap: break-word">Data Alternatif</div>
  <div data-layer="Data Sub-kriteria" class="DataSubKriteria" style="width: 297.64px; height: 39px; left: 92.36px; top: 340px; position: absolute; color: black; font-size: 25px; font-family: Montserrat; font-weight: 600; letter-spacing: 2.50px; word-wrap: break-word">Data Sub-kriteria</div>
  <div data-layer="Data Kriteria" class="DataKriteria" style="width: 293.71px; height: 38px; left: 92.36px; top: 251px; position: absolute; color: black; font-size: 25px; font-family: Montserrat; font-weight: 600; letter-spacing: 2.50px; word-wrap: break-word">Data Kriteria</div>
  <div data-layer="Data Hasil Akhir" class="DataHasilAkhir" style="width: 293.71px; height: 38px; left: 92.36px; top: 597px; position: absolute; color: black; font-size: 25px; font-family: Montserrat; font-weight: 600; letter-spacing: 2.50px; word-wrap: break-word">Data Hasil Akhir</div>
  <div data-layer="Jadwal" class="Jadwal" style="width: 293.71px; height: 38px; left: 96.29px; top: 683px; position: absolute; color: black; font-size: 25px; font-family: Montserrat; font-weight: 600; letter-spacing: 2.50px; word-wrap: break-word">Jadwal</div>
  <div data-layer="Data Perhitungan" class="DataPerhitungan" style="width: 293.71px; height: 38px; left: 92.36px; top: 517px; position: absolute; color: black; font-size: 25px; font-family: Montserrat; font-weight: 600; letter-spacing: 2.50px; word-wrap: break-word">Data Perhitungan</div>
  <div data-layer="Dashboard" class="Dashboard" style="width: 293.71px; height: 38px; left: 92.36px; top: 165px; position: absolute; color: #538CDF; font-size: 25px; font-family: Montserrat; font-weight: 600; letter-spacing: 2.50px; word-wrap: break-word">Dashboard</div>
</div>
<div data-layer="Login Page" class="LoginPage" style="width: 1920px; height: 1089px; position: relative; background: #8FABD4; overflow: hidden">
  <img data-layer="—Pngtree—cartoon sun smiling sun graffiti_3910270 2" class="PngtreeCartoonSunSmilingSunGraffiti39102702" style="width: 2000px; height: 2000px; left: -700px; top: 61.04px; position: absolute; transform: rotate(-20deg); transform-origin: top left" src="https://placehold.co/2000x2000" />
  <div data-layer="Rectangle 1" class="Rectangle1" style="width: 1920px; height: 139px; left: 0px; top: -9px; position: absolute; background: #F3F1EC"></div>
  <div data-layer="KeputusanEQU" class="Keputusanequ" style="width: 499px; height: 58px; left: 44px; top: 35px; position: absolute; color: #8FABD4; font-size: 48px; font-family: Montserrat; font-weight: 700; word-wrap: break-word">KeputusanEQU</div>
  <div data-layer="KeputusanEQU" class="Keputusanequ" style="width: 854px; height: 58px; left: 126px; top: 343px; position: absolute; color: white; font-size: 96px; font-family: Montserrat; font-weight: 700; word-wrap: break-word">KeputusanEQU</div>
  <div data-layer="quill:hamburger" class="QuillHamburger" style="width: 77px; height: 77px; left: 1777px; top: 22px; position: absolute; overflow: hidden">
    <div data-svg-wrapper data-layer="Vector" class="Vector" style="left: 12.03px; top: 19.25px; position: absolute">
      <svg width="55" height="41" viewBox="0 0 55 41" fill="none" xmlns="http://www.w3.org/2000/svg">
      <path d="M0.9375 0.9375H53.875M0.9375 20.1875H53.875M0.9375 39.4375H53.875" stroke="#8FABD4" stroke-width="1.875" stroke-linecap="round" stroke-linejoin="round"/>
      </svg>
    </div>
  </div>
  <div data-svg-wrapper data-layer="fluent:person-20-regular" class="FluentPerson20Regular" style="left: 1758px; top: 68px; position: absolute">
    <svg width="37" height="37" viewBox="0 0 37 37" fill="none" xmlns="http://www.w3.org/2000/svg">
    <path d="M18.5 3.69995C16.5374 3.69995 14.6552 4.47959 13.2675 5.86736C11.8797 7.25513 11.1 9.13735 11.1 11.1C11.1 13.0626 11.8797 14.9448 13.2675 16.3325C14.6552 17.7203 16.5374 18.5 18.5 18.5C20.4627 18.5 22.3449 17.7203 23.7326 16.3325C25.1204 14.9448 25.9 13.0626 25.9 11.1C25.9 9.13735 25.1204 7.25513 23.7326 5.86736C22.3449 4.47959 20.4627 3.69995 18.5 3.69995ZM12.95 11.1C12.95 9.628 13.5348 8.21634 14.5756 7.17551C15.6164 6.13468 17.0281 5.54995 18.5 5.54995C19.972 5.54995 21.3837 6.13468 22.4245 7.17551C23.4653 8.21634 24.05 9.628 24.05 11.1C24.05 12.5719 23.4653 13.9836 22.4245 15.0244C21.3837 16.0652 19.972 16.65 18.5 16.65C17.0281 16.65 15.6164 16.0652 14.5756 15.0244C13.5348 13.9836 12.95 12.5719 12.95 11.1ZM9.2667 20.35C8.77941 20.3478 8.29648 20.4418 7.84566 20.6268C7.39483 20.8118 6.98498 21.084 6.63963 21.4278C6.29429 21.7715 6.02026 22.1802 5.83328 22.6302C5.6463 23.0802 5.55004 23.5627 5.55005 24.05C5.55005 27.1783 7.0911 29.5371 9.4998 31.0744C11.8715 32.5859 15.0683 33.3 18.5 33.3C21.9318 33.3 25.1286 32.5859 27.5003 31.0744C29.909 29.5389 31.45 27.1765 31.45 24.05C31.45 23.0687 31.0602 22.1275 30.3663 21.4337C29.6725 20.7398 28.7313 20.35 27.75 20.35H9.2667ZM7.40005 24.05C7.40005 23.0269 8.22885 22.2 9.2667 22.2H27.75C28.2407 22.2 28.7113 22.3949 29.0582 22.7418C29.4051 23.0887 29.6 23.5593 29.6 24.05C29.6 26.4716 28.4493 28.2754 26.505 29.513C24.5255 30.7766 21.7098 31.45 18.5 31.45C15.2903 31.45 12.4746 30.7766 10.4951 29.513C8.5526 28.2735 7.40005 26.4735 7.40005 24.05Z" fill="white"/>
    </svg>
  </div>
  <div data-layer="Rectangle 3" class="Rectangle3" style="width: 692px; height: 528px; left: 1066px; top: 328px; position: absolute; opacity: 0.80; background: #F3F1EC; border-radius: 30px"></div>
  <div data-layer="Rectangle 4" class="Rectangle4" style="width: 536.36px; height: 73px; left: 1143.17px; top: 484.94px; position: absolute; opacity: 0.80; background: #F3F1EC; border-radius: 30px; border: 1px black solid"></div>
  <div data-layer="Rectangle 5" class="Rectangle5" style="width: 536.36px; height: 73px; left: 1143.17px; top: 592px; position: absolute; opacity: 0.80; background: #F3F1EC; border-radius: 30px; border: 1px black solid"></div>
  <div data-layer="Username" class="Username" style="width: 232.81px; height: 52.31px; left: 1179.19px; top: 504.41px; position: absolute; color: #9FA5AE; font-size: 24px; font-family: Annapurna SIL; font-weight: 400; letter-spacing: 2.40px; word-wrap: break-word">Username</div>
  <div data-layer="Password" class="Password" style="width: 232.81px; height: 52.31px; left: 1175.33px; top: 610.25px; position: absolute; color: #9FA5AE; font-size: 24px; font-family: Annapurna SIL; font-weight: 400; letter-spacing: 2.40px; word-wrap: break-word">Password</div>
  <div data-layer="Rectangle 6" class="Rectangle6" style="width: 536.36px; height: 73px; left: 1143.17px; top: 714.88px; position: absolute; opacity: 0.80; background: #8FABD4; border-radius: 30px; border: 1px black solid"></div>
  <div data-layer="Login" class="Login" style="width: 191.65px; height: 58.40px; left: 1315.53px; top: 722.18px; position: absolute; text-align: center; color: #F5F9FF; font-size: 32px; font-family: Poppins; font-weight: 700; letter-spacing: 3.20px; word-wrap: break-word">Login</div>
  <div data-layer="Login Account" class="LoginAccount" style="width: 355px; height: 65.70px; left: 1219.06px; top: 379.10px; position: absolute; color: black; font-size: 36px; font-family: Baloo Bhaijaan; font-weight: 400; letter-spacing: 3.60px; word-wrap: break-word">Login Account</div>
</div>
<div data-layer="Frame 18" class="Frame18" style="width: 612px; height: 528px; position: relative">
  <div data-layer="Rectangle 3" class="Rectangle3" style="width: 612px; height: 528px; left: 0px; top: 0px; position: absolute; background: #ECECEC; box-shadow: 4px 4px 4px; border-radius: 30px; border: 1px black solid; filter: blur(2px)"></div>
  <div data-layer="Nama" class="Nama" style="width: 129px; height: 66px; left: 250px; top: 195px; position: absolute; color: black; font-size: 36px; font-family: Baloo Bhaijaan; font-weight: 400; letter-spacing: 3.60px; word-wrap: break-word">Nama</div>
  <div data-layer="Ellipse 1" class="Ellipse1" style="width: 140px; height: 140px; left: 236px; top: 48px; position: absolute; background: #538CDF; border-radius: 9999px"></div>
  <div data-layer="fluent:person-20-regular" class="FluentPerson20Regular" style="width: 90px; height: 90px; left: 261px; top: 74px; position: absolute; overflow: hidden">
    <div data-svg-wrapper data-layer="Vector" class="Vector" style="left: 13.50px; top: 9px; position: absolute">
      <svg width="63" height="72" viewBox="0 0 63 72" fill="none" xmlns="http://www.w3.org/2000/svg">
      <path d="M31.5 0C26.7261 0 22.1477 1.89642 18.7721 5.27208C15.3964 8.64773 13.5 13.2261 13.5 18C13.5 22.7739 15.3964 27.3523 18.7721 30.7279C22.1477 34.1036 26.7261 36 31.5 36C36.2739 36 40.8523 34.1036 44.2279 30.7279C47.6036 27.3523 49.5 22.7739 49.5 18C49.5 13.2261 47.6036 8.64773 44.2279 5.27208C40.8523 1.89642 36.2739 0 31.5 0ZM18 18C18 14.4196 19.4223 10.9858 21.9541 8.45406C24.4858 5.92232 27.9196 4.5 31.5 4.5C35.0804 4.5 38.5142 5.92232 41.0459 8.45406C43.5777 10.9858 45 14.4196 45 18C45 21.5804 43.5777 25.0142 41.0459 27.5459C38.5142 30.0777 35.0804 31.5 31.5 31.5C27.9196 31.5 24.4858 30.0777 21.9541 27.5459C19.4223 25.0142 18 21.5804 18 18ZM9.0405 40.5C7.8552 40.4947 6.68052 40.7235 5.58391 41.1734C4.4873 41.6233 3.49036 42.2854 2.65034 43.1217C1.81032 43.9579 1.14376 44.9519 0.688938 46.0465C0.234115 47.141 -1.20009e-05 48.3147 4.61369e-10 49.5C4.61371e-10 57.1095 3.7485 62.847 9.6075 66.5865C15.3765 70.263 23.1525 72 31.5 72C39.8475 72 47.6235 70.263 53.3925 66.5865C59.2515 62.8515 63 57.105 63 49.5C63 47.1131 62.0518 44.8239 60.364 43.136C58.6761 41.4482 56.3869 40.5 54 40.5H9.0405ZM4.5 49.5C4.5 47.0115 6.516 45 9.0405 45H54C55.1935 45 56.3381 45.4741 57.182 46.318C58.0259 47.1619 58.5 48.3065 58.5 49.5C58.5 55.3905 55.701 59.778 50.9715 62.7885C46.1565 65.862 39.3075 67.5 31.5 67.5C23.6925 67.5 16.8435 65.862 12.0285 62.7885C7.3035 59.7735 4.5 55.395 4.5 49.5Z" fill="white"/>
      </svg>
    </div>
  </div>
  <div data-layer="Rectangle 19" class="Rectangle19" style="width: 522px; height: 73px; left: 45px; top: 386px; position: absolute; opacity: 0.80; background: #FFCC00; border-radius: 30px; border: 1px black solid"></div>
  <div data-layer="Manage Account" class="ManageAccount" style="width: 371px; height: 59px; left: 130px; top: 398px; position: absolute; text-align: center; color: #F5F9FF; font-size: 32px; font-family: Poppins; font-weight: 700; letter-spacing: 3.20px; word-wrap: break-word">Manage Account</div>
  <div data-svg-wrapper data-layer="settings" class="Settings" style="left: 63px; top: 395px; position: absolute">
    <svg width="55" height="55" viewBox="0 0 55 55" fill="none" xmlns="http://www.w3.org/2000/svg">
    <path d="M21.1979 50.4166L20.2812 43.0833C19.7847 42.8923 19.3168 42.6631 18.8776 42.3958C18.4384 42.1284 18.0087 41.8419 17.5885 41.5364L10.7708 44.401L4.46875 33.5155L10.3698 29.0468C10.3316 28.7794 10.3125 28.5216 10.3125 28.2734V26.7265C10.3125 26.4782 10.3316 26.2204 10.3698 25.953L4.46875 21.4843L10.7708 10.5989L17.5885 13.4635C18.0087 13.1579 18.4479 12.8714 18.9062 12.6041C19.3646 12.3367 19.8229 12.1076 20.2812 11.9166L21.1979 4.58325H33.8021L34.7187 11.9166C35.2153 12.1076 35.6832 12.3367 36.1224 12.6041C36.5616 12.8714 36.9913 13.1579 37.4115 13.4635L44.2292 10.5989L50.5312 21.4843L44.6302 25.953C44.6684 26.2204 44.6875 26.4782 44.6875 26.7265V28.2734C44.6875 28.5216 44.6493 28.7794 44.5729 29.0468L50.474 33.5155L44.1719 44.401L37.4115 41.5364C36.9913 41.8419 36.5521 42.1284 36.0937 42.3958C35.6354 42.6631 35.1771 42.8923 34.7187 43.0833L33.8021 50.4166H21.1979ZM25.2083 45.8333H29.7344L30.5365 39.7603C31.7205 39.4548 32.8186 39.006 33.8307 38.414C34.8429 37.822 35.7691 37.1058 36.6094 36.2655L42.2812 38.6145L44.5156 34.7187L39.5885 30.9947C39.7795 30.46 39.9132 29.8966 39.9896 29.3046C40.066 28.7126 40.1042 28.111 40.1042 27.4999C40.1042 26.8888 40.066 26.2872 39.9896 25.6952C39.9132 25.1032 39.7795 24.5399 39.5885 24.0051L44.5156 20.2812L42.2812 16.3853L36.6094 18.7916C35.7691 17.9131 34.8429 17.1779 33.8307 16.5859C32.8186 15.9938 31.7205 15.5451 30.5365 15.2395L29.7917 9.16659H25.2656L24.4635 15.2395C23.2795 15.5451 22.1814 15.9938 21.1693 16.5859C20.1571 17.1779 19.2309 17.894 18.3906 18.7343L12.7188 16.3853L10.4844 20.2812L15.4115 23.9478C15.2205 24.5208 15.0868 25.0937 15.0104 25.6666C14.934 26.2395 14.8958 26.8506 14.8958 27.4999C14.8958 28.111 14.934 28.703 15.0104 29.276C15.0868 29.8489 15.2205 30.4218 15.4115 30.9947L10.4844 34.7187L12.7188 38.6145L18.3906 36.2083C19.2309 37.0867 20.1571 37.822 21.1693 38.414C22.1814 39.006 23.2795 39.4548 24.4635 39.7603L25.2083 45.8333ZM27.6146 35.5208C29.8299 35.5208 31.7205 34.7378 33.2865 33.1718C34.8524 31.6058 35.6354 29.7152 35.6354 27.4999C35.6354 25.2846 34.8524 23.394 33.2865 21.828C31.7205 20.2621 29.8299 19.4791 27.6146 19.4791C25.3611 19.4791 23.4609 20.2621 21.9141 21.828C20.3672 23.394 19.5937 25.2846 19.5937 27.4999C19.5937 29.7152 20.3672 31.6058 21.9141 33.1718C23.4609 34.7378 25.3611 35.5208 27.6146 35.5208Z" fill="#FEF7FF"/>
    </svg>
  </div>
  <div data-layer="Rectangle 6" class="Rectangle6" style="width: 522px; height: 73px; left: 45px; top: 294px; position: absolute; opacity: 0.80; background: #FF383C; border-radius: 30px; border: 1px black solid"></div>
  <div data-layer="Logout" class="Logout" style="width: 191.65px; height: 58.40px; left: 217.36px; top: 301.30px; position: absolute; text-align: center; color: #F5F9FF; font-size: 32px; font-family: Poppins; font-weight: 700; letter-spacing: 3.20px; word-wrap: break-word">Logout</div>
  <div data-svg-wrapper data-layer="Log out" data-size="48" class="LogOut" style="left: 72px; top: 306px; position: absolute">
    <svg width="48" height="48" viewBox="0 0 48 48" fill="none" xmlns="http://www.w3.org/2000/svg">
    <path d="M18 42H10C8.93913 42 7.92172 41.5786 7.17157 40.8284C6.42143 40.0783 6 39.0609 6 38V10C6 8.93913 6.42143 7.92172 7.17157 7.17157C7.92172 6.42143 8.93913 6 10 6H18M32 34L42 24M42 24L32 14M42 24H18" stroke="white" stroke-width="4" stroke-linecap="round" stroke-linejoin="round"/>
    </svg>
  </div>
</div>y
  <!-- ⭐ Dan seterusnya semua blok dari Figma (aku biarkan apa adanya) -->
  ';

  ?>

</div>

</body>
</html>
