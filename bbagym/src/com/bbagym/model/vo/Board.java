package com.bbagym.model.vo;

import java.util.Date;

public class Board {

	private int qaCode;
	private String tilte;
	private String qaContent;
	private Date qaDate;
	private String oriFileName;
	private String newFileName;
	private int readCount;
	private int mCode;
	
	public Board() {
		super();
	}
	
	public Board(int qaCode, String tilte, String qaContent, Date qaDate, String oriFileName, String newFileName,
			int readCount, int mCode) {
		super();
		this.qaCode = qaCode;
		this.tilte = tilte;
		this.qaContent = qaContent;
		this.qaDate = qaDate;
		this.oriFileName = oriFileName;
		this.newFileName = newFileName;
		this.readCount = readCount;
		this.mCode = mCode;
	}
	
	public int getQaCode() {
		return qaCode;
	}
	public void setQaCode(int qaCode) {
		this.qaCode = qaCode;
	}
	public String getTilte() {
		return tilte;
	}
	public void setTilte(String tilte) {
		this.tilte = tilte;
	}
	public String getQaContent() {
		return qaContent;
	}
	public void setQaContent(String qaContent) {
		this.qaContent = qaContent;
	}
	public Date getQaDate() {
		return qaDate;
	}
	public void setQaDate(Date qaDate) {
		this.qaDate = qaDate;
	}
	public String getOriFileName() {
		return oriFileName;
	}
	public void setOriFileName(String oriFileName) {
		this.oriFileName = oriFileName;
	}
	public String getNewFileName() {
		return newFileName;
	}
	public void setNewFileName(String newFileName) {
		this.newFileName = newFileName;
	}
	public int getReadCount() {
		return readCount;
	}
	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}
	public int getmCode() {
		return mCode;
	}
	public void setmCode(int mCode) {
		this.mCode = mCode;
	}
	
	@Override
	public String toString() {
		return "Board [qaCode=" + qaCode + ", tilte=" + tilte + ", qaContent=" + qaContent + ", qaDate=" + qaDate
				+ ", oriFileName=" + oriFileName + ", newFileName=" + newFileName + ", readCount=" + readCount
				+ ", mCode=" + mCode + "]";
	}
	
	
	
	
	
	
	
	
}
