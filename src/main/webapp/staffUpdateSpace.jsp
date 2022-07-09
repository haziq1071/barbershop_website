<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
<head lang="en" dir="ltr">
  <meta charset="UTF-8">
    <title> Update Space Form</title>
    <link rel="stylesheet" href="createspace.css">
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
    <%
        int jspaceid = 0;

        if(request.getParameter("spaceid")==null){
            jspaceid = (Integer) session.getAttribute("spaceid");
        }
        else{
            jspaceid = Integer.parseInt(request.getParameter("spaceid"));
            session.setAttribute("spaceid", jspaceid);
        }
    %>
    <c:set var="jspaceid" value="<%=jspaceid%>"/>
    SELECT * FROM space WHERE spaceid=?
    <sql:param value="${jspaceid}" />
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
            <span class="links_name" >BILIK</span>
          </a>
          <ul class="sub-menu">
            <li><a href="createRoom.jsp">CIPTA INFO BILIK</a></li>
            <li><a href="createHall.jsp">CIPTA INFO DEWAN</a></li>
            <li><a href="viewRoom.jsp">LIHAT INFO BILIK</a></li>
            <li><a href="updateRoom.jsp">KEMASKINI INFO BILIK</a></li>
            <li><a href="deleteRoom.jsp">PADAM INFO BILIK</a></li>
          </ul>
        </li>

        <li>
          <a class="main-menu" href="#">
            <i class='bx bx-bookmark'></i>
            <span class="links_name" >TEMPAHAN</span>
          </a>
          <ul class="sub-menu">
            <li><a href="staffBooking.html">TEMPAH BILIK</a></li>
            <li><a href="staffViewBooking.html">LIHAT TEMPAHAN</a></li>
            <li><a href="staffUpdateBooking.html">KEMASKINI TEMPAHAN</a></li>
            <li><a href="staffDeleteBooking.html">PADAM TEMPAHAN</a></li>
            <li><a href="staffApproveBooking.html">SAHKAN TEMPAHAN</a></li>
          </ul>
        </li>

        
       <li>
          <a class="main-menu" href="#">
            <i class='bx bx-user'></i>
            <span class="links_name">AKAUN</span>
          </a>
          <ul class="sub-menu">
            <li><a href="viewStaff.html">LIHAT AKAUN</a></li>
            <li><a href="updateStaff.html">KEMASKINI AKAUN</a></li>
            <li><a href="deleteStaff.html">PADAM AKAUN</a></li>
          </ul>
        </li>
        
        <li class="log_out">
          <a class="main-menu" href="#">
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
        <c:forEach var="space" items="${oc.rows}">
      	<div class="home-content">
          <div class="container">
          	  <form action="SpaceServlet" method="post">
              <header class="main_title">KEMASKINI RUANG</header>
                <div class="form first">
                  <div class="details room">
                    <span class="title">INFORMASI RUANG</span>
                    <div class="fields">
                      <div class="input-field input-box">
                      	<input type="hidden" name="spaceid" value="${space.spaceid}"/>
                        <label class="details" >Nama</label>
                        <input type="text" name="spacename" value="${space.spacename}">
                      </div>
                      <div class="input-field input-box">
                        <label class="details">Kapasiti</label>
                        <input type="text" name="spacecapacity" value="${space.spacecapacity}">
                      </div>
                      <div class="input-field input-box">
                        <label class="details">Status</label>
                        <c:set var = "status" scope = "session" value = "${space.spacestatus}"/>
                        <c:if test = "${status == 'Boleh Digunakan'}">
                            <select name="spacestatus">
                                <option value="${space.spacestatus}">${space.spacestatus}</option>
                                <option value="Sedang Diselenggara">Sedang Diselenggara</option>
                            </select>
                        </c:if>
                        <c:if test = "${status == 'Sedang Diselenggara'}">
                            <select name="spacestatus">
                                <option value="${space.spacestatus}">${space.spacestatus}</option>
                                <option value="Boleh Digunakan">Boleh Digunakan</option>
                            </select>
                        </c:if> 
                      </div>
                      <div class="input-field input-box">
                        <label class="details">Sistem Bunyi</label>
                         <c:set var = "system" scope = "session" value = "${space.soundsystem}"/>
                         <c:if test = "${system == 'Mikrofon Sahaja'}">
                            <select name="soundsystem">
                                <option value="${space.soundsystem}">${space.soundsystem}</option>
                                <option value="Mikrofon Dan Speaker">Mikrofon Dan Speaker</option>
                                <option value="Set Sistem Bar Bunyi">Set Sistem Bar Bunyi</option>
                                <option value="Set Sistem Bunyi Hi-fi">Set Sistem Bunyi Hi-fi</option>
                            </select>
                         </c:if>
                         <c:if test = "${system == 'Mikrofon Dan Speaker'}">
                            <select name="soundsystem">
                                <option value="${space.soundsystem}">${space.soundsystem}</option>
                                <option value="Mikrofon Sahaja">Mikrofon Sahaja</option>
                                <option value="Set Sistem Bar Bunyi">Set Sistem Bar Bunyi</option>
                                <option value="Set Sistem Bunyi Hi-fi">Set Sistem Bunyi Hi-fi</option>
                            </select>
                         </c:if>
                         <c:if test = "${system == 'Set Sistem Bar Bunyi'}">
                            <select name="soundsystem">
                                <option value="${space.soundsystem}">${space.soundsystem}</option>
                                <option value="Mikrofon Sahaja">Mikrofon Sahaja</option>
                                <option value="Mikrofon Dan Speaker">Mikrofon Dan Speaker</option>
                                <option value="Set Sistem Bunyi Hi-fi">Set Sistem Bunyi Hi-fi</option>
                            </select>
                         </c:if>
                         <c:if test = "${system == 'Set Sistem Bunyi Hi-fi'}">
                            <select name="soundsystem">
                                <option value="${space.soundsystem}">${space.soundsystem}</option>
                                <option value="Mikrofon Sahaja">Mikrofon Sahaja</option>
                                <option value="Mikrofon Dan Speaker">Mikrofon Dan Speaker</option>
                                <option value="Set Sistem Bar Bunyi">Set Sistem Bar Bunyi</option>
                            </select>
                         </c:if>  
                      </div>
                      <div class="input-field input-box">
                        <label class="details" >Kuantiti Meja</label>
                        <input type="text" name="tablequantity" value="${space.tablequantity}">
                      </div>
                       <div class="input-field input-box">
                        <label class="details">Kuantiti Kerusi</label>
                        <input type="text" name="chairquantity" value="${space.chairquantity}">
                      </div>                    
                      <input type="hidden" name="action" value="updateSpace">
                      <div class="button staff">
                        <a href="staffViewSpace.jsp"><button class="update">Simpan</button></a>
                        <a href="staffViewSpace.jsp"><button class="cancel">Batal</button></a>
                      </div>
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