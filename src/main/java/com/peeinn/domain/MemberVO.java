package com.peeinn.domain;

import java.util.Date;

public class MemberVO {
	private int mNo; //회원번호
	private String mId; //아이디
	private String mPw; //비밀번호
	private String mNm; //이름
	private String mBirth; //생일
	private String mTel; //전화번호
	private String mMail; //메일
	private Date mRegdate; //가입일
	private Date mQuitdate; //탈퇴일 (탈퇴일 존재여부로 탈퇴회원 구분)

	public MemberVO() {
		// TODO Auto-generated constructor stub
	}

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public String getmPw() {
		return mPw;
	}

	public void setmPw(String mPw) {
		this.mPw = mPw;
	}

	public String getmNm() {
		return mNm;
	}

	public void setmNm(String mNm) {
		this.mNm = mNm;
	}

	public String getmBirth() {
		return mBirth;
	}

	public void setmBirth(String mBirth) {
		this.mBirth = mBirth;
	}

	public String getmTel() {
		return mTel;
	}

	public void setmTel(String mTel) {
		this.mTel = mTel;
	}

	public String getmMail() {
		return mMail;
	}

	public void setmMail(String mMail) {
		this.mMail = mMail;
	}

	public Date getmRegdate() {
		return mRegdate;
	}

	public void setmRegdate(Date mRegdate) {
		this.mRegdate = mRegdate;
	}

	public Date getmQuitdate() {
		return mQuitdate;
	}

	public void setmQuitdate(Date mQuitdate) {
		this.mQuitdate = mQuitdate;
	}

	@Override
	public String toString() {
		return "MemberVO [mNo=" + mNo + ", mId=" + mId + ", mPw=" + mPw + ", mNm=" + mNm + ", mBirth=" + mBirth
				+ ", mTel=" + mTel + ", mMail=" + mMail + ", mRegdate=" + mRegdate + ", mQuitdate=" + mQuitdate + "]";
	}

}// MemberVO
