<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="Member-header.jsp" %> 
<!DOCTYPE html> <html> 
<head> <meta charset="UTF-8"> 
<title>Insert title here</title> 
</head> 
<body> 
<section class="contact-form-wrap section">
 <div class="container"> <div class="row justify-content-center"> 
 <div class="col-lg-6"> <div class="section-title text-center"> 
 <h2 class="text-md mb-2">Pay Maintenance</h2> 
 <div class="divider mx-auto my-4">
 </div> 
 </div> 
 </div> 
 </div> 
 <% String msg = (String) request.getAttribute("msg"); %> 
 <% if (msg != null) { %>
  <div class="section-title text-center">
   <h4 class="text-md mb-2" style="color: red;"><%= msg %></h4>
    </div> <% } %> <div class="row"> 
    <div class="col-lg-12 col-md-12 col-sm-12"> 
    <form action="member" class="appointment-form ftco-animate" method="post"> 
    <div class="row"> <!-- Maintenance Month --> 
    <div class="col-md-6 mb-3 form-group"> 
    <input name="month" type="text" class="form-control" placeholder=" " required> 
    <label class="form-label-float">Month (e.g., October)</label> 
    </div> <!-- Maintenance Year --> 
    
    <div class="col-md-6 mb-3 form-group"> 
    <input name="year" type="number" class="form-control" placeholder=" " min="2000" required> 
    <label class="form-label-float">Year</label> 
    </div> <!-- Amount --> 
    
    <div class="col-md-6 mb-3 form-group"> 
    <input name="amount" type="number" class="form-control" placeholder=" " min="1" required> 
    <label class="form-label-float">Maintenance Amount (₹)</label> 
    </div> <!-- Due Date --> 
    
    <div class="col-md-6 mb-3 form-group">
     <input name="due_date" type="date" class="form-control" required> 
     <label class="form-label-float">Due Date</label> 
     </div> <!-- Remarks (Optional) --> 
     
     <div class="col-md-12 mb-3 form-group"> 
     <textarea name="remarks" class="form-control" placeholder=" " rows="3"></textarea> 
     <label class="form-label-float">Remarks (Optional)</label> 
     </div> <!-- Hidden Member ID --> 
     
     <input type="hidden" name="member_id" value="">
      <!-- Submit Button --> <div class="col-12 text-center mt-3"> 
      <input name="action" type="submit" value="payMaintenance" class="btn btn-secondary py-3 px-5"> 
      </div> 
      </div> 
      </form> 
      </div> 
      </div> 
      </div> 
      </section> 
      </body> 
      </html>