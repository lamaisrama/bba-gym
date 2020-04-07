package com.bbagym.model.vo;

public class Program {
	private String programName;
	private int cost1mth;
	private int cost3mth;
	private int cost6mth;
	private int cost12mth;
	

	public Program() {
		// TODO Auto-generated constructor stub
	}


	public Program(String programName, int cost1mth, int cost3mth, int cost6mth, int cost12mth) {
		super();
		this.programName = programName;
		this.cost1mth = cost1mth;
		this.cost3mth = cost3mth;
		this.cost6mth = cost6mth;
		this.cost12mth = cost12mth;
	}


	public String getProgramName() {
		return programName;
	}


	public void setProgramName(String programName) {
		this.programName = programName;
	}


	public int getCost1mth() {
		return cost1mth;
	}


	public void setCost1mth(int cost1mth) {
		this.cost1mth = cost1mth;
	}


	public int getCost3mth() {
		return cost3mth;
	}


	public void setCost3mth(int cost3mth) {
		this.cost3mth = cost3mth;
	}


	public int getCost6mth() {
		return cost6mth;
	}


	public void setCost6mth(int cost6mth) {
		this.cost6mth = cost6mth;
	}


	public int getCost12mth() {
		return cost12mth;
	}


	public void setCost12mth(int cost12mth) {
		this.cost12mth = cost12mth;
	}


	@Override
	public String toString() {
		return "Program [programName=" + programName + ", cost1mth=" + cost1mth + ", cost3mth=" + cost3mth
				+ ", cost6mth=" + cost6mth + ", cost12mth=" + cost12mth + "]";
	}
	
	
}
