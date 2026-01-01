<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="left-side-bar">
		<div class="brand-logo">
			<a href="index.html">
				<img src="admin/vendors/images/deskapp-logo.svg" alt="" class="dark-logo">
				<img src="admin/vendors/images/deskapp-logo-white.svg" alt="" class="light-logo">
			</a>
			<div class="close-sidebar" data-toggle="left-sidebar-close">
				<i class="ion-close-round"></i>
			</div>
		</div>
		<div class="menu-block customscroll">
			<div class="sidebar-menu">
				<ul id="accordion-menu">
					<li class="dropdown">
						<a href="admin-index.jsp" class="dropdown-toggle no-arrow">
							<span class="micon dw dw-house-1"></span><span class="mtext">Home</span>
						</a>
					</li>
					<li class="dropdown">
					    <a href="javascript:;" class="dropdown-toggle">
					        <span class="micon dw dw-user"></span><span class="mtext">Members</span>
					    </a>
					    <ul class="submenu">
					        <li><a href="admin?action=viewAllMember">Member List</a></li>
					    </ul>
					</li>
					
					<li class="dropdown">
					    <a href="javascript:;" class="dropdown-toggle">
					        <span class="micon dw dw-calendar1"></span><span class="mtext">Event Booking</span>
					    </a>
					    <ul class="submenu">
					        <li><a href="admin?action=viewAllEvents">All Events</a></li>
					    </ul>
					</li>
					<li class="dropdown">
				    <a href="javascript:;" class="dropdown-toggle">
				        <span class="micon dw dw-warning"></span><span class="mtext">Complaints</span>
				    </a>
				    <ul class="submenu">
				        <li><a href="admin?action=viewAllComplaints">All Complaints</a></li>
				    </ul>
				</li>
				<li class="dropdown">
				    <a href="javascript:;" class="dropdown-toggle">
				        <span class="micon dw dw-group"></span><span class="mtext">Visitors</span>
				    </a>
				    <ul class="submenu">
				        <li><a href="admin?action=viewAllVisitors">All Visitors</a></li>
				    </ul>
				</li>
				<li class="dropdown">
				    <a href="javascript:;" class="dropdown-toggle">
				        <span class="micon dw dw-lock"></span><span class="mtext">Security</span>
				    </a>
				    <ul class="submenu">
				        <li><a href="admin?action=viewAllSecurity">All Security</a></li>
				        <li><a href="admin-AddSecurity.jsp">Add Security</a></li>
				    </ul>
				</li>
				<li class="dropdown">
				    <a href="javascript:;" class="dropdown-toggle">
				        <span class="micon dw dw-list"></span><span class="mtext">Maintenance</span>
				    </a>
				    <ul class="submenu">
				        <li><a href="admin?action=viewAllMaintenance">All Maintenance</a></li>
				        <li><a href="admin-CreateMaintenance.jsp">Create Maintenance</a></li>
				    </ul>
				</li>
								</ul>
			</div>
		</div>
	</div>

</body>
</html>