<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
<head lang="en" dir="ltr">
  <meta charset="UTF-8">
    <title> Update Space Form</title>
    <link rel="stylesheet" href="createspace.css">
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"/>
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
  <%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");

    if(session.getAttribute("staffid")==null)
        response.sendRedirect("index.jsp");
  %>
	<sql:setDataSource
            var="ic"
            driver="org.postgresql.Driver"
            url="postgresql://postgres:K2AVv8EYHZvPj7HrbfGt@containers-us-west-10.railway.app:7326/railway"
            user="postgres"
            password="K2AVv8EYHZvPj7HrbfGt"/>

<sql:query dataSource="${ic}" var="oc">
    <%
        int jserviceid = 0;

        if(request.getParameter("serviceid")==null){
            jserviceid = (Integer) session.getAttribute("serviceid");
        }
        else{
            jserviceid = Integer.parseInt(request.getParameter("serviceid"));
            session.setAttribute("serviceid", jserviceid);
        }
    %>
    <c:set var="jserviceid" value="<%=jserviceid%>"/>
    SELECT * FROM services WHERE serviceid=?
    <sql:param value="${jserviceid}" />
</sql:query>
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
            <span class="links_name" >TEMPAHAN</span>
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
              <a href="https://www.facebook.com/sarpuchongjaya/"><i class="fab fa-facebook-f"></i></a>
              <a href="https://www.instagram.com.surau_ar_rahman_pchg"><i class="fab fa-instagram"></i></a>
            </div>
        </nav>
        <c:forEach var="space" items="${oc.rows}">
        <div class="home-content">
          <div class="container">
              <form action="ServicesServlet" method="post">
              <header class="main_title">KEMASKINI DEWAN</header>
                <div class="form first">
                  <div class="details room">
                    <span class="title">INFORMASI DEWAN</span>
                    <div class="fields">
                      <div class="input-field input-box">
                        <input type="hidden" name="serviceid" value="${services.serviceid}"/>
                        <label class="details" >Service Name</label>
                        <input type="text" name="servicename" value="${services.servicename}" required>
                      </div>

                        <div class="input-field input-box">
                            <label class="details">Description</label>
                            <input type="text" name="servicedescription" value="${services.servicedescription}" required>
                        </div>

                      <div class="input-field input-box">
                        <label class="details">Price</label>
                        <input type="text" name="serviceprice" value="${services.serviceprice}" pattern="[0-9]+" title="Price only number allowed" required>
                      </div>


                          <input type="hidden" name="action" value="updateServices">
                      <a href="staffViewSpace.jsp"><button class="update">KEMASKINI</button></a>
                      <a href="staffViewSpace.jsp"><button class="delete">BATAL</button></a>                   
                    </div> 
                  </div>
              </div>
            </form>
        </div>
      </div>
    </c:forEach>
  </section>
</body>
</html>