/**
 * 
 */
package com.news.utils;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.apache.ibatis.annotations.Param;

/**
 * @author pxq
 * @date 2018年3月27日
 */
public class PageUtils {
	
	private  final Integer MinPageSize=5;
	private  final Integer MaxPageSize=15;
	private  final Integer PageSize2=20;
	private  final Integer PageSize25=25;
	private  final Integer PageSize3=30;
	//用于带条件查询的页面使用
	private Object param1;
	private Object param2;
	private Object param3;
	private Object param4;
	
	private Integer pageNo;// 当前页
	private Integer pageSize;// 显示条数
	private Integer totalPage;// 一共多少页
	private Integer totalCount;// 一共多少条
	private String pageUrl;// url地址
	private Integer showPage;// 显示多少页
	private List<Integer> showPages;// 显示的页码
	private Integer startNo;//
	private Integer endNo;//
	private boolean isPrive;// 是否上一页
	private boolean isNext;// 是否下一页

	/**
	 * @return the pageNo
	 */
	public Integer getPageNo() {
		return this.pageNo == null || this.pageNo==0 ? 1 : pageNo;
	}

	/**
	 * @param pageNo
	 *            the pageNo to set
	 */
	public void setPageNo(Integer pageNo) {
		this.pageNo = pageNo;
	}

	/**
	 * @return the pageSize
	 */
	public Integer getPageSize() {
		return pageSize == null || pageSize == 0 ? 10 : pageSize;
	}

	/**
	 * @param pageSize
	 *            the pageSize to set
	 */
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	/**
	 * @return the totalPage
	 */
	public Integer getTotalPage() {
		Integer totalPage = 0;
		if (getTotalCount() < getPageSize()) {
			totalPage = 1;
		} else if (getTotalCount() % getPageSize() > 0) {
			totalPage = (getTotalCount() / getPageSize()) + 1;
		} else {
			totalPage = getTotalCount() / getPageSize();
		}
		return totalPage;
	}

	/**
	 * @param totalPage
	 *            the totalPage to set
	 */
	public void setTotalPage(Integer totalPage) {
		this.totalPage = totalPage;
	}

	/**
	 * @return the totalCount
	 */
	public Integer getTotalCount() {
		return totalCount == null ? 0 : totalCount;
	}

	/**
	 * @param totalCount
	 *            the totalCount to set
	 */
	public void setTotalCount(Integer totalCount) {
		this.totalCount = totalCount;
	}

	/**
	 * @return the pageUrl
	 */
	public String getPageUrl() {
		return pageUrl == null || "".equals(pageUrl) ? "/" : pageUrl;
	}

	/**
	 * @param pageUrl
	 *            the pageUrl to set
	 */
	public void setPageUrl(String pageUrl) {
		this.pageUrl = pageUrl;
	}

	/**
	 * @return the showPage
	 */
	public Integer getShowPage() {
		return showPage == null ? 5 : showPage;
	}

	/**
	 * @param showPage
	 *            the showPage to set
	 */
	public void setShowPage(Integer showPage) {
		this.showPage = showPage;
	}

	/**
	 * @return the showPages
	 */
	public List<Integer> getShowPages() {
		Integer count = getShowPage();
		showPages=new ArrayList<>();
		Integer pageNoB=getPageNo()-(getShowPage()/2);
		 if (pageNoB<1) {
			 pageNoB=1;
		 }
		 for (int i = 0; i < count; i++) {
			 if (pageNoB<(this.getTotalPage()+1)) {
				 showPages.add(pageNoB);
				 pageNoB++;
			}else {
				break;
			}
		}
		return showPages;
	}

	/**
	 * @param showPages
	 *            the showPages to set
	 */
	public void setShowPages(List<Integer> showPages) {
		this.showPages = showPages;
	}

	/**
	 * @return the startNo
	 */
	public Integer getStartNo() {
		return (getPageNo()- 1) * getPageSize();
	}

	/**
	 * @param startNo
	 *            the startNo to set
	 */
	public void setStartNo(Integer startNo) {
		this.startNo = startNo;
	}

	/**
	 * @return the endNo
	 */
	public Integer getEndNo() {
		return getPageNo() * getPageSize();
	}

	/**
	 * @param endNo
	 *            the endNo to set
	 */
	public void setEndNo(Integer endNo) {
		this.endNo = endNo;
	}

	/**
	 * @return the isPrive
	 */
	public boolean getIsPrive() {
		return getPageNo() >= 2;
	}

	/**
	 * @param isPrive
	 *            the isPrive to set
	 */
	public void setPrive(boolean isPrive) {
		this.isPrive = isPrive;
	}

	/**
	 * @return the isNext
	 */
	public boolean getIsNext() {
		return this.pageNo <= (getTotalPage() - 1);
	}

	/**
	 * @param isNext
	 *            the isNext to set
	 */
	public void setNext(boolean isNext) {
		this.isNext = isNext;
	}

	/**
	 * @return the param1
	 */
	public Object getParam1() {
		return param1;
	}

	/**
	 * @param param1 the param1 to set
	 */
	public void setParam1(Object param1) {
		this.param1 = param1;
	}

	/**
	 * @return the param2
	 */
	public Object getParam2() {
		return param2;
	}

	/**
	 * @param param2 the param2 to set
	 */
	public void setParam2(Object param2) {
		this.param2 = param2;
	}

	/**
	 * @return the param3
	 */
	public Object getParam3() {
		return param3;
	}

	/**
	 * @param param3 the param3 to set
	 */
	public void setParam3(Object param3) {
		this.param3 = param3;
	}

	/**
	 * @return the param4
	 */
	public Object getParam4() {
		return param4;
	}

	/**
	 * @param param4 the param4 to set
	 */
	public void setParam4(Object param4) {
		this.param4 = param4;
	}

	public PageUtils(Integer pageNo, Integer pageSize, Integer totalCount,String pageUrl,Integer showPage) {
		super();
		this.pageNo = pageNo;
		this.pageSize = pageSize;
		this.totalCount = totalCount;
		this.pageUrl=pageUrl;
		this.showPage=showPage;
	}

	public PageUtils() {
		super();
	}

	@Override
	public String toString() {
		return "SqlSErverPageUtils [pageNo=" + pageNo + ", pageSize=" + pageSize + ", totalPage=" + totalPage
				+ ", totalCount=" + totalCount + ", pageUrl=" + pageUrl + ", showPage=" + showPage + ", showPages="
				+ (showPages) + ", startNo=" + startNo + ", endNo=" + endNo + ", isPrive=" + isPrive + ", isNext="
				+ isNext + "]";
	}

}
