<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 9/7/2022
  Time: 11:19 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="UTF-8">
    <title> View Applicant Profile </title>
    <link rel="stylesheet" href="accountHandler.css">
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
<sql:setDataSource
        var="ic"
        driver="org.postgresql.Driver"
        url="jdbc:postgresql://containers-us-west-10.railway.app:7321/railway"
        user="postgres"
        password="VmRY0mmQ31AWU2EQureM"/>/>

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
    SELECT * FROM applicant WHERE applicantid=?
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
    <c:forEach var="applicant" items="${oc.rows}">
        <div class="home-content">
            <div class="container">
                <div class="rightbox">
                    <form action="" method="post">
                    <div class="profile tabShow">
                        <h1>USER INFORMATION</h1>
                        <input type="hidden" name="applicantid" value="${applicant.applicantid}"/>
                        <h2>FULL NAME</h2>
                        <p class="input">${applicant.applicantname}</p>
                        <h2>IC NUMBER</h2>
                        <p class="input">${applicant.applicantic}</p>
                        <h2>BIRTH DATE</h2>
                        <p class="input">${applicant.applicantdateofbirth}</p>
                        <h2>ADDRESS</h2>
                        <p class="input">${applicant.applicantaddress}</p>
                        <h2>Email</h2>
                        <p class="input">${applicant.applicantemail}</p>
                        <h2>PHONE NUMBER</h2>
                        <p class="input">${applicant.applicantphone}</p>
                        <h2>USERNAME</h2>
                        <p class="input">${applicant.applicantusername}</p>
                        <h2>PASSWORD</h2>
                        <p class="input">${applicant.applicantpassword}</p>

                        <input type="hidden" name="action" value="deleteApplicant">
                        <button class="btn update" onclick="form.action='applicantUpdateAccount.jsp'">UPDATE</button>
                        <button class="btn cancel" formaction="ApplicantServlet" 
                        onclick="return confirm('ARE YOU SURE TO CONTINUE DELETING?');">DELETE</button>
                    </div>
                    </form>
                </div>
            </div>
        </div>
    </c:forEach>
</section>

</body>
</html>


