<!DOCTYPE html>
<html>
<head>
	<title>Laman Utama</title>
	<meta charset="UTF-8">
    <title> Staff Homepage</title>
    <link rel="stylesheet" href="homePage.css">
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
          <a class="main-menu" href="homepageStaff.jsp">
            <i class='bx bx-home'></i>
            <span class="links_name">LAMAN UTAMA</span>
          </a>
        </li>

        <li>
          <a class="main-menu" href="staffViewSpace.jsp">
            <i class='bx bx-box' ></i>
            <span class="links_name">RUANG</span>
          </a>
          <!--ul class="sub-menu">
            <li><a href="createRoom.jsp">CIPTA INFO BILIK</a></li>
            <li><a href="createHall.jsp">CIPTA INFO DEWAN</a></li>
          </ul-->
        </li>

        <li>
          <a class="main-menu" href="#">
            <i class='bx bx-bookmark'></i>
            <span class="links_name">TEMPAHAN</span>
          </a>
          <ul class="sub-menu">
            <li><a href="staffBooking.jsp">TEMPAH BILIK</a></li>
            <li><a href="staffViewBooking.jsp">LIHAT TEMPAHAN</a></li>
            <li><a href="staffDeleteBooking.jsp">PADAM TEMPAHAN</a></li>
            <li><a href="staffApproveBooking.jsp">SAHKAN TEMPAHAN</a></li>
          </ul>
        </li>

        <li>
          <a class="main-menu" href="staffViewAccount.jsp">
            <i class='bx bx-user'></i>
            <span class="links_name">AKAUN</span>
          </a>
        </li>
        <li class="log_out">
          <a class="main-menu" href="index.jsp">
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
	        <header class="main_title">Laman Utama</header>
	        <img src="banner.jpg" id="image" height="250" width="450">
	        <br><br>
	        <p>Ini adalah laman rasmi Surau Ar-Rahman.Laman ini membolehkan kakitangan, qariah dan orang ramai membuat tempahan bilik-bilik atau ruangan yang sedia ada di Surau Ar-Rahman. Harapan kami dari pihak surau ini adalah kehadiran para ahli qariah dan orang ramai akan dapat mengeratkan ukhwah sesama suadara seislam dan mengimarahkan rumah Allah SWT. InshaAllah.</p>
	    </div>
	</div>
  </section>
</body>
</html>

