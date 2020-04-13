package com.bbagym.model.vo;

import java.util.Date;

public class MypageUser {
	private int ccode;
	private String cname;
	private String pname;
	private int month;
	private Date paydate;
	private Date expiredate;
	private int score;
	private int count;
	private String address;
	private String phone;
	private double avgscore;
	
	public MypageUser() {
		// TODO Auto-generated constructor stub
	}

	

	public MypageUser(int ccode, String cname, String pname, int month, Date paydate, Date expiredate, int score,
			int count, String address, String phone, double avgscore) {
		super();
		this.ccode = ccode;
		this.cname = cname;
		this.pname = pname;
		this.month = month;
		this.paydate = paydate;
		this.expiredate = expiredate;
		this.score = score;
		this.count = count;
		this.address = address;
		this.phone = phone;
		this.avgscore = avgscore;
	}


	

	public int getCcode() {
		return ccode;
	}



	public void setCcode(int ccode) {
		this.ccode = ccode;
	}



	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public int getMonth() {
		return month;
	}

	public void setMonth(int month) {
		this.month = month;
	}

	public Date getPaydate() {
		return paydate;
	}

	public void setPaydate(Date paydate) {
		this.paydate = paydate;
	}

	public Date getExpiredate() {
		return expiredate;
	}

	public void setExpiredate(Date expiredate) {
		this.expiredate = expiredate;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public double getAvgscore() {
		return avgscore;
	}

	public void setAvgscore(double avgscore) {
		this.avgscore = avgscore;
	}

	@Override
	public String toString() {
		return "MypageUser [cname=" + cname + ", pname=" + pname + ", month=" + month + ", paydate=" + paydate
				+ ", expiredate=" + expiredate + ", score=" + score + ", count=" + count + ", address=" + address
				+ ", phone=" + phone + ", avgscore=" + avgscore + "]";
	}

	
	
	
	
	
	
}
