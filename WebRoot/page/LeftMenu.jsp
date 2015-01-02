<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.mpgl.util.CommonUtil"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<div class="span2 main-menu-span">
	<div class="well nav-collapse sidebar-nav">
		<ul class="nav nav-tabs nav-stacked main-menu">
			<s:if test="#session.USER_INFO.roleVo != null">
				<s:iterator id="menus" value="#session.USER_INFO.roleVo.menuList">
					<li class="nav-header hidden-tablet">
						<s:property value="name"/>
					</li>
					<s:if test=" #menus.list != null ">
						<s:iterator id="subMenus" value="#menus.list">
							<li>
								<a class="ajax-link" href="${pageContext.request.contextPath}<s:property value="#subMenus.path"/>">
									<i class="<s:property value="#subMenus.code"/>"></i>
									<span class="hidden-tablet"><s:property value="#subMenus.name"/></span>
								</a>
							</li>
						</s:iterator>
					</s:if>
				</s:iterator>
			</s:if>
		</ul>
	</div><!--/.well -->
</div><!--/span-->
