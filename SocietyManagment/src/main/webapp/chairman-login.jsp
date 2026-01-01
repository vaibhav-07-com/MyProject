<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="header.jsp" %>
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
      <div class="col-lg-6">
        <div class="section-title text-center">
          <h2 class="text-md mb-2">Chairman Login</h2>
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
      <div class="col-lg-6">
        <form action="Chairman" method="post" class="appointment-form ftco-animate">

          <!-- Email -->
          <div class="form-group mb-3">
            <label for="email">Email</label>
            <input type="email" name="email" id="email" class="form-control"
                   placeholder="Enter your email" required>
          </div>

          <!-- Password -->
          <div class="form-group mb-4">
            <label for="password">Password</label>
            <input type="password" name="password" id="password" class="form-control"
                   placeholder="Enter your password" required>
          </div>

          <!-- Submit Button -->
          <div class="text-center">
            <button type="submit" name="action" value="login" class="btn btn-primary">
              Login
            </button>
          </div>

        </form>
      </div>
    </div>
  </div>
</section>

</body>
</html>