<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
    <title> Update Space Form</title>
    <link rel="stylesheet" href="createroom.css">
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"/>
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>

<body>
  <div class="sidebar">
    <div class="logo-details">
      <img src="logoWhite.png">
    </div>
      <ul class="nav-links">
        <li>
          <a class="main-menu" href="homepage.html">
            <i class='bx bx-home'></i>
            <span class="links_name">LAMAN UTAMA</span>
          </a>
        </li>

        <li>
          <a class="main-menu" href="#">
            <i class='bx bx-box' ></i>
            <span class="links_name" id="min">BILIK</span>
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
            <span class="links_name" id="min">TEMPAHAN</span>
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
                    <span class="title">INFORMASI DEWAN</span>
                    <div class="fields">
                      <div class="input-field input-box">
                      	<input type="hidden" name="spaceid" value="${space.spaceid}"/>
                        <label class="details" for="spacename">Nama Dewan</label>
                        <input type="text" name="spacename" id="spacename" value="${space.spacename}">
                      </div>
                      <div class="input-field input-box">
                        <label class="details" for="spacecapacity">Kapasiti</label>
                        <input type="text" name="spacecapacity" id="spacecapacity" value="${space.spacecapacity}">
                      </div>
                      <div class="input-field input-box">
                        <label class="details" for="spacestatus">Status Dewan</label>

                        <c:set var = "spstatus" scope = "session" value = "${space.spacestatus}"/>
                        <c:if test = "${spstatus == 'Boleh Digunakan'}">
                            <select name="spacestatus" id="spacestatus">
                                <option value="${space.spacestatus}">${result.roomstatus}</option>
                                <option value="Sedang Diselenggara">Sedang Diselenggara</option>
                            </select>
                        </c:if>
                        <c:if test = "${spstatus == 'Sedang Diselenggara'}">
                            <select name="spacestatus" id="spacestatus">
                                <option value="${space.spacestatus}">${result.roomstatus}</option>
                                <option value="Boleh Digunakan">Boleh Digunakan</option>
                            </select>
                        </c:if>
                        
                      </div>
                    </div>
                  </div>
                  
                  <div class="details ID">
                    <span class="title">Fasiliti bilik</span>
                    <div class="fields">
                      <div class="input-field input-box">
                        <label class="details" for="soundsystem">Sistem Bunyi</label>
                         <c:set var = "system" scope = "session" value = "${result.soundsystem}"/>
                         <c:if test = "${system == 'Mikrofon Sahaja'}">
                            <select name="soundsystem" id="soundsystem">
                                <option value="${space.soundsystem}">${result.soundsystem}</option>
                                <option value="Mikrofon Dan Speaker">Mikrofon Dan Speaker</option>
                                <option value="Set Sistem Bar Bunyi">Set Sistem Bar Bunyi</option>
                                <option value="Set Sistem Bunyi Hi-fi">Set Sistem Bunyi Hi-fi</option>
                            </select>
                         </c:if>
                         <c:if test = "${system == 'Mikrofon Dan Speaker'}">
                            <select name="soundsystem" id="soundsystem">
                                <option value="${space.soundsystem}">${result.soundsystem}</option>
                                <option value="Mikrofon Sahaja">Mikrofon Sahaja</option>
                                <option value="Set Sistem Bar Bunyi">Set Sistem Bar Bunyi</option>
                                <option value="Set Sistem Bunyi Hi-fi">Set Sistem Bunyi Hi-fi</option>
                            </select>
                         </c:if>
                         <c:if test = "${system == 'Set Sistem Bar Bunyi'}">
                            <select name="soundsystem" id="soundsystem">
                                <option value="${space.soundsystem}">${result.soundsystem}</option>
                                <option value="Mikrofon Sahaja">Mikrofon Sahaja</option>
                                <option value="Mikrofon Dan Speaker">Mikrofon Dan Speaker</option>
                                <option value="Set Sistem Bunyi Hi-fi">Set Sistem Bunyi Hi-fi</option>
                            </select>
                         </c:if>
                         <c:if test = "${system == 'Set Sistem Bunyi Hi-fi'}">
                            <select name="soundsystem" id="soundsystem">
                                <option value="${space.soundsystem}">${result.soundsystem}</option>
                                <option value="Mikrofon Sahaja">Mikrofon Sahaja</option>
                                <option value="Mikrofon Dan Speaker">Mikrofon Dan Speaker</option>
                                <option value="Set Sistem Bar Bunyi">Set Sistem Bar Bunyi</option>
                            </select>
                         </c:if>  
                      </div>
                       <div class="input-field input-box">
                        <label class="details" for="tablequantity">Kuantiti Meja</label>
                        <input type="text" name="tablequantity" id="tablequantity" value="${space.tablequantity}">
                      </div>
                       <div class="input-field input-box">
                        <label class="details" for="chairquantity">Kuantiti Kerusi</label>
                        <input type="text" name="chairquantity" id="chairquantity" value="${space.chairquantity}">
                      </div>
                      <input type="hidden" name="action" value="updateSpace">
                      <div class="button staff">
                        <input type="submit" class="updateHall" name="submit" value="KEMASKINI">
                        <br><br>
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