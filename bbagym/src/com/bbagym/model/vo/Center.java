package com.bbagym.model.vo;

public class Center {
	private int cCode;
	private String cName;
	private String cAddress;
	private String cPhone;
	private String cOperatingtime;
	private String cHoliday;
	private String cText;
	private String cMainImage;
	private String cBusinessCode;
	private String cApproval;
	private int memberCode;
	private String snsHome;
	private String snsInsta;
	private String snsBlog;
	private String snsEtc;
	
	public Center() {
		// TODO Auto-generated constructor stub
	}

	public Center(int cCode, String cName, String cAddress, String cPhone, String cOperatingtime, String cHoliday,
			String cText, String cMainImage, String cBusinessCode, String cApproval, int memberCode, String snsHome,
			String snsInsta, String snsBlog, String snsEtc) {
		super();
		this.cCode = cCode;
		this.cName = cName;
		this.cAddress = cAddress;
		this.cPhone = cPhone;
		this.cOperatingtime = cOperatingtime;
		this.cHoliday = cHoliday;
		this.cText = cText;
		this.cMainImage = cMainImage;
		this.cBusinessCode = cBusinessCode;
		this.cApproval = cApproval;
		this.memberCode = memberCode;
		this.snsHome = snsHome;
		this.snsInsta = snsInsta;
		this.snsBlog = snsBlog;
		this.snsEtc = snsEtc;
	}

	public int getcCode() {
		return cCode;
	}

	public void setcCode(int cCode) {
		this.cCode = cCode;
	}

	public String getcName() {
		return cName;
	}

	public void setcName(String cName) {
		this.cName = cName;
	}

	public String getcAddress() {
		return cAddress;
	}

	public void setcAddress(String cAddress) {
		this.cAddress = cAddress;
	}

	public String getcPhone() {
		return cPhone;
	}

	public void setcPhone(String cPhone) {
		this.cPhone = cPhone;
	}

	public String getcOperatingtime() {
		return cOperatingtime;
	}

	public void setcOperatingtime(String cOperatingtime) {
		this.cOperatingtime = cOperatingtime;
	}

	public String getcHoliday() {
		return cHoliday;
	}

	public void setcHoliday(String cHoliday) {
		this.cHoliday = cHoliday;
	}

	public String getcText() {
		return cText;
	}

	public void setcText(String cText) {
		this.cText = cText;
	}

	public String getcMainImage() {
		return cMainImage;
	}

	public void setcMainImage(String cMainImage) {
		this.cMainImage = cMainImage;
	}

	public String getcBusinessCode() {
		return cBusinessCode;
	}

	public void setcBusinessCode(String cBusinessCode) {
		this.cBusinessCode = cBusinessCode;
	}

	public String getcApproval() {
		return cApproval;
	}

	public void setcApproval(String cApproval) {
		this.cApproval = cApproval;
	}

	public int getMemberCode() {
		return memberCode;
	}

	public void setMemberCode(int memberCode) {
		this.memberCode = memberCode;
	}

	public String getSnsHome() {
		return snsHome;
	}

	public void setSnsHome(String snsHome) {
		this.snsHome = snsHome;
	}

	public String getSnsInsta() {
		return snsInsta;
	}

	public void setSnsInsta(String snsInsta) {
		this.snsInsta = snsInsta;
	}

	public String getSnsBlog() {
		return snsBlog;
	}

	public void setSnsBlog(String snsBlog) {
		this.snsBlog = snsBlog;
	}

	public String getSnsEtc() {
		return snsEtc;
	}

	public void setSnsEtc(String snsEtc) {
		this.snsEtc = snsEtc;
	}

	@Override
	public String toString() {
		return "Center [cCode=" + cCode + ", cName=" + cName + ", cAddress=" + cAddress + ", cPhone=" + cPhone
				+ ", cOperatingtime=" + cOperatingtime + ", cHoliday=" + cHoliday + ", cText=" + cText + ", cMainImage="
				+ cMainImage + ", cBusinessCode=" + cBusinessCode + ", cApproval=" + cApproval + ", memberCode="
				+ memberCode + ", snsHome=" + snsHome + ", snsInsta=" + snsInsta + ", snsBlog=" + snsBlog + ", snsEtc="
				+ snsEtc + "]";
	}
	
}
