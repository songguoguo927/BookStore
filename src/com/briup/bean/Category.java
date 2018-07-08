package com.briup.bean;

import java.util.Set;
/**
 * 书的大分类
 * @author briup
 *
 */
public class Category {
	private long id;
	/*书的大类型名字*/
	private String name;
	/*书的大类型下包含的所有小类型*/
	private Set<CategoryDetail> detail;
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Set<CategoryDetail> getDetail() {
		return detail;
	}
	public void setDetail(Set<CategoryDetail> detail) {
		this.detail = detail;
	}
	
}
