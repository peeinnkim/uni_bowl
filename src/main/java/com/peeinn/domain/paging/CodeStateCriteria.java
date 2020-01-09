package com.peeinn.domain.paging;

public class CodeStateCriteria extends SearchCriteria {
	private int code;
	private int state;

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	@Override
	public String toString() {
		return "MemStateCriteria [code=" + code + ", state=" + state + "]";
	}

}// StateCriteria
