package com.peeinn.domain;

import java.util.Date;

public class OrgResultVO {
	private int orNo; // 번호 (org_detail)
	private Date orDate; // 상영날짜 (org)
	private int orThNo; // 상영관번호 (org_detail)
	private String orStartTime; // 시작시간 (org_detail)
	private String orEndTime; // 종료시간 (org_detail)
	private int orPgNo; // 프로그램번호 (org)

	private String orThNm; // 상영관이름 (extra)
	private String orPgNm; // 프로그램이름 (extra)

	public int getOrNo() {
		return orNo;
	}

	public void setOrNo(int orNo) {
		this.orNo = orNo;
	}

	public Date getOrDate() {
		return orDate;
	}

	public void setOrDate(Date orDate) {
		this.orDate = orDate;
	}

	public int getOrThNo() {
		return orThNo;
	}

	public void setOrThNo(int orThNo) {
		this.orThNo = orThNo;
	}

	public String getOrStartTime() {
		return orStartTime;
	}

	public void setOrStartTime(String orStartTime) {
		this.orStartTime = orStartTime;
	}

	public String getOrEndTime() {
		return orEndTime;
	}

	public void setOrEndTime(String orEndTime) {
		this.orEndTime = orEndTime;
	}

	public int getOrPgNo() {
		return orPgNo;
	}

	public void setOrPgNo(int orPgNo) {
		this.orPgNo = orPgNo;
	}

	public String getOrThNm() {
		return orThNm;
	}

	public void setOrThNm(String orThNm) {
		this.orThNm = orThNm;
	}

	public String getOrPgNm() {
		return orPgNm;
	}

	public void setOrPgNm(String orPgNm) {
		this.orPgNm = orPgNm;
	}

	@Override
	public String toString() {
		return "OrgResultVO [orNo=" + orNo + ", orDate=" + orDate + ", orThNo=" + orThNo + ", orStartTime="
				+ orStartTime + ", orEndTime=" + orEndTime + ", orPgNo=" + orPgNo + ", orThNm=" + orThNm + ", orPgNm="
				+ orPgNm + "]";
	}

}// OrgResultVO
