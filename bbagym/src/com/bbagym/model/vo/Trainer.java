package com.bbagym.model.vo;

public class Trainer {

	private int t_code;
	private String t_counsel_hours;
	private String t_introduction;
	private String t_career;
	private String business_code;
	private String t_text;
	private char approval;
	private String c_code;
	private String m_code;
	
	public Trainer() {
		// TODO Auto-generated constructor stub
	}

	public Trainer(int t_code, String t_counsel_hours, String t_introduction, String t_career, String business_code,
			String t_text, char approval, String c_code, String m_code) {
		super();
		this.t_code = t_code;
		this.t_counsel_hours = t_counsel_hours;
		this.t_introduction = t_introduction;
		this.t_career = t_career;
		this.business_code = business_code;
		this.t_text = t_text;
		this.approval = approval;
		this.c_code = c_code;
		this.m_code = m_code;
	}

	public int getT_code() {
		return t_code;
	}

	public void setT_code(int t_code) {
		this.t_code = t_code;
	}

	public String getT_counsel_hours() {
		return t_counsel_hours;
	}

	public void setT_counsel_hours(String t_counsel_hours) {
		this.t_counsel_hours = t_counsel_hours;
	}

	public String getT_introduction() {
		return t_introduction;
	}

	public void setT_introduction(String t_introduction) {
		this.t_introduction = t_introduction;
	}

	public String getT_career() {
		return t_career;
	}

	public void setT_career(String t_career) {
		this.t_career = t_career;
	}

	public String getBusiness_code() {
		return business_code;
	}

	public void setBusiness_code(String business_code) {
		this.business_code = business_code;
	}

	public String getT_text() {
		return t_text;
	}

	public void setT_text(String t_text) {
		this.t_text = t_text;
	}

	public char getApproval() {
		return approval;
	}

	public void setApproval(char approval) {
		this.approval = approval;
	}

	public String getC_code() {
		return c_code;
	}

	public void setC_code(String c_code) {
		this.c_code = c_code;
	}

	public String getM_code() {
		return m_code;
	}

	public void setM_code(String m_code) {
		this.m_code = m_code;
	}

	@Override
	public String toString() {
		return "Trainer [t_code=" + t_code + ", t_counsel_hours=" + t_counsel_hours + ", t_introduction="
				+ t_introduction + ", t_career=" + t_career + ", business_code=" + business_code + ", t_text=" + t_text
				+ ", approval=" + approval + ", c_code=" + c_code + ", m_code=" + m_code + "]";
	}
	
	
	
	
}
