package model;

public class visitor {
private int vid,Sid,flatNo,mId;
private String Vname,MemeberName,status,InTime,block,photo;
private long contact;

public int getmId() {
	return mId;
}
public void setmId(int mId) {
	this.mId = mId;
}
public String getPhoto() {
	return photo;
}
public void setPhoto(String photo) {
	this.photo = photo;
}
public String getBlock() {
	return block;
}
public void setBlock(String block) {
	this.block = block;
}
public int getVid() {
	return vid;
}
public void setVid(int vid) {
	this.vid = vid;
}
public int getSid() {
	return Sid;
}
public void setSid(int sid) {
	Sid = sid;
}
public int getFlatNo() {
	return flatNo;
}
public void setFlatNo(int flatNo) {
	this.flatNo = flatNo;
}
public String getVname() {
	return Vname;
}
public void setVname(String vname) {
	Vname = vname;
}
public String getMemeberName() {
	return MemeberName;
}
public void setMemeberName(String memeberName) {
	MemeberName = memeberName;
}
public String getStatus() {
	return status;
}
public void setStatus(String status) {
	this.status = status;
}
public String getInTime() {
	return InTime;
}
public void setInTime(String inTime) {
	InTime = inTime;
}
public long getContact() {
	return contact;
}
public void setContact(long contact) {
	this.contact = contact;
}
@Override
public String toString() {
	return "visitor [vid=" + vid + ", Sid=" + Sid + ", flatNo=" + flatNo + ", mId=" + mId + ", Vname=" + Vname
			+ ", MemeberName=" + MemeberName + ", status=" + status + ", InTime=" + InTime + ", block=" + block
			+ ", photo=" + photo + ", contact=" + contact + "]";
}

}
