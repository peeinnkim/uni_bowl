package com.peeinn.domain;

import java.util.Date;
import java.util.List;

public class OrgVO {
	private int orgNo;
	private Date orgDate;
	private List<ProgramVO> pgList;

	public int getOrgNo() {
		return orgNo;
	}

	public void setOrgNo(int orgNo) {
		this.orgNo = orgNo;
	}

	public Date getOrgDate() {
		return orgDate;
	}

	public void setOrgDate(Date orgDate) {
		this.orgDate = orgDate;
	}

	public List<ProgramVO> getPgList() {
		return pgList;
	}

	public void setPgList(List<ProgramVO> pgList) {
		this.pgList = pgList;
	}

	@Override
	public String toString() {
		return "OrgVO [orgNo=" + orgNo + ", orgDate=" + orgDate + ", pgList=" + pgList + "]";
	}

}// OrgVO
