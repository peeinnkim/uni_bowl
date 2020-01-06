package com.peeinn.domain;

import java.util.Date;

public class PayVO {
	private int pyNo; // 결제고유번호
	private String pyType; // 카드종류
	private String pyNum; // 카드번호
	private String pyValidMonth; // 유효번호 -월
	private String pyValidYear; // 유효번호 -년
	private Date pyDate; // 결제날짜
	private int pyMemCode; // 결제한 사람 회원여부 (0:회원 / 1:비회원)
	private int pyMem; // 결제한사람

	public PayVO() {
		// TODO Auto-generated constructor stub
	}

	public int getPyNo() {
		return pyNo;
	}

	public void setPyNo(int pyNo) {
		this.pyNo = pyNo;
	}

	public String getPyType() {
		return pyType;
	}

	public void setPyType(String pyType) {
		this.pyType = pyType;
	}

	public String getPyNum() {
		return pyNum;
	}

	public void setPyNum(String pyNum) {
		this.pyNum = pyNum;
	}

	public String getPyValidMonth() {
		return pyValidMonth;
	}

	public void setPyValidMonth(String pyValidMonth) {
		this.pyValidMonth = pyValidMonth;
	}

	public String getPyValidYear() {
		return pyValidYear;
	}

	public void setPyValidYear(String pyValidYear) {
		this.pyValidYear = pyValidYear;
	}

	public Date getPyDate() {
		return pyDate;
	}

	public void setPyDate(Date pyDate) {
		this.pyDate = pyDate;
	}

	public int getPyMemCode() {
		return pyMemCode;
	}

	public void setPyMemCode(int pyMemCode) {
		this.pyMemCode = pyMemCode;
	}

	public int getPyMem() {
		return pyMem;
	}

	public void setPyMem(int pyMem) {
		this.pyMem = pyMem;
	}

	@Override
	public String toString() {
		return "PayVO [pyNo=" + pyNo + ", pyType=" + pyType + ", pyNum=" + pyNum + ", pyValidMonth=" + pyValidMonth
				+ ", pyValidYear=" + pyValidYear + ", pyDate=" + pyDate + ", pyMemCode=" + pyMemCode + ", pyMem="
				+ pyMem + "]";
	}

}// PayVO
