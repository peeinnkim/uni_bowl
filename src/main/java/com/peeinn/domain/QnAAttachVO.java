package com.peeinn.domain;

public class QnAAttachVO {
	private int atNo; // qna 첨부파일 고유번호
	private String atThumb; // 썸네일명
	private String atOrigin; // 원본명
	private int qnaNo; // 글 번호

	public QnAAttachVO() {
		// TODO Auto-generated constructor stub
	}

	public QnAAttachVO(int atNo, String atThumb, String atOrigin, int qnaNo) {
		this.atNo = atNo;
		this.atThumb = atThumb;
		this.atOrigin = atOrigin;
		this.qnaNo = qnaNo;
	}

	public int getAtNo() {
		return atNo;
	}

	public void setAtNo(int atNo) {
		this.atNo = atNo;
	}

	public String getAtThumb() {
		return atThumb;
	}

	public void setAtThumb(String atThumb) {
		this.atThumb = atThumb;
	}

	public String getAtOrigin() {
		return atOrigin;
	}

	public void setAtOrigin(String atOrigin) {
		this.atOrigin = atOrigin;
	}

	public int getQnaNo() {
		return qnaNo;
	}

	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}

	@Override
	public String toString() {
		return "QnAAttachVO [atNo=" + atNo + ", atThumb=" + atThumb + ", atOrigin=" + atOrigin + ", qnaNo=" + qnaNo
				+ "]";
	}

}// QnAAttachVO
