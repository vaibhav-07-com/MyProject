<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="admin-header.jsp" %>
   <%@include file="admin-sidebar.jsp" %>
<!DOCTYPE html>
<html>
<head>
	</head>
<body>
	
		<div class="mobile-menu-overlay"></div>

	<div class="main-container">
		<div class="pd-ltr-20">
			<div class="card-box pd-20 height-100-p mb-30">
				<div class="row align-items-center">
					<div class="col-md-4">
						<img src="admin/vendors/images/banner-img.png" alt="">
					</div>
					<div class="col-md-8">
						<h4 class="font-20 weight-500 mb-10 text-capitalize">
							Welcome back <div class="weight-600 font-30 text-blue">Johnny Brown!</div>
						</h4>
						<p class="font-18 max-width-600">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Unde hic non repellendus debitis iure, doloremque assumenda. Autem modi, corrupti, nobis ea iure fugiat, veniam non quaerat mollitia animi error corporis.</p>
					</div>
				</div>
			</div>
			<div class="row">
    <!-- Total Doctors -->
    <div class="col-md-4 mb-30">
        <div class="card-box pd-20 text-center">
            <div class="icon h1 text-blue">
                <i class="icon-copy dw dw-stethoscope"></i>
            </div>
            <h2 class="text-blue mb-10">Total Members</h2>
            <h3 class="font-30 weight-600 text-dark">
                <%= session.getAttribute("totalMembers") %>
            </h3>
        </div>
    </div>

    <!-- Total Patients -->
    <div class="col-md-4 mb-30">
        <div class="card-box pd-20 text-center">
            <div class="icon h1 text-green">
                <i class="icon-copy dw dw-user1"></i>
            </div>
            <h2 class="text-green mb-10">Total EventBook</h2>
            <h3 class="font-30 weight-600 text-dark">
                <%= session.getAttribute("totalEvents") %>
            </h3>
        </div>
    </div>

    <!-- Total Appointments -->
    <div class="col-md-4 mb-30">
        <div class="card-box pd-20 text-center">
            <div class="icon h1 text-orange">
                <i class="icon-copy dw dw-calendar1"></i>
            </div>
            <h2 class="text-orange mb-10">Total Visitors</h2>
            <h3 class="font-30 weight-600 text-dark">
                <%= session.getAttribute("totalComplaints") %>
            </h3>
        </div>
    </div>
    
    <div class="col-md-4 mb-30">
        <div class="card-box pd-20 text-center">
            <div class="icon h1 text-orange">
                <i class="icon-copy dw dw-calendar1"></i>
            </div>
            <h2 class="text-orange mb-10">Total Complaints</h2>
            <h3 class="font-30 weight-600 text-dark">
                <%= session.getAttribute("totalVisitors") %>
			</h3>
        </div>
    </div>
</div>
			
	</div>
	<!-- js -->
</body>
</html>
</body>
</html>