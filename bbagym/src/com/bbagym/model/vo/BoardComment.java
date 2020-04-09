package com.bbagym.model.vo;

import java.util.Date;

public class BoardComment {

	//boardCommentNo 
	private int qaCommentCode;
	//boardCommentRef 
	private int qaCommentRef;
	//boardCommentLevel
	private int qaCommentLevel;
	//boardCommentContent
	private String qaCommentContent;
	//boardCommentDate
	private Date qaCommentDate;
	//boardRef
	private int qaCode;
	//boardCommentWriter
	private int mCode;
	private String mId;
	
	public BoardComment() {
		super();
	}

	public BoardComment(int qaCommentCode, int qaCommentRef, int qaCommentLevel, String qaCommentContent,
			Date qaCommentDate, int qaCode, int mCode) {
		super();
		this.qaCommentCode = qaCommentCode;
		this.qaCommentRef = qaCommentRef;
		this.qaCommentLevel = qaCommentLevel;
		this.qaCommentContent = qaCommentContent;
		this.qaCommentDate = qaCommentDate;
		this.qaCode = qaCode;
		this.mCode = mCode;
	}

	public BoardComment(int qaCommentCode, int qaCommentRef, int qaCommentLevel, String qaCommentContent,
			Date qaCommentDate, int qaCode, int mCode, String mId) {
		super();
		this.qaCommentCode = qaCommentCode;
		this.qaCommentRef = qaCommentRef;
		this.qaCommentLevel = qaCommentLevel;
		this.qaCommentContent = qaCommentContent;
		this.qaCommentDate = qaCommentDate;
		this.qaCode = qaCode;
		this.mCode = mCode;
		this.mId = mId;
	}

	public int getQaCommentCode() {
		return qaCommentCode;
	}

	public void setQaCommentCode(int qaCommentCode) {
		this.qaCommentCode = qaCommentCode;
	}

	public int getQaCommentRef() {
		return qaCommentRef;
	}

	public void setQaCommentRef(int qaCommentRef) {
		this.qaCommentRef = qaCommentRef;
	}

	public int getQaCommentLevel() {
		return qaCommentLevel;
	}

	public void setQaCommentLevel(int qaCommentLevel) {
		this.qaCommentLevel = qaCommentLevel;
	}

	public String getQaCommentContent() {
		return qaCommentContent;
	}

	public void setQaCommentContent(String qaCommentContent) {
		this.qaCommentContent = qaCommentContent;
	}

	public Date getQaCommentDate() {
		return qaCommentDate;
	}

	public void setQaCommentDate(Date qaCommentDate) {
		this.qaCommentDate = qaCommentDate;
	}

	public int getQaCode() {
		return qaCode;
	}

	public void setQaCode(int qaCode) {
		this.qaCode = qaCode;
	}

	public int getmCode() {
		return mCode;
	}

	public void setmCode(int mCode) {
		this.mCode = mCode;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	@Override
	public String toString() {
		return "BoardComment [qaCommentCode=" + qaCommentCode + ", qaCommentRef=" + qaCommentRef + ", qaCommentLevel="
				+ qaCommentLevel + ", qaCommentContent=" + qaCommentContent + ", qaCommentDate=" + qaCommentDate
				+ ", qaCode=" + qaCode + ", mCode=" + mCode + ", mId=" + mId + "]";
	}

	
	
	
	
	
	
	
	
}
