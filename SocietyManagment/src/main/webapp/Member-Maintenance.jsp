<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="Member-header.jsp" %>
<%@ page import="java.util.*, model.maintenance" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member Maintenance</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<style>
  .paid {
    color: green;
    font-weight: bold;
  }
  .unpaid {
    color: red;
    font-weight: bold;
  }

  /* Add zebra striping to the table */
  .table-striped tbody tr:nth-child(odd) {
    background-color: #f2f2f2;
  }

  .table th, .table td {
    text-align: center;
    vertical-align: middle;
  }

  /* Custom tag button styles */
  .tag {
    padding: 5px 10px;
    border-radius: 20px;
    font-weight: bold;
  }

  .tag-primary {
    background-color: #007bff;
    color: white;
  }

  .tag-secondary {
    background-color: #6c757d;
    color: white;
  }

  .tag-success {
    background-color: #28a745;
    color: white;
  }

  .tag-danger {
    background-color: #dc3545;
    color: white;
  }

  .btn {
    border-radius: 20px;
    padding: 5px 15px;
  }

  /* Additional custom styles */
  .divider {
    width: 60px;
    height: 2px;
    background-color: #007bff;
    margin: 10px auto;
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
          <h2 class="text-md mb-2">Maintenance Records</h2>
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

    <!-- Maintenance Table -->
    <div class="row">
      <div class="col-lg-10 mx-auto">
        <table class="table table-bordered table-striped">
          <thead class="table-dark">
            <tr>
              <th>Month</th>
              <th>Year</th>
              <th>Amount (₹)</th>
              <th>Due Date</th>
              <th>Paid Date</th>
              <th>Status</th>
              <th>Action</th>
            </tr>
          </thead>
          <tbody>
    <%
      List<maintenance> list = (List<maintenance>) request.getAttribute("maintenanceList");
      if (list != null) {
          for (maintenance mnt : list) {
    %>
      <tr>
        <td><%= mnt.getMonth() %></td>
        <td><%= mnt.getYear() %></td>
        <td>₹<%= mnt.getAmount() %></td>
        <td><%= mnt.getDueDate() %></td>
        <td><%= (mnt.getPaidDate() == null) ? "-" : mnt.getPaidDate() %></td>
        <td>
          <% if ("Paid".equalsIgnoreCase(mnt.getStatus())) { %>
              <span class="tag tag-success">Paid</span>
          <% } else { %>
              <span class="tag tag-danger">Unpaid</span>
          <% } %>
        </td>
        <td>
          <% if (!"Paid".equalsIgnoreCase(mnt.getStatus())) { %>
              <a href="member?action=payMaintenance&maintenance_id=<%= mnt.getId() %>&memberId=<%=mnt.getMemberId() %>"
                 class="btn btn-sm btn-primary">Pay</a>
          <% } else { %>
              -
          <% } %>
        </td>
      </tr>
    <% 
          }
      } else {
    %>
      <tr><td colspan="7">No maintenance records found.</td></tr>
    <% } %>
  </tbody>
        </table>
      </div>
    </div>

  </div>
</section>

</body>
</html>
