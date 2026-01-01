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
            
            <!-- Header -->
            <div class="page-header">
                <div class="row">
                    <div class="col-md-6 col-sm-12">
                        <div class="title">
                            <h4>Add Security Guard</h4>
                        </div>
                        <nav aria-label="breadcrumb" role="navigation">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="admin-index.jsp">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Add Security</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
            <!-- Header End -->

            <!-- Form Start -->
            <div class="pd-20 card-box mb-30">
                <div class="clearfix mb-20">
                    <div class="pull-left">
                        <h4 class="text-blue h4">Security Registration Form</h4>
                        <p class="mb-30">Add new security staff details</p>
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
                    <input type="hidden" name="action" value="addSecurity">

                    <!-- First Name -->
                    <div class="form-group row">
                        <label class="col-sm-12 col-md-2 col-form-label">First Name</label>
                        <div class="col-sm-12 col-md-10">
                            <input name="first_name" type="text" class="form-control" placeholder="Enter First Name" required>
                        </div>
                    </div>

                    <!-- Last Name -->
                    <div class="form-group row">
                        <label class="col-sm-12 col-md-2 col-form-label">Last Name</label>
                        <div class="col-sm-12 col-md-10">
                            <input name="last_name" type="text" class="form-control" placeholder="Enter Last Name" required>
                        </div>
                    </div>

                    <!-- Gender -->
                    <div class="form-group row">
                        <label class="col-sm-12 col-md-2 col-form-label">Gender</label>
                        <div class="col-sm-12 col-md-10">
                            <select name="gender" class="custom-select col-12" required>
                                <option value="">Choose Gender...</option>
                                <option value="Male">Male</option>
                                <option value="Female">Female</option>
                                <option value="Other">Other</option>
                            </select>
                        </div>
                    </div>

                    <!-- Address -->
                    <div class="form-group row">
                        <label class="col-sm-12 col-md-2 col-form-label">Address</label>
                        <div class="col-sm-12 col-md-10">
                            <textarea name="address" class="form-control" rows="3" placeholder="Enter Address" required></textarea>
                        </div>
                    </div>

                    <!-- Phone -->
                    <div class="form-group row">
                        <label class="col-sm-12 col-md-2 col-form-label">Phone Number</label>
                        <div class="col-sm-12 col-md-10">
                            <input name="phone_no" type="tel" pattern="[0-9]{10}" maxlength="10" class="form-control" placeholder="Enter 10-digit Phone Number" required>
                        </div>
                    </div>

                    <!-- Email -->
                    <div class="form-group row">
                        <label class="col-sm-12 col-md-2 col-form-label">Email</label>
                        <div class="col-sm-12 col-md-10">
                            <input name="email" type="email" class="form-control" placeholder="Enter Email Address" required>
                        </div>
                    </div>

                    <!-- Password -->
                    <div class="form-group row">
                        <label class="col-sm-12 col-md-2 col-form-label">Password</label>
                        <div class="col-sm-12 col-md-10">
                            <input name="password" type="password" class="form-control" placeholder="Enter Password" required>
                        </div>
                    </div>

                    <!-- Submit -->
                    <div class="form-group row">
                        <div class="col-sm-12 col-md-10 offset-md-2">
                            <button name="action" value="addSecurity" type="submit" class="btn btn-primary">Add Security</button>
                            <button type="reset" class="btn btn-secondary">Reset</button>
                        </div>
                    </div>

                </form>
            </div>
            <!-- Form End -->

        </div>
    </div>
</div>

</body>
</html>