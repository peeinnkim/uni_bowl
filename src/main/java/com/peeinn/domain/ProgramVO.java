package com.peeinn.domain;

public class ProgramVO {
	private int pgNo;
	private String pgTitle;
	private String pgDetail;
	private String pgPoster;
	private String pgThumb;
	private int pgTime;
	private int pgIsRunning; // 0:상영종료, 1:상영중

	public int getPgNo() {
		return pgNo;
	}

	public void setPgNo(int pgNo) {
		this.pgNo = pgNo;
	}

	public String getPgTitle() {
		return pgTitle;
	}

	public void setPgTitle(String pgTitle) {
		this.pgTitle = pgTitle;
	}

	public String getPgDetail() {
		return pgDetail;
	}

	public void setPgDetail(String pgDetail) {
		this.pgDetail = pgDetail;
	}

	public String getPgPoster() {
		return pgPoster;
	}

	public void setPgPoster(String pgPoster) {
		this.pgPoster = pgPoster;
	}

	public String getPgThumb() {
		return pgThumb;
	}

	public void setPgThumb(String pgThumb) {
		this.pgThumb = pgThumb;
	}

	public int getPgTime() {
		return pgTime;
	}

	public void setPgTime(int pgTime) {
		this.pgTime = pgTime;
	}

	public int getPgIsRunning() {
		return pgIsRunning;
	}

	public void setPgIsRunning(int pgIsRunning) {
		this.pgIsRunning = pgIsRunning;
	}

	@Override
	public String toString() {
		return "ProgramVO [pgNo=" + pgNo + ", pgTitle=" + pgTitle + ", pgDetail=" + pgDetail + ", pgPoster=" + pgPoster
				+ ", pgThumb=" + pgThumb + ", pgTime=" + pgTime + ", pgIsRunning=" + pgIsRunning + "]";
	}

}// ProgramVO
