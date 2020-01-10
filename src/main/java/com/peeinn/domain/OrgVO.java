package com.peeinn.domain;

import java.util.Date;

public class OrgVO {
	private int orgNo; // 상영상세정보 번호
	private Date orgDate; // 상영날짜
	private int orgThNo; // 상영관 번호
	private int orgPgNo; // 프로그램 번호

	public int getOrgNo() {
		return orgNo;
	}

	public void setOrgNo(int orgNo) {
		this.orgNo = orgNo;
	}

	public Date getOrgDate() {
		return orgDate;
	}

	public void setOrgDate(Date orgDate) {
		this.orgDate = orgDate;
	}

	public int getOrgThNo() {
		return orgThNo;
	}

	public void setOrgThNo(int orgThNo) {
		this.orgThNo = orgThNo;
	}

	public int getOrgPgNo() {
		return orgPgNo;
	}

	public void setOrgPgNo(int orgPgNo) {
		this.orgPgNo = orgPgNo;
	}

	@Override
	public String toString() {
		return "OrgVO [orgNo=" + orgNo + ", orgDate=" + orgDate + ", orgThNo=" + orgThNo + ", orgPgNo=" + orgPgNo + "]";
	}

}// OrgVO
