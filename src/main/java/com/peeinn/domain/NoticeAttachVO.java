package com.peeinn.domain;

public class NoticeAttachVO {
	private int naNo; // 공지 첨부 번호
	private String naThumb; // 첨부 썸넬
	private String naOrigin; // 첨부 원본
	private int ntNo; // 첨부글 번호

	public NoticeAttachVO() {
		// TODO Auto-generated constructor stub
	}

	public NoticeAttachVO(int naNo, String naThumb, String naOrigin, int ntNo) {
		this.naNo = naNo;
		this.naThumb = naThumb;
		this.naOrigin = naOrigin;
		this.ntNo = ntNo;
	}

	public int getNaNo() {
		return naNo;
	}

	public void setNaNo(int naNo) {
		this.naNo = naNo;
	}

	public String getNaThumb() {
		return naThumb;
	}

	public void setNaThumb(String naThumb) {
		this.naThumb = naThumb;
	}

	public String getNaOrigin() {
		return naOrigin;
	}

	public void setNaOrigin(String naOrigin) {
		this.naOrigin = naOrigin;
	}

	public int getNtNo() {
		return ntNo;
	}

	public void setNtNo(int ntNo) {
		this.ntNo = ntNo;
	}

	@Override
	public String toString() {
		return "NoticeAttachVO [naNo=" + naNo + ", naThumb=" + naThumb + ", naOrigin=" + naOrigin + ", ntNo=" + ntNo
				+ "]";
	}

}// NoticeAttachVO
