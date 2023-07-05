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
        url="jdbc:postgresql://containers-us-west-10.railway.app:7321/railway"
        user="postgres"
        password="VmRY0mmQ31AWU2EQureM"/>

<sql:query dataSource="${ic}" var="oc">
  <%
    int japplicantid = 0;
    if(request.getParameter("applicantid")==null){
      japplicantid = (Integer) session.getAttribute("applicantid");
    }
    else{
      japplicantid = Integer.parseInt(request.getParameter("applicantid"));
      session.setAttribute("applicantid", japplicantid);
    }
  %>
  <c:set var="japplicantid" value="<%=japplicantid%>"/>
  SELECT bookingid, spacename, TO_CHAR(bookingdate, 'DD-MM-YYYY')bookingdate, TO_CHAR(eventdate, 'DD-MM-YYYY')eventdate, eventtime, eventdescription, bookingstatus
  FROM booking b
  JOIN services s
  ON b.serviceid = s.serviceid
  WHERE applicantid=?
  <sql:param value="${japplicantid}" />
</sql:query>

<div class="sidebar">
  <div class="logo-details">
    <img src="barber_logo.png">
  </div>
  <ul class="nav-links">
    <li>
      <a class="main-menu" href="homepageApplicant.jsp">
        <i class='bx bx-home'></i>
        <span class="links_name">HOME PAGE</span>
      </a>
    </li>

    <li>
      <a class="main-menu" href="applicantViewSpace.jsp">
        <i class='bx bx-box' ></i>
        <span class="links_name">SERVICE</span>
      </a>
    </li>

    <li>
      <a class="main-menu" href="applicantViewBooking.jsp">
        <i class='bx bx-bookmark'></i>
        <span class="links_name">BOOKING</span>
      </a>
    </li>

    <li>
      <a class="main-menu" href="applicantViewAccount.jsp">
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
    <div class="table">
      <div class="table_header">
        <a href="applicantCreateBooking.jsp"><button class="add">MAKE BOOKING</button></a>
        <header class="main_title" style="font-size: xx-large">BOOKING LIST</header>
      </div>
      <table class="container">
        <tr>
          <th>NO. BOOKING</th>
          <th>BOOKING DATE</th>
          <th>EVENT DATE</th>
          <th>EVENT TIME</th>
          <th>EVENT DESCRIPTION</th>
          <th>SERVICE NAME</th>
          <th>STATUS</th>
          <th>CANCELLATION</th>
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
              <td>${result.servicename}</td>
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