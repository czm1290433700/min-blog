package blog.entity;

import java.util.List;

public class page<T> {
	private int pageNum;//ҳ��
	private int pageSize;//ÿҳ��Ϣ��
	private int totalNum;//����Ϣ��
	private int startIndex;//ÿҳ��ʼ����
	private int totalPage;//��ҳ��
	private List<T> data;//ÿҳ����
	/**
	 * ����ҳ������
	 * @param pageNum
	 * @param pageSize
	 * @param totalNum
	 */
	public page(int pageNum,int pageSize,int totalNum){
		this.pageNum=pageNum;
		this.pageSize=pageSize;
		this.totalNum=totalNum;
		//ҳ���ж�
		if(pageNum<1) {
			pageNum=1;
		}
		//����
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
