package com.peeinn.domain;

public class OrgDetailVO {
	private int odNo; // 번호
	private int odOrgNo;
	private int odStartTime; // 시작시간
	private int odEndTime; // 종료시간
	private int odThNo; // 상영관번호

	public int getOdNo() {
		return odNo;
	}

	public void setOdNo(int odNo) {
		this.odNo = odNo;
	}

	public int getOdOrgNo() {
		return odOrgNo;
	}

	public void setOdOrgNo(int odOrgNo) {
		this.odOrgNo = odOrgNo;
	}

	public int getOdStartTime() {
		return odStartTime;
	}

	public void setOdStartTime(int odStartTime) {
		this.odStartTime = odStartTime;
	}

	public int getOdEndTime() {
		return odEndTime;
	}

	public void setOdEndTime(int odEndTime) {
		this.odEndTime = odEndTime;
	}

	public int getOdThNo() {
		return odThNo;
	}

	public void setOdThNo(int odThNo) {
		this.odThNo = odThNo;
	}

	@Override
	public String toString() {
		return "OrgDetailVO [odNo=" + odNo + ", odOrgNo=" + odOrgNo + ", odStartTime=" + odStartTime + ", odEndTime="
				+ odEndTime + ", odThNo=" + odThNo + "]";
	}

}// OrgVO
