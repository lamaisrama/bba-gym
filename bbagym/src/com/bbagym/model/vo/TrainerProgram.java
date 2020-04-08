package com.bbagym.model.vo;

public class TrainerProgram {
	
	private String name;
	private int price;
	
	public TrainerProgram() {
		// TODO Auto-generated constructor stub
	}

	public TrainerProgram(String name, int price) {
		super();
		this.name = name;
		this.price = price;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "TrainerProgram [name=" + name + ", price=" + price + "]";
	}
	
	

}
