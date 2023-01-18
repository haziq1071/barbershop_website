<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title> Applicant View Booking </title>
  <link rel="stylesheet" href="bookingHandler.css">
  <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"/>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
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
  <%
    int japplicantid;
    if(request.getParameter("applicantid")==null){
      japplicantid = (Integer) session.getAttribute("applicantid");
    }
    else{
      japplicantid = Integer.parseInt(request.getParameter("applicantid"));
      session.setAttribute("applicantid", japplicantid);
    }
  %>
  <c:set var="japplicantid" value="%=japplicantid%>"/>
  SELECT b.bookingid, b.bookingdate, b.bookingstatus, b.eventdate, b.eventtime, b.eventdescription, a.applicantname, b.eventspace
  FROM booking b
  JOIN applicant a ON b.applicantid = a.applicantid
  WHERE a.applicantid = ?
  <sql:param value="${japplicantid}" />
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
      <a href="https://www.instagram.com.surau_ar_rahman_pchg"><i class="fab fa-instagram"></i></a>
    </div>
  </nav>
  <div class="home-content">
    <div class="table">
      <div class="table_header">
        <a href="applicantCreateBooking.jsp"><button class="add">BUAT TEMPAHAN</button></a>
        <header class="main_title" style="font-size: xx-large">SENARAI TEMPAHAN</header>
      </div>
      <table class="container">
        <tr>
          <th>NO. TEMPAHAN</th>
          <th>TARIKH TEMPAHAN</th>
          <th>TARIKH AKTIVITI</th>
          <th>MASA AKTIVITI</th>
          <th>PERINCIAN AKTIVITI</th>
          <th>RUANG TEMPAHAN</th>
          <th>STATUS</th>
          <th>BATAL TEMPAHAN</th>
        </tr>
        <c:forEach var="result" items="${oc.rows}">
          <form action="" method="post">
            <input type="hidden" name="bookingid" value="${result.bookingid}">
            <tr>
              <td>${result.bookingid}</td>
              <td>${result.bookingdate}</td>
              <td>${result.eventdate}</td>
              <td>${result.eventtime}</td>
              <td>${result.eventdescription}</td>
              <td>${result.eventspace}</td>
              <td>${result.bookingstatus}</td>
              <td>
                <input type="hidden" name="action" value="applicantcancelbooking">
                <button formaction="BookingServlet"  onclick="return confirm('Adakah anda yakin untuk batalkan tempahan ini?')">BATAL</button>
              </td>
            </tr>
          </form>
        </c:forEach>
      </table>
    </div>
  </div>
</section>
</body>
</html> 