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
        url="jdbc:postgresql://ec2-52-72-56-59.compute-1.amazonaws.com:5432/d274lnoegak379"
        user="dnzxqagexabepj"
        password="edb330e6fe55ed3bb6d1ee1eb3c1f995e6b205eb5d464bee634abc3345b2d294"/>

<sql:query dataSource="${ic}" var="oc">
  SELECT *
  FROM space
  WHERE spacestatus LIKE '%Boleh Digunakan%'
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
              <span class="details">Perincian Aktiviti</span>
              <input type="text" name="bookingdescription">
            </div>
            <div class="input-box">
              <span class="details">Nama Ruang</span>
              <select class="form-control" id="spaceid" name="spaceid">
                <c:forEach items="${oc.rows}" var="space">
                  <option value="<c:out value="${space.spaceid}"/>"><c:out value="${space.spacename}" /></option>
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


