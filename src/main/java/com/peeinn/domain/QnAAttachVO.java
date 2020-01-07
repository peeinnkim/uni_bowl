package com.peeinn.domain;

public class QnAAttachVO {
	private int qaNo; // qna 첨부파일 고유번호
	private String qaThumb; // 썸네일명
	private String qaOrigin; // 원본명
	private int qnaNo; // 글 번호

	public QnAAttachVO() {
		// TODO Auto-generated constructor stub
	}

	public QnAAttachVO(int qaNo, String qaThumb, String qaOrigin, int qnaNo) {
		this.qaNo = qaNo;
		this.qaThumb = qaThumb;
		this.qaOrigin = qaOrigin;
		this.qnaNo = qnaNo;
	}

	public int getQaNo() {
		return qaNo;
	}

	public void setQaNo(int qaNo) {
		this.qaNo = qaNo;
	}

	public String getQaThumb() {
		return qaThumb;
	}

	public void setQaThumb(String qaThumb) {
		this.qaThumb = qaThumb;
	}

	public String getQaOrigin() {
		return qaOrigin;
	}

	public void setQaOrigin(String qaOrigin) {
		this.qaOrigin = qaOrigin;
	}

	public int getQnaNo() {
		return qnaNo;
	}

	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}

	@Override
	public String toString() {
		return "QnAAttachVO [qaNo=" + qaNo + ", qaThumb=" + qaThumb + ", qaOrigin=" + qaOrigin + ", qnaNo=" + qnaNo
				+ "]";
	}

}// QnAAttachVO
