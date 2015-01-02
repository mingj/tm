package com.mpgl.vo;

import java.util.List;

/**
 * 角色VO
 * 
 * @author Administrator
 * 
 */
public class RoleVo {

	private String id;

	private String name;

	private List<MenuVo> menuList;

	private String[] ids;

	private String submenu_id;

	private int newId;

	public String[] getIds() {
		return ids;
	}

	public void setIds(String[] ids) {
		this.ids = ids;
	}

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

	public List<MenuVo> getMenuList() {
		return menuList;
	}

	public void setMenuList(List<MenuVo> menuList) {
		this.menuList = menuList;
	}

	public String getSubmenu_id() {
		return submenu_id;
	}

	public void setSubmenu_id(String submenu_id) {
		this.submenu_id = submenu_id;
	}

	public int getNewId() {
		return newId;
	}

	public void setNewId(int newId) {
		this.newId = newId;
	}
}
