<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="security-header.jsp" %>
    <%@ page import="model.visitor" %>
    <%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* Make the whole container full width */
.container {
  width: 100%;
  max-width: 100%;
  margin: 0;
  padding: 0 10px;
}

/* Full-width table */
.table {
  width: 100%;
  border-collapse: collapse;
  font-size: 17px;
  margin: 0;
  background-color: #fff;
  border: 1px solid #dee2e6;
}

/* Table headers and cells styling */
.table th, .table td {
  text-align: center;
  vertical-align: middle;
  padding: 14px 20px;
  border: 1px solid #dee2e6;
}

/* Dark table header */
.table-dark th {
  background-color: #343a40;
  color: #fff;
}

/* Zebra striping */
.table-striped tbody tr:nth-child(odd) {
  background-color: #f9f9f9;
}

/* ✅ Simple rectangular image (like your example) */
.table img {
  width: 120px;
  height: 80px;
  border-radius: 0;         /* no round corners */
  object-fit: cover;        /* crop to fit area cleanly */
  border: 1px solid #ccc;   /* light gray border */
  box-shadow: none;         /* remove shadow */
}

/* Section layout */
.section {
  padding: 40px 0;
  width: 100%;
}

/* Title styling */
.section-title h2 {
  font-size: 28px;
  font-weight: 600;
}

/* Decorative divider */
.divider {
  width: 100px;
  height: 3px;
  background-color: #007bff;
  margin: 12px auto;
}

</style>
</head>
<body>
<section class="contact-form-wrap section">
  <div class="container">

    <!-- Title -->
    <div class="row justify-content-center">
      <div class="col-lg-6">
        <div class="section-title text-center">
          <h2 class="text-md mb-2">Visitor Records</h2>
          <div class="divider mx-auto my-4"></div>
        </div>
      </div>
    </div>

    <!-- Message -->
    <%
      String msg = (String) request.getAttribute("msg");
      if (msg != null) {
    %>
      <div class="text-center mb-3">
        <h5 style="color: red;"><%= msg %></h5>
      </div>
    <%
      }
    %>

    <!-- Visitor Table -->
    <div class="row">
      <div class="col-lg-10 mx-auto">
        <table class="table table-bordered table-striped">
          <thead class="table-dark">
            <tr>
              <th>ID</th>
              <th>Visitor Name</th>
              <th>Contact No</th>
              <th>Member Name</th>
              <th>Flat No</th>
              <th>Block</th>
              <th>In Time</th>
              <th>Photo</th>
              <th>Status</th>
            </tr>
          </thead>
          <tbody>
    <%
      List<visitor> list = (List<visitor>) request.getAttribute("visitorList");
      if (list != null && !list.isEmpty()) {
          for (visitor v : list) {
    %>
      <tr>
        <td><%= v.getVid() %></td>
        <td><%= v.getVname() %></td>
        <td><%= v.getContact() %></td>
        <td><%= v.getMemeberName() %></td>
        <td><%= v.getFlatNo() %></td>
        <td><%= v.getBlock() %></td>
        <td><%= v.getInTime() %></td>
        <%
        System.out.println(v.getPhoto());
        %>
        <td><img src="images/<%=v.getPhoto()%>" alt="photo"></td>
        <td><%= v.getStatus() %></td>
      </tr>
    <%
          }
      } else {
    %>
      <tr><td colspan="10" class="text-center">No visitor records found.</td></tr>
    <% } %>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</section>

</body>
</html>