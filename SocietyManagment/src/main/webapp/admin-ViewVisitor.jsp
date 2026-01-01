<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@include file="admin-header.jsp" %>
   <%@include file="admin-sidebar.jsp" %>
   <%@ page import="java.util.*" %>
   <%@ page import="model.visitor" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Visitors</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="vendors/styles/core.css">
    <link rel="stylesheet" href="vendors/styles/style.css">
</head>
<body>

<div class="main-container">
    <div class="pd-ltr-20 xs-pd-20-10">
        <div class="min-height-200px">
            
            <!-- Page Header -->
            <div class="page-header">
                <div class="row">
                    <div class="col-md-6 col-sm-12">
                        <div class="title">
                            <h4>Visitors</h4>
                        </div>
                        <nav aria-label="breadcrumb" role="navigation">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="admin-index.jsp">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">View Visitors</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>

            <!-- Visitor Table Start -->
            <div class="pd-20 card-box mb-30">
                <div class="clearfix mb-20">
                    <div class="pull-left">
                        <h4 class="text-blue h4">All Visitors</h4>
                        <p>List of all visitors approved by members</p>
                    </div>
                </div>

                <table class="table table-bordered table-hover text-center">
                    <thead class="table-dark">
                        <tr>
                            <th scope="col">Visitor ID</th>
                            <th scope="col">Name</th>
                            <th scope="col">Contact No</th>
                            <th scope="col">Member Name</th>
                            <th scope="col">Flat No</th>
                            <th scope="col">Block</th>
                            <th scope="col">In Time</th>
                            <th scope="col">Photo</th>
                            <th scope="col">Security ID</th>
                            <th scope="col">Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            List<visitor> visitors = (List<visitor>) request.getAttribute("Visitors");
                            if (visitors != null && !visitors.isEmpty()) {
                                for (visitor v : visitors) {
                        %>
                        <tr>
                            <td><%= v.getVid() %></td>
                            <td><%= v.getVname() %></td>
                            <td><%= v.getContact() %></td>
                            <td><%= v.getMemeberName() %></td>
                            <td><%= v.getFlatNo() %></td>
                            <td><%= v.getBlock() %></td>
                            <td><%= v.getInTime() %></td>
                            <td>
                                <% if (v.getPhoto() != null && !v.getPhoto().isEmpty()) { %>
                                    <img src="uploads/visitors/<%= v.getPhoto() %>" alt="Visitor Photo" width="60" height="60" style="border-radius:50%;">
                                <% } else { %>
                                    <span class="text-muted">No Photo</span>
                                <% } %>
                            </td>
                            <td><%= v.getSid() %></td>
                            <td>
                                <% if ("Approved".equalsIgnoreCase(v.getStatus())) { %>
                                    <span class="badge bg-success">Approved</span>
                                <% } else if ("Rejected".equalsIgnoreCase(v.getStatus())) { %>
                                    <span class="badge bg-danger">Rejected</span>
                                <% } else if ("Pending".equalsIgnoreCase(v.getStatus())) { %>
                                    <span class="badge bg-warning text-dark">Pending</span>
                                <% } else { %>
                                    <span class="badge bg-secondary"><%= v.getStatus() %></span>
                                <% } %>
                            </td>
                        </tr>
                        <%
                                } // end for
                            } else {
                        %>
                        <tr>
                            <td colspan="10" class="text-center text-muted">No visitor records found</td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div>
            <!-- Visitor Table End -->
        </div>
    </div>
</div>

</body>
</html>