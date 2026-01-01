package model;

public class security {
private int id;
private String fname,lname,gender,address,email,password,status,joindate;
private long contact;

@Override
public String toString() {
	return "security [id=" + id + ", fname=" + fname + ", lname=" + lname + ", gender=" + gender + ", address="
			+ address + ", email=" + email + ", password=" + password + ", status=" + status + ", joindate=" + joindate
			+ ", contact=" + contact + "]";
}

public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getFname() {
	return fname;
}
public void setFname(String fname) {
	this.fname = fname;
}
public String getLname() {
	return lname;
}
public void setLname(String lname) {
	this.lname = lname;
}
public String getGender() {
	return gender;
}
public void setGender(String gender) {
	this.gender = gender;
}
public String getAddress() {
	return address;
}
public void setAddress(String address) {
	this.address = address;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
public String getStatus() {
	return status;
}
public void setStatus(String status) {
	this.status = status;
}
public String getJoindate() {
	return joindate;
}
public void setJoindate(String joindate) {
	this.joindate = joindate;
}
public long getContact() {
	return contact;
}
public void setContact(long contact) {
	this.contact = contact;
}
}
