<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="UTF-8">
    <title> Update Staff Form </title>
    <link rel="stylesheet" href="accountHandler.css">
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
<sql:setDataSource
        var="ic"
        driver="org.postgresql.Driver"
        url="jdbc:postgresql://containers-us-west-10.railway.app:7321/railway"
        user="postgres"
        password="VmRY0mmQ31AWU2EQureM"/>

<sql:query dataSource="${ic}" var="oc">
    <%
        int jstaffid = 0;

        if(request.getParameter("staffid")==null){
            jstaffid = (Integer) session.getAttribute("staffid");
        }
        else{
            jstaffid = Integer.parseInt(request.getParameter("staffid"));
            session.setAttribute("staffid", jstaffid);
        }
    %>

    <c:set var="jstaffid" value="<%=jstaffid%>"/>
    SELECT staffid,staffname,staffic,staffdateofbirth,staffaddress,staffemail,staffphone,staffusername,staffpassword
    from staff
    WHERE staffid=?
    <sql:param value="${jstaffid}" />
</sql:query>

<sql:query dataSource="${ic}" var="st">
    SELECT staffid,staffname from staff
</sql:query>
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
    <c:forEach var="staff" items="${oc.rows}">
        <div class="home-content">
            <div class="container-staff">
                <div class="rightbox">
                    <form action="StaffServlet" method="post">
                        <div class="profile tabShow">
                            <h1>STAFF INFORMATION</h1>
                            <input type="hidden" name="staffid" value="${staff.staffid}"/>
                            <h2>FULL NAME</h2>
                            <input type="text" class="input"  name="staffname" value = "${staff.staffname}" required>
                            <h2>IC NUMBER</h2>
                            <input type="text" class="input" name="staffic" value = "${staff.staffic}" pattern="[0-9]{6}-[0-9]{2}-[0-9]{4}" title="xxxxxx-xx-xxxx" required>
                            <h2>BIRTHDATE</h2>
                            <input type="date" class="input" name="staffdateofbirth" value ="${staff.staffdateofbirth}" max="2023-01-25" required>
                            <h2>ADDRESS</h2>
                            <input type="text" class="input" name="staffaddress" value = "${staff.staffaddress}" required>
                            <h2>Email</h2>
                            <input type="text" class="input" name="staffemail" value = "${staff.staffemail}" required>
                            <h2>PHONE NUMBER</h2>
                            <input type="text" class="input" name="staffphone" value = "${staff.staffphone}" pattern="[0-9]{3}-[0-9]{7}" title="xxx-xxxxxxx" required>

                            <c:forEach var="staff" items="${oc.rows}">
                                <h2>USERNAME</h2>
                                <input type="text" class="input" name="staffusername" value = "${staff.staffusername}" required>
                                <h2>PASSWORD</h2>
                                <input type="text" class="input" name="staffpassword" value = "${staff.staffpassword}" required>
                            </c:forEach>
                            <input type="hidden" name="action" value="updateStaff">
                            <a href="staffViewAccount.jsp"><button class="btn update">SAVE</button></a>
                            <a href="staffViewAccount.jsp"><button class="btn cancel">CANCEL</button></a>

                        </div>
                    </form>
                </div>
            </div>
        </div>
    </c:forEach>
</section>
</body>
</html>


