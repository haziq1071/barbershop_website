<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 9/7/2022
  Time: 11:18 AM
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
  <meta charset="UTF-8">
  <title> SignUp Applicant Form </title>
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
        <span class="links_name">RUANGAN</span>
      </a>
    </li>
    <li>
      <a class="main-menu" href="#">
        <i class='bx bx-bookmark'></i>
        <span class="links_name">TEMPAHAN</span>
      </a>
    </li>
    <li>
      <a class="main-menu" href="#">
        <i class='bx bx-user'></i>
        <span class="links_name">AKAUN</span>
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
    <div class="contain_applicant">
      <header class="main_title">PENDAFTARAN AKAUN</header>
      <form class="fapplicant" method="post">
        <div class="form first">
          <div class="details personal">
            <span class="title">Maklumat Peribadi</span>

            <div class="fields">
              <div class="input-field input-box">
                <label class="details">Nama Penuh</label>
                <input type="text" name="applicantname" required>
              </div>
              <div class="input-field input-box">
                <label class="details">Kad Pengenalan</label>
                <input type="text" name="applicantic" placeholder="xxxxxx-xx-xxxx" required>
              </div>
              <div class="input-field">
                <label class="details">Tarikh Lahir</label>
                <input type="date" name="applicantdateofbirth" required>
              </div>
              <div class="input-field input-box">
                <label class="details">Alamat</label>
                <input type="text" name="applicantaddress" required>
              </div>
              <div class="input-field input-box">
                <label class="details">Email</label>
                <input type="email" name="applicantemail" required>
              </div>

              <div class="input-field input-box">
                <label class="details">Nombor Telefon</label>
                <input type="text" name="applicantphone" required>
              </div>
            </div>
          </div>
          <div class="details ID">
            <span class="title">Maklumat Akaun</span>

            <div class="fields">
              <div class="input-field input-box">
                <label class="details">Nama Pengguna</label>
                <input type="text" name="applicantusername" required>
              </div>

              <div class="input-field input-box">
                <label class="details">Kata Laluan</label>
                <input type="password" name="applicantpassword" required>
              </div>
            </div>

            <input type="hidden" name="action" value="signupApplicant">

            <div class="button applicant">
              <input type="submit" value="Daftar" formaction="ApplicantServlet" onclick="return confirm('Akaun telah berjaya dicipta');">
            </div>
          </div>
        </div>
      </form>
    </div>
  </div>
</section>
</body>
</html>

