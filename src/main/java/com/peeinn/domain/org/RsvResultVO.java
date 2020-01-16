package com.peeinn.domain.org;

import com.peeinn.domain.MemberVO;
import com.peeinn.domain.PayVO;
import com.peeinn.domain.RsvVO;
import com.peeinn.domain.SeatGradeVO;

public class RsvResultVO {
	private RsvVO rrRsv;
	private SeatGradeVO rrSg;
	private MemberVO rrMem;
	private PayVO rrPay;
	private OrgResultVO rrOres;

	public RsvResultVO() {
		rrRsv = new RsvVO();
		rrSg = new SeatGradeVO();
		rrMem = new MemberVO();
		rrPay = new PayVO();
		rrOres = new OrgResultVO();
	}

	public RsvVO getRrRsv() {
		return rrRsv;
	}

	public void setRrRsv(RsvVO rrRsv) {
		this.rrRsv = rrRsv;
	}

	public SeatGradeVO getRrSg() {
		return rrSg;
	}

	public void setRrSg(SeatGradeVO rrSg) {
		this.rrSg = rrSg;
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

	public OrgResultVO getRrOres() {
		return rrOres;
	}

	public void setRrOres(OrgResultVO rrOres) {
		this.rrOres = rrOres;
	}

	@Override
	public String toString() {
		return "RsvResultVO [rrRsv=" + rrRsv + ", rrSg=" + rrSg + ", rrMem=" + rrMem + ", rrPay=" + rrPay + ", rrOres="
				+ rrOres + "]";
	}

}// RsvSeatVO
