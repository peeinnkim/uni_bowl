package com.peeinn.domain;

public class NonMemberVO {
	private int nmNo; // 비회원 번호
	private String nmNm; // 비회원 이름
	private String nmTel; // 비회원 전화번호
	private String nmPw; // 비회원 비밀번호

	public NonMemberVO() {
		// TODO Auto-generated constructor stub
	}

	public int getNmNo() {
		return nmNo;
	}

	public void setNmNo(int nmNo) {
		this.nmNo = nmNo;
	}

	public String getNmNm() {
		return nmNm;
	}

	public void setNmNm(String nmNm) {
		this.nmNm = nmNm;
	}

	public String getNmTel() {
		return nmTel;
	}

	public void setNmTel(String nmTel) {
		this.nmTel = nmTel;
	}

	public String getNmPw() {
		return nmPw;
	}

	public void setNmPw(String nmPw) {
		this.nmPw = nmPw;
	}

	@Override
	public String toString() {
		return "NonMemberVO [nmNo=" + nmNo + ", nmNm=" + nmNm + ", nmTel=" + nmTel + ", nmPw=" + nmPw + "]";
	}

}// NonMemberVO
