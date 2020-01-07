package com.peeinn.domain;

public class AuthVO {
	private int authNo; // 번호
	private String authId; // 아이디
	private int authCode; // 분류코드(0: 회원 / 1: 비회원 / 2: 관리자)

	public AuthVO() {
		// TODO Auto-generated constructor stub
	}

	public AuthVO(int authNo, String authId, int authCode) {
		this.authNo = authNo;
		this.authId = authId;
		this.authCode = authCode;
	}

	public int getAuthNo() {
		return authNo;
	}

	public void setAuthNo(int authNo) {
		this.authNo = authNo;
	}

	public String getAuthId() {
		return authId;
	}

	public void setAuthId(String authId) {
		this.authId = authId;
	}

	public int getAuthCode() {
		return authCode;
	}

	public void setAuthCode(int authCode) {
		this.authCode = authCode;
	}

	@Override
	public String toString() {
		return "AuthVO [authNo=" + authNo + ", authId=" + authId + ", authCode=" + authCode + "]";
	}

}// AuthVO
