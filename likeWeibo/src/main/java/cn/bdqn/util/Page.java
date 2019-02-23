package cn.bdqn.util;

import java.util.List;

public class Page<T> {
	private Integer pageNo;
	private Integer pageSize;
	private Integer totalCount;
	private Integer totalPageCount;
	private Integer start;
	private List<T> list;
	public Integer getPageNo() {
		return pageNo;
	}
	public void setPageNo(Integer pageNo) {
		this.pageNo = pageNo;
		this.start=(pageNo-1)*pageSize;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	public Integer getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(Integer totalCount) {
		this.totalCount = totalCount;
		if (totalCount%pageSize==0) {
			this.totalPageCount=totalCount/pageSize;
		}else {
			this.totalPageCount=totalCount/pageSize+1;
		}
		
	}
	public Integer getTotalPageCount() {
		return totalPageCount;
	}
	public void setTotalPageCount(Integer totalPageCount) {
		this.totalPageCount = totalPageCount;

	}
	public Integer getStart() {
		return start;
	}
	public void setStart(Integer start) {
		this.start = start;
	}
	public List<T> getList() {
		return list;
	}
	public void setList(List<T> list) {
		this.list = list;
	}
	
	
	

}
