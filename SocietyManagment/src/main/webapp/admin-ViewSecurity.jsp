<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="admin-header.jsp" %>
   <%@include file="admin-sidebar.jsp" %>
   <%@ page import="java.util.*" %>
   <%@ page import="model.security" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
                            <h4>Security Staff</h4>
                        </div>
                        <nav aria-label="breadcrumb" role="navigation">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="admin-index.jsp">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">View Security Staff</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>

            <!-- Security Table Start -->
            <div class="pd-20 card-box mb-30">
                <div class="clearfix mb-20">
                    <div class="pull-left">
                        <h4 class="text-blue h4">All Security Staff</h4>
                        <p>List of all registered security guards</p>
                    </div>
                </div>

                <table class="table table-bordered table-hover text-center">
                    <thead class="table-dark">
                        <tr>
                            <th scope="col">Security ID</th>
                            <th scope="col">First Name</th>
                            <th scope="col">Last Name</th>
                            <th scope="col">Gender</th>
                            <th scope="col">Address</th>
                            <th scope="col">Phone No</th>
                            <th scope="col">Email</th>
                            <th scope="col">Joining Date</th>
                            <th scope="col">Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            List<security> securityList = (List<security>) request.getAttribute("Security");
                            if (securityList != null && !securityList.isEmpty()) {
                                for (security s : securityList) {
                        %>
                        <tr>
                            <td><%= s.getId() %></td>
                            <td><%= s.getFname() %></td>
                            <td><%= s.getLname() %></td>
                            <td><%= s.getGender() %></td>
                            <td><%= s.getAddress() %></td>
                            <td><%= s.getContact() %></td>
                            <td><%= s.getEmail() %></td>
                            <td><%= s.getJoindate() %></td>
                            <td>
                                <% if ("Active".equalsIgnoreCase(s.getStatus())) { %>
                                    <span class="badge bg-success">Active</span>
                                <% } else if ("Pending".equalsIgnoreCase(s.getStatus())) { %>
                                    <span class="badge bg-warning text-dark">Pending</span>
                                <% } else if ("Rejected".equalsIgnoreCase(s.getStatus())) { %>
                                    <span class="badge bg-danger">Rejected</span>
                                <% } else { %>
                                    <span class="badge bg-secondary"><%= s.getStatus() %></span>
                                <% } %>
                            </td>
                        </tr>
                        <%
                                } // end for loop
                            } else {
                        %>
                        <tr>
                            <td colspan="10" class="text-center text-muted">No security staff found</td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div>
            <!-- Security Table End -->

        </div>
    </div>
</div>

</body>
</html>