package com.bbagym.model.vo;

import java.util.List;

public class TrainerEnroll {
	private int code;
	private String counselHr;
	private String introduction;
	private String career;
	private String text;
	private String mainImage;
	private String approval;
	private int centerCode;
	private int memberCode;
	private String snsHome;
	private String snsInsta;
	private String snsBlog;
	private String snsEtc;
	private List<String> photos;
	private List<String> categories;
	private List<Program> program;
	private boolean prefer;
	private double score;
	
	public TrainerEnroll() {
		// TODO Auto-generated constructor stub
	}

	public TrainerEnroll(int code, String counselHr, String introduction, String career, String text, String mainImage,
			String approval, int centerCode, int memberCode, String snsHome, String snsInsta, String snsBlog,
			String snsEtc, List<String> photos, List<String> categories, List<Program> program, boolean prefer,
			double score) {
		super();
		this.code = code;
		this.counselHr = counselHr;
		this.introduction = introduction;
		this.career = career;
		this.text = text;
		this.mainImage = mainImage;
		this.approval = approval;
		this.centerCode = centerCode;
		this.memberCode = memberCode;
		this.snsHome = snsHome;
		this.snsInsta = snsInsta;
		this.snsBlog = snsBlog;
		this.snsEtc = snsEtc;
		this.photos = photos;
		this.categories = categories;
		this.program = program;
		this.prefer = prefer;
		this.score = score;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getCounselHr() {
		return counselHr;
	}

	public void setCounselHr(String counselHr) {
		this.counselHr = counselHr;
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public String getCareer() {
		return career;
	}

	public void setCareer(String career) {
		this.career = career;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getMainImage() {
		return mainImage;
	}

	public void setMainImage(String mainImage) {
		this.mainImage = mainImage;
	}

	public String getApproval() {
		return approval;
	}

	public void setApproval(String approval) {
		this.approval = approval;
	}

	public int getCenterCode() {
		return centerCode;
	}

	public void setCenterCode(int centerCode) {
		this.centerCode = centerCode;
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

	public List<String> getPhotos() {
		return photos;
	}

	public void setPhotos(List<String> photos) {
		this.photos = photos;
	}

	public List<String> getCategories() {
		return categories;
	}

	public void setCategories(List<String> categories) {
		this.categories = categories;
	}

	public List<Program> getProgram() {
		return program;
	}

	public void setProgram(List<Program> program) {
		this.program = program;
	}

	public boolean isPrefer() {
		return prefer;
	}

	public void setPrefer(boolean prefer) {
		this.prefer = prefer;
	}

	public double getScore() {
		return score;
	}

	public void setScore(double score) {
		this.score = score;
	}

	@Override
	public String toString() {
		return "TrainerEnroll [code=" + code + ", counselHr=" + counselHr + ", introduction=" + introduction
				+ ", career=" + career + ", text=" + text + ", mainImage=" + mainImage + ", approval=" + approval
				+ ", centerCode=" + centerCode + ", memberCode=" + memberCode + ", snsHome=" + snsHome + ", snsInsta="
				+ snsInsta + ", snsBlog=" + snsBlog + ", snsEtc=" + snsEtc + ", photos=" + photos + ", categories="
				+ categories + ", program=" + program + ", prefer=" + prefer + ", score=" + score + "]";
	}
	
	
}

