package com.bbagym.model.vo;

public class Baguni {

	private int pcode;
	private String pname;
	private int price;
	private String cname;
	private String mname;
	private int count;
	private int month;
	private String cmainimage;
	private String tmainimage;
	
	
	
	public Baguni() {
		// TODO Auto-generated constructor stub
	}




	public Baguni(int pcode, String pname, int price, String cname, String mname, int count, int month,
			String cmainimage, String tmainimage) {
		super();
		this.pcode = pcode;
		this.pname = pname;
		this.price = price;
		this.cname = cname;
		this.mname = mname;
		this.count = count;
		this.month = month;
		this.cmainimage = cmainimage;
		this.tmainimage = tmainimage;
	}




	public int getPcode() {
		return pcode;
	}




	public void setPcode(int pcode) {
		this.pcode = pcode;
	}




	public String getPname() {
		return pname;
	}




	public void setPname(String pname) {
		this.pname = pname;
	}




	public int getPrice() {
		return price;
	}




	public void setPrice(int price) {
		this.price = price;
	}




	public String getCname() {
		return cname;
	}




	public void setCname(String cname) {
		this.cname = cname;
	}




	public String getMname() {
		return mname;
	}




	public void setMname(String mname) {
		this.mname = mname;
	}




	public int getCount() {
		return count;
	}




	public void setCount(int count) {
		this.count = count;
	}




	public int getMonth() {
		return month;
	}




	public void setMonth(int month) {
		this.month = month;
	}




	public String getCmainimage() {
		return cmainimage;
	}




	public void setCmainimage(String cmainimage) {
		this.cmainimage = cmainimage;
	}




	public String getTmainimage() {
		return tmainimage;
	}




	public void setTmainimage(String tmainimage) {
		this.tmainimage = tmainimage;
	}




	@Override
	public String toString() {
		return "Baguni [pcode=" + pcode + ", pname=" + pname + ", price=" + price + ", cname=" + cname + ", mname="
				+ mname + ", count=" + count + ", month=" + month + ", cmainimage=" + cmainimage + ", tmainimage="
				+ tmainimage + "]";
	}




	
	
	
	
}
