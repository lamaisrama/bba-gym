package com.bbagym.model.vo;

public class Price {
	private int month;
	private int price;

	
	public Price() {
		// TODO Auto-generated constructor stub
	}
	
	public Price(int month, int price) {
		super();
		this.month = month;
		this.price = price;
	}

	
	public int getMonth() {
		return month;
	}


	public void setMonth(int month) {
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
		return "Price [month=" + month + ", price=" + price + "]";
	}
	
	
}
