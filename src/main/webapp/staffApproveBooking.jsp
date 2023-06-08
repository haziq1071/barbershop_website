<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title> Staff Approve Booking </title>
    <link rel="stylesheet" href="approveBooking.css">
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

    if(session.getAttribute("staffid")==null)
        response.sendRedirect("index.jsp");
%>
<sql:setDataSource
        var="ic"
        driver="org.postgresql.Driver"
        url="jdbc:postgresql://containers-us-west-10.railway.app:7321/postgres"
        user="postgres"
        password="VmRY0mmQ31AWU2EQureM"/>

<sql:query dataSource="${ic}" var="ac">
    SELECT *
    FROM booking b
    JOIN space s
    ON b.spaceid = s.spaceid
    JOIN applicant a
    ON b.applicantid = a.applicantid
    ORDER BY eventdate
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
            <a class="main-menu" href="staffApproveBooking.jsp">
                <i class='bx bx-bookmark'></i>
                <span class="links_name">TEMPAHAN</span>
            </a>
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
            <a href="https://www.instagram.com.surau_ar_rahman_pchg"><i class="fab fa-instagram"></i></a>
        </div>
    </nav>
    <div class="home-content">
        <div class="table">
            <div class="table_header">
                <header class="main_title" style="font-size: xx-large">SENARAI TEMPAHAN</header>
            </div>
                <table class="container">
                    <tr>
                        <th>NO.TEMPAHAN</th>
                        <th>NAMA PEMOHON</th>
                        <th>TARIKH TEMPAHAN</th>
                        <th>RUANG TEMPAHAN</th>
                        <th>TARIKH AKTIVITI</th>
                        <th>PERINCIAN AKTIVITI</th>
                        <th>STATUS TEMPAHAN</th>
                        <th>TINDAKAN</th>
                    </tr>
                    <c:forEach var="result" items="${ac.rows}">
                        <input type="hidden" name="bookingid" value="${result.bookingid}">
                        <tr>
                            <td>${result.bookingid}</td>
                            <td>${result.applicantname}</td>
                            <td>${result.bookingdate}</td>
                            <td>${result.spacename}</td>
                            <td>${result.eventdate}</td>
                            <td>${result.eventdescription}</td>
                            <td>${result.bookingstatus}</td>
                            <td>
                                <form action="" method="post">
                                <input type="hidden" name="action" value="staffapprovedbooking">
                                <input type="hidden" name="bookingid" value="${result.bookingid}">
                                <button class="approve" formaction="BookingServlet" onclick="return confirm('Adakah anda yakin untuk meluluskan tempahan ini?')">TERIMA</button>
                                </form>
                                <form action="" method="post">
                                <input type="hidden" name="action" value="staffrejectbooking">
                                <input type="hidden" name="bookingid" value="${result.bookingid}">
                                <button class="reject" formaction="BookingServlet" onclick="return confirm('Adakah anda yakin untuk menolak tempahan ini?')">TOLAK</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
        </div>
    </div>
</section>
</body>
</html>