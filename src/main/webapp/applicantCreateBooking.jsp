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
        url="jdbc:postgresql://containers-us-west-10.railway.app:7321/railway"
        user="postgres"
        password="VmRY0mmQ31AWU2EQureM"/>

<sql:query dataSource="${ic}" var="oc">
  SELECT *
  FROM services

</sql:query>
<sql:query dataSource="${ic}" var="aid">
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
  SELECT applicantid FROM applicant WHERE applicantid=?
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
    <div class="container">
      <div class="title">MAKE BOOKING</div>
      <div class="content">
        <form method="post">
          <div class="user-details">
            <div class="input-box">
              <span class="details">EVENT DATE</span>
              <input type="date" name="eventdate" min="2023-01-27" required>
            </div>
             <div class="input-box">
                <span class="details">EVENT TIME</span>
                    <select class="form-control" name="eventtime" required>
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
              <span class="details">SERVICE DESCRIPTION</span>
              <input type="text" name="eventdescription" required>
            </div>
            <div class="input-box">
                <span class="details">SERVICES</span>
                    <select class="form-control" id="serviceid" name="seviceid" required>
                     	<option disabled selected>CHOOSE SERVICE</option>
                        <c:forEach items="${oc.rows}" var="Sevices">
                        <option value="<c:out value="${Services.serviceid}"/>"><c:out value="${Sevices.servicename}" /></option>
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


