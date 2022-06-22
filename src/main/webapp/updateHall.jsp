<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
    <title> update room </title>
    <link rel="stylesheet" href="createroom.css">
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
<%
    int jroomid = Integer.parseInt(request.getParameter("roomid"));
%>
<sql:query dataSource="${ic}" var="oc">
  <!--%
        int jroomid = 0;

        if(request.getParameter("roomid")==null){
            jroomid = (Integer) session.getAttribute("roomid");
        }
        else{
            jroomid = Integer.parseInt(request.getParameter("roomid"));
            session.setAttribute("roomid", jroomid);
        }
    %-->
    <c:set var="jroomid" value="<%=jroomid%>"/>
    SELECT * FROM room WHERE roomid=?
    <sql:param value="${jroomid}"/>
</sql:query>

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

      	<div class="home-content">
          <div class="container">
              <header class="main_title">KEMASKINI DEWAN</header>

              <c:forEach var="result" items="${oc.rows}">

              <form name="HallInfoForm" action="RoomServlet" method="post" onsubmit="return confirm('Anda pasti ingin kemaskini?');"  enctype = "multipart/form-data">
                <div class="form first">
                  <div class="details room">
                    <span class="title">INFORMASI DEWAN</span>

                     <input type="number" name="roomid" value="${result.roomid}" hidden>

                    <div class="fields">
                      <div class="input-field input-box">
                        <label class="details" for="roomname">Nama Dewan</label>
                        <input type="text" name="roomname" id="roomname" value="${result.roomname}">
                      </div>
                      <div class="input-field input-box">
                        <label class="details" for="roomcapacity">Kapasiti</label>
                        <input type="text" name="roomcapacity" id="roomcapacity" value="${result.roomcapacity}">
                      </div>
                      <div class="input-field input-box">
                        <label class="details" for="roomstatus">Status Dewan</label>
                        <!--
                        <select name="roomstatus" id="roomstatus" value="${result.roomstatus}">
                          <option disabled selected>Pilih Status</option>
                          <option value="Boleh Digunakan">Boleh Digunakan</option>
                          <option value="Sedang Diselenggara">Sedang Diselenggara</option>
                        </select>
                        --->
                        <c:set var = "rmstatus" scope = "session" value = "${result.roomstatus}"/>
                        <c:if test = "${rmstatus == 'Boleh Digunakan'}">
                            <select name="roomstatus" id="roomstatus">
                                <option value="${result.roomstatus}">${result.roomstatus}</option>
                                <option value="Sedang Diselenggara">Sedang Diselenggara</option>
                            </select>
                        </c:if>
                        <c:if test = "${rmstatus == 'Sedang Diselenggara'}">
                            <select name="roomstatus" id="roomstatus">
                                <option value="${result.roomstatus}">${result.roomstatus}</option>
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
                        <!--
                        <select name="soundsystem" id="soundsystem" for="soundsystem" value="${result.soundsystem}">
                          <option disabled selected>Pilih Sistem Bunyi</option>
                          <option value="Mikrofon Sahaja">Mikrofon Sahaja</option>
                          <option value="Mikrofon Dan Speaker">Mikrofon Dan Speaker</option>
                          <option value="Set Sistem Bar Bunyi">Set Sistem Bar Bunyi</option>
                          <option value="Set Sistem Bunyi Hi-fi">Set Sistem Bunyi Hi-fi</option>
                        </select>
                        -->
                         <c:set var = "system" scope = "session" value = "${result.systemsound}"/>
                         <c:if test = "${system == 'Mikrofon Sahaja'}">
                            <select name="systemsound" id="systemsound">
                                <option value="${result.systemsound}">${result.systemsound}</option>
                                <option value="Mikrofon Dan Speaker">Mikrofon Dan Speaker</option>
                                <option value="Set Sistem Bar Bunyi">Set Sistem Bar Bunyi</option>
                                <option value="Set Sistem Bunyi Hi-fi">Set Sistem Bunyi Hi-fi</option>
                            </select>
                         </c:if>
                         <c:if test = "${system == 'Mikrofon Dan Speaker'}">
                            <select name="systemsound" id="systemsound">
                                <option value="${result.systemsound}">${result.systemsound}</option>
                                <option value="Mikrofon Sahaja">Mikrofon Sahaja</option>
                                <option value="Set Sistem Bar Bunyi">Set Sistem Bar Bunyi</option>
                                <option value="Set Sistem Bunyi Hi-fi">Set Sistem Bunyi Hi-fi</option>
                            </select>
                         </c:if>
                         <c:if test = "${system == 'Set Sistem Bar Bunyi'}">
                            <select name="systemsound" id="systemsound">
                                <option value="${result.systemsound}">${result.systemsound}</option>
                                <option value="Mikrofon Sahaja">Mikrofon Sahaja</option>
                                <option value="Mikrofon Dan Speaker">Mikrofon Dan Speaker</option>
                                <option value="Set Sistem Bunyi Hi-fi">Set Sistem Bunyi Hi-fi</option>
                            </select>
                         </c:if>
                         <c:if test = "${system == 'Set Sistem Bunyi Hi-fi'}">
                            <select name="systemsound" id="systemsound">
                                <option value="${result.systemsound}">${result.systemsound}</option>
                                <option value="Mikrofon Sahaja">Mikrofon Sahaja</option>
                                <option value="Mikrofon Dan Speaker">Mikrofon Dan Speaker</option>
                                <option value="Set Sistem Bar Bunyi">Set Sistem Bar Bunyi</option>
                            </select>
                         </c:if>

                      </div>
                      <input type="hidden" name="action" value="updateRoom">
                      <div class="button staff">
                        <button type="submit" name="submit" >KEMASKINI</button><br><br>
                      </div>
                    </div> 
                  </div>

              </div>
            </form>
              </c:forEach>
        </div>
      </div>
  </section>
</body>
<!--
  <script>
    function myFunction(){
      alert("Bilik berjaya ditambah.");
    }
 </script>-->

</html>