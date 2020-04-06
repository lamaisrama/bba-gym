package com.bbagym.model.vo;

import java.sql.Date;

public class Member {
	
	private int M_CODE;
	private String userId;
	private String M_PW;
	private String M_NAME;
	private String M_EMAIL;
	private String M_PHONE;
	private String M_ADDRESS;
	private int M_LEVEL;
	private Date M_ENROLLDATE;
	private char M_STATUS;
	private String M_IMAGE;
	private String M_PHONE2;
	private String M_ADDRESS_2;
	private char M_GENDER;
	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Member(int m_CODE, String userId, String m_PW, String m_NAME, String m_EMAIL, String m_PHONE,
			String m_ADDRESS, int m_LEVEL, Date m_ENROLLDATE, char m_STATUS, String m_IMAGE, String m_PHONE2,
			String m_ADDRESS_2, char m_GENDER) {
		super();
		M_CODE = m_CODE;
		this.userId = userId;
		M_PW = m_PW;
		M_NAME = m_NAME;
		M_EMAIL = m_EMAIL;
		M_PHONE = m_PHONE;
		M_ADDRESS = m_ADDRESS;
		M_LEVEL = m_LEVEL;
		M_ENROLLDATE = m_ENROLLDATE;
		M_STATUS = m_STATUS;
		M_IMAGE = m_IMAGE;
		M_PHONE2 = m_PHONE2;
		M_ADDRESS_2 = m_ADDRESS_2;
		M_GENDER = m_GENDER;
	}
	public int getM_CODE() {
		return M_CODE;
	}
	public void setM_CODE(int m_CODE) {
		M_CODE = m_CODE;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getM_PW() {
		return M_PW;
	}
	public void setM_PW(String m_PW) {
		M_PW = m_PW;
	}
	public String getM_NAME() {
		return M_NAME;
	}
	public void setM_NAME(String m_NAME) {
		M_NAME = m_NAME;
	}
	public String getM_EMAIL() {
		return M_EMAIL;
	}
	public void setM_EMAIL(String m_EMAIL) {
		M_EMAIL = m_EMAIL;
	}
	public String getM_PHONE() {
		return M_PHONE;
	}
	public void setM_PHONE(String m_PHONE) {
		M_PHONE = m_PHONE;
	}
	public String getM_ADDRESS() {
		return M_ADDRESS;
	}
	public void setM_ADDRESS(String m_ADDRESS) {
		M_ADDRESS = m_ADDRESS;
	}
	public int getM_LEVEL() {
		return M_LEVEL;
	}
	public void setM_LEVEL(int m_LEVEL) {
		M_LEVEL = m_LEVEL;
	}
	public Date getM_ENROLLDATE() {
		return M_ENROLLDATE;
	}
	public void setM_ENROLLDATE(Date m_ENROLLDATE) {
		M_ENROLLDATE = m_ENROLLDATE;
	}
	public char getM_STATUS() {
		return M_STATUS;
	}
	public void setM_STATUS(char m_STATUS) {
		M_STATUS = m_STATUS;
	}
	public String getM_IMAGE() {
		return M_IMAGE;
	}
	public void setM_IMAGE(String m_IMAGE) {
		M_IMAGE = m_IMAGE;
	}
	public String getM_PHONE2() {
		return M_PHONE2;
	}
	public void setM_PHONE2(String m_PHONE2) {
		M_PHONE2 = m_PHONE2;
	}
	public String getM_ADDRESS_2() {
		return M_ADDRESS_2;
	}
	public void setM_ADDRESS_2(String m_ADDRESS_2) {
		M_ADDRESS_2 = m_ADDRESS_2;
	}
	public char getM_GENDER() {
		return M_GENDER;
	}
	public void setM_GENDER(char m_GENDER) {
		M_GENDER = m_GENDER;
	}
	@Override
	public String toString() {
		return "Member [M_CODE=" + M_CODE + ", userId=" + userId + ", M_PW=" + M_PW + ", M_NAME=" + M_NAME
				+ ", M_EMAIL=" + M_EMAIL + ", M_PHONE=" + M_PHONE + ", M_ADDRESS=" + M_ADDRESS + ", M_LEVEL=" + M_LEVEL
				+ ", M_ENROLLDATE=" + M_ENROLLDATE + ", M_STATUS=" + M_STATUS + ", M_IMAGE=" + M_IMAGE + ", M_PHONE2="
				+ M_PHONE2 + ", M_ADDRESS_2=" + M_ADDRESS_2 + ", M_GENDER=" + M_GENDER + "]";
	}
	
	
}
