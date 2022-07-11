<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="UTF-8">
    <title> Create Booking Form </title>
    <link rel="stylesheet" href="createBooking.css">
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
<sql:setDataSource
        var="ic"
        driver="org.postgresql.Driver"
        url="jdbc:postgresql://ec2-52-72-56-59.compute-1.amazonaws.com:5432/d274lnoegak379"
        user="dnzxqagexabepj"
        password="edb330e6fe55ed3bb6d1ee1eb3c1f995e6b205eb5d464bee634abc3345b2d294"/>

<sql:query dataSource="${ic}" var="oc">
  SELECT * from space
</sql:query>
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
        </li>
        <li>
            <a class="main-menu" href="#">
                <i class='bx bx-bookmark'></i>
                <span class="links_name">TEMPAHAN</span>
            </a>
            <ul class="sub-menu">
				<li><a href="staffViewBooking.jsp">LIHAT TEMPAHAN</a></li>
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
            <div class="title">DAFTAR TEMPAHAN</div>
            <div class="content">
              <form method="post">
                <div class="user-details">
                  <div class="input-box">
                    <span class="details">Tarikh Aktiviti</span>
                    <input type="date" name="eventdate" >
                  </div>
                  <div class="input-box">
                    <span class="details">Perincian Aktiviti</span>
                    <input type="text" name="bookingdescription">
                  </div>
                  <div class="input-box">
                    <span class="details">Nama Ruang</span>
                    <select	name="spacename" >
					   <option disabled selected>Pilih Ruang</option>
					   <input type="hidden" name="spaceid" value="${space.spaceid}">
					   <c:forEach var="space" items="${oc.rows}">
					   <option value="${space.spacename}">${space.spacename}</option>
					   </c:forEach>
					</select>
                  </div>      
                </div>
                <input type="hidden" name="action" value="staffcreatebooking">
                <div class="button">
                  <input type="submit" value="TEMPAH" formaction="BookingServlet" onclick="return confirm('Tempahan telah berjaya dibuat!');">
                </div>
              </form>
            </div>
        </div>
    </div>
</section>
</body>
</html>


