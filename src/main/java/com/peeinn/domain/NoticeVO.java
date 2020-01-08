package com.peeinn.domain;

import java.util.Date;
import java.util.List;

public class NoticeVO {
	private int ntNo; // 공지번호
	private String ntTitle; // 공지제목
	private int ntWriter; // 작성자
	private String ntContent; // 공지내용
	private Date ntRegDate; // 등록시간
	private Date ntModDate; // 수정시간
	private int ntViewCnt; // 조회수
	private int ntIsFixed; // 상단고정여부 (0: 일반글 / 1: 상단고정)

	private String ntWriterId;

	private List<NoticeAttachVO> files; // 첨부파일목록

	public NoticeVO() {
		// TODO Auto-generated constructor stub
	}

	public NoticeVO(int ntNo, String ntTitle, int ntWriter, String ntContent, Date ntRegDate, Date ntModDate,
			int ntViewCnt, int ntIsFixed, List<NoticeAttachVO> files) {
		this.ntNo = ntNo;
		this.ntTitle = ntTitle;
		this.ntWriter = ntWriter;
		this.ntContent = ntContent;
		this.ntRegDate = ntRegDate;
		this.ntModDate = ntModDate;
		this.ntViewCnt = ntViewCnt;
		this.ntIsFixed = ntIsFixed;
		this.files = files;
	}

	public int getNtNo() {
		return ntNo;
	}

	public void setNtNo(int ntNo) {
		this.ntNo = ntNo;
	}

	public String getNtTitle() {
		return ntTitle;
	}

	public void setNtTitle(String ntTitle) {
		this.ntTitle = ntTitle;
	}

	public int getNtWriter() {
		return ntWriter;
	}

	public void setNtWriter(int ntWriter) {
		this.ntWriter = ntWriter;
	}

	public String getNtContent() {
		return ntContent;
	}

	public void setNtContent(String ntContent) {
		this.ntContent = ntContent;
	}

	public Date getNtRegDate() {
		return ntRegDate;
	}

	public void setNtRegDate(Date ntRegDate) {
		this.ntRegDate = ntRegDate;
	}

	public Date getNtModDate() {
		return ntModDate;
	}

	public void setNtModDate(Date ntModDate) {
		this.ntModDate = ntModDate;
	}

	public int getNtViewCnt() {
		return ntViewCnt;
	}

	public void setNtViewCnt(int ntViewCnt) {
		this.ntViewCnt = ntViewCnt;
	}

	public int getNtIsFixed() {
		return ntIsFixed;
	}

	public void setNtIsFixed(int ntIsFixed) {
		this.ntIsFixed = ntIsFixed;
	}

	public List<NoticeAttachVO> getFiles() {
		return files;
	}

	public void setFiles(List<NoticeAttachVO> files) {
		this.files = files;
	}

	public String getNtWriterId() {
		return ntWriterId;
	}

	public void setNtWriterId(String ntWriterId) {
		this.ntWriterId = ntWriterId;
	}

	@Override
	public String toString() {
		return "NoticeVO [ntNo=" + ntNo + ", ntTitle=" + ntTitle + ", ntWriter=" + ntWriter + ", ntContent=" + ntContent
				+ ", ntRegDate=" + ntRegDate + ", ntModDate=" + ntModDate + ", ntViewCnt=" + ntViewCnt + ", ntIsFixed="
				+ ntIsFixed + ", ntWriterId=" + ntWriterId + ", files=" + files + "]";
	}

}// NoticeVO
