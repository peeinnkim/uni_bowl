package com.peeinn.domain.org;

import java.util.Date;
import java.util.List;

import com.peeinn.domain.MemberVO;
import com.peeinn.domain.OrgVO;
import com.peeinn.domain.PayVO;
import com.peeinn.domain.ProgramVO;
import com.peeinn.domain.SeatVO;
import com.peeinn.domain.TheaterVO;

public class RsvResultVO extends OrgResultVO {
	private int rrRsvNo;
	private Date rrRsvDate;
	private Date rrRsvCdate;
	private MemberVO rrMem;
	private PayVO rrPay;
	private List<SeatVO> rrSeatList;

	@Override
	public OrgVO getOrg() {
		return super.getOrg();
	}

	@Override
	public void setOrg(OrgVO org) {
		super.setOrg(org);
	}

	@Override
	public TheaterVO getTh() {
		return super.getTh();
	}

	@Override
	public void setTh(TheaterVO th) {
		super.setTh(th);
	}

	@Override
	public ProgramVO getPg() {
		return super.getPg();
	}

	@Override
	public void setPg(ProgramVO pg) {
		super.setPg(pg);
	}

	public int getRrRsvNo() {
		return rrRsvNo;
	}

	public void setRrRsvNo(int rrRsvNo) {
		this.rrRsvNo = rrRsvNo;
	}

	public Date getRrRsvDate() {
		return rrRsvDate;
	}

	public void setRrRsvDate(Date rrRsvDate) {
		this.rrRsvDate = rrRsvDate;
	}

	public Date getRrRsvCdate() {
		return rrRsvCdate;
	}

	public void setRrRsvCdate(Date rrRsvCdate) {
		this.rrRsvCdate = rrRsvCdate;
	}

	public MemberVO getRrMem() {
		return rrMem;
	}

	public void setRrMem(MemberVO rrMem) {
		this.rrMem = rrMem;
	}

	public PayVO getRrPay() {
		return rrPay;
	}

	public void setRrPay(PayVO rrPay) {
		this.rrPay = rrPay;
	}

	public List<SeatVO> getRrSeatList() {
		return rrSeatList;
	}

	public void setRrSeatList(List<SeatVO> rrSeatList) {
		this.rrSeatList = rrSeatList;
	}

	@Override
	public String toString() {
		return "RsvResultVO [rrRsvNo=" + rrRsvNo + ", rrRsvDate=" + rrRsvDate + ", rrRsvCdate=" + rrRsvCdate
				+ ", rrMem=" + rrMem + ", rrPay=" + rrPay + ", rrSeatList=" + rrSeatList + "]";
	}

}// RsvResultVO
