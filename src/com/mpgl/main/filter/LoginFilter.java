package com.mpgl.main.filter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mpgl.util.Constant;
import com.mpgl.vo.UserVo;

public class LoginFilter implements Filter {

	protected FilterConfig filterConfig = null;

	/**
	 * 如果用户未登录，则重定向到指定的页面，URL不包括 ContextPath
	 */
	private String redirectURL = null;

	/**
	 * 不做检查的URL列表，以分号分开，并且 URL 中不包括 ContextPath
	 */
	private List<String> notCheckURLList = new ArrayList<String>();

	@Override
	public void destroy() {

	}

	@Override
	public void doFilter(ServletRequest servletRequest,
			ServletResponse servletResponse, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) servletRequest;
		HttpServletResponse response = (HttpServletResponse) servletResponse;
		HttpSession session = request.getSession();
		if(checkRequestURIIntNotFilterList(request)) {
			chain.doFilter(servletRequest, servletResponse);
			return;
		}
		if (isLogin(request)) {
			chain.doFilter(servletRequest, servletResponse);
			return;
		}
		request.getSession().setAttribute("LOGIN_ERROR", "登录帐号或密码错误");
		response.sendRedirect(request.getContextPath() + redirectURL);
		return;
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		this.filterConfig = filterConfig;
		redirectURL = this.filterConfig.getInitParameter("redirectURL");

		String notCheckURLListStr = this.filterConfig
				.getInitParameter("notCheckURLList");

		if (notCheckURLListStr != null) {
			StringTokenizer st = new StringTokenizer(notCheckURLListStr, ";");
			notCheckURLList.clear();
			while (st.hasMoreTokens()) {
				notCheckURLList.add(st.nextToken());
			}
		}

	}

	/**
	 * 校验用户是否登陆
	 * 
	 * @param request
	 * @return
	 */
	private boolean isLogin(HttpServletRequest request) {
		boolean isLogin = false;
		if (checkRequestURIIntNotFilterList(request)) {
			isLogin = true;
		} else {
			HttpSession session = request.getSession();
			UserVo user = (UserVo) session.getAttribute(Constant.USER);
			if (user != null) {
				isLogin = true;
			} else {
				isLogin = false;
			}
		}
		return isLogin;
	}

	/**
	 * 校验当前url是否在不检查队列中
	 * 
	 * @param request
	 * @return
	 */
	private boolean checkRequestURIIntNotFilterList(HttpServletRequest request) {
		String uri = request.getServletPath()
				+ (request.getPathInfo() == null ? "" : request.getPathInfo());
		return notCheckURLList.contains(uri);
	}

}
