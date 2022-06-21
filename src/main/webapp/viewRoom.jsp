

<!DOCTYPE html>
<html>

<head>
    <title>Option read room</title>
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


<div class="home-content">
    <div class="container">
        <header class="main_title">PILIHAN BILIK</header>
	<form class="form first">
	<fieldset id="fields" style="border-radius: 5px;">
        <label class="title">B-01</label>
		<img src="b01.jpeg" height="150px" width="200px" alt="pic1">
		<img alt="pic2">
		<div class="button staff">
          <a href="read b01.html">Lihat</a>
        </div>
	</fieldset><br>
	<fieldset id="fields" style="border-radius: 5px;">
		<label class="title">B-02</label><br>
		<img src="b02.jpeg" height="150px" width="200px" alt="pic1">
		<img alt="pic2">
		<img alt="pic3">
		<div class="button staff">
            <input type="submit" value="Lihat">
        </div>
	</fieldset><br>
	<fieldset id="fields" style="border-radius: 5px;">
		<label class="title">B-03</label><br>
		<img src="h1.jpeg" height="150px" width="200px" alt="pic1">
		<img alt="pic2">
		<img alt="pic3">
		<div class="button staff">
            <input type="submit" value="Lihat">
        </div>
	</fieldset><br>
	<fieldset id="fields" style="border-radius: 5px;">
		<label class="title">B-04</label><br>
		<img src="h2.jpeg" height="150px" width="200px" alt="pic1">
		<img alt="pic2">
		<img alt="pic3">
		<div class="button staff">
            <input type="submit" value="Lihat">
        </div>
	</fieldset>
	</form>
</div>
</div>
</section>
  <!--<script src="script.js"></script>-->
</body>

</html>