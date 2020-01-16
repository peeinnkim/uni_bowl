package com.peeinn.domain;

import java.util.Date;

public class PayVO {
	private int pyNo; // 결제고유번호
	private int pyPrice; // 금액
	private String pyType; // 카드종류
	private String pyNum; // 카드번호
	private String pyValidMonth; // 유효번호 -월
	private String pyValidYear; // 유효번호 -년
	private Date pyDate; // 결제날짜
	private Date pycDate; // 취소날짜
	private int pyState; // 결제상태 (0:결제완료 / 1: 취소)

	private int pyRsvNo; // 예약번호
	private int pyMemNo; // 회원번호

	public int getPyNo() {
		return pyNo;
	}

	public int getPyPrice() {
		return pyPrice;
	}

	public void setPyPrice(int pyPrice) {
		this.pyPrice = pyPrice;
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

	public Date getPycDate() {
		return pycDate;
	}

	public void setPycDate(Date pycDate) {
		this.pycDate = pycDate;
	}

	public int getPyState() {
		return pyState;
	}

	public void setPyState(int pyState) {
		this.pyState = pyState;
	}

	public int getPyRsvNo() {
		return pyRsvNo;
	}

	public void setPyRsvNo(int pyRsvNo) {
		this.pyRsvNo = pyRsvNo;
	}

	public int getPyMemNo() {
		return pyMemNo;
	}

	public void setPyMemNo(int pyMemNo) {
		this.pyMemNo = pyMemNo;
	}

	@Override
	public String toString() {
		return "PayVO [pyNo=" + pyNo + ", pyPrice=" + pyPrice + ", pyType=" + pyType + ", pyNum=" + pyNum
				+ ", pyValidMonth=" + pyValidMonth + ", pyValidYear=" + pyValidYear + ", pyDate=" + pyDate
				+ ", pycDate=" + pycDate + ", pyState=" + pyState + ", pyRsvNo=" + pyRsvNo + ", pyMemNo=" + pyMemNo
				+ "]";
	}

}// PayVO
