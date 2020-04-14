package com.bbagym.model.vo;

public class TrainerProgram {
	
	private String pName;;
	private int price;
	private int count;
	private int pCode;
	
	
	public TrainerProgram() {
		// TODO Auto-generated constructor stub
	}


	TrainerProgram(String pName, int price, int count, int pCode) {
		super();
		this.pName = pName;
		this.price = price;
		this.count = count;
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


	public int getCount() {
		return count;
	}


	public void setCount(int count) {
		this.count = count;
	}


	public int getpCode() {
		return pCode;
	}


	public void setpCode(int pCode) {
		this.pCode = pCode;
	}


	@Override
	public String toString() {
		return "TrainerProgram [pName=" + pName + ", price=" + price + ", count=" + count + ", pCode=" + pCode + "]";
	}

	
	

}
