package com.peeinn.domain;

public class SeatVO {
	private int stNo;
	private String stNm;
	private String stDnm;
	private int stThNo;
	private int stSgNo;

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

	public String getStDnm() {
		return stDnm;
	}

	public void setStDnm(String stDnm) {
		this.stDnm = stDnm;
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

	@Override
	public String toString() {
		return "SeatVO [stNo=" + stNo + ", stNm=" + stNm + ", stDnm=" + stDnm + ", stThNo=" + stThNo + ", stSgNo="
				+ stSgNo + "]";
	}

}// SeatVO
