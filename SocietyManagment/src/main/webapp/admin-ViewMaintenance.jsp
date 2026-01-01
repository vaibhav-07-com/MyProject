<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="admin-header.jsp" %>
   <%@include file="admin-sidebar.jsp" %>
    <%@ page import="java.util.*" %>
<%@ page import="model.maintenance" %>
<body>

<div class="main-container">
    <div class="pd-ltr-20 xs-pd-20-10">
        <div class="min-height-200px">

            <!-- Page Header -->
            <div class="page-header">
                <div class="row">
                    <div class="col-md-6 col-sm-12">
                        <div class="title">
                            <h4>Maintenance</h4>
                        </div>
                        <nav aria-label="breadcrumb" role="navigation">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="admin-index.jsp">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Maintenance Records</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>

            <!-- Maintenance Table Start -->
            <div class="pd-20 card-box mb-30">
                <div class="clearfix mb-20">
                    <div class="pull-left">
                        <h4 class="text-blue h4">All Maintenance Records</h4>
                        <p>Monthly maintenance details for members</p>
                    </div>
                </div>

                <table class="table table-bordered table-hover text-center">
                    <thead class="table-dark">
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Member ID</th>
                            <th scope="col">Month</th>
                            <th scope="col">Year</th>
                            <th scope="col">Amount</th>
                            <th scope="col">Status</th>
                            <th scope="col">Due Date</th>
                            <th scope="col">Paid Date</th>
                            <th scope="col">Remarks</th>
                            <th scope="col">Action</th> <!-- optional actions -->
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            List<maintenance> maints = (List<maintenance>) request.getAttribute("maintenance");
                            if (maints != null && !maints.isEmpty()) {
                                int sr = 1;
                                for (maintenance m : maints) {
                        %>
                        <tr>
                            <th scope="row"><%= sr++ %></th>
                            <td><%= m.getMemberId() %></td>
                            <td><%= m.getMonth() %></td>
                            <td><%= m.getYear() %></td>
                            <td>&#8377; <%= m.getAmount() %></td>
                            <td>
                                <% String st = m.getStatus(); 
                                   if ("Paid".equalsIgnoreCase(st)) { %>
                                    <span class="badge bg-success">Paid</span>
                                <% } else if ("Unpaid".equalsIgnoreCase(st) || "Due".equalsIgnoreCase(st)) { %>
                                    <span class="badge bg-danger"><%= st %></span>
                                <% } else if ("Partial".equalsIgnoreCase(st)) { %>
                                    <span class="badge bg-warning text-dark">Partial</span>
                                <% } else { %>
                                    <span class="badge bg-secondary"><%= st %></span>
                                <% } %>
                            </td>
                            <td><%= m.getDueDate() %></td>
                            <td><%= (m.getPaidDate() == null || m.getPaidDate().trim().isEmpty()) ? "-" : m.getPaidDate() %></td>
                            <td><%= (m.getRemarks() == null) ? "" : m.getRemarks() %></td>
                            <td>
                                <!-- Example action: mark as paid (only when unpaid) -->
                                <% if ("Unpaid".equalsIgnoreCase(st) || "Due".equalsIgnoreCase(st)) { %>
                                    <form action="admin" method="post" style="display:inline;">
                                        <input type="hidden" name="action" value="markMaintenancePaid">
                                        <input type="hidden" name="id" value="<%= m.getId() %>">
                                        <button type="submit" class="btn btn-success btn-sm">Mark Paid</button>
                                    </form>
                                <% } else { %>
                                    <button class="btn btn-secondary btn-sm" disabled>No Action</button>
                                <% } %>
                            </td>
                        </tr>
                        <%
                                } // end for
                            } else {
                        %>
                        <tr>
                            <td colspan="10" class="text-center text-muted">No maintenance records found</td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div>
            <!-- Maintenance Table End -->

        </div>
    </div>
</div>

</body>
</html>