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
    <div class="sidebar">
    <div class="logo-details">
      <img src="logoWhite.png">
    </div>
      <ul class="nav-links">
        <li>
          <a class="main-menu" href="homepage.jsp">
            <i class='bx bx-home'></i>
            <span class="links_name">LAMAN UTAMA</span>
          </a>
        </li>

        <li>
          <a class="main-menu" href="#">
            <i class='bx bx-box' ></i>
            <span class="links_name">BILIK</span>
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
            <span class="links_name">TEMPAHAN</span>
          </a>
          <ul class="sub-menu">
            <li><a href="staffBooking.jsp">TEMPAH BILIK</a></li>
            <li><a href="staffViewBooking.jsp">LIHAT TEMPAHAN</a></li>
            <li><a href="staffDeleteBooking.jsp">PADAM TEMPAHAN</a></li>
            <li><a href="staffApproveBooking.jsp">SAHKAN TEMPAHAN</a></li>
          </ul>
        </li>

        <li>
          <a class="main-menu" href="viewStaff.jsp">
            <i class='bx bx-user'></i>
            <span class="links_name">AKAUN</span>
          </a>
        </li>
        <li class="log_out">
          <a class="main-menu" href="index.html">
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
          <a href="https://www.instagram.com/surau_ar_rahman_pchg/"><i class="fab fa-instagram"></i></a>
        </div>
    </nav>
    <div class="home-content">
        <div class="container-staff">
		<div class="rightbox">
			<div class="profile tabShow">
				<h1>MAKLUMAT STAF</h1>
				<h2>Nama Penuh</h2>
				<input type="text" class="input"  name="staffname" value="Akhyar Rashid">
				<h2>Kad Pengenalan</h2>
				<input type="text" class="input" name="staffic" value="010323-05-6064">
				<h2>Tarikh Lahir</h2>
				<input type="text" class="input" name="staffdateofbirth" value="24/2/1999">
				<h2>Alamat</h2>
				<input type="text" class="input" name="staffaddress" value="No. 48, Taman Nusa Damai, Selangor.">
				<h2>Email</h2>
				<input type="text" class="input" name="staffemail" value="akhyarrashid@gmail.com">
				<h2>Nombor Telefon</h2>
				<input type="text" class="input" name="staffphone" value="018-5676570">
				<h2>Jawatan</h2>
				<input type="text" class="input" name="staffrole" value="Bendahari">
        <h2>ID Penyelia</h2>
        <input type="text" class="input" name="supervisorid" value="01">
        <h2>Nombor Staf</h2>
         <input type="text" class="input" name="staffusername" value="NA67548">
        <h2>Kata Laluan</h2>
        <input type="password" class="input" name="staffpassword" value="akhyar05">

        <input type="hidden" name="action" value="updateStaff">
        
				<button class="btn update" onclick="return myFunction()">Kemaskini</button>
				<a href="viewStaff.jsp"><button class="btn cancel">Batal</button></a>
			</div>
		</div>
	</div>
    </div>
  </section>
   <script>
    function myFunction() {
      alert("Akaun telah berjaya dikemaskini!");
    }
  </script>
</body>
</html>

