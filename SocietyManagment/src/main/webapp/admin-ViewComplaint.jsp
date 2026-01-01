<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@include file="admin-header.jsp" %>
   <%@include file="admin-sidebar.jsp" %>
   <%@ page import="java.util.*" %>
<%@ page import="model.complaint" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Complaints</title>
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
                            <h4>Complaints</h4>
                        </div>
                        <nav aria-label="breadcrumb" role="navigation">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="admin-index.jsp">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">View Complaints</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>

            <!-- Complaints Table Start -->
            <div class="pd-20 card-box mb-30">
                <div class="clearfix mb-20">
                    <div class="pull-left">
                        <h4 class="text-blue h4">All Complaints</h4>
                        <p>List of all member complaints and their status</p>
                    </div>
                </div>

                <table class="table table-bordered table-hover text-center">
                    <thead class="table-dark">
                        <tr>
                            <th scope="col">Complaint ID</th>
                            <th scope="col">Member ID</th>
                            <th scope="col">Subject</th>
                            <th scope="col">Description</th>
                            <th scope="col">Complaint Date</th>
                            <th scope="col">Status</th>
                            <th scope="col">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            List<complaint> complaints = (List<complaint>) request.getAttribute("complaint");
                            if (complaints != null && !complaints.isEmpty()) {
                                for (complaint c : complaints) {
                        %>
                        <tr>
                            <td><%= c.getcId() %></td>
                            <td><%= c.getmId() %></td>
                            <td><%= c.getSubject() %></td>
                            <td><%= c.getDescription() %></td>
                            <td><%= c.getDate() %></td>
                            <td>
                                <% if ("Pending".equalsIgnoreCase(c.getStatus())) { %>
                                    <span class="badge bg-warning text-dark">Pending</span>
                                <% } else if ("Resolved".equalsIgnoreCase(c.getStatus())) { %>
                                    <span class="badge bg-success">Resolved</span>
                                <% } else if ("Rejected".equalsIgnoreCase(c.getStatus())) { %>
                                    <span class="badge bg-danger">Rejected</span>
                                <% } else { %>
                                    <span class="badge bg-secondary"><%= c.getStatus() %></span>
                                <% } %>
                            </td>
                            <td>
                                <% if ("Pending".equalsIgnoreCase(c.getStatus())) { %>
                                    <form action="admin" method="post" style="display:inline;">
                                        <input type="hidden" name="action" value="resolveComplaint">
                                        <input type="hidden" name="complaint_id" value="<%= c.getcId() %>">
                                        <button type="submit" class="btn btn-success btn-sm">Resolve</button>
                                    </form>
                                    <form action="admin" method="post" style="display:inline;">
                                        <input type="hidden" name="action" value="rejectComplaint">
                                        <input type="hidden" name="complaint_id" value="<%= c.getcId() %>">
                                        <button type="submit" class="btn btn-danger btn-sm">Reject</button>
                                    </form>
                                <% } else { %>
                                    <span class="text-muted">No Action</span>
                                <% } %>
                            </td>
                        </tr>
                        <%
                                } // end for
                            } else {
                        %>
                        <tr>
                            <td colspan="7" class="text-center text-muted">No complaints found</td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div>
            <!-- Complaints Table End -->
        </div>
    </div>
</div>

</body>
</html>