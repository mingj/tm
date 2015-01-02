<%@page import="com.mpgl.util.CommonUtil"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String root = request.getContextPath();
session.setAttribute("rootPath",root);
session.setAttribute("root",root);
%>
<!DOCTYPE html>
<html>
	<head>
		<link rel="shortcut icon"  type="image/x-icon" href="<%=root%>/images/smalllogo.png"  media="screen" >
		<link rel="stylesheet" type="text/css"	href="<%=root%>/easyui/themes/bootstrap/easyui.css" />
		<link rel="stylesheet" type="text/css"	href="<%=root%>/easyui/themes/icon.css" />
		<link rel="stylesheet" type="text/css" href="<%=root%>/css/default.css" />
		<link rel="stylesheet" type="text/css" href="<%=root%>/css/index.css" />
		<script type="text/javascript" src="<%=root%>/easyui/jquery-1.8.0.min.js"></script>
		<script type="text/javascript" src="<%=root%>/easyui/jquery.easyui.min.js"></script>
		<script type="text/javascript"	src="<%=root%>/easyui/locale/easyui-lang-zh_CN.js"></script>
		<script type="text/javascript" src="<%=root%>/js/launch.js"></script>
		<script type="text/javascript" src="<%=root%>/js/util.js"></script>
		<script type="text/javascript"	src="<%=root%>/js/My97DatePickerBeta/WdatePicker.js"></script>
	</head>
</html>