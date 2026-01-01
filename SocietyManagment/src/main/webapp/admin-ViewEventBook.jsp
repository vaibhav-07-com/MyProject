<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@include file="admin-header.jsp" %>
   <%@include file="admin-sidebar.jsp" %>
   <%@ page import="java.util.*" %>
   <%@ page import="model.event" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
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
                            <h4>Event Bookings</h4>
                        </div>
                        <nav aria-label="breadcrumb" role="navigation">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="admin-index.jsp">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">View Event Bookings</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>

            <!-- Event Table Start -->
            <div class="pd-20 card-box mb-30">
                <div class="clearfix mb-20">
                    <div class="pull-left">
                        <h4 class="text-blue h4">All Event Bookings</h4>
                        <p>List of all event requests submitted by members</p>
                    </div>
                </div>

                <table class="table table-bordered table-hover text-center">
                    <thead class="table-dark">
                        <tr>
                            <th scope="col">Event ID</th>
                            <th scope="col">Member ID</th>
                            <th scope="col">Event Name</th>
                            <th scope="col">Venue</th>
                            <th scope="col">Event Date</th>
                            <th scope="col">Guests</th>
                            <th scope="col">Description</th>
                            <th scope="col">Status</th>
                            <th scope="col">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            List<event> eventList = (List<event>) request.getAttribute("event");
                            if (eventList != null && !eventList.isEmpty()) {
                                for (event e : eventList) {
                        %>
                        <tr>
                            <td><%= e.getEventId() %></td>
                            <td><%= e.getMemberId() %></td>
                            <td><%= e.getEventName() %></td>
                            <td><%= e.getVenue() %></td>
                            <td><%= e.getEventDate() %></td>
                            <td><%= e.getGuests() %></td>
                            <td><%= e.getDescription() %></td>
                            <td>
                                <% if ("Pending".equalsIgnoreCase(e.getStatus())) { %>
                                    <span class="badge bg-warning text-dark">Pending</span>
                                <% } else if ("Approved".equalsIgnoreCase(e.getStatus())) { %>
                                    <span class="badge bg-success">Approved</span>
                                <% } else if ("Rejected".equalsIgnoreCase(e.getStatus())) { %>
                                    <span class="badge bg-danger">Rejected</span>
                                <% } else { %>
                                    <span class="badge bg-secondary"><%= e.getStatus() %></span>
                                <% } %>
                            </td>
                            <td>
                                <% if ("Pending".equalsIgnoreCase(e.getStatus())) { %>
                                    <form action="admin" method="post" style="display:inline;">
                                        <input type="hidden" name="action" value="approveEvent">
                                        <input type="hidden" name="event_id" value="<%= e.getEventId() %>">
                                        <button type="submit" class="btn btn-success btn-sm">Approve</button>
                                    </form>
                                    <form action="admin" method="post" style="display:inline;">
                                        <input type="hidden" name="action" value="rejectEvent">
                                        <input type="hidden" name="event_id" value="<%= e.getEventId() %>">
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
                            <td colspan="10" class="text-muted text-center">No event bookings found</td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div>
            <!-- Event Table End -->
        </div>
    </div>
</div>
</body>
</html>