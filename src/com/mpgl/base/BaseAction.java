package com.mpgl.base;

import java.util.Map;

import org.apache.log4j.Logger;
import org.apache.struts2.interceptor.ApplicationAware;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;
import com.mpgl.util.Constant;
import com.mpgl.vo.Form;
import com.mpgl.vo.PageVo;
import com.mpgl.vo.UserVo;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 基本Action
 * 
 * @author user
 * 
 */
public abstract class BaseAction extends ActionSupport implements SessionAware,
		RequestAware, ApplicationAware {

	private static final long serialVersionUID = -8617459327257091494L;

	/**
	 * 日志
	 */
	protected static Logger log = Logger.getLogger(BaseAction.class);

	/**
	 * 服务器 全局变量
	 */
	public Map<String, Object> application;

	/**
	 * result常量，跳转到教师页面
	 */
	public static String TEACHER = "teacher";

	/**
	 * result常量，跳转到学生页面
	 */
	public static String STUDENT = "student";

	/**
	 * 异步请求返回状态
	 */
	public String ajaxStatus = Constant.CODE_EOF;

	/**
	 * 前端分页
	 */
	public PageVo pageVo = new PageVo();

	/**
	 * DataGrid默认分页参数-页码
	 */
	public String page;

	/**
	 * DataGrid默认分页参数-页尺寸
	 */
	private String rows;

	/**
	 * 表单参数对象
	 */
	public Form form;

	/**
	 * Session
	 */
	public Map<String, Object> session;

	/**
	 * Request
	 */
	public Map<String, Object> request;

	/**
	 * 获取当前登录用户
	 * 
	 * @return
	 */
	public UserVo getCurrentUser() {
		return (UserVo) session.get(Constant.USER);
	}

	/**
	 * 为MAP添加分页参数
	 * 
	 * @param param
	 * @return
	 */
	public Map<String, Object> getPageMap(Map<String, Object> param) {
		if (param != null) {
			pageVo.setPageSize(10);
			pageVo.putLimitParam(param);
		}
		return param;
	}

	/**
	 * 获取查询表单数据 有分页
	 * 
	 * @return
	 */
	public Form getForm() {
		if (form == null) {
			form = new Form();
		}
		if (page != null && rows != null) {
			int page_ = Integer.parseInt(page);
			int rows_ = Integer.parseInt(rows);
			if (page_ <= 0) {
				page_ = 1;
			}
			form.setPageIndex((page_ - 1) * rows_);
			form.setPageSize(rows_);
		}
		return form;
	}

	/**
	 * 设置分页参数
	 * 
	 * @param map
	 */
	public void initPage(Map<String, Object> map) {
		pageVo.setRowCount(Integer.parseInt(map.get(Constant.ROW_TOTAL)
				.toString()));
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public Map<String, Object> getSession() {
		return this.session;
	}

	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}

	public Map<String, Object> getRequest() {
		return this.request;
	}

	@Override
	public void setApplication(Map<String, Object> application) {
		this.application = application;
	}

	public Map<String, Object> getApplication() {
		return this.application;
	}

	public void setForm(Form form) {
		this.form = form;
	}

	public String getPage() {
		return page;
	}

	public void setPage(String page) {
		this.page = page;
	}

	public String getRows() {
		return rows;
	}

	public void setRows(String rows) {
		this.rows = rows;
	}

	public PageVo getPageVo() {
		return pageVo;
	}

	public void setPageVo(PageVo pageVo) {
		this.pageVo = pageVo;
	}
}