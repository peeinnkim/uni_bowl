package com.peeinn.domain;

public class SeatVO {
	private int stNo;
	private String stNm;
	private int stThNo;
	private int stSgNo;

	private int stOrgNo;

	public int getStNo() {
		return stNo;
	}

	public void setStNo(int stNo) {
		this.stNo = stNo;
	}

	public String getStNm() {
		return stNm;
	}

	public void setStNm(String stNm) {
		this.stNm = stNm;
	}

	public int getStThNo() {
		return stThNo;
	}

	public void setStThNo(int stThNo) {
		this.stThNo = stThNo;
	}

	public int getStSgNo() {
		return stSgNo;
	}

	public void setStSgNo(int stSgNo) {
		this.stSgNo = stSgNo;
	}

	public int getStOrgNo() {
		return stOrgNo;
	}

	public void setStOrgNo(int stOrgNo) {
		this.stOrgNo = stOrgNo;
	}

	@Override
	public String toString() {
		return "SeatVO [stNo=" + stNo + ", stNm=" + stNm + ", stThNo=" + stThNo + ", stSgNo=" + stSgNo + ", stOrgNo="
				+ stOrgNo + "]";
	}

}// SeatVO
