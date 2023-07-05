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
    <div class="contain_applicant">
      <header class="main_title">ACCOUNT REGISTRATION</header>
      <form class="fapplicant" method="post">
        <div class="form first">
          <div class="details personal">
            <span class="title">PERSONAL INFORMATION</span>

            <div class="fields">
              <div class="input-field input-box">
                <label class="details">FULL NAME</label>
                <input type="text" name="applicantname" required>
              </div>
              <div class="input-field input-box">
                <label class="details">IC NUMBER</label>
                <input type="text" id="icNumber" name="applicantic" pattern="[0-9]{6}-[0-9]{2}-[0-9]{4}" title="xxxxxx-xx-xxxx" required>
              </div>
              <div class="input-field">
                <label class="details">BIRTH DATE</label>
                <input type="date" name="applicantdateofbirth" max="<%=java.time.LocalDate.now()%>" required>
              </div>
              <div class="input-field input-box">
                <label class="details">ADDRESS</label>
                <input type="text" name="applicantaddress" required>
              </div>
              <div class="input-field input-box">
                <label class="details">Email</label>
                <input type="email" name="applicantemail" required>
              </div>

              <div class="input-field input-box">
                <label class="details">PHONE NUMBER</label>
                <input type="text" name="applicantphone" pattern="[0-9]{3}-[0-9]{7}" title="xxx-xxxxxxx" required>
              </div>
            </div>
          </div>
          <div class="details ID">
            <span class="title">ACCOUNT INFORMATION</span>

            <div class="fields">
              <div class="input-field input-box">
                <label class="details">USERNAME</label>
                <input type="text" name="applicantusername" required>
              </div>

              <div class="input-field input-box">
                <label class="details">PASSWORD</label>
                <input type="password" name="applicantpassword" required>
              </div>
            </div>

            <input type="hidden" name="action" value="signupApplicant">

            <div class="button applicant">
              <input type="submit" value="CREATE" formaction="ApplicantServlet">
            </div>
          </div>
        </div>
      </form>
    </div>
  </div>
</section>
<script>
  document.querySelector("form").addEventListener("submit", function(event) {
    var icNumberInput = document.getElementById("icNumber");
    var birthdateInput = document.getElementById("birthdate");

    var icNumber = icNumberInput.value;
    var selectedBirthdate = birthdateInput.value;

    // Extract the birthdate part from the IC number
    var icBirthdate = icNumber.substr(0, 6).replace("-", "");

    if (selectedBirthdate !== icBirthdate) {
      alert("The IC number does not match the selected birthdate.");
      event.preventDefault(); // Prevent form submission
    }
  });
</script>
</body>
</html>


