package model;

public class Chairman {
private int Cid;
private String first_name,last_name,gender,dob,email,password,address,photo;
private long contact_no;
public int getCid() {
	return Cid;
}
public void setCid(int cid) {
	Cid = cid;
}
public String getFirst_name() {
	return first_name;
}
public void setFirst_name(String first_name) {
	this.first_name = first_name;
}
public String getLast_name() {
	return last_name;
}
public void setLast_name(String last_name) {
	this.last_name = last_name;
}
public String getGender() {
	return gender;
}
public void setGender(String gender) {
	this.gender = gender;
}
public String getDob() {
	return dob;
}
public void setDob(String dob) {
	this.dob = dob;
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
public String getAddress() {
	return address;
}
public void setAddress(String address) {
	this.address = address;
}
public String getPhoto() {
	return photo;
}
public void setPhoto(String photo) {
	this.photo = photo;
}
public long getContact_no() {
	return contact_no;
}
public void setContact_no(long contact_no) {
	this.contact_no = contact_no;
}
@Override
public String toString() {
	return "Chairman [Cid=" + Cid + ", first_name=" + first_name + ", last_name=" + last_name + ", gender=" + gender
			+ ", dob=" + dob + ", email=" + email + ", password=" + password + ", address=" + address + ", photo="
			+ photo + ", contact_no=" + contact_no + "]";
}

}
