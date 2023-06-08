<!DOCTYPE html>
<html>
<head>
	<title>Laman Utama</title>
	<meta charset="UTF-8">
    <title> Applicant Homepage </title>
    <link rel="stylesheet" href="homePage.css">
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"/>
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
   </head>
<body>
	<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");

    if(session.getAttribute("applicantid")==null)
        response.sendRedirect("index.jsp");
    %>
    <div class="sidebar">
    <div class="logo-details">
      <img src="logoWhite.png">
    </div>
      <ul class="nav-links">
        <li>
          <a class="main-menu" href="homepageApplicant.jsp">
            <i class='bx bx-home'></i>
            <span class="links_name">LAMAN UTAMA</span>
          </a>
        </li>

        <li>
          <a class="main-menu" href="applicantViewSpace.jsp">
            <i class='bx bx-box' ></i>
            <span class="links_name">RUANG</span>
          </a>
        </li>

        <li>
          <a class="main-menu" href="applicantViewBooking.jsp">
            <i class='bx bx-bookmark'></i>
            <span class="links_name">TEMPAHAN</span>
          </a>
        </li>

        <li>
          <a class="main-menu" href="applicantViewAccount.jsp">
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
	        <p>Selamat datang ke laman rasmi Surau Ar-Rahman, Puchong Jaya! Laman ini bertujuan bagi membolehkan kakitangan, qariah dan orang ramai membuat tempahan dewan atau bilik yang terdapat di dalam Surau Ar-Rahman bagi mengadakan majlis atau kuliah. Harapan kami dari pihak Surau Ar-Rahman adalah bagi menggalakkan kehadiran orang ramai agar dapat mengeratkan ukhwah diantara saudara sesama seislam dan mengimarahkan rumah Allah SWT. InshaAllah.</p>
	    </div>
	</div>
  </section>
</body>
</html>

