package com.lishan.gjq.util;

import java.util.List;

import org.apache.poi.ss.formula.functions.T;

import com.alibaba.fastjson.JSON;

public class PageUtil {
	private int pageNumber;//总记录数
	private int pageCount;//总页数
	private int pageIndex;//当前页
	private int pageSize;//每页大小
	private List<T> list;//当前页的数据
	public PageUtil() {
		super();
	}
	public PageUtil(int pageNumber, int pageCount, int pageIndex, int pageSize, List<T> list) {
		super();
		this.pageNumber = pageNumber;
		this.pageCount = pageCount;
		this.pageIndex = pageIndex;
		this.pageSize = pageSize;
		this.list = list;
	}
	public int getPageNumber() {
		return pageNumber;
	}
	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	public int getPageIndex() {
		return pageIndex;
	}
	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public List<T> getList() {
		return list;
	}
	public void setList(List<T> list) {
		this.list = list;
	}
	@Override
	public String toString() {
		return JSON.toJSONString(this);
	}
	

}
