<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="UTF-8">
    <title> Login Account Form </title>
    <link rel="stylesheet" href="loginAccount.css">
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"/>
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
   </head>

<body>
  <div class="sidebar">
    <div class="logo-details">
      <img src="barber_logo.png">
    </div>
  </div>
  <section class="home-section">
    <nav>
      <div class="sidebar-button">
        <span class="dashboard">DE'MACHO BARBERSHOP</span>
      </div>
      <div class="media_icons">
          <a href="https://www.facebook.com/demachobarber/"><i class="fab fa-facebook-f"></i></a>
        </div>
    </nav>
    <div class="home-content">
        <div class="hero">
          <div class="form-box">
          <div class="button-box">
            <div id="btn"></div>
            <button type="button" class="toggle-btn" onclick="staffLogin()">STAFF</button>
            <button type="button" class="toggle-btn" onclick="applicantLogin()">USER</button>
          </div>
          <div class="logo">
            <img src="barber_logo.png">
          </div>
          <form id="staff" class="input-group" action="StaffServlet" method="POST">
            <input type="text" class="input-field" name="staffusername" placeholder="USER NAME" required>
            <input type="password" class="input-field" name="staffpassword" placeholder="PASSWORD" required>
            <div class="input-box button">

              <input type="hidden" name="action" value="loginStaff">

              <input type="submit" name="submit" value="Log Masuk">
            </div>
            <div class="login-signup">
                <span class="text">Dont Have Account?
                  <a href="staffCreateAccount.jsp" class="text signup-link">Register Now!</a>
                </span>
            </div>
          </form>
          <form id="applicant" class="input-group" action="ApplicantServlet" method="POST">
            <input type="text" class="input-field" name="applicantusername"  placeholder="USER NAME" required>
            <input type="password" class="input-field" name="applicantpassword" placeholder="PASSWORD" required>
            <div class="input-box button">

               <input type="hidden" name="action" value="loginApplicant">

              <input type="submit" name="submit" value="Log In">
            </div>
            <div class="login-signup">
              <span class="text">Dont Have Account?
                <a href="applicantCreateAccount.jsp" class="text signup-link">Register Now!</a>
              </span>
            </div>
          </form>
        </div>
      </div>
    </div>
  </section>

  <script>

    var x = document.getElementById("staff");
    var y = document.getElementById("applicant");
    var z = document.getElementById("btn");

    function applicantLogin(){
      x.style.left = "-400px";
      y.style.left = "50px";
      z.style.left = "110px";
    }

    function staffLogin(){
      x.style.left = "50px";
      y.style.left = "450px";
      z.style.left = "0";
    }
 </script>

</body>
</html>

