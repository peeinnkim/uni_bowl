package com.peeinn.domain;

public class TheaterVO {
	private int thNo; // 상영관 번호
	private String thNm; // 상영관 이름
	private int thSeatCnt; // 상영관 좌석수
	private int thFloor; // 상영관 위치(층)
	private int thRow; // 상영관 좌석row
	private int thCol; // 상영관 좌석col
	private String thChart; // 상영관 좌석표

	public int getThNo() {
		return thNo;
	}

	public void setThNo(int thNo) {
		this.thNo = thNo;
	}

	public String getThNm() {
		return thNm;
	}

	public void setThNm(String thNm) {
		this.thNm = thNm;
	}

	public int getThSeatCnt() {
		return thSeatCnt;
	}

	public void setThSeatCnt(int thSeatCnt) {
		this.thSeatCnt = thSeatCnt;
	}

	public int getThFloor() {
		return thFloor;
	}

	public void setThFloor(int thFloor) {
		this.thFloor = thFloor;
	}

	public int getThRow() {
		return thRow;
	}

	public void setThRow(int thRow) {
		this.thRow = thRow;
	}

	public int getThCol() {
		return thCol;
	}

	public void setThCol(int thCol) {
		this.thCol = thCol;
	}

	public String getThChart() {
		return thChart;
	}

	public void setThChart(String thChart) {
		this.thChart = thChart;
	}

	@Override
	public String toString() {
		return "TheaterVO [thNo=" + thNo + ", thNm=" + thNm + ", thSeatCnt=" + thSeatCnt + ", thFloor=" + thFloor
				+ ", thRow=" + thRow + ", thCol=" + thCol + ", thChart=" + thChart + "]";
	}

}// TheaterVO
