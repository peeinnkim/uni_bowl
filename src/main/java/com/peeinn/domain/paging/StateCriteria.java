package com.peeinn.domain.paging;

public class StateCriteria extends SearchCriteria {
	private int state;

	public StateCriteria() {
		state = -1;
	}

	public StateCriteria(int state) {
		this.state = state;
	}

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



}// StateCriteria
