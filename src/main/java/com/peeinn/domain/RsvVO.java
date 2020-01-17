package com.peeinn.domain;

import java.text.ParseException;
import java.util.Date;
import java.util.Map;

import com.peeinn.util.MyUtils;

public class RsvVO {
	private int rsvNo;
	private Date rsvDate;
	private Date rsvCdate;
	private int rsvMemNo;

	private PayVO rsvPay;
	private Map<String, Object> rsvInfoMap;

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

	public int getRsvMemNo() {
		return rsvMemNo;
	}

	public void setRsvMemNo(int rsvMemNo) {
		this.rsvMemNo = rsvMemNo;
	}

	public PayVO getRsvPay() {
		return rsvPay;
	}

	public void setRsvPay(PayVO rsvPay) {
		this.rsvPay = rsvPay;
	}


	public Map<String, Object> getRsvInfoMap() {
		return rsvInfoMap;
	}

	public void setRsvInfoMap(Map<String, Object> rsvInfoMap) {
		this.rsvInfoMap = rsvInfoMap;
	}

	@Override
	public String toString() {
		return "RsvVO [rsvNo=" + rsvNo + ", rsvDate=" + rsvDate + ", rsvCdate=" + rsvCdate + ", rsvMemNo=" + rsvMemNo
				+ ", rsvPay=" + rsvPay + ", rsvInfoMap=" + rsvInfoMap + "]";
	}

}// RsvVO
