<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
<head lang="en" dir="ltr">
  <meta charset="UTF-8">
    <title> Update Room Form</title>
    <link rel="stylesheet" href="createspace.css">
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
        url="jdbc:postgresql://containers-us-west-141.railway.app:7894/railway"
        user="postgres"
        password="UyduWFTEPVisrjXTehXg"/>

<sql:query dataSource="${ic}" var="oc">
    <%
        int jroomid = 0;

        if(request.getParameter("roomid")==null){
            jroomid = (Integer) session.getAttribute("roomid");
        }
        else{
            jroomid = Integer.parseInt(request.getParameter("roomid"));
            session.setAttribute("roomid", jroomid);
        }
    %>
    <c:set var="jroomid" value="<%=jroomid%>"/>
    SELECT * FROM room WHERE roomid=?
    <sql:param value="${jroomid}" />
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
          <a class="main-menu" href="#">
            <i class='bx bx-box' ></i>
            <span class="links_name" >RUANG</span>
          </a>
          <ul class="sub-menu">
              <li><a href="staffViewSpace.jsp">DEWAN</a></li>
              <li><a href="staffViewRoom.jsp">BILIK</a></li>
          </ul>
        </li>

        <li>
          <a class="main-menu" href="#">
            <i class='bx bx-bookmark'></i>
            <span class="links_name" >TEMPAHAN</span>
          </a>
            <ul class="sub-menu">
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
              <a href="https://www.instagram.com.surau_ar_rahman_pchg"><i class="fab fa-instagram"></i></a>
            </div>
        </nav>
        <c:forEach var="room" items="${oc.rows}">
      	<div class="home-content">
          <div class="container">
          	  <form action="RoomServlet" method="post">
              <header class="main_title">KEMASKINI DEWAN</header>
                <div class="form first">
                  <div class="details room">
                    <span class="title">INFORMASI DEWAN</span>
                    <div class="fields">
                      <div class="input-field input-box">
                      	<input type="hidden" name="roomid" value="${room.roomid}"/>
                        <label class="details" >Nama</label>
                        <input type="text" name="roomname" value="${room.roomname}" required>
                      </div>
                      <div class="input-field input-box">
                        <label class="details">Kapasiti</label>
                        <input type="text" name="roomcapacity" value="${room.roomcapacity}" pattern="[0-9]+" title="Kapasiti hanya nombor sahaja" required>
                      </div>
                      <div class="input-field input-box">
                        <label class="details">Status</label>
                        <c:set var = "status" scope = "session" value = "${room.roomstatus}"/>
                        <c:if test = "${status == 'Boleh Digunakan'}">
                            <select name="roomstatus" required>
                                <option value="${room.roomstatus}">${room.roomstatus}</option>
                                <option value="Sedang Diselenggara">Sedang Diselenggara</option>
                            </select>
                        </c:if>
                        <c:if test = "${status == 'Sedang Diselenggara'}">
                            <select name="roomstatus" required>
                                <option value="${room.roomstatus}">${room.roomstatus}</option>
                                <option value="Boleh Digunakan">Boleh Digunakan</option>
                            </select>
                        </c:if> 
                      </div>
                      <div class="input-field input-box">
                        <label class="details">Sistem Bunyi</label>
                        <input type="text" name="roomsoundsystem" value="${room.roomsoundsystem}" required>
                      </div>
                      <div class="input-field input-box">
                        <label class="details" >Kuantiti Meja</label>
                        <input type="text" name="tablequantity" value="${room.tablequantity}" pattern="[0-9]+" title="Kuantiti meja hanya nombor sahaja" required>
                      </div>
                      <div class="input-field input-box">
                        <label class="details">Kuantiti Kerusi</label>
                        <input type="text" name="chairquantity" value="${room.chairquantity}" pattern="[0-9]+" title="Kuantiti kerusi hanya nombor sahaja" required>
                      </div>
                          <input type="hidden" name="action" value="updateRoom">
                      <a href="staffViewRoom.jsp"><button class="update">KEMASKINI</button></a>
                      <a href="staffViewRoom.jsp"><button class="delete">BATAL</button></a>                   
                    </div> 
                  </div>
              </div>
            </form>
        </div>
      </div>
    </c:forEach>
  </section>
</body>
</html>