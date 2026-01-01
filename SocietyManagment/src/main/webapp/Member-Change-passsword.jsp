<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="Member-header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<section class="contact-form-wrap section">
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-lg-8">
        <div class="section-title text-center">
          <h2 class="text-md mb-2">Update Password</h2>
          <div class="divider mx-auto my-4"></div>
        </div>
      </div>
    </div>
<%
String msg = (String) request.getAttribute("msg");
%>
<%
if (msg != null) {
%>
<div class="section-title text-center">
<h4 class="text-md mb-2" style="color: red;"><%= msg %></h4>
</div>
<%
}
%>
    <div class="row justify-content-center">
      <div class="col-lg-8">
        <form action="member" method="post" class="appointment-form ftco-animate">

          <!-- Email -->
          <div class="form-group mb-3">
            <label for="email">Email</label>
            <input type="email" name="email" id="email" class="form-control"
                   value="<%= m.getEmail() %>" required>
          </div>

          <!-- Old Password -->
          <div class="form-group mb-3">
            <label for="oldpass">Old Password</label>
            <input type="password" name="oldpass" id="oldpass" class="form-control"
                   placeholder="Enter your old password" required>
          </div>

          <!-- New Password -->
          <div class="form-group mb-3">
            <label for="newpass">New Password</label>
            <input type="password" name="newpass" id="newpass" class="form-control"
                   placeholder="Enter new password" required>
          </div>

          <!-- Confirm New Password -->
          <div class="form-group mb-4">
            <label for="confnewpass">Confirm New Password</label>
            <input type="password" name="confnewpass" id="confnewpass" class="form-control"
                   placeholder="Re-enter new password" required>
          </div>

          <!-- Submit Button -->
          <div class="text-center">
            <button type="submit" name="action" value="updatePassword" class="btn btn-primary">
              Update Password
            </button>
          </div>

        </form>
      </div>
    </div>
  </div>
</section>

</body>
</html>