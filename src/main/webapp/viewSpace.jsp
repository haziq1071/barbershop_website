<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
    <title> Create Space </title>
    <link rel="stylesheet" href="roomHandler.css">
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"/>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
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
          <a class="main-menu" href="viewSpace.jsp">
            <i class='bx bx-box' ></i>
            <span class="links_name" id="min">RUANG</span>
          </a>
          <!--ul class="sub-menu">
            <li><a href="createRoom.jsp">CIPTA INFO BILIK</a></li>
            <li><a href="createHall.jsp">CIPTA INFO DEWAN</a></li>
          </ul-->
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
    <div class="container">
    <a href="createSpace.jsp"><button class="add">TAMBAH RUANG</button></a>
      <header class="main_title" style="font-size: xx-large">SENARAI RUANG</header>
        <c:forEach var="result" items="${oc.rows}">
        <input type="number" name="roomid"  value="${result.roomid}" hidden>
        <form action="" method="post">
          <section class="wrapper top">
                <div class="containerRoom">
                 <div class="text">
                    <h2>Dewan ${result.roomname}</h2>
                      <div class="content">
                        <span>Kapasiti:</span>
                        <span>${result.roomcapacity}</span>
                        <span>Status:</span>
                        <span>${result.roomstatus}</span>
                        <span>Sistem Bunyi:</span>
                        <span>${result.soundsystem}</span>  

                        <a href="updateSpace.jsp"><button class="update">KEMASKINI
                        </button></a>
                        <input type="hidden" name="action"  value="deleteRoom">
                        <button type="submit" class="delete" formaction="RoomServlet"
                        onclick="return confirm('Pasti padam dewan <c:out value="${result.roomname}"/> ?');">PADAM
                        </button>             
                      </div>
                 </div>
                </div>
          </section>
  		</form>
  		</c:forEach>
  	</div>
  </div>
</section>
</body>
</html>