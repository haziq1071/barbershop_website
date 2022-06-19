<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="UTF-8">
    <title> View Staff Form </title>
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
          <a class="main-menu" href="homepage.html">
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
            <li><a href="create-room.html">CIPTA INFO BILIK</a></li>
            <li><a href="create-hall.html">CIPTA INFO DEWAN</a></li>
            <li><a href="read for view.html">LIHAT INFO BILIK</a></li>    
            <li><a href="read for update.html">KEMASKINI INFO BILIK</a></li>
            <li><a href="read for delete.html">PADAM INFO BILIK</a></li>
          </ul>
        </li>

        <li>
          <a class="main-menu" href="#">
            <i class='bx bx-bookmark'></i>
            <span class="links_name">TEMPAHAN</span>
          </a>
          <ul class="sub-menu">
            <li><a href="staffBooking.html">TEMPAH BILIK</a></li>
            <li><a href="staffViewBooking">LIHAT TEMPAHAN</a></li>
            <li><a href="staffDeleteBooking">PADAM TEMPAHAN</a></li>
            <li><a href="staffApproveBooking">SAHKAN TEMPAHAN</a></li>
          </ul>
        </li>

        <li>
          <a class="main-menu" href="#">
            <i class='bx bx-user'></i>
            <span class="links_name">AKAUN</span>
          </a>
          <ul class="sub-menu">
            <li><a href="viewStaff.html">LIHAT AKAUN</a></li>
            <li><a href="updateStaff.html">KEMASKINI AKAUN</a></li>
            <li><a href="deleteStaff.html">PADAM AKAUN</a></li>
          </ul>
        </li>
        <li class="log_out">
          <a class="main-menu" href="loginAccount.html">
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
				<h1>MAKLUMAT STAF</h1>
				<h2>Nama Penuh</h2>
				<p class="input">Akhyar Rashid</p>
				<h2>Kad Pengenalan</h2>
				<p class="input">010323-05-6064</p>
				<h2>Tarikh Lahir</h2>
				<p class="input">24/2/2001</p>
				<h2>Alamat</h2>
				<p class="input">No. 48, Taman Nusa Damai, Selangor.</p>
				<h2>Email</h2>
				<p class="input">akhyarrashid@gmail.com</p>
				<h2>Nombor Telefon</h2>
				<p class="input">018-5676570</p>
				<h2>Jawatan</h2>
				<p class="input">Bendahari</p>
		    <h2>Nombor Staf</h2>
		    <p class="input">NA67548</p>
		    <h2>Kata Laluan</h2>
		    <p class="input">akhyar05</p>

        <input type="hidden" name="action" value="viewStaff">

				<a href="updateStaff.html"><button class="btn update">Kemaskini</button></a>
        <a href="deleteStaff.html"><button class="btn cancel">Padam</button></a> 
			</div>
		</div>
	</div>
    </div>
  </section>
</body>
</html>

