package com.bbagym.model.vo;

import java.util.Date;

public class Member {

	private String m_code;
	private String m_id;
	private String m_pw;
	private String m_name;
	private String m_email;
	private String m_phone;
	private String m_address;
	private int m_level;
	private Date m_enrolldate;
	private char m_status;
	private String m_image;
	private String m_phone2;
	private String m_address2;
	private char m_gender;

	public Member() {
		// TODO Auto-generated constructor stub
	}

	public Member(String m_code, String m_id, String m_pw, String m_name, String m_email, String m_phone,
			String m_address, int m_level, Date m_enrolldate, char m_status, String m_image, String m_phone2,
			String m_address2, char m_gender) {
		super();
		this.m_code = m_code;
		this.m_id = m_id;
		this.m_pw = m_pw;
		this.m_name = m_name;
		this.m_email = m_email;
		this.m_phone = m_phone;
		this.m_address = m_address;
		this.m_level = m_level;
		this.m_enrolldate = m_enrolldate;
		this.m_status = m_status;
		this.m_image = m_image;
		this.m_phone2 = m_phone2;
		this.m_address2 = m_address2;
		this.m_gender = m_gender;
	}

	public String getM_code() {
		return m_code;
	}

	public void setM_code(String m_code) {
		this.m_code = m_code;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getM_pw() {
		return m_pw;
	}

	public void setM_pw(String m_pw) {
		this.m_pw = m_pw;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public String getM_phone() {
		return m_phone;
	}

	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}

	public String getM_address() {
		return m_address;
	}

	public void setM_address(String m_address) {
		this.m_address = m_address;
	}

	public int getM_level() {
		return m_level;
	}

	public void setM_level(int m_level) {
		this.m_level = m_level;
	}

	public Date getM_enrolldate() {
		return m_enrolldate;
	}

	public void setM_enrolldate(Date m_enrolldate) {
		this.m_enrolldate = m_enrolldate;
	}

	public char getM_status() {
		return m_status;
	}

	public void setM_status(char m_status) {
		this.m_status = m_status;
	}

	public String getM_image() {
		return m_image;
	}

	public void setM_image(String m_image) {
		this.m_image = m_image;
	}

	public String getM_phone2() {
		return m_phone2;
	}

	public void setM_phone2(String m_phone2) {
		this.m_phone2 = m_phone2;
	}

	public String getM_address2() {
		return m_address2;
	}

	public void setM_address2(String m_address2) {
		this.m_address2 = m_address2;
	}

	public char getM_gender() {
		return m_gender;
	}

	public void setM_gender(char m_gender) {
		this.m_gender = m_gender;
	}

	@Override
	public String toString() {
		return "Member [m_code=" + m_code + ", m_id=" + m_id + ", m_pw=" + m_pw + ", m_name=" + m_name + ", m_email="
				+ m_email + ", m_phone=" + m_phone + ", m_address=" + m_address + ", m_level=" + m_level
				+ ", m_enrolldate=" + m_enrolldate + ", m_status=" + m_status + ", m_image=" + m_image + ", m_phone2="
				+ m_phone2 + ", m_address2=" + m_address2 + ", m_gender=" + m_gender + "]";
	}
	
	

}
