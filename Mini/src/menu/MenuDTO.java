package menu;

//  table board
//	IDX		NUMBER				No		1	
//	NAME	VARCHAR2(20 BYTE)	No		2	
//	IMG		VARCHAR2(500 BYTE)	No		3	
//	PRICE	NUMBER				No		4
// 	KIND	VARCHAR2			NO		5

public class MenuDTO {
	private int IDX,PRICE;
	private String NAME, IMG, KIND;
	private int TOTAL;
	
	public int getIDX() {
		return IDX;
	}
	public void setIDX(int iDX) {
		IDX = iDX;
	}
	public int getPRICE() {
		return PRICE;
	}
	public void setPRICE(int pRICE) {
		PRICE = pRICE;
	}
	public String getNAME() {
		return NAME;
	}
	public void setNAME(String nAME) {
		NAME = nAME;
	}
	public String getIMG() {
		return IMG;
	}
	public void setIMG(String iMG) {
		IMG = iMG;
	}
	public String getKIND() {
		return KIND;
	}
	public void setKIND(String kIND) {
		KIND = kIND;
	}
	public int getTOTAL() {
		return TOTAL;
	}
	public void setTOTAL(int tOTAL) {
		TOTAL = tOTAL;
	}
}
