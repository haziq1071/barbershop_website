<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="UTF-8">
    <title> Update Applicant Form </title>
    <link rel="stylesheet" href="accountHandler.css">
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"/>
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
   </head>
<body>
    <div class="sidebar">
    <div class="logo-details">
      <img src="logoWhite.png">
    </div>
      <ul class="nav-links">
        <li>
          <a class="main-menu" href="#">
            <i class='bx bx-home'></i>
            <span class="links_name">LAMAN UTAMA</span>
          </a>
        </li>

        <li>
          <a class="main-menu" href="#">
            <i class='bx bx-box' ></i>
            <span class="links_name">BILIK</span>
          </a>
          <ul class="sub-menu">
            <li><a href="#">CIPTA INFO BILIK</a></li>
            <li><a href="#">LIHAT INFO BILIK</a></li>
            <li><a href="#">KEMASKINI INFO BILIK</a></li>
            <li><a href="#">PADAM INFO BILIK</a></li>
          </ul>
        </li>

        <li>
          <a class="main-menu" href="#">
            <i class='bx bx-bookmark'></i>
            <span class="links_name">TEMPAHAN</span>
          </a>
          <ul class="sub-menu">
            <li><a href="#">TEMPAH BILIK</a></li>
            <li><a href="#">LIHAT TEMPAHAN</a></li>
            <li><a href="#">KEMASKINI TEMPAHAN</a></li>
            <li><a href="#">PADAM TEMPAHAN</a></li>
            <li><a href="#">SAHKAN TEMPAHAN</a></li>
          </ul>
        </li>

        <li>
          <a class="main-menu" href="viewApplicant.jsp">
            <i class='bx bx-user'></i>
            <span class="links_name">AKAUN</span>
          </a>
        </li>
        <li class="log_out">
          <a class="main-menu" href="#">
            <i class='bx bx-log-out'></i>
            <span class="links_name">LOG KELUAR</span>
          </a>
        </li>
      </ul>
  </div>
  <section class="home-section">
    <nav>
      <div class="sidebar-button">
        <span class="dashboard">SURAU AR-RAHMAN BANDAR PUCHONG JAYA</span>
      </div>
      <div class="media_icons">
          <a href="https://www.facebook.com/sarpuchongjaya/"><i class="fab fa-facebook-f"></i></a>
          <a href="https://www.instagram.com/surau_ar_rahman_pchg/"><i class="fab fa-instagram"></i></a>
        </div>
    </nav>
    <div class="home-content">
        <div class="container">
		<div class="rightbox">
			<div class="profile tabShow">
				<h1>MAKLUMAT PEMOHON</h1>
				<h2>Nama Penuh</h2>
				<input type="text" class="input" value="Akhyar Rashid">
				<h2>Kad Pengenalan</h2>
				<input type="text" class="input" value="010323-05-6064">
				<h2>Tarikh Lahir</h2>
				<input type="text" class="input" value="24/2/1999">
				<h2>Alamat</h2>
				<input type="text" class="input" value="No. 48, Taman Nusa Damai, Selangor.">
				<h2>Email</h2>
				<input type="text" class="input" value="akhyarrashid@gmail.com">
				<h2>Nombor Telefon</h2>
				<input type="text" class="input" value="018-5676570">
         <h2>Nama Pengguna</h2>
        <input type="text" class="input" value="akhyar4576">
        <h2>Kata Laluan</h2>
        <input type="password" class="input" value="akhyar05">
				<button class="btn update">Kemaskini</button>
				<a href="viewApplicant.jsp"><button class="btn cancel">Batal</button></a>  
			</div>
		</div>
	</div>
    </div>
  </section>
</body>
</html>

