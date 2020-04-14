package com.bbagym.model.vo;

public class CenterPrograms {
	
	private int pCode;
	private String pName;
	private int price;
	private int month;
	
	public CenterPrograms() {
		// TODO Auto-generated constructor stub
	}

	CenterPrograms(int pCode, String pName, int price, int month) {
		super();
		this.pCode = pCode;
		this.pName = pName;
		this.price = price;
		this.month = month;
	}

	public int getpCode() {
		return pCode;
	}

	public void setpCode(int pCode) {
		this.pCode = pCode;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getMonth() {
		return month;
	}

	public void setMonth(int month) {
		this.month = month;
	}

	@Override
	public String toString() {
		return "CenterPrograms [pCode=" + pCode + ", pName=" + pName + ", price=" + price + ", month=" + month + "]";
	}
	
	

}
