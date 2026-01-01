<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="Member-header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Member Registration</title>
  
<style>
.form-group {
  position: relative;
  margin-bottom: 1.5rem;
}

.form-group .form-control {
  padding-top: 1.5rem; /* increased top padding for space above */
  padding-bottom: 0.5rem; /* slight space below */
}

.form-label-float {
  position: absolute;
  top: 0.85rem;              /* vertical alignment: label inside input */
  left: 2rem;                /* moved slightly right */
  transition: 0.2s ease all;
  color: #aaa;
  font-size: 1rem;
  background: white;
  padding: 0 6px;            /* slight horizontal padding */
  pointer-events: none;
}

.form-control:focus + .form-label-float,
.form-control:not(:placeholder-shown) + .form-label-float {
  top: -0.65rem;             /* floats above input */
  left: 0.85rem;             /* aligns nicely when floated */
  font-size: 0.75rem;
  color: #333;
}

/* Optional: Smoother transition */
.form-control {
  transition: border-color 0.3s ease, box-shadow 0.3s ease;
}

/* Fix spacing for textarea too */
textarea.form-control {
  min-height: 100px;
  resize: vertical;
  padding-top: 1.5rem;
}

.no-material label {
  position: static !important;
  top: auto !important;
  left: auto !important;
  transform: none !important;
  font-size: 14px !important;
  color: #333 !important;
  background: transparent !important;
  z-index: 1;
}

.no-material select.form-control {
  all: unset;
  display: block;
  width: 100%;
  padding: 8px 10px;
  border: 1px solid #ccc;
  border-radius: 4px;
  background-color: #fff !important;
  font-size: 14px;
  color: #000 !important;
  appearance: menulist !important;
  -webkit-appearance: menulist !important;
  -moz-appearance: menulist !important;
  position: relative;
  z-index: 2;
}

</style>
</head>
<body>
<section class="contact-form-wrap section">
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-lg-6">
        <div class="section-title text-center">
          <h2 class="text-md mb-2">Event Booking</h2>
          <div class="divider mx-auto my-4"></div>
        </div>
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
    <div class="row">
      <div class="col-lg-12 col-md-12 col-sm-12">
        <form action="member" class="appointment-form ftco-animate" method="post">
          <div class="row">

            <!-- Event Name -->
            <div class="col-md-6 mb-3 form-group">
              <input name="event_name" type="text" class="form-control" placeholder=" " required>
              <label class="form-label-float">Event Name</label>
            </div>


            <!-- Event Date -->
            <div class="col-md-6 mb-3 form-group">
              <input name="event_date" type="date" class="form-control" required>
              <label class="form-label-float">Event Date</label>
            </div>
            
            
            <!-- Venue -->
            <div class="col-md-6 mb-3 form-group">
            <div class="no-material">
              
              <select name="venue" class="form-control" required>
                <option value="" disabled selected hidden>Select Venue</option>
                <option value="Clubhouse">Clubhouse</option>
                <option value="Garden">Garden</option>
                <option value="Terrace">Terrace</option>
                <option value="Community Hall">Community Hall</option>
                <option value="Lawn">Lawn</option>
              </select>
              </div>
            </div>

            <!-- Guests -->
            <div class="col-md-6 mb-3 form-group">
              <input name="guests" type="number" class="form-control" placeholder=" " min="1" required>
              <label class="form-label-float">Expected Guests</label>
            </div>

            <!-- Description -->
            <div class="col-md-12 mb-3 form-group">
              <textarea name="description" class="form-control" placeholder=" " rows="3"></textarea>
              <label class="form-label-float">Event Description (Optional)</label>
            </div>

            <!-- Hidden Member ID -->
            <input type="hidden" name="member_id" value="<%= m.getMemberId() %>">

            <!-- Submit Button -->
            <div class="col-12 text-center mt-3">
              <input name="action" type="submit" value="bookEvent" class="btn btn-secondary py-3 px-5">
            </div>

          </div>
        </form>
      </div>
    </div>
  </div>
</section>

<script>
document.addEventListener("DOMContentLoaded", function () {
  const dateInput = document.querySelector('input[name="event_date"]');
  const venueSelect = document.querySelector('select[name="venue"]');

  // Disable venue initially
  venueSelect.disabled = true;

  // 🔒 Prevent past dates
  const today = new Date().toISOString().split("T")[0];
  dateInput.setAttribute("min", today);

  dateInput.addEventListener('change', function() {
    const selectedDate = this.value;

    if (!selectedDate) return;

    // Enable venue selection
    venueSelect.disabled = false;

    // Fetch booked venues for the selected date
    fetch("<%= request.getContextPath() %>/member?action=getBookedVenues&date=" + encodeURIComponent(selectedDate))
      .then(response => {
        if (!response.ok) throw new Error("Network response was not ok");
        return response.json();
      })
      .then(bookedVenues => {
        console.log("Booked venues:", bookedVenues);

        const options = venueSelect.querySelectorAll('option');
        options.forEach(opt => {
          if (!opt.value) return; // Skip placeholder

          const venueName = opt.value.trim();

          // Check if venue is already booked
          if (bookedVenues.includes(venueName)) {
            opt.disabled = true;
            opt.style.color = "red";
          } else {
            opt.disabled = false;
            opt.style.color = "green";
          }
        });
      })
      .catch(error => {
        console.error("Error fetching booked venues:", error);
      });
  });
});
</script>

</body>
</html>
