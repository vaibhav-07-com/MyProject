<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="Member-header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Member Complaint</title>
  
<style>
.form-group {
  position: relative;
  margin-bottom: 1.5rem;
}

.form-group .form-control {
  padding-top: 1.5rem; /* increased top padding for space above */
  padding-bottom: 0.5rem; /* slight space below */
}

.form-label-float {
  position: absolute;
  top: 0.85rem;              /* vertical alignment: label inside input */
  left: 2rem;                /* moved slightly right */
  transition: 0.2s ease all;
  color: #aaa;
  font-size: 1rem;
  background: white;
  padding: 0 6px;            /* slight horizontal padding */
  pointer-events: none;
}

.form-control:focus + .form-label-float,
.form-control:not(:placeholder-shown) + .form-label-float {
  top: -0.65rem;             /* floats above input */
  left: 0.85rem;             /* aligns nicely when floated */
  font-size: 0.75rem;
  color: #333;
}

/* Optional: Smoother transition */
.form-control {
  transition: border-color 0.3s ease, box-shadow 0.3s ease;
}

/* Fix spacing for textarea too */
textarea.form-control {
  min-height: 100px;
  resize: vertical;
  padding-top: 1.5rem;
}

.no-material label {
  position: static !important;
  top: auto !important;
  left: auto !important;
  transform: none !important;
  font-size: 14px !important;
  color: #333 !important;
  background: transparent !important;
  z-index: 1;
}

.no-material select.form-control {
  all: unset;
  display: block;
  width: 100%;
  padding: 8px 10px;
  border: 1px solid #ccc;
  border-radius: 4px;
  background-color: #fff !important;
  font-size: 14px;
  color: #000 !important;
  appearance: menulist !important;
  -webkit-appearance: menulist !important;
  -moz-appearance: menulist !important;
  position: relative;
  z-index: 2;
}

</style>
</head>
<body>
<section class="contact-form-wrap section">
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-lg-8">
        <div class="section-title text-center">
          <h2 class="text-md mb-2">Member Complaint Form</h2>
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

          <!-- Subject -->
          <div class="form-group mb-3">
            <label for="subject">Complaint Subject</label>
            <input type="text" name="subject" id="subject" class="form-control" placeholder="Enter complaint subject" required>
          </div>

          <!-- Description -->
          <div class="form-group mb-3">
            <label for="description">Description</label>
            <textarea name="description" id="description" class="form-control" rows="5" placeholder="Write complaint details..." required></textarea>
          </div>
          
          <input type="hidden" name="member_id" value="<%= m.getMemberId() %>">

          <!-- Submit Button -->
          <div class="text-center">
            <button type="submit" name="action" value="addComplaint" class="btn btn-primary">Submit Complaint</button>
          </div>

        </form>
      </div>
    </div>
  </div>
</section>

</body>
</html>
