package model;

public class event {
	int memberId,eventId ;
    String eventName,description,venue,eventDate,status;
    int guests ;
    
	public int getEventId() {
		return eventId;
	}
	public void setEventId(int eventId) {
		this.eventId = eventId;
	}
	public int getMemberId() {
		return memberId;
	}
	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}
	public String getEventName() {
		return eventName;
	}
	public void setEventName(String eventName) {
		this.eventName = eventName;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getVenue() {
		return venue;
	}
	public void setVenue(String venue) {
		this.venue = venue;
	}
	public String getEventDate() {
		return eventDate;
	}
	public void setEventDate(String eventDate) {
		this.eventDate = eventDate;
	}
	public int getGuests() {
		return guests;
	}
	public void setGuests(int guests) {
		this.guests = guests;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "event [memberId=" + memberId + ", eventId=" + eventId + ", eventName=" + eventName + ", description="
				+ description + ", venue=" + venue + ", eventDate=" + eventDate + ", status=" + status + ", guests="
				+ guests + "]";
	}
	
}
