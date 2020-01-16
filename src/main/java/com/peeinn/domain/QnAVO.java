package com.peeinn.domain;

import java.text.ParseException;
import java.util.Date;
import java.util.List;

import com.peeinn.util.MyUtils;

public class QnAVO {
	private int qnaNo; // 문의번호
	private String qnaTitle; // 문의제목
	private int qnaWriter; // 글쓴사람번호
	private String qnaContent; // 글쓴 내용
	private int qnaCategory; // 문의분류 (1: 예약문의 / 2: 시설문의 / 3: 기타문의 / 4: 제안하기)
	private Date qnaRegDate; // 문의등록날짜
	private Date qnaModDate; // 문의수정날짜
	private int qnaViewCnt; // 조회수

	private String qnaWriterId; // 글쓴사람 아이디

	private List<QnAAttachVO> files; // 첨부파일 모음

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

	public int getQnaWriter() {
		return qnaWriter;
	}

	public void setQnaWriter(int qnaWriter) {
		this.qnaWriter = qnaWriter;
	}

	public String getQnaContent() {
		return qnaContent;
	}

	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}

	public int getQnaCategory() {
		return qnaCategory;
	}

	public void setQnaCategory(int qnaCategory) {
		this.qnaCategory = qnaCategory;
	}

	public Date getQnaRegDate() {
		return qnaRegDate;
	}

	public void setQnaRegDate(Date qnaRegDate) {
		this.qnaRegDate = qnaRegDate;
	}

	public void setQnaRegDate(String qnaRegDate) throws ParseException {
		this.qnaRegDate = MyUtils.parseStringToDate(qnaRegDate);
	}

	public Date getQnaModDate() {
		return qnaModDate;
	}

	public void setQnaModDate(Date qnaModDate) {
		this.qnaModDate = qnaModDate;
	}

	public void setQnaModDate(String qnaModDate) throws ParseException {
		this.qnaModDate = MyUtils.parseStringToDate(qnaModDate);
	}

	public int getQnaViewCnt() {
		return qnaViewCnt;
	}

	public void setQnaViewCnt(int qnaViewCnt) {
		this.qnaViewCnt = qnaViewCnt;
	}

	public String getQnaWriterId() {
		return qnaWriterId;
	}

	public void setQnaWriterId(String qnaWriterId) {
		this.qnaWriterId = qnaWriterId;
	}

	public List<QnAAttachVO> getFiles() {
		return files;
	}

	public void setFiles(List<QnAAttachVO> files) {
		this.files = files;
	}

	@Override
	public String toString() {
		return "QnAVO [qnaNo=" + qnaNo + ", qnaTitle=" + qnaTitle + ", qnaWriter=" + qnaWriter + ", qnaContent="
				+ qnaContent + ", qnaCategory=" + qnaCategory + ", qnaRegDate=" + qnaRegDate + ", qnaModDate="
				+ qnaModDate + ", qnaViewCnt=" + qnaViewCnt + ", qnaWriterId=" + qnaWriterId + ", files=" + files + "]";
	}

}// QnAVO
