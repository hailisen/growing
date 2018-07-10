package com.zcz.util;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

import java.util.List;

/**
 * 用于封装分页信息类
 * @author Lu Jianliang
 * @param <E>
 */
@ApiModel(value = "Page -- 分页属性")
public class Page<E> {

	/**
	 * 当前页码
	 */
	@ApiModelProperty(value = "当前页码")
	private Long pageNumber = 1L;

	/**
	 * 每页展示数据量
	 */
	@ApiModelProperty(value = "每页展示数据量")
	private Long pageSize = 15L;

	/**
	 * 总页数
	 */
	@ApiModelProperty(value = "总页数")
	private Long totalPages = 0L;

	/**
	 * 总记录数
	 */
	@ApiModelProperty(value = "总记录数")
	private Long totalRows = 0L;

	/**
	 * 用于封装分页查询结果的List集合
	 */
	@ApiModelProperty(value = "用于封装分页查询结果的List集合")
	private List<E> result;

	public Long getPageNumber() {
		if(pageNumber <= 1){
			return pageNumber = 1L;
		}
		if(pageNumber >= totalPages){
			return pageNumber = totalPages;
		}
		return pageNumber;
	}

	public void setPageNumber(Long pageNumber) {
		this.pageNumber = pageNumber;
	}

	public Long getPageSize() {
		return pageSize;
	}

	public void setPageSize(Long pageSize) {
		this.pageSize = pageSize;
	}

	public Long getTotalPages() {
		if(pageSize!=0){
			totalPages = (totalRows + pageSize - 1)/pageSize;
		}
		return totalPages;
	}

	public void setTotalPages(Long totalPages) {
		this.totalPages = totalPages;
	}

	public Long getTotalRows() {
		return totalRows;
	}

	public void setTotalRows(Long totalRows) {
		//设置总记录数
		this.totalRows = totalRows;
		//初始化总页数
		this.totalPages = this.getTotalPages();
	}

	public List<E> getResult() {
		return result;
	}

	public void setResult(List<E> result) {
		this.result = result;
	}

}
