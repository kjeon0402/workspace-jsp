package member;

public class MemberDTO {
//	TABLE : MEMBER
//	IDX   NOT NULL NUMBER        
//	ID    NOT NULL VARCHAR2(50)  
//	PW    NOT NULL VARCHAR2(200) 
//	NAME  NOT NULL VARCHAR2(50)  
//	EMAIL          VARCHAR2(100) 
//	PNUM           VARCHAR2(100) 
	
	private int idx;
	private String id, pw, name, email, pnum;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPnum() {
		return pnum;
	}
	public void setPnum(String pnum) {
		this.pnum = pnum;
	}

}
