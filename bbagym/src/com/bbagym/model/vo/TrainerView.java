package com.bbagym.model.vo;

import java.util.Arrays;

public class TrainerView {

	private int t_code;
	private String t_img;
	private String m_name;
	private String c_center;
	private String m_addres2;
	private String[] badge;

	public TrainerView() {
		// TODO Auto-generated constructor stub
	}

	

	public TrainerView(int t_code, String t_img, String m_name, String c_center, String m_addres2, String[] badge) {
		super();
		this.t_code = t_code;
		this.t_img = t_img;
		this.m_name = m_name;
		this.c_center = c_center;
		this.m_addres2 = m_addres2;
		this.badge = badge;
	}



	public String[] getBadge() {
		return badge;
	}



	public void setBadge(String[] badge) {
		this.badge = badge;
	}



	public int getT_code() {
		return t_code;
	}

	public void setT_code(int t_code) {
		this.t_code = t_code;
	}

	public String getT_img() {
		return t_img;
	}

	public void setT_img(String t_img) {
		this.t_img = t_img;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getC_center() {
		return c_center;
	}

	public void setC_center(String c_center) {
		this.c_center = c_center;
	}

	public String getM_addres2() {
		return m_addres2;
	}

	public void setM_addres2(String m_addres2) {
		this.m_addres2 = m_addres2;
	}



	@Override
	public String toString() {
		return "TrainerView [t_code=" + t_code + ", t_img=" + t_img + ", m_name=" + m_name + ", c_center=" + c_center
				+ ", m_addres2=" + m_addres2 + ", badge=" + Arrays.toString(badge) + "]";
	}

	
	
	
	
	
	
}
