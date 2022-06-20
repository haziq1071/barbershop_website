<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="UTF-8">
    <title> SignUp Staff Form </title>
    <link rel="stylesheet" href="signupAccount.css">
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
          <a class="main-menu" href="#">
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
            <li><a href="create-room.jsp">CIPTA INFO BILIK</a></li>
            <li><a href="create-hall.jsp">CIPTA INFO DEWAN</a></li>
            <li><a href="read for view.jsp">LIHAT INFO BILIK</a></li>
            <li><a href="read for update.jsp">KEMASKINI INFO BILIK</a></li>
            <li><a href="read for delete.jsp">PADAM INFO BILIK</a></li>
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
          <a class="main-menu" href="#">
            <i class='bx bx-user'></i>
            <span class="links_name">AKAUN</span>
          </a>
          <ul class="sub-menu">
            <li><a href="viewStaff.jsp">LIHAT AKAUN</a></li>
            <li><a href="updateStaff.jsp">KEMASKINI AKAUN</a></li>
            <li><a href="deleteStaff.jsp">PADAM AKAUN</a></li>
          </ul>
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
        <div class="contain_staff">
	        <header class="main_title">PENDAFTARAN AKAUN</header>

	        <form class="fstaff" method="post" o<%--nsubmit="return myFunction()"--%>>
	            <div class="form first">
	                <div class="details personal">
	                    <span class="title">Maklumat Peribadi</span>

	                    <div class="fields">
	                        <div class="input-field input-box">
	                            <label class="details">Nama Penuh</label>
	                            <input type="text" name="staffname"required>
	                        </div>
	                        <div class="input-field input-box">
	                            <label class="details">Kad Pengenalan</label>
	                            <input type="text" name="staffic"placeholder="xxxxxx-xx-xxxx" required>
	                        </div>
	                        <div class="input-field">
	                            <label class="details">Tarikh Lahir</label>
	                            <input type="date" name="staffdateofbirth"required>
	                        </div>
	                        <div class="input-field input-box">
	                            <label class="details">Alamat</label>
	                             <input type="text" name="staffaddress"required>
	                        </div>
	                        <div class="input-field input-box">
	                            <label class="details">Email</label>
	                            <input type="email" name="staffemail"required>
	                        </div>

	                        <div class="input-field input-box">
	                            <label class="details">Nombor Telefon</label>
	                            <input type="text" name="staffphone" required>
	                        </div>
	                        <div class="input-field">
	                            <label class="details">Jawatan</label>
	                            <select required>
	                                <option disabled selected>Pilih Jawatan</option>
	                                <option name="staffrole" >Nazir</option>
	                                <option name="staffrole">Timbalan Nazir</option>
	                                <option name="staffrole">Imam 1</option>
	                                <option name="staffrole">Imam 2</option>
	                                <option name="staffrole">Bilal 1</option>
	                                <option name="staffrole">Bilal 2</option>
	                                <option name="staffrole">Bendahari</option>
	                                <option name="staffrole">Setiausaha</option>
	                                <option name="staffrole">Pembantu Setiausaha</option>
	                                <option name="staffrole">AJK</option>
	                                <option name="staffrole">Siak 1</option>
	                                <option name="staffrole">Siak 2</option>
	                                <option name="staffrole">Pemeriksa Kira-kira 1</option>
	                                <option name="staffrole">Pemeriksa Kira-kira 2</option>
	                            </select>
	                        </div>
	                        <div class="input-field">
	                            <label class="details">ID Penyelia</label>
	                            <input type="text" name="supervisorid">
	                        </div>
	                    </div>
	                </div>
	                <div class="details ID">
	                    <span class="title">Maklumat Akaun</span>

	                    <div class="fields">
	                        <div class="input-field input-box">
	                            <label class="details">Nombor Staf</label>
	                              <input type="text" name="staffusername" required>
	                        </div>

	                        <div class="input-field input-box">
	                            <label class="details">Kata Laluan</label>
	                            <input type="password" name="staffpassword"required>
	                        </div>

	                        <div class="input-field input-box">
	                            <label class="details">Pengesahan Kata Laluan</label>
	                            <input type="password" name="staffpassword"required>
	                        </div>
	                    </div>

                      <input type="hidden" name="action" value="signupStaff">

	                    <div class="button staff">
						<input type="submit" value="Daftar" formaction="StaffServlet" onclick="return confirm('Akaun telah berjaya dicipta');">
	                    </div>
	                </div> 
	            </div>
	        </form>


    	</div>
    </div>
  </section>
<%--  <script>
    function myFunction() {
      alert("Akaun telah berjaya dicipta");
    }
  </script>--%>
</body>
</html>

