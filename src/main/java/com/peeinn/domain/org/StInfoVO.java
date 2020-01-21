package com.peeinn.domain.org;

import com.peeinn.domain.SeatVO;

public class StInfoVO {
	private SeatVO siSt;
	private int siRsv;
	private int siOrg;

	public SeatVO getSiSt() {
		return siSt;
	}

	public void setSiSt(SeatVO siSt) {
		this.siSt = siSt;
	}

	public int getSiRsv() {
		return siRsv;
	}

	public void setSiRsv(int siRsv) {
		this.siRsv = siRsv;
	}

	public int getSiOrg() {
		return siOrg;
	}

	public void setSiOrg(int siOrg) {
		this.siOrg = siOrg;
	}

	@Override
	public String toString() {
		return "StInfoVO [siSt=" + siSt + ", siRsv=" + siRsv + ", siOrg=" + siOrg + "]";
	}

}// StInfoVO
