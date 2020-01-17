package com.peeinn.domain.org;

import com.peeinn.domain.SeatVO;

public class OrgStInfoVO {
	private OrgResultVO osOres;
	private SeatVO osSt;

	public OrgResultVO getOsOres() {
		return osOres;
	}

	public void setOsOres(OrgResultVO osOres) {
		this.osOres = osOres;
	}

	public SeatVO getOsSt() {
		return osSt;
	}

	public void setOsSt(SeatVO osSt) {
		this.osSt = osSt;
	}

	@Override
	public String toString() {
		return "OrgStInfoVO [osOres=" + osOres + ", osSt=" + osSt + "]";
	}

}// OrgStInfo
