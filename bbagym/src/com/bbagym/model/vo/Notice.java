package com.bbagym.model.vo;

import java.util.Date;

public class Notice {
	
	//공지게시판 코드
	private int nCode;
	//공지게시판 제목
	private String title;
	//공지게시판 내용
	private String nContent;
	//공지게시판 작성일
	private Date nDate;
	//공지게시판 원본파일
	private String oriFileName;
	//공지게시판 리네임파일
	private String newFileName;
	//공지게시판 조회수
	private int readCount;
	//공지게시판_멤버코드
	private int mCode;
	//공지게시판 상태
	private char nStatus;
	
	private String mId;
	
	public Notice() {
		super();
	}

	public Notice(int nCode, String title, String nContent, Date nDate, String oriFileName, String newFileName,
			int readCount, int mCode, char nStatus) {
		super();
		this.nCode = nCode;
		this.title = title;
		this.nContent = nContent;
		this.nDate = nDate;
		this.oriFileName = oriFileName;
		this.newFileName = newFileName;
		this.readCount = readCount;
		this.mCode = mCode;
		this.nStatus = nStatus;
	}

	public Notice(int nCode, String title, String nContent, Date nDate, String oriFileName, String newFileName,
			int readCount, int mCode, char nStatus, String mId) {
		super();
		this.nCode = nCode;
		this.title = title;
		this.nContent = nContent;
		this.nDate = nDate;
		this.oriFileName = oriFileName;
		this.newFileName = newFileName;
		this.readCount = readCount;
		this.mCode = mCode;
		this.nStatus = nStatus;
		this.mId = mId;
	}

	public int getnCode() {
		return nCode;
	}

	public void setnCode(int nCode) {
		this.nCode = nCode;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getnContent() {
		return nContent;
	}

	public void setnContent(String nContent) {
		this.nContent = nContent;
	}

	public Date getnDate() {
		return nDate;
	}

	public void setnDate(Date nDate) {
		this.nDate = nDate;
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

	public char getnStatus() {
		return nStatus;
	}

	public void setnStatus(char nStatus) {
		this.nStatus = nStatus;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	@Override
	public String toString() {
		return "Notice [nCode=" + nCode + ", title=" + title + ", nContent=" + nContent + ", nDate=" + nDate
				+ ", oriFileName=" + oriFileName + ", newFileName=" + newFileName + ", readCount=" + readCount
				+ ", mCode=" + mCode + ", nStatus=" + nStatus + ", mId=" + mId + "]";
	}

	
	
	
	
	
	
	
}
