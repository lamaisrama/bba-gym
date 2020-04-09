package com.bbagym.model.vo;

public class CenterPrice {
	
	private String month;
	private int price;
	
	public CenterPrice() {
		// TODO Auto-generated constructor stub
	}

	public CenterPrice(String month, int price) {
		super();
		this.month = month;
		this.price = price;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "CenterPrice [month=" + month + ", price=" + price + "]";
	}
	
	

}
