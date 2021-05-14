package order;

public class OrderDTO {
//	IDX       NOT NULL NUMBER        
//	PRODUCT   NOT NULL VARCHAR2(50)  
//	CNT       NOT NULL NUMBER        
//	ORDERER   NOT NULL VARCHAR2(50)  
//	ADDRESS   NOT NULL VARCHAR2(100) 
//	ORDERTIME NOT NULL VARCHAR2(100) 
//	PAYCHECK  NOT NULL CHAR(1)       
//	PRICE     NOT NULL NUMBER        
//	TOTAL     NOT NULL NUMBER    
	
	private int idx, cnt, price, total;
	private String product, orderer, address, ordertime, paycheck;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getProduct() {
		return product;
	}
	public void setProduct(String product) {
		this.product = product;
	}
	public String getOrderer() {
		return orderer;
	}
	public void setOrderer(String orderer) {
		this.orderer = orderer;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getOrdertime() {
		return ordertime;
	}
	public void setOrdertime(String ordertime) {
		this.ordertime = ordertime;
	}
	public String getPaycheck() {
		return paycheck;
	}
	public void setPaycheck(String paycheck) {
		this.paycheck = paycheck;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
}
