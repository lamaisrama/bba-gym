package com.bbagym.model.vo;

import java.util.Date;

public class Msg {

	private int msgcode;
	private String name;
	private int reccode;
	private String title;
	private int sendcode;
	private String content;
	private Date date;
	private char readstatus;
	private String email;
	
	public Msg() {
		// TODO Auto-generated constructor stub
	}


	public Msg(int msgcode, String name, int reccode, String title, int sendcode, String content, Date date,
			char readstatus, String email) {
		super();
		this.msgcode = msgcode;
		this.name = name;
		this.reccode = reccode;
		this.title = title;
		this.sendcode = sendcode;
		this.content = content;
		this.date = date;
		this.readstatus = readstatus;
		this.email = email;
	}








	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public int getMsgcode() {
		return msgcode;
	}



	public void setMsgcode(int msgcode) {
		this.msgcode = msgcode;
	}



	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getReccode() {
		return reccode;
	}

	public void setReccode(int reccode) {
		this.reccode = reccode;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getSendcode() {
		return sendcode;
	}

	public void setSendcode(int sendcode) {
		this.sendcode = sendcode;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public char getReadstatus() {
		return readstatus;
	}

	public void setReadstatus(char readstatus) {
		this.readstatus = readstatus;
	}

	@Override
	public String toString() {
		return "Msg [name=" + name + ", reccode=" + reccode + ", title=" + title + ", sendcode=" + sendcode
				+ ", content=" + content + ", date=" + date + ", readstatus=" + readstatus + "]";
	}
	
	
	
	
}
