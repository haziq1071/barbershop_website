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
                <input type="text" name="applicantic" pattern="[0-9]{6}-[0-9]{2}-[0-9]{4}" title="xxxxxx-xx-xxxx" required>
              </div>
              <div class="input-field">
                <label class="details">Tarikh Lahir</label>
                <input type="date" name="applicantdateofbirth" max="2023-01-25" required>
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
                <input type="text" name="applicantphone" pattern="[0-9]{3}-[0-9]{7}" title="xxx-xxxxxxx" required>
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
              <input type="submit" value="Daftar" formaction="ApplicantServlet">
            </div>
          </div>
        </div>
      </form>
    </div>
  </div>
</section>
</body>
</html>


