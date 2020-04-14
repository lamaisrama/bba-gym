package com.bbagym.model.vo;

import java.util.Date;

public class BuyInfo {
	
	private int orderCode;
	private int pCode;
	private String mName;
	private String pName;
	private int month;
	private Date buyDate;
	private int score;
	
	public BuyInfo() {
		// TODO Auto-generated constructor stub
	}

	BuyInfo(int orderCode, int pCode, String mName, String pName, int month, Date buyDate, int score) {
		super();
		this.orderCode = orderCode;
		this.pCode = pCode;
		this.mName = mName;
		this.pName = pName;
		this.month = month;
		this.buyDate = buyDate;
		this.score = score;
	}

	public int getOrderCode() {
		return orderCode;
	}

	public void setOrderCode(int orderCode) {
		this.orderCode = orderCode;
	}

	public int getpCode() {
		return pCode;
	}

	public void setpCode(int pCode) {
		this.pCode = pCode;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public int getMonth() {
		return month;
	}

	public void setMonth(int month) {
		this.month = month;
	}

	public Date getBuyDate() {
		return buyDate;
	}

	public void setBuyDate(Date buyDate) {
		this.buyDate = buyDate;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	@Override
	public String toString() {
		return "BuyInfo [orderCode=" + orderCode + ", pCode=" + pCode + ", mName=" + mName + ", pName=" + pName
				+ ", month=" + month + ", buyDate=" + buyDate + ", score=" + score + "]";
	}

	
	

}
