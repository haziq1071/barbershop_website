<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
	<meta charset="UTF-8">
	<title>Create Space Form</title>
	<link rel="stylesheet" href="createspace.css">
	<link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
//dccvdv
<body>
<sql:setDataSource
		var="ic"
		driver="org.postgresql.Driver"
		url="postgresql://postgres:K2AVv8EYHZvPj7HrbfGt@containers-us-west-10.railway.app:7326/railway"
		user="postgres"
		password="K2AVv8EYHZvPj7HrbfGt"/>
<sql:query dataSource="${ic}" var="oc">
    SELECT serviceid,servicename from services
</sql:query>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");

    if(session.getAttribute("staffid")==null)
        response.sendRedirect("index.jsp");
  %>

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
				<a class="main-menu" href="staffViewSpace.jsp">
					<i class='bx bx-box'></i>
					<span class="links_name min">RUANG</span>
				</a>
			</li>

			<li>
				<a class="main-menu" href="staffApproveBooking.jsp">
					<i class='bx bx-bookmark'></i>
					<span class="links_name min">TEMPAHAN</span>
				</a>
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
				<a href="https://www.facebook.com/sarpuchongjaya/"><i
					class="fab fa-facebook-f"></i></a> <a
					href="https://www.instagram.com.surau_ar_rahman_pchg"><i
					class="fab fa-instagram"></i></a>
			</div>
		</nav>

		<div class="home-content">
			<div class="container">
				<header class="main_title">Create Services</header>
				<form method="post">
					<div class="form first">
						<div class="details room">
							<span class="title">INFO</span>
							<div class="fields">
								<div class="input-field input-box">
									<label class="details">Service Name</label>
									<input type="text" name="servicename" required>
								</div>

								<div class="input-field input-box">
									<label class="details">Description</label>
									<input type="text"	name="servicedescription" required>
								</div>

								<div class="input-field input-box">
									<label class="details">Price</label>
									<input type="text" name="serviceprice" pattern="[0-9]+" title="Price only number allowed" required>
								</div>

							</div>
							<input type="hidden" name="action" value="createServices">
							<div class="button staff">
								<input type="submit" value="TAMBAH" formaction="ServicesServlet">
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</section>
</body>
</html>


