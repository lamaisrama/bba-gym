package com.bbagym.model.vo;

import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.Properties;

public class CenterEnroll {
	private int code;
	private String name;
	private String address;
	private String tel;
	private String opHr;
	private String holiday;
	private String schedulePath;
	private String text;
	private String mainImage;
	private String businessCode;
	private String approval;
	private int memberCode;
	private String snsHome;
	private String snsInsta;
	private String snsBlog;
	private String snsEtc;
	private List<String> photos;
	private List<String> categories;
	private List<String> facilities;
	private List<Program> program;
	private boolean prefer;
	
	public CenterEnroll() {
		// TODO Auto-generated constructor stub
	}
	
	

	public boolean getPrefer() {
		return prefer;
	}



	public void setPrefer(boolean prefer) {
		this.prefer = prefer;
	}



	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getOpHr() {
		return opHr;
	}

	public void setOpHr(String opHr) {
		this.opHr = opHr;
	}

	public String getHoliday() {
		return holiday;
	}

	public void setHoliday(String holiday) {
		this.holiday = holiday;
	}

	public String getSchedulePath() {
		return schedulePath;
	}

	public void setSchedulePath(String schedulePath) {
		this.schedulePath = schedulePath;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getMainImage() {
		return mainImage;
	}

	public void setMainImage(String mainImage) {
		this.mainImage = mainImage;
	}

	public String getBusinessCode() {
		return businessCode;
	}

	public void setBusinessCode(String businessCode) {
		this.businessCode = businessCode;
	}

	public String getApproval() {
		return approval;
	}

	public void setApproval(String approval) {
		this.approval = approval;
	}

	public int getMemberCode() {
		return memberCode;
	}

	public void setMemberCode(int memberCode) {
		this.memberCode = memberCode;
	}

	public String getSnsHome() {
		return snsHome;
	}

	public void setSnsHome(String snsHome) {
		this.snsHome = snsHome;
	}

	public String getSnsInsta() {
		return snsInsta;
	}

	public void setSnsInsta(String snsInsta) {
		this.snsInsta = snsInsta;
	}

	public String getSnsBlog() {
		return snsBlog;
	}

	public void setSnsBlog(String snsBlog) {
		this.snsBlog = snsBlog;
	}

	public String getSnsEtc() {
		return snsEtc;
	}

	public void setSnsEtc(String snsEtc) {
		this.snsEtc = snsEtc;
	}

	public List<String> getPhotos() {
		return photos;
	}

	public void setPhotos(List<String> photos) {
		this.photos = photos;
	}

	public List<String> getCategories() {
		return categories;
	}

	public void setCategories(List<String> categories) {
		this.categories = categories;
	}

	public List<String> getFacilities() {
		return facilities;
	}

	public void setFacilities(List<String> facilities) {
		this.facilities = facilities;
	}

	public List<Program> getProgram() {
		return program;
	}

	public void setProgram(List<Program> program) {
		this.program = program;
	}

	@Override
	public String toString() {
		return "CenterEnroll [code=" + code + ", name=" + name + ", address=" + address + ", tel=" + tel + ", opHr="
				+ opHr + ", holiday=" + holiday + ", schedulePath=" + schedulePath + ", text=" + text + ", mainImage="
				+ mainImage + ", businessCode=" + businessCode + ", approval=" + approval + ", memberCode=" + memberCode
				+ ", snsHome=" + snsHome + ", snsInsta=" + snsInsta + ", snsBlog=" + snsBlog + ", snsEtc=" + snsEtc
				+ ", photos=" + photos + ", categories=" + categories + ", facilities=" + facilities + ", program="
				+ program + "]";
	}

}

