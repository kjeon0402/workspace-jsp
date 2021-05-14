package guest;

public class GuestDTO {
//	IDX     NOT NULL NUMBER        
//	ID      NOT NULL VARCHAR2(50)  
//	PW      NOT NULL VARCHAR2(200) 
//	NAME    NOT NULL VARCHAR2(50)  
//	ADDRESS NOT NULL VARCHAR2(100) 
//	CARD    NOT NULL VARCHAR2(50)  
//	CARDPW  NOT NULL VARCHAR2(50)  
	
	private int idx;
	private String id, pw, name, address, card, cardpw;
	
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
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCard() {
		return card;
	}
	public void setCard(String card) {
		this.card = card;
	}
	public String getCardpw() {
		return cardpw;
	}
	public void setCardpw(String cardpw) {
		this.cardpw = cardpw;
	}
}
