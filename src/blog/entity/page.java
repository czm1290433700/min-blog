package blog.entity;

import java.util.List;

public class page<T> {
	private int pageNum;//页码
	private int pageSize;//每页信息量
	private int totalNum;//总信息数
	private int startIndex;//每页开始索引
	private int totalPage;//总页数
	private List<T> data;//每页内容
	/**
	 * 设置页面属性
	 * @param pageNum
	 * @param pageSize
	 * @param totalNum
	 */
	public page(int pageNum,int pageSize,int totalNum){
		this.pageNum=pageNum;
		this.pageSize=pageSize;
		this.totalNum=totalNum;
		//页码判断
		if(pageNum<1) {
			pageNum=1;
		}
		//计算
		this.totalPage=(totalNum+pageSize-1)/pageSize;
		this.startIndex=(pageNum-1)*pageSize;
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getTotalNum() {
		return totalNum;
	}
	public void setTotalNum(int totalNum) {
		this.totalNum = totalNum;
	}
	public int getStartIndex() {
		return startIndex;
	}
	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public List<T> getData() {
		return data;
	}
	public void setData(List<T> data) {
		this.data = data;
	}
}
