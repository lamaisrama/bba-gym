package com.bbagym.model.vo;

import java.util.ArrayList;
import java.util.List;

public class Program {
	private int pCode;
	private String programName;
	private List<Price> prices = new ArrayList();
	

	public Program() {
		// TODO Auto-generated constructor stub
	}


	public Program(String programName) {
		super();
		this.programName = programName;
	}


	public Program(int pCode, String programName, List<Price> prices) {
		super();
		this.pCode = pCode;
		this.programName = programName;
		this.prices = prices;
	}


	public int getpCode() {
		return pCode;
	}


	public void setpCode(int pCode) {
		this.pCode = pCode;
	}


	public String getProgramName() {
		return programName;
	}


	public void setProgramName(String programName) {
		this.programName = programName;
	}


	public List<Price> getPrices() {
		return prices;
	}


	public void setPrices(List<Price> prices) {
		this.prices = prices;
	}


	@Override
	public String toString() {
		return "Program [pCode=" + pCode + ", programName=" + programName + ", prices=" + prices + "]";
	}


	
}
