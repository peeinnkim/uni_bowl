package com.peeinn.domain.org;

import com.peeinn.domain.OrgVO;
import com.peeinn.domain.ProgramVO;
import com.peeinn.domain.TheaterVO;

//Intranet 등록에 사용
public class OrgResultVO {
	private OrgVO org; // 상세정보 객체
	private TheaterVO th; // 상영관 객체
	private ProgramVO pg; // 프로그램 객체

	public OrgResultVO() {
		org = new OrgVO();
		th = new TheaterVO();
		pg = new ProgramVO();
	}
	
	public OrgVO getOrg() {
		return org;
	}

	public void setOrg(OrgVO org) {
		this.org = org;
	}

	public TheaterVO getTh() {
		return th;
	}

	public void setTh(TheaterVO th) {
		this.th = th;
	}

	public ProgramVO getPg() {
		return pg;
	}

	public void setPg(ProgramVO pg) {
		this.pg = pg;
	}

	@Override
	public String toString() {
		return "OrgResultVO [org=" + org + ", th=" + th + ", pg=" + pg + "]";
	}

}// OrgResultVO
