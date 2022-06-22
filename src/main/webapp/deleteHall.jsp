
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
    <title> Delete room </title>
    <link rel="stylesheet" href="createroom.css">
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"/>
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>

<body>
<sql:setDataSource var="ic" driver="org.postgresql.Driver" url="jdbc:postgresql://ec2-52-72-56-59.compute-1.amazonaws.com:5432/d274lnoegak379" user="dnzxqagexabepj" 
password="edb330e6fe55ed3bb6d1ee1eb3c1f995e6b205eb5d464bee634abc3345b2d294"/>

<sql:query dataSource="${ic}" var="oc">
    SELECT * from room where roomid=?
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
        <li><a href="create-room.html">CIPTA INFO BILIK</a></li>
        <li><a href="create-hall.html">CIPTA INFO DEWAN</a></li>    
        <li><a href="read for view.html">LIHAT INFO BILIK</a></li>    
        <li><a href="read for update.html">KEMASKINI INFO BILIK</a></li>
        <li><a href="read for delete.html">PADAM INFO BILIK</a></li>
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
        <header class="main_title">PADAM BILIK</header>

        <c:forEach var="result" items="${oc.rows}">

	<form action="RoomServlet" method="post">
		<div class="form first">
			<div class="details room">
			<span class="title">Bilik : B-01</span><br><br>

		<fieldset><!--start fieldset image bilik-->
			<img alt="pic">
		</fieldset><!--end fieldset gambar-->
    
    <div class="fields">
      <div class="details">
			      <span class="title">INFORMASI DEWAN</span>
            <input type="hidden" name="roomdid"  value="${result.roomid}">
            <h2 class="title">Nama Dewan</h2>
            <p class="details"><c:out value="${result.roomname}"/></p>
            <h2 class="title">Kapasiti</h2>
            <p class="details"><c:out value="${result.roomcapacity}"/></p>
            <h2 class="title">Status</h2>
            <p class="details"><c:out value="${result.roomstatus}"/></p>
            <h2 class="title">Sistem Bunyi</h2>
            <p class="details"><c:out value="${result.soundsystem}"/></p>
    </div><br><br>
      <input type="hidden" name="action" value="deleteRoom">
		<div class="button staff">
      <button type="submit" formaction="RoomServlet"
                                onclick="return confirm('Anda pasti ingin padam dewan <c:out value="${result.roomname}"/> ?');">PADAM
                    </button>
    </div>
	</div>
	</div>
</div>
	</form>
   </c:forEach>
</div>
</div>
</section>
<!--
<script>
	function myFunction(){
		alert("Bilik berjaya dipadam.");
	}
</script>
--->
</html>