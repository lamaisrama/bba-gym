package com.bbagym.model.vo;

public class TrainerProgram {
	
	private int pcode;
	private String pName;;
	private int price;
	private int count;
	
	
	public TrainerProgram() {
		// TODO Auto-generated constructor stub
	}


	



	public TrainerProgram(int pcode, String pName, int price, int count) {
		super();
		this.pcode = pcode;
		this.pName = pName;
		this.price = price;
		this.count = count;
	}






	public int getPcode() {
		return pcode;
	}




	public void setPcode(int pcode) {
		this.pcode = pcode;
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






	@Override
	public String toString() {
		return "TrainerProgram [pcode=" + pcode + ", pName=" + pName + ", price=" + price + ", count=" + count + "]";
	}



		



}
