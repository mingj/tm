package com.mpgl.vo;

import java.util.List;

/**
 * 菜单VO
 * 
 * @author Administrator
 * 
 */
public class MenuVo {

	private String id;

	private String name;

	private List<SubMenuVo> list;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<SubMenuVo> getList() {
		return list;
	}

	public void setList(List<SubMenuVo> list) {
		this.list = list;
	}

}
