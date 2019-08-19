package com.lishan.gjq.util;

import com.alibaba.fastjson.JSON;

public class Page {
	private int start;
	private int end;
	public Page() {
		super();
	}
	public Page(int start, int end) {
		super();
		this.start = start;
		this.end = end;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	@Override
	public String toString() {
		return JSON.toJSONString(this);
	}
	

}
