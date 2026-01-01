<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@include file="admin-header.jsp" %>
   <%@include file="admin-sidebar.jsp" %>
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
			<div class="page-header">
				<div class="row">
					<div class="col-md-6 col-sm-12">
						<div class="title">
							<h4>Add Maintenance</h4>
						</div>
						<nav aria-label="breadcrumb" role="navigation">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="admin-dashboard.jsp">Home</a></li>
								<li class="breadcrumb-item active" aria-current="page">Add Maintenance</li>
							</ol>
						</nav>
					</div>
				</div>
			</div>

			<!-- Maintenance Form Start -->
			<div class="pd-20 card-box mb-30">
				<div class="clearfix">
					<div class="pull-left">
						<h4 class="text-blue h4">Maintenance Entry Form</h4>
						<p class="mb-30">Create a new maintenance record for all members</p>
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
				<form action="admin" method="post">
					<input type="hidden" name="action" value="addMaintenance">

					<div class="form-group row">
						<label class="col-sm-12 col-md-2 col-form-label">Month</label>
						<div class="col-sm-12 col-md-10">
							<select name="month" class="custom-select col-12" required>
								<option value="">Select Month</option>
								<option>January</option><option>February</option><option>March</option>
								<option>April</option><option>May</option><option>June</option>
								<option>July</option><option>August</option><option>September</option>
								<option>October</option><option>November</option><option>December</option>
							</select>
						</div>
					</div>

					<div class="form-group row">
						<label class="col-sm-12 col-md-2 col-form-label">Year</label>
						<div class="col-sm-12 col-md-10">
							<input name="year" type="number" class="form-control" placeholder="2025" required>
						</div>
					</div>

					<div class="form-group row">
						<label class="col-sm-12 col-md-2 col-form-label">Amount</label>
						<div class="col-sm-12 col-md-10">
							<input name="amount" type="number" class="form-control" placeholder="Enter Maintenance Amount" required>
						</div>
					</div>

					<div class="form-group row">
						<label class="col-sm-12 col-md-2 col-form-label">Due Date</label>
						<div class="col-sm-12 col-md-10">
							<input name="due_date" type="date" class="form-control" required>
						</div>
					</div>

					<div class="form-group row">
						<label class="col-sm-12 col-md-2 col-form-label">Remarks</label>
						<div class="col-sm-12 col-md-10">
							<textarea name="remarks" class="form-control" rows="3" placeholder="Enter any note or message (optional)"></textarea>
						</div>
					</div>

					<div class="text-center">
						<button name="action" value="addMaintenance" type="submit" class="btn btn-primary">Create Maintenance</button>
					</div>
				</form>
			</div>
			<!-- Maintenance Form End -->
		</div>
	</div>
</div>

</body>
</html>