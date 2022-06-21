

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
        <header class="main_title">KEMASKINI BILIK</header>
        <form action="#" method="" onsubmit="return myFunction()">
          <div class="form first">
            <div class="details room">
              <span class="title">Informasi Bilik</span>

              <div class="fields">
                <div class="input-field input-box">
                  <label class="details">Nama Bilik </label>
                  <input type="text" name="roomname" placeholder="B-01">
                </div>
                <div class="input_field input_box" style="float: left;padding-left: 30px; width: 190px;"><!--start division upload image-->
                  <label class ="details">Pilih Gambar : </label><br>
                  <input type="file" id="answer" name="image" accept="image/*">
                </div><!--end division letak gambar-->
                <div class="input-field input-box">
                  <label class="details">Kapasiti</label>
                  <input type="text" name="roomcapacity" placeholder="30 orang">
                </div>
              </div>
            </div>
            
            <div class="details ID">
              <span class="title">Fasiliti bilik</span>
              <div class="fields">
              <div class="input-field input-box">
                <input type="text" name ="tablequantity" placeholder="15 meja">
              </div>
              <div class="input-field input-box">
                <input type="text" name="chairquanity" placeholder="30 kerusi">
              </div>
              <div class="input-field input-box">
                <input type="text" name="lectureequipment" placeholder="1 projektor">
              </div>
              <div class="input-field input-box">
                <input type="text" name="soundsystem" placeholder="1 Pembesar suara dan mikrofon">
              </div>
              <div class="button staff">
                <input type="submit" value="KEMASKINI">
              </div>
            </div> 
        </div>
      </form>
    </div>
  </div>
  </section>

  <script>
    function myFunction(){
      alert("Bilik berjaya ditambah.");
    }
 </script>

</html>