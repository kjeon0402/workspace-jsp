package day16_quiz;

import java.util.Date;

public class MemberDTO {
	
//	IDX        NOT NULL NUMBER        
//	USERID     NOT NULL VARCHAR2(20)  
//	USERPW     NOT NULL VARCHAR2(500) 
//	USERNAME   NOT NULL VARCHAR2(50)  
//	AGE                 NUMBER        
//	GENDER              VARCHAR2(10)  
//	REGISTDATE          DATE         
	
	private int idx;
	private String userid;
	private String userpw;
	private String username;
	private int age;
	private String gender;
	private Date registDate;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpw() {
		return userpw;
	}
	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public Date getRegistDate() {
		return registDate;
	}
	public void setRegistDate(Date registDate) {
		this.registDate = registDate;
	}
}
