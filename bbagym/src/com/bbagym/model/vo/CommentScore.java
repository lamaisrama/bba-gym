package com.bbagym.model.vo;

public class CommentScore {
	
	private int commentScore;
	
	public CommentScore() {
		// TODO Auto-generated constructor stub
	}

	CommentScore(int commentScore) {
		super();
		this.commentScore = commentScore;
	}

	public int getCommentScore() {
		return commentScore;
	}

	public void setCommentScore(int commentScore) {
		this.commentScore = commentScore;
	}

	@Override
	public String toString() {
		return "CommentScore [commentScore=" + commentScore + "]";
	}
	
	

}
