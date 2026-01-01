package model;

public class complaint {
int cId,mId;
String Date,subject,description,status;
public int getcId() {
	return cId;
}
public void setcId(int cId) {
	this.cId = cId;
}
public int getmId() {
	return mId;
}
public void setmId(int mId) {
	this.mId = mId;
}
public String getDate() {
	return Date;
}
public void setDate(String date) {
	Date = date;
}
public String getSubject() {
	return subject;
}
public void setSubject(String subject) {
	this.subject = subject;
}
public String getDescription() {
	return description;
}
public void setDescription(String description) {
	this.description = description;
}
public String getStatus() {
	return status;
}
public void setStatus(String status) {
	this.status = status;
}
@Override
public String toString() {
	return "complaint [cId=" + cId + ", mId=" + mId + ", Date=" + Date + ", subject=" + subject + ", description="
			+ description + ", status=" + status + "]";
}

}
