package com.bbagym.model.vo;

public class Center {

	private String c_code;
	private String c_name;
	private String c_address;
	private String c_phone;
	private String c_opearting_hours;
	private String c_holiday;
	private String c_schedule;
	private String c_text;
	private String business_code;
	private char approval;
	private String m_code;
	
	public Center() {
		// TODO Auto-generated constructor stub
	}

	public Center(String c_code, String c_name, String c_address, String c_phone, String c_opearting_hours,
			String c_holiday, String c_schedule, String c_text, String business_code, char approval, String m_code) {
		super();
		this.c_code = c_code;
		this.c_name = c_name;
		this.c_address = c_address;
		this.c_phone = c_phone;
		this.c_opearting_hours = c_opearting_hours;
		this.c_holiday = c_holiday;
		this.c_schedule = c_schedule;
		this.c_text = c_text;
		this.business_code = business_code;
		this.approval = approval;
		this.m_code = m_code;
	}

	public String getC_code() {
		return c_code;
	}

	public void setC_code(String c_code) {
		this.c_code = c_code;
	}

	public String getC_name() {
		return c_name;
	}

	public void setC_name(String c_name) {
		this.c_name = c_name;
	}

	public String getC_address() {
		return c_address;
	}

	public void setC_address(String c_address) {
		this.c_address = c_address;
	}

	public String getC_phone() {
		return c_phone;
	}

	public void setC_phone(String c_phone) {
		this.c_phone = c_phone;
	}

	public String getC_opearting_hours() {
		return c_opearting_hours;
	}

	public void setC_opearting_hours(String c_opearting_hours) {
		this.c_opearting_hours = c_opearting_hours;
	}

	public String getC_holiday() {
		return c_holiday;
	}

	public void setC_holiday(String c_holiday) {
		this.c_holiday = c_holiday;
	}

	public String getC_schedule() {
		return c_schedule;
	}

	public void setC_schedule(String c_schedule) {
		this.c_schedule = c_schedule;
	}

	public String getC_text() {
		return c_text;
	}

	public void setC_text(String c_text) {
		this.c_text = c_text;
	}

	public String getBusiness_code() {
		return business_code;
	}

	public void setBusiness_code(String business_code) {
		this.business_code = business_code;
	}

	public char getApproval() {
		return approval;
	}

	public void setApproval(char approval) {
		this.approval = approval;
	}

	public String getM_code() {
		return m_code;
	}

	public void setM_code(String m_code) {
		this.m_code = m_code;
	}

	@Override
	public String toString() {
		return "Center [c_code=" + c_code + ", c_name=" + c_name + ", c_address=" + c_address + ", c_phone=" + c_phone
				+ ", c_opearting_hours=" + c_opearting_hours + ", c_holiday=" + c_holiday + ", c_schedule=" + c_schedule
				+ ", c_text=" + c_text + ", business_code=" + business_code + ", approval=" + approval + ", m_code="
				+ m_code + "]";
	}
	
	
	
}
