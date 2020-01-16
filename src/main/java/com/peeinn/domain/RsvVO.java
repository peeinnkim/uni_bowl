package com.peeinn.domain;

import java.text.ParseException;
import java.util.Date;
import java.util.List;

import com.peeinn.util.MyUtils;

public class RsvVO {
	private int rsvNo;
	private Date rsvDate;
	private Date rsvCdate;
	private int rsvOrgNo;
	private int rsvMemNo;

	private List<SeatVO> rsvSeatList;

	public int getRsvNo() {
		return rsvNo;
	}

	public void setRsvNo(int rsvNo) {
		this.rsvNo = rsvNo;
	}

	public Date getRsvDate() {
		return rsvDate;
	}

	public void setRsvDate(Date rsvDate) {
		this.rsvDate = rsvDate;
	}

	public void setRsvDate(String rsvDate) throws ParseException {
		this.rsvDate = MyUtils.parseStringToDate(rsvDate);
	}

	public Date getRsvCdate() {
		return rsvCdate;
	}

	public void setRsvCdate(Date rsvCdate) {
		this.rsvCdate = rsvCdate;
	}

	public void setRsvCdate(String rsvCdate) throws ParseException {
		this.rsvCdate = MyUtils.parseStringToDate(rsvCdate);
	}

	public int getRsvOrgNo() {
		return rsvOrgNo;
	}

	public void setRsvOrgNo(int rsvOrgNo) {
		this.rsvOrgNo = rsvOrgNo;
	}

	public int getRsvMemNo() {
		return rsvMemNo;
	}

	public void setRsvMemNo(int rsvMemNo) {
		this.rsvMemNo = rsvMemNo;
	}

	public List<SeatVO> getRsvSeatList() {
		return rsvSeatList;
	}

	public void setRsvSeatList(List<SeatVO> rsvSeatList) {
		this.rsvSeatList = rsvSeatList;
	}

	@Override
	public String toString() {
		return "RsvVO [rsvNo=" + rsvNo + ", rsvDate=" + rsvDate + ", rsvCdate=" + rsvCdate + ", rsvOrgNo=" + rsvOrgNo
				+ ", rsvMemNo=" + rsvMemNo + ", rsvSeatList=" + rsvSeatList + "]";
	}

}// RsvVO
