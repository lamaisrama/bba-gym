package com.bbagym.model.vo;


import java.util.List;

public class TrainerView {

	private int tcode;
	private String timg;
	private String mname;
	private String ccenter;
	private String maddres2;
	private List<String> badge;

	public TrainerView() {
		// TODO Auto-generated constructor stub
	}

	public int getTcode() {
		return tcode;
	}

	public void setTcode(int tcode) {
		this.tcode = tcode;
	}

	public String getTimg() {
		return timg;
	}

	public void setTimg(String timg) {
		this.timg = timg;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getCcenter() {
		return ccenter;
	}

	public void setCcenter(String ccenter) {
		this.ccenter = ccenter;
	}

	public String getMaddres2() {
		return maddres2;
	}

	public void setMaddres2(String maddres2) {
		this.maddres2 = maddres2;
	}

	public List<String> getBadge() {
		return badge;
	}

	public void setBadge(List<String> badge) {
		this.badge = badge;
	}

	@Override
	public String toString() {
		return "TrainerView [tcode=" + tcode + ", timg=" + timg + ", mname=" + mname + ", ccenter=" + ccenter
				+ ", maddres2=" + maddres2 + ", badge=" + badge + "]";
	}
	
	
	
	

	
	
	
	
	
	
}
