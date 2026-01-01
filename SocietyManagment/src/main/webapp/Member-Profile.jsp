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
          <h2 class="text-md mb-2">Update Member Profile</h2>
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
        <form action="member" method="post" class="appointment-form ftco-animate" enctype="multipart/form-data">

          <!-- First Name -->
          <div class="form-group mb-3">
            <label for="first_name">First Name</label>
            <input type="text" name="first_name" id="first_name" class="form-control"
                   value="<%= m.getFirstName() %>" required>
          </div>

          <!-- Last Name -->
          <div class="form-group mb-3">
            <label for="last_name">Last Name</label>
            <input type="text" name="last_name" id="last_name" class="form-control"
                   value="<%= m.getLastName() %>" required>
          </div>

          <!-- Gender -->
          <div class="form-group mb-3">
            <label>Gender</label><br>
            <label><input type="radio" name="gender" value="Male" <%= m.getGender().equals("Male") ? "checked" : "" %>> Male</label>&nbsp;&nbsp;
            <label><input type="radio" name="gender" value="Female" <%= m.getGender().equals("Female") ? "checked" : "" %>> Female</label>&nbsp;&nbsp;
            <label><input type="radio" name="gender" value="Other" <%= m.getGender().equals("Other") ? "checked" : "" %>> Other</label>
          </div>

          <!-- Date of Birth -->
          <div class="form-group mb-3">
            <label for="dob">Date of Birth</label>
            <input type="date" name="dob" id="dob" class="form-control"
                   value="<%= m.getDob() %>" required>
          </div>

          <!-- Email -->
          <div class="form-group mb-3">
            <label for="email">Email</label>
            <input type="email" name="email" id="email" class="form-control"
                   value="<%= m.getEmail() %>" required>
          </div>

          <!-- Contact Number -->
          <div class="form-group mb-3">
            <label for="contact_no">Contact Number</label>
            <input type="text" name="contact_no" id="contact_no" class="form-control"
                   value="<%= m.getContactNo() %>" required>
          </div>

          <!-- Occupation -->
          <div class="form-group mb-3">
            <label for="occupation">Occupation</label>
            <input type="text" name="occupation" id="occupation" class="form-control"
                   value="<%= m.getOccupation() %>">
          </div>

          <!-- Address -->
          <div class="form-group mb-3">
            <label for="address">Address</label>
            <textarea name="address" id="address" class="form-control" rows="3"
                      placeholder="Enter full address"><%= m.getAddress() %></textarea>
          </div>

          <!-- Photo -->
          <div class="form-group mb-4">
            <label for="photo">Profile Photo</label>
            <input type="file" name="photo" id="photo" class="form-control">
            <div class="mt-2">
              <img src="images/<%= m.getPhoto() %>" alt="Profile Photo" width="100" height="100">
            </div>
          </div>
          
          <!-- Hidden field for Member ID -->
          <input type="hidden" name="member_id" value="<%= m.getMemberId() %>">

          <!-- Submit Button -->
          <div class="text-center">
            <button type="submit" name="action" value="updateProfile" class="btn btn-primary">Update Profile</button>
          </div>

        </form>
      </div>
    </div>
  </div>
</section>

</body>
</html>