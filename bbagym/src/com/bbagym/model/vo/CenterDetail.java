package com.bbagym.model.vo;

import java.util.List;

public class CenterDetail {
	
	private String centerMainImg;
	private String centerName;
	private double centerScore;
	private String centerAddr;
	private String centerPhone;
	private boolean jjim;
	private boolean buy;
	private int buyCount;
	private List<BuyInfo> buyInfo;
	private List<CenterPrograms> centerPrograms;
	private List<String> centerFacilityNames;
	private List<CommentScore> commentScore;
	private String centerIntro;  //db에서는 c_text임
	private String centerOpenHours;
	private String centerHolidays;
	private String centerSchedule;
	private List<String> centerImgs;
	private String sns_homepage;
	private String sns_instagram;
	private String sns_blog;
	private String sns_etc;
	
	private String addrX;
	private String addrY;
	
	
	
	public CenterDetail() {
		// TODO Auto-generated constructor stub
	}

	CenterDetail(String centerMainImg, String centerName, double centerScore, String centerAddr, String centerPhone,
			boolean jjim, boolean buy, int buyCount, List<BuyInfo> buyInfo, List<CenterPrograms> centerPrograms,
			List<String> centerFacilityNames, List<CommentScore> commentScore, String centerIntro,
			String centerOpenHours, String centerHolidays, String centerSchedule, List<String> centerImgs,
			String sns_homepage, String sns_instagram, String sns_blog, String sns_etc) {
		super();
		this.centerMainImg = centerMainImg;
		this.centerName = centerName;
		this.centerScore = centerScore;
		this.centerAddr = centerAddr;
		this.centerPhone = centerPhone;
		this.jjim = jjim;
		this.buy = buy;
		this.buyCount = buyCount;
		this.buyInfo = buyInfo;
		this.centerPrograms = centerPrograms;
		this.centerFacilityNames = centerFacilityNames;
		this.commentScore = commentScore;
		this.centerIntro = centerIntro;
		this.centerOpenHours = centerOpenHours;
		this.centerHolidays = centerHolidays;
		this.centerSchedule = centerSchedule;
		this.centerImgs = centerImgs;
		this.sns_homepage = sns_homepage;
		this.sns_instagram = sns_instagram;
		this.sns_blog = sns_blog;
		this.sns_etc = sns_etc;
	}

	public String getCenterMainImg() {
		return centerMainImg;
	}

	public void setCenterMainImg(String centerMainImg) {
		this.centerMainImg = centerMainImg;
	}

	public String getCenterName() {
		return centerName;
	}

	public void setCenterName(String centerName) {
		this.centerName = centerName;
	}

	public double getCenterScore() {
		return centerScore;
	}

	public void setCenterScore(double centerScore) {
		this.centerScore = centerScore;
	}

	public String getCenterAddr() {
		return centerAddr;
	}

	public void setCenterAddr(String centerAddr) {
		this.centerAddr = centerAddr;
	}

	public String getCenterPhone() {
		return centerPhone;
	}

	public void setCenterPhone(String centerPhone) {
		this.centerPhone = centerPhone;
	}

	public boolean isJjim() {
		return jjim;
	}

	public void setJjim(boolean jjim) {
		this.jjim = jjim;
	}

	public boolean isBuy() {
		return buy;
	}

	public void setBuy(boolean buy) {
		this.buy = buy;
	}

	public int getBuyCount() {
		return buyCount;
	}

	public void setBuyCount(int buyCount) {
		this.buyCount = buyCount;
	}

	public List<BuyInfo> getBuyInfo() {
		return buyInfo;
	}

	public void setBuyInfo(List<BuyInfo> buyInfo) {
		this.buyInfo = buyInfo;
	}

	public List<CenterPrograms> getCenterPrograms() {
		return centerPrograms;
	}

	public void setCenterPrograms(List<CenterPrograms> centerPrograms) {
		this.centerPrograms = centerPrograms;
	}

	public List<String> getCenterFacilityNames() {
		return centerFacilityNames;
	}

	public void setCenterFacilityNames(List<String> centerFacilityNames) {
		this.centerFacilityNames = centerFacilityNames;
	}

	public List<CommentScore> getCommentScore() {
		return commentScore;
	}

	public void setCommentScore(List<CommentScore> commentScore) {
		this.commentScore = commentScore;
	}

	public String getCenterIntro() {
		return centerIntro;
	}

	public void setCenterIntro(String centerIntro) {
		this.centerIntro = centerIntro;
	}

	public String getCenterOpenHours() {
		return centerOpenHours;
	}

	public void setCenterOpenHours(String centerOpenHours) {
		this.centerOpenHours = centerOpenHours;
	}

	public String getCenterHolidays() {
		return centerHolidays;
	}

	public void setCenterHolidays(String centerHolidays) {
		this.centerHolidays = centerHolidays;
	}

	public String getCenterSchedule() {
		return centerSchedule;
	}

	public void setCenterSchedule(String centerSchedule) {
		this.centerSchedule = centerSchedule;
	}

	public List<String> getCenterImgs() {
		return centerImgs;
	}

	public void setCenterImgs(List<String> centerImgs) {
		this.centerImgs = centerImgs;
	}

	public String getSns_homepage() {
		return sns_homepage;
	}

	public void setSns_homepage(String sns_homepage) {
		this.sns_homepage = sns_homepage;
	}

	public String getSns_instagram() {
		return sns_instagram;
	}

	public void setSns_instagram(String sns_instagram) {
		this.sns_instagram = sns_instagram;
	}

	public String getSns_blog() {
		return sns_blog;
	}

	public void setSns_blog(String sns_blog) {
		this.sns_blog = sns_blog;
	}

	public String getSns_etc() {
		return sns_etc;
	}

	public void setSns_etc(String sns_etc) {
		this.sns_etc = sns_etc;
	}
	
	public String getAddrX() {
		return addrX;
	}

	public void setAddrX(String addrX) {
		this.addrX = addrX;
	}

	public String getAddrY() {
		return addrY;
	}

	public void setAddrY(String addrY) {
		this.addrY = addrY;
	}

	@Override
	public String toString() {
		return "CenterDetail [centerMainImg=" + centerMainImg + ", centerName=" + centerName + ", centerScore="
				+ centerScore + ", centerAddr=" + centerAddr + ", centerPhone=" + centerPhone + ", jjim=" + jjim
				+ ", buy=" + buy + ", buyCount=" + buyCount + ", buyInfo=" + buyInfo + ", centerPrograms="
				+ centerPrograms + ", centerFacilityNames=" + centerFacilityNames + ", commentScore=" + commentScore
				+ ", centerIntro=" + centerIntro + ", centerOpenHours=" + centerOpenHours + ", centerHolidays="
				+ centerHolidays + ", centerSchedule=" + centerSchedule + ", centerImgs=" + centerImgs
				+ ", sns_homepage=" + sns_homepage + ", sns_instagram=" + sns_instagram + ", sns_blog=" + sns_blog
				+ ", sns_etc=" + sns_etc + "]";
	}
	
	
	
	
}
