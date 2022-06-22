<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
    <title> Delete Hall </title>
    <link rel="stylesheet" href="createroom.css">
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"/>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
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
  <c:forEach var="result" items="${oc.rows}">
  <div class="home-content">
    <form action="" method="post">
    <div class="container">
        <header class="main_title" style="font-size: xx-large">${result.roomname}</header>
    <div class="form first">
      <div class="details room">

    <fieldset><!--start fieldset image bilik-->
    </fieldset><!--end fieldset gambar-->
    
    <div class="fields">
        <div class="details">
            <span class="title">INFORMASI DEWAN</span>

            <input type="number" name="roomid"  value="${result.roomid}" hidden>
            <!--img class="mySlides" src="pic/${result.roomimagepic}" style="width:100%"-->
            <img class="mySlides" src="b01.jpeg" style="width:100%">
             <div class="coll">
              <div class="overflow-auto">
                  <div class="mytable">
                  <table>
                      <tr>
                          <td colspan="2" class="title">Nama Dewan</td>
                          <td colspan="3" class="details">${result.roomname}</td>
                      </tr>
                      <tr>
                          <td colspan="2" class="title">Kapasiti</td>
                          <td colspan="3" class="details">${result.roomcapacity}</td>
                      </tr>
                      <tr>
                          <td colspan="2" class="title">Status</td>
                          <td colspan="3" class="details">${result.roomstatus}</td>
                      </tr>
                      <tr>
                          <td colspan="2" class="title">Sistem Bunyi</td>
                          <td colspan="3" class="details">${result.soundsystem}</td>
                      </tr>                 
                   </table>
                  </div>
              </div>
          </div>
      </div><br><br>

       <input type="hidden" name="action"  value="deleteRoom">
        <button type="submit" 
                formaction="RoomServlet"
                onclick="return confirm('Pasti padam dewan <c:out value="${result.roomname}"/> ?');">Delete
        </button>
    <!--div class="button staff">
      <a href="viewRoom.jsp"><input type="button" value="KEMBALI"></a>
    </div-->
  </div>
  </div>
</div>
</div>
</form>
</div>
</section>
</c:forEach>
</body>
</html>