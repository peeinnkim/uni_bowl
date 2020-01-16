package com.peeinn.domain;

public class SeatGradeVO {
	private int sgNo;
	private String sgNm;
	private int sgPrice;

	public int getSgNo() {
		return sgNo;
	}

	public void setSgNo(int sgNo) {
		this.sgNo = sgNo;
	}

	public String getSgNm() {
		return sgNm;
	}

	public void setSgNm(String sgNm) {
		this.sgNm = sgNm;
	}

	public int getSgPrice() {
		return sgPrice;
	}

	public void setSgPrice(int sgPrice) {
		this.sgPrice = sgPrice;
	}

	@Override
	public String toString() {
		return "SeatGradeVO [sgNo=" + sgNo + ", sgNm=" + sgNm + ", sgPrice=" + sgPrice + "]";
	}

}// SeatGradeVO
