<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="admin-header.jsp" %>
   <%@include file="admin-sidebar.jsp" %>
   <%@ page import="java.util.*" %>
<%@ page import="model.member" %>
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
								<h4>Member Management</h4>
							</div>
							<nav aria-label="breadcrumb" role="navigation">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="admin-index.jsp">Home</a></li>
									<li class="breadcrumb-item active" aria-current="page">All Members</li>
								</ol>
							</nav>
						</div>
						<div class="col-md-6 col-sm-12 text-right">
							<div class="dropdown">
								<a class="btn btn-primary dropdown-toggle" href="#" role="button" data-toggle="dropdown">
									Actions
								</a>
								<div class="dropdown-menu dropdown-menu-right">
									<a class="dropdown-item" href="#">Export List</a>
									<a class="dropdown-item" href="#">Policies</a>
									<a class="dropdown-item" href="#">View Reports</a>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- Member Table Start -->
				<div class="pd-20 card-box mb-30">
					<div class="clearfix mb-20">
						<div class="pull-left">
							<h4 class="text-blue h4">All Registered Members</h4>
							<p>Pending requests can be approved or rejected.</p>
						</div>
					</div>

					<table class="table table-striped table-bordered">
						<thead class="table-dark">
							<tr>
								<th scope="col">#</th>
								<th scope="col">Name</th>
								<th scope="col">Gender</th>
								<th scope="col">Email</th>
								<th scope="col">Contact</th>
								<th scope="col">Block</th>
								<th scope="col">Flat No</th>
								<th scope="col">Status</th>
								<th scope="col">Action</th>
							</tr>
						</thead>
						<tbody>
							<%
								List<member> members = (List<member>) request.getAttribute("members");
								if (members != null && !members.isEmpty()) {
									int sr = 1;
									for (member m : members) {
							%>
							<tr>
								<th scope="row"><%= sr++ %></th>
								<td><%= m.getFirstName() %> <%= m.getLastName() %></td>
								<td><%= m.getGender() %></td>
								<td><%= m.getEmail() %></td>
								<td><%= m.getContactNo() %></td>
								<td><%= m.getBlock() %></td>
								<td><%= m.getFlat_no() %></td>
								<td><%=m.getStatus() %></td>
								<td>
									<% if ("Pending".equalsIgnoreCase(m.getStatus())) { %>
										<form action="admin" method="post" style="display:inline;">
											<input type="hidden" name="action" value="approveMember">
											<input type="hidden" name="member_id" value="<%= m.getMemberId() %>">
											<button type="submit" class="btn btn-success btn-sm">Approve</button>
										</form>
										<form action="admin" method="post" style="display:inline;">
											<input type="hidden" name="action" value="rejectMember">
											<input type="hidden" name="member_id" value="<%= m.getMemberId() %>">
											<button type="submit" class="btn btn-danger btn-sm">Reject</button>
										</form>
										<% } else if("reject".equalsIgnoreCase(m.getStatus())) { { %>
										<form action="admin" method="post" style="display:inline;">
											<input type="hidden" name="action" value="approveMember">
											<input type="hidden" name="member_id" value="<%= m.getMemberId() %>">
											<button type="submit" class="btn btn-success btn-sm">Approve</button>
										</form>
									<% } %>
									<% } else { %>
										<button class="btn btn-secondary btn-sm" disabled><%= m.getStatus() %></button>
									<% } %>
								</td>
							</tr>
							<%
									}
								} else {
							%>
							<tr>
								<td colspan="9" class="text-center text-muted">No member records found.</td>
							</tr>
							<%
								}
							%>
						</tbody>
					</table>
				</div>
				<!-- Member Table End -->

			</div>
		</div>
	</div>

</body>
</html>