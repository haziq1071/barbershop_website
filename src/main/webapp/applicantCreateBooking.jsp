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
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");

    if(session.getAttribute("applicantid")==null)
        response.sendRedirect("index.jsp");

%>

<sql:setDataSource
        var="ic"
        driver="org.postgresql.Driver"
        url="jdbc:postgresql://containers-us-west-141.railway.app:7894/railway"
        user="postgres"
        password="ETymgiO6aGYvyXf5fkei"/>

<sql:query dataSource="${ic}" var="oc">
  SELECT *
  FROM space
  WHERE spacestatus LIKE '%Boleh Digunakan%'
</sql:query>
<sql:query dataSource="${ic}" var="rc">
  SELECT *
  FROM room
  WHERE roomstatus LIKE '%Boleh Digunakan%'
</sql:query>



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
      <div class="title">DAFTAR TEMPAHAN</div>
      <div class="content">
        <form method="post">
          <div class="user-details">
            <div class="input-box">
              <span class="details">Tarikh Aktiviti</span>
              <input type="date" name="eventdate" >
            </div>
             <div class="input-box">
                <span class="details">Masa Aktiviti</span>
                    <select class="form-control" name="eventtime">
                        <option disabled selected>Pilih Masa</option>
                        <option value="8:00 - 10:00">8:00 - 10:00</option>
                        <option value="10:00 - 12:00">10:00 - 12:00</option>
                        <option value="12:00 - 14:00">12:00 - 14:00</option>
                        <option value="14:00 - 16:00">14:00 - 16:00</option>
                        <option value="16:00 - 18:00">16:00 - 18:00</option>
                        <option value="18:00 - 20:00">18:00 - 20:00</option>
                        <option value="20:00 - 22:00">20:00 - 22:00</option>
                        <option value="22:00 - 00:00">22:00 - 00:00</option>
                    </select>
            </div>
            <div class="input-box">
              <span class="details">Perincian Aktiviti</span>
              <input type="text" name="eventdescription">
            </div>
            <div class="input-box">
                <span class="details">Ruang Tempahan</span>
                    <select class="form-control" name="eventspace">
                     	<option disabled selected>Pilih Ruang</option>
                        <c:forEach items="${oc.rows}" var="space">
                        <option value="<c:out value="${space.spacename}"/>"><c:out value="${space.spacename}" /></option>
                        </c:forEach>
                        <c:forEach items="${rc.rows}" var="room">
                        <option value="<c:out value="${room.roomname}"/>"><c:out value="${room.roomname}" /></option>
                        </c:forEach>
                    </select>
            </div>           
          </div>
          <c:forEach items="${aid.rows}" var="applicant">
            <input type="hidden" name="applicantid" value="${applicant.applicantid}"/>
            <input type="hidden" name="bookingstatus" value="Telah Dimajukan"/>
          </c:forEach>
          <input type="hidden" name="action" value="applicantcreatebooking">
          <div class="button">
            <input type="submit" value="TEMPAH" formaction="BookingServlet">
          </div>
        </form>
      </div>
    </div>
  </div>
</section>
</body>
</html>


