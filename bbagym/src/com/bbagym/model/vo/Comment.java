package com.bbagym.model.vo;

import java.util.Date;
import java.util.List;

public class Comment {
	
	private int commentCode;
	private int commentLevel;
	private String mName;
	private String mId;
	private String pName;
	private int month;
	private int mCode;
	private int cCode;
	private int tCode;
	private int pCode;
	private int commentRef;
	private String commentContent;
	private Date commentDate;
	private int orderCode;
	private int orderScore;
	private char status;
	
	public Comment() {
		// TODO Auto-generated constructor stub
	}

	Comment(int commentCode, int commentLevel, String mName, String mId, String pName, int month, int mCode, int cCode,
			int tCode, int pCode, int commentRef, String commentContent, Date commentDate, int orderCode,
			int orderScore, char status) {
		super();
		this.commentCode = commentCode;
		this.commentLevel = commentLevel;
		this.mName = mName;
		this.mId = mId;
		this.pName = pName;
		this.month = month;
		this.mCode = mCode;
		this.cCode = cCode;
		this.tCode = tCode;
		this.pCode = pCode;
		this.commentRef = commentRef;
		this.commentContent = commentContent;
		this.commentDate = commentDate;
		this.orderCode = orderCode;
		this.orderScore = orderScore;
		this.status = status;
	}

	public int getCommentCode() {
		return commentCode;
	}

	public void setCommentCode(int commentCode) {
		this.commentCode = commentCode;
	}

	public int getCommentLevel() {
		return commentLevel;
	}

	public void setCommentLevel(int commentLevel) {
		this.commentLevel = commentLevel;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public int getMonth() {
		return month;
	}

	public void setMonth(int month) {
		this.month = month;
	}

	public int getmCode() {
		return mCode;
	}

	public void setmCode(int mCode) {
		this.mCode = mCode;
	}

	public int getcCode() {
		return cCode;
	}

	public void setcCode(int cCode) {
		this.cCode = cCode;
	}

	public int gettCode() {
		return tCode;
	}

	public void settCode(int tCode) {
		this.tCode = tCode;
	}

	public int getpCode() {
		return pCode;
	}

	public void setpCode(int pCode) {
		this.pCode = pCode;
	}

	public int getCommentRef() {
		return commentRef;
	}

	public void setCommentRef(int commentRef) {
		this.commentRef = commentRef;
	}

	public String getCommentContent() {
		return commentContent;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}

	public Date getCommentDate() {
		return commentDate;
	}

	public void setCommentDate(Date commentDate) {
		this.commentDate = commentDate;
	}

	public int getOrderCode() {
		return orderCode;
	}

	public void setOrderCode(int orderCode) {
		this.orderCode = orderCode;
	}

	public int getOrderScore() {
		return orderScore;
	}

	public void setOrderScore(int orderScore) {
		this.orderScore = orderScore;
	}

	public char getStatus() {
		return status;
	}

	public void setStatus(char status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Comment [commentCode=" + commentCode + ", commentLevel=" + commentLevel + ", mName=" + mName + ", mId="
				+ mId + ", pName=" + pName + ", month=" + month + ", mCode=" + mCode + ", cCode=" + cCode + ", tCode="
				+ tCode + ", pCode=" + pCode + ", commentRef=" + commentRef + ", commentContent=" + commentContent
				+ ", commentDate=" + commentDate + ", orderCode=" + orderCode + ", orderScore=" + orderScore
				+ ", status=" + status + "]";
	}

}
