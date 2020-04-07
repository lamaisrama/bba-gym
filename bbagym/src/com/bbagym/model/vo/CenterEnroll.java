package com.bbagym.model.vo;

import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.Properties;

public class CenterEnroll {
	private String name;
	private String address;
	private String tel;
	private String opHr;
	private String holiday;
	private String[] categories;
	private String[] facilities;
	private Properties sns;
	private String photo;
	private List<String> photos;
	private String text;
	private Properties program;
	
	public CenterEnroll() {
		// TODO Auto-generated constructor stub
	}

	public CenterEnroll(String name, String address, String tel, String opHr, String holiday, String[] categories,
			String[] facilities, Properties sns, String photo, List<String> photos, String text,
			Properties program) {
		super();
		this.name = name;
		this.address = address;
		this.tel = tel;
		this.opHr = opHr;
		this.holiday = holiday;
		this.categories = categories;
		this.facilities = facilities;
		this.sns = sns;
		this.photo = photo;
		this.photos = photos;
		this.text = text;
		this.program = program;
	}

	public CenterEnroll(String name, String address, String tel, String opHr, String holiday, String[] categories,
			String[] facilities, Properties sns, String photo, List<String> photos) {
		super();
		this.name = name;
		this.address = address;
		this.tel = tel;
		this.opHr = opHr;
		this.holiday = holiday;
		this.categories = categories;
		this.facilities = facilities;
		this.sns = sns;
		this.photo = photo;
		this.photos = photos;
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

	public String[] getCategories() {
		return categories;
	}

	public void setCategories(String[] categories) {
		this.categories = categories;
	}

	public String[] getFacilities() {
		return facilities;
	}

	public void setFacilities(String[] facilities) {
		this.facilities = facilities;
	}

	public Properties getSns() {
		return sns;
	}

	public void setSns(Properties sns) {
		this.sns = sns;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public List<String> getPhotos() {
		return photos;
	}

	public void setPhotos(List<String> photos) {
		this.photos = photos;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public Properties getProgram() {
		return program;
	}

	public void setProgram(Properties program) {
		this.program = program;
	}

	@Override
	public String toString() {
		return "CenterEnroll [name=" + name + ", address=" + address + ", tel=" + tel + ", opHr=" + opHr + ", holiday="
				+ holiday + ", categories=" + Arrays.toString(categories) + ", facilities="
				+ Arrays.toString(facilities) + ", sns=" + sns + ", photo=" + photo + ", photos=" + photos + ", text="
				+ text + ", program=" + program + "]";
	}
	
	
	
}
