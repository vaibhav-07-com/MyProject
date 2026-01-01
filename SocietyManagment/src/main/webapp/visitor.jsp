<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@include file="security-header.jsp" %>
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
          <h2 class="text-md mb-2">Visitor Entry Form</h2>
          <div class="divider mx-auto my-4"></div>
        </div>
      </div>
    </div>

    <% String msg = (String) request.getAttribute("msg"); %>
    <% if (msg != null) { %>
      <div class="section-title text-center">
        <h4 class="text-md mb-2" style="color: red;"><%= msg %></h4>
      </div>
    <% } %>

    <div class="row">
      <div class="col-lg-12 col-md-12 col-sm-12">
        <form action="security" class="appointment-form ftco-animate" method="post" enctype="multipart/form-data">
          <div class="row">

            <!-- Visitor Name -->
            <div class="col-md-6 mb-3 form-group">
            <label class="form-label-float">Visitor Name</label>
              <input name="visitor_name" type="text" class="form-control" placeholder=" " required>
                          </div>

            <!-- Contact Number -->
            <div class="col-md-6 mb-3 form-group">
            <label class="form-label-float">Contact Number</label>
              <input name="contact_no" type="text" class="form-control" placeholder=" " required>
              
            </div>

            <!-- Member Name -->
            <div class="col-md-6 mb-3 form-group">
            <label class="form-label-float">Member Name</label>
              <input name="member_name" type="text" class="form-control" placeholder=" " required>
              
            </div>

            <!-- Flat Number -->
            <div class="col-md-6 mb-3 form-group">
				<div class="no-material">
				  <label>Flat No</label>
				  <select name="flat_no" class="form-control">
				    <option value="">Select Flat</option>
				    <option value="101">101</option>
				    <option value="102">102</option>
				    <option value="103">103</option>
				    <option value="104">104</option>
				    <option value="105">105</option>
				    <option value="106">106</option>
				    <option value="107">107</option>
				    <option value="108">108</option>
				    <option value="109">109</option>
				    <option value="110">110</option>
				  </select>
				</div>
			</div>

            <div class="col-md-6 mb-3 form-group">
				<div class="no-material">
				  <label>Block</label>
				  <select name="block" class="form-control">
				    <option value="">Select Block</option>
				    <option value="A">A</option>
				    <option value="B">B</option>
				    <option value="C">C</option>
				    <option value="D">D</option>
				  </select>
				</div>
			</div>

            <!-- In Time -->
            <div class="col-md-6 mb-3 form-group">
            <label class="form-label-float">In Time</label>
              <input name="in_time" type="datetime-local" class="form-control" placeholder=" " required>
              
            </div>

            <!-- Visitor Photo -->
            <div class="col-md-6 mb-3 form-group">
            <label class="form-label-float">Visitor Photo</label>
              <input name="visitor_photo" type="file" class="" placeholder=" " accept="image/*" required>
            </div>
            
            <!-- Security ID -->
            <div class="col-md-6 mb-3 form-group">
              <input name="security_id" type="hidden" class="form-control" value="<%=s.getId() %>" required>
            </div>
            
            <!-- Submit -->
            <div class="col-12 text-center mt-3">
              <input name="action" type="submit" value="AddVisitor" class="btn btn-secondary py-3 px-5">
            </div>

          </div>
        </form>
      </div>
    </div>
  </div>
</section>

</body>
</html>