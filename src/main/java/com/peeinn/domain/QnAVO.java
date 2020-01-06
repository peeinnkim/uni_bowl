package com.peeinn.domain;

import java.util.Date;
import java.util.List;

public class QnAVO {
	private int qnaNo; // 문의번호
	private String qnaTitle; // 문의제목
	private String qnaCategory; // 문의분류
	private Date qnaRegDate; // 문의등록날짜
	private Date qnaModDate; // 문의수정날짜
	private String qnaContent; // 글쓴 내용
	private String qnaPath; // 문의첨부파일
	private int qnaViewCnt; // 조회수
	private int qnaWriterCode; // 글쓴사람 분류(0: 회원 / 1: 비회원)
	private int qnaWriter; // 글쓴사람번호

	private List<QnAAttachVO> files; // 첨부파일 모음

	public QnAVO() {
		// TODO Auto-generated constructor stub
	}

	public int getQnaNo() {
		return qnaNo;
	}

	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}

	public String getQnaTitle() {
		return qnaTitle;
	}

	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}

	public String getQnaCategory() {
		return qnaCategory;
	}

	public void setQnaCategory(String qnaCategory) {
		this.qnaCategory = qnaCategory;
	}

	public Date getQnaRegDate() {
		return qnaRegDate;
	}

	public void setQnaRegDate(Date qnaRegDate) {
		this.qnaRegDate = qnaRegDate;
	}

	public Date getQnaModDate() {
		return qnaModDate;
	}

	public void setQnaModDate(Date qnaModDate) {
		this.qnaModDate = qnaModDate;
	}

	public String getQnaContent() {
		return qnaContent;
	}

	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}

	public String getQnaPath() {
		return qnaPath;
	}

	public void setQnaPath(String qnaPath) {
		this.qnaPath = qnaPath;
	}

	public int getQnaViewCnt() {
		return qnaViewCnt;
	}

	public void setQnaViewCnt(int qnaViewCnt) {
		this.qnaViewCnt = qnaViewCnt;
	}

	public int getQnaWriterCode() {
		return qnaWriterCode;
	}

	public void setQnaWriterCode(int qnaWriterCode) {
		this.qnaWriterCode = qnaWriterCode;
	}

	public int getQnaWriter() {
		return qnaWriter;
	}

	public void setQnaWriter(int qnaWriter) {
		this.qnaWriter = qnaWriter;
	}

	public List<QnAAttachVO> getFiles() {
		return files;
	}

	public void setFiles(List<QnAAttachVO> files) {
		this.files = files;
	}

	@Override
	public String toString() {
		return "QnAVO [qnaNo=" + qnaNo + ", qnaTitle=" + qnaTitle + ", qnaCategory=" + qnaCategory + ", qnaRegDate="
				+ qnaRegDate + ", qnaModDate=" + qnaModDate + ", qnaContent=" + qnaContent + ", qnaPath=" + qnaPath
				+ ", qnaViewCnt=" + qnaViewCnt + ", qnaWriterCode=" + qnaWriterCode + ", qnaWriter=" + qnaWriter
				+ ", files=" + files + "]";
	}

}// QnAVO
