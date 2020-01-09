package com.peeinn.domain.paging;

public class StateCriteria extends SearchCriteria {
	private int state;

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	@Override
	public String toString() {
		return "StateCriteria [state=" + state + "]";
	}

}//StateCriteria
