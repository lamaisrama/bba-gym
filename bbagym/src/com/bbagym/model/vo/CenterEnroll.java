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
	private String mainImagePath;
	private List<String> photos;
	private List<String> categories;
	private List<String> facilities;
	private Properties sns;
	private Properties program;
	
	public CenterEnroll() {
		// TODO Auto-generated constructor stub
	}

	public CenterEnroll(int code, String name, String address, String tel, String opHr, String holiday,
			String schedulePath, String text, String mainImagePath, List<String> photos, List<String> categories,
			List<String> facilities, Properties sns, Properties program) {
		super();
		this.code = code;
		this.name = name;
		this.address = address;
		this.tel = tel;
		this.opHr = opHr;
		this.holiday = holiday;
		this.schedulePath = schedulePath;
		this.text = text;
		this.mainImagePath = mainImagePath;
		this.photos = photos;
		this.categories = categories;
		this.facilities = facilities;
		this.sns = sns;
		this.program = program;
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

	public String getMainImagePath() {
		return mainImagePath;
	}

	public void setMainImagePath(String mainImagePath) {
		this.mainImagePath = mainImagePath;
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

	public Properties getSns() {
		return sns;
	}

	public void setSns(Properties sns) {
		this.sns = sns;
	}

	public Properties getProgram() {
		return program;
	}

	public void setProgram(Properties program) {
		this.program = program;
	}

	@Override
	public String toString() {
		return "CenterEnroll [code=" + code + ", name=" + name + ", address=" + address + ", tel=" + tel + ", opHr="
				+ opHr + ", holiday=" + holiday + ", schedulePath=" + schedulePath + ", text=" + text
				+ ", mainImagePath=" + mainImagePath + ", photos=" + photos + ", categories=" + categories
				+ ", facilities=" + facilities + ", sns=" + sns + ", program=" + program + "]";
	}



	
	
	
	
}
