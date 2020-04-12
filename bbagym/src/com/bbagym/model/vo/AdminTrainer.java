package com.bbagym.model.vo;

public class AdminTrainer {
	private int M_CODE;
	private String M_ID;
	private String M_NAME;
	private String M_ADDRESS_2;
	private String M_PHONE_2;
	private String T_INTRODUCTION;
	private String APPROVAL;
	private int T_CODE;
	private String C_CODE;
	private String C_NAME;
	public AdminTrainer() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AdminTrainer(int m_CODE, String m_ID, String m_NAME, String m_ADDRESS_2, String m_PHONE_2,
			String t_INTRODUCTION, String aPPROVAL, int t_CODE, String c_CODE, String c_NAME) {
		super();
		M_CODE = m_CODE;
		M_ID = m_ID;
		M_NAME = m_NAME;
		M_ADDRESS_2 = m_ADDRESS_2;
		M_PHONE_2 = m_PHONE_2;
		T_INTRODUCTION = t_INTRODUCTION;
		APPROVAL = aPPROVAL;
		T_CODE = t_CODE;
		C_CODE = c_CODE;
		C_NAME = c_NAME;
	}
	public int getM_CODE() {
		return M_CODE;
	}
	public void setM_CODE(int m_CODE) {
		M_CODE = m_CODE;
	}
	public String getM_ID() {
		return M_ID;
	}
	public void setM_ID(String m_ID) {
		M_ID = m_ID;
	}
	public String getM_NAME() {
		return M_NAME;
	}
	public void setM_NAME(String m_NAME) {
		M_NAME = m_NAME;
	}
	public String getM_ADDRESS_2() {
		return M_ADDRESS_2;
	}
	public void setM_ADDRESS_2(String m_ADDRESS_2) {
		M_ADDRESS_2 = m_ADDRESS_2;
	}
	public String getM_PHONE_2() {
		return M_PHONE_2;
	}
	public void setM_PHONE_2(String m_PHONE_2) {
		M_PHONE_2 = m_PHONE_2;
	}
	public String getT_INTRODUCTION() {
		return T_INTRODUCTION;
	}
	public void setT_INTRODUCTION(String t_INTRODUCTION) {
		T_INTRODUCTION = t_INTRODUCTION;
	}
	public String getAPPROVAL() {
		return APPROVAL;
	}
	public void setAPPROVAL(String aPPROVAL) {
		APPROVAL = aPPROVAL;
	}
	public int getT_CODE() {
		return T_CODE;
	}
	public void setT_CODE(int t_CODE) {
		T_CODE = t_CODE;
	}
	public String getC_CODE() {
		return C_CODE;
	}
	public void setC_CODE(String c_CODE) {
		C_CODE = c_CODE;
	}
	public String getC_NAME() {
		return C_NAME;
	}
	public void setC_NAME(String c_NAME) {
		C_NAME = c_NAME;
	}
	@Override
	public String toString() {
		return "AdminTrainer [M_CODE=" + M_CODE + ", M_ID=" + M_ID + ", M_NAME=" + M_NAME + ", M_ADDRESS_2="
				+ M_ADDRESS_2 + ", M_PHONE_2=" + M_PHONE_2 + ", T_INTRODUCTION=" + T_INTRODUCTION + ", APPROVAL="
				+ APPROVAL + ", T_CODE=" + T_CODE + ", C_CODE=" + C_CODE + ", C_NAME=" + C_NAME + "]";
	}
	
	
}