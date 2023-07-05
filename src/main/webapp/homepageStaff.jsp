<!DOCTYPE html>
<html>
<head>
	<title>HOME PAGE</title>
	<meta charset="UTF-8">
    <title> Staff Homepage</title>
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

    if(session.getAttribute("staffid")==null)
        response.sendRedirect("index.jsp");
  %>
    <div class="sidebar">
    <div class="logo-details">
      <img src="barber_logo.png">
    </div>
      <ul class="nav-links">
        <li>
          <a class="main-menu" href="homepageStaff.jsp">
            <i class='bx bx-home'></i>
            <span class="links_name">HOME PAGE</span>
          </a>
        </li>

        <li>
          <a class="main-menu" href="staffViewSpace.jsp">
            <i class='bx bx-box' ></i>
            <span class="links_name">SERVICE</span>
          </a>
        </li>

        <li>
          <a class="main-menu" href="staffApproveBooking.jsp">
            <i class='bx bx-bookmark'></i>
            <span class="links_name">BOOKING</span>
          </a>
        </li>

        <li>
          <a class="main-menu" href="staffViewAccount.jsp">
            <i class='bx bx-user'></i>
            <span class="links_name">ACCOUNT</span>
          </a>
        </li>
        <li class="log_out">
          <a class="main-menu" href="index.jsp">
            <i class='bx bx-log-out'></i>
            <span class="links_name">LOG OUT</span>
          </a>
        </li>
      </ul>
  </div>
  <section class="home-section">
    <nav>
      <div class="sidebar-button">
        <span class="dashboard">DE'MACHO BARBERSHOP</span>
      </div>
      <div class="media_icons">
          <a href="https://www.facebook.com/demachobarber/"><i class="fab fa-facebook-f"></i></a>

      </div>
    </nav>
    <div class="home-content">
        <div class="container">
	        <header class="main_title">HOME PAGE</header>
	        <img src="barbershop.jpg" id="image" height="250" width="450">
	        <br><br>
	        <p>Welcome to the DE'MACHO BARBERSHOP website! .</p>
	    </div>
	</div>
  </section>
</body>
</html>

