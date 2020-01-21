package com.peeinn.domain.org;

import java.util.Date;

public class RsvLogsVO {
	private int rlNo;
	private int rlMno;
	private String rlMid;
	private int rlRsvNo;
	private String rlPgTitle;
	private Date rlOrgDate;
	private String rlThNm;
	private int rlRsvPrice;
	private Date rlRsvDate;
	private int rlRsvState;

	public RsvLogsVO() {
		// TODO Auto-generated constructor stub
	}

	public RsvLogsVO(int rlNo, int rlMno, String rlMid, int rlRsvNo, String rlPgTitle, Date rlOrgDate, String rlThNm,
			int rlRsvPrice, Date rlRsvDate, int rlRsvState) {
		this.rlNo = rlNo;
		this.rlMno = rlMno;
		this.rlMid = rlMid;
		this.rlRsvNo = rlRsvNo;
		this.rlPgTitle = rlPgTitle;
		this.rlOrgDate = rlOrgDate;
		this.rlThNm = rlThNm;
		this.rlRsvPrice = rlRsvPrice;
		this.rlRsvDate = rlRsvDate;
		this.rlRsvState = rlRsvState;
	}

	public int getRlNo() {
		return rlNo;
	}

	public void setRlNo(int rlNo) {
		this.rlNo = rlNo;
	}

	public int getRlMno() {
		return rlMno;
	}

	public void setRlMno(int rlMno) {
		this.rlMno = rlMno;
	}

	public String getRlMid() {
		return rlMid;
	}

	public void setRlMid(String rlMid) {
		this.rlMid = rlMid;
	}

	public int getRlRsvNo() {
		return rlRsvNo;
	}

	public void setRlRsvNo(int rlRsvNo) {
		this.rlRsvNo = rlRsvNo;
	}

	public String getRlPgTitle() {
		return rlPgTitle;
	}

	public void setRlPgTitle(String rlPgTitle) {
		this.rlPgTitle = rlPgTitle;
	}

	public Date getRlOrgDate() {
		return rlOrgDate;
	}

	public void setRlOrgDate(Date rlOrgDate) {
		this.rlOrgDate = rlOrgDate;
	}

	public String getRlThNm() {
		return rlThNm;
	}

	public void setRlThNm(String rlThNm) {
		this.rlThNm = rlThNm;
	}

	public int getRlRsvPrice() {
		return rlRsvPrice;
	}

	public void setRlRsvPrice(int rlRsvPrice) {
		this.rlRsvPrice = rlRsvPrice;
	}

	public Date getRlRsvDate() {
		return rlRsvDate;
	}

	public void setRlRsvDate(Date rlRsvDate) {
		this.rlRsvDate = rlRsvDate;
	}

	public int getRlRsvState() {
		return rlRsvState;
	}

	public void setRlRsvState(int rlRsvState) {
		this.rlRsvState = rlRsvState;
	}

	@Override
	public String toString() {
		return "RsvLogsVO [rlNo=" + rlNo + ", rlMno=" + rlMno + ", rlMid=" + rlMid + ", rlRsvNo=" + rlRsvNo
				+ ", rlPgTitle=" + rlPgTitle + ", rlOrgDate=" + rlOrgDate + ", rlThNm=" + rlThNm + ", rlRsvPrice="
				+ rlRsvPrice + ", rlRsvDate=" + rlRsvDate + ", rlRsvState=" + rlRsvState + "]";
	}

}// RsvLogsVO
