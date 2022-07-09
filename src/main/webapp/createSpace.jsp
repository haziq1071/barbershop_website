<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<meta charset="UTF-8">
<title>Create Hall Form</title>
<link rel="stylesheet" href="createroom.css">
<link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css'
	rel='stylesheet'>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css" />
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
					<i class='bx bx-box'></i>
					<span class="links_name min">BILIK</span>
				</a>
				<ul class="sub-menu">
					<li><a href="createRoom.jsp">CIPTA INFO BILIK</a></li>
					<li><a href="createHall.jsp">CIPTA INFO DEWAN</a></li>
					<li><a href="viewRoom.jsp">LIHAT INFO BILIK</a></li>
					<li><a href="updateRoom.jsp">KEMASKINI INFO BILIK</a></li>
					<li><a href="deleteRoom.jsp">PADAM INFO BILIK</a></li>
				</ul>
			</li>

			<li><a class="main-menu" href="#"> <i class='bx bx-bookmark'></i>
					<span class="links_name min">TEMPAHAN</span>
			</a>
				<ul class="sub-menu">
					<li><a href="staffBooking.html">TEMPAH BILIK</a></li>
					<li><a href="staffViewBooking.html">LIHAT TEMPAHAN</a></li>
					<li><a href="staffUpdateBooking.html">KEMASKINI TEMPAHAN</a></li>
					<li><a href="staffDeleteBooking.html">PADAM TEMPAHAN</a></li>
					<li><a href="staffApproveBooking.html">SAHKAN TEMPAHAN</a></li>
				</ul></li>

			<li><a class="main-menu" href="#"> <i class='bx bx-user'></i>
					<span class="links_name">AKAUN</span>
			</a>
				<ul class="sub-menu">
					<li><a href="viewStaff.html">LIHAT AKAUN</a></li>
					<li><a href="updateStaff.html">KEMASKINI AKAUN</a></li>
					<li><a href="deleteStaff.html">PADAM AKAUN</a></li>
				</ul></li>

			<li class="log_out"><a class="main-menu" href="index.jsp"> <i
					class='bx bx-log-out'></i> <span class="links_name">LOG
						KELUAR</span>
			</a></li>
		</ul>
	</div>

	<section class="home-section">
		<nav>
			<div class="sidebar-button">
				<span class="dashboard">SURAU AR-RAHMAN BANDAR PUCHONG JAYA</span>
			</div>
			<div class="media_icons">
				<a href="https://www.facebook.com/sarpuchongjaya/"><i
					class="fab fa-facebook-f"></i></a> <a
					href="https://www.instagram.com.surau_ar_rahman_pchg"><i
					class="fab fa-instagram"></i></a>
			</div>
		</nav>

		<div class="home-content">
			<div class="container">
				<header class="main_title">PENAMBAHAN DEWAN</header>
				<form name="createRoom" method="post">
					<div class="form first">
						<div class="details room">
							<span class="title">Informasi Dewan</span>

							<div class="fields">
								<div class="input-field input-box">
									<label class="details">Nama Dewan </label> 
									<input type="text" name="roomname" >
								</div>
								<div class="input-field input-box">
									<label class="details">Kapasiti</label>
									<input type="text" name="roomcapacity" >
								</div>
								<div class="input-field input-box">
									<label class="details">Status Dewan</label>
									<select	name="roomstatus" >
										<option disabled selected>Pilih Status</option>
										<option value="Boleh Digunakan">Boleh Digunakan</option>
										<option value="Sedang Diselenggara">Sedang Diselenggara</option>
									</select>
								</div>
								<div class="input-field input-box">
									<label class="details">Sistem Bunyi</label>
									<select	name="soundsystem" >
										<option disabled selected>Pilih Sistem Bunyi</option>
										<option value="Mikrofon Sahaja">Mikrofon Sahaja</option>
										<option value="Mikrofon Dan Speaker">Mikrofon Dan Speaker</option>
										<option value="Set Sistem Bar Bunyi">Set Sistem Bar Bunyi</option>
										<option value="Set Sistem Bunyi Hi-fi">Set Sistem Bunyi Hi-fi</option>
									</select>
								</div>
								<div class="input-field input-box">
									<label class="details">Bilangan Meja</label>
									<input type="text" name="tablequantity" >
								</div>
								<div class="input-field input-box">
									<label class="details">Bilangan Kerusi</label>
									<input type="text" name="chairquantity" >
								</div>
							</div>
							<input type="hidden" name="action" value="createRoom">
							<div class="button staff">
								<input type="submit" name="createRoom" value="TAMBAH" formaction="RoomServlet" onclick="return confirm('Bilik telah berjaya ditambah!');">
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</section>

</body>
</html>

