package com.peeinn.domain;

import java.util.Date;

public class QnAReplyVO {
	private int rpNo; // 리플고유번호
	private int rpWriter; // 리플작성자
	private String rpContent; // 리플내용
	private Date rpRegDate; // 리플등록날짜
	private Date rpModDate; // 리플수정날짜
	private int qnaNo; // 글 번호

	private String rpWriterId; // 글쓴사람 아이디

	public QnAReplyVO() {
		// TODO Auto-generated constructor stub
	}

	public QnAReplyVO(int rpNo, int rpWriter, String rpContent, Date rpRegDate, Date rpModDate, int qnaNo) {
		this.rpNo = rpNo;
		this.rpWriter = rpWriter;
		this.rpContent = rpContent;
		this.rpRegDate = rpRegDate;
		this.rpModDate = rpModDate;
		this.qnaNo = qnaNo;
	}

	public int getRpNo() {
		return rpNo;
	}

	public void setRpNo(int rpNo) {
		this.rpNo = rpNo;
	}

	public int getRpWriter() {
		return rpWriter;
	}

	public void setRpWriter(int rpWriter) {
		this.rpWriter = rpWriter;
	}

	public String getRpContent() {
		return rpContent;
	}

	public void setRpContent(String rpContent) {
		this.rpContent = rpContent;
	}

	public Date getRpRegDate() {
		return rpRegDate;
	}

	public void setRpRegDate(Date rpRegDate) {
		this.rpRegDate = rpRegDate;
	}

	public Date getRpModDate() {
		return rpModDate;
	}

	public void setRpModDate(Date rpModDate) {
		this.rpModDate = rpModDate;
	}

	public int getQnaNo() {
		return qnaNo;
	}

	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}

	public String getRpWriterId() {
		return rpWriterId;
	}

	public void setRpWriterId(String rpWriterId) {
		this.rpWriterId = rpWriterId;
	}

	@Override
	public String toString() {
		return "QnAReplyVO [rpNo=" + rpNo + ", rpWriter=" + rpWriter + ", rpContent=" + rpContent + ", rpRegDate="
				+ rpRegDate + ", rpModDate=" + rpModDate + ", qnaNo=" + qnaNo + ", rpWriterId=" + rpWriterId + "]";
	}

}// QnAReplyVO
