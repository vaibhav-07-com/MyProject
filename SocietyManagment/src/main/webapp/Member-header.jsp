<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="model.member" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <!-- mobile metas -->
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="viewport" content="initial-scale=1, maximum-scale=1">
      <!-- site metas -->
      <meta name="keywords" content="">
      <meta name="description" content="">
      <meta name="author" content="">
      <!-- bootstrap css -->
      <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
      <!-- style css -->
      <link rel="stylesheet" type="text/css" href="css/style.css">
      <!-- Responsive-->
      <link rel="stylesheet" href="css/responsive.css">
      <!-- fevicon -->
      <link rel="icon" href="images/fevicon.png" type="image/gif" />
      <!-- font css -->
      <link href="https://fonts.googleapis.com/css2?family=Sen:wght@400;700;800&display=swap" rel="stylesheet">
      <!-- Scrollbar Custom CSS -->
      <link rel="stylesheet" href="css/jquery.mCustomScrollbar.min.css">
      <!-- Tweaks for older IEs-->
      <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
  
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<style>
/* --- fix name cutoff issue --- */
.navbar-nav {
  margin-left: auto !important;
  margin-right: 0 !important;
  justify-content: flex-end !important;
  align-items: center;
  flex-wrap: nowrap !important; /* prevent wrapping */
}

.navbar-nav .nav-item.dropdown {
  position: relative;
  display: flex;
  align-items: center;
}

.navbar-nav .dropdown-toggle {
  display: inline-flex !important;
  align-items: center;
  justify-content: center;
  overflow: visible !important;
  max-width: none !important;
  white-space: nowrap !important;
  padding: 8px 12px;
}

.navbar-nav .dropdown-toggle span {
  display: inline-block;
  max-width: 100%;
  overflow: visible !important;
  white-space: nowrap !important;
  color: #000;
  font-weight: 600;
}

/* Dropdown menu positioning */
.navbar-nav .dropdown-menu {
  right: 0;
  left: auto;
  min-width: 180px;
}

/* Hover blue color */
.navbar-nav .nav-link,
.navbar-nav .dropdown-toggle {
  color: #000;
  transition: color 0.3s ease;
  font-weight: 500;
}

.navbar-nav .nav-link:hover,
.navbar-nav .dropdown-toggle:hover span {
  color: #007bff;
}

</style>

</head>
<body>
<%
	member m = null;
	if (session.getAttribute("data") != null) {
		m = (member) session.getAttribute("data");
	} else {
		response.sendRedirect("Member-Login.jsp");
	}
	%>
<div class="header_section">
  <div class="container-fluid">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
      <a class="navbar-brand" href="index.html"><img src="images/logo.png" alt="Logo"></a>

      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav ml-auto">

          <li class="nav-item active">
            <a class="nav-link" href="member-Home.jsps">Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="Member-EventBook.jsp">EventBook</a>
          </li>
          
          <li class="nav-item">
            <a class="nav-link" href="member?action=viewMaintenance&member_id=<%= m.getMemberId() %>">Maintenance</a>
          </li>
          
          <li class="nav-item">
            <a class="nav-link" href="member?action=viewVisitor&member_id=<%= m.getMemberId() %>">Visitors</a>
          </li>
          
          <li class="nav-item">
            <a class="nav-link" href="Member-Complaint.jsp">Complaint</a>
          </li>
          
          <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="departmentDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <span><%=m.getFirstName() %></span>
                </a>
                <div class="dropdown-menu" aria-labelledby="departmentDropdown">
                    <a class="dropdown-item" href="Member-Profile.jsp">Profile</a>
                    <a class="dropdown-item" href="Member-Change-passsword.jsp">Chnage Password</a>
                     <a class="dropdown-item" href="Member-Logout.jsp">Logout</a>
                </div>
              </li>
          

        </ul>
      </div>
    </nav>
  </div>

  

<script src="js/jquery.min.js"></script>
      <script src="js/popper.min.js"></script>
      <script src="js/bootstrap.bundle.min.js"></script>
      <script src="js/jquery-3.0.0.min.js"></script>
      <script src="js/plugin.js"></script>
      <!-- sidebar -->
      
      <!-- javascript --> 
      
</body>
</html>