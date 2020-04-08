package com.bbagym.model.vo;

public class CenterScore {
	
	private int sum;
	private int count;
	
	
	public CenterScore() {
		// TODO Auto-generated constructor stub
	}


	CenterScore(int sum, int count) {
		super();
		this.sum = sum;
		this.count = count;
	}


	public int getSum() {
		return sum;
	}


	public void setSum(int sum) {
		this.sum = sum;
	}


	public int getCount() {
		return count;
	}


	public void setCount(int count) {
		this.count = count;
	}


	@Override
	public String toString() {
		return "CenterScore [sum=" + sum + ", count=" + count + "]";
	}
	
	
}
