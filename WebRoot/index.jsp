<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="shortcut icon" href="images/small-logo.png">
<link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="bootstrap/css/index.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
<script type="text/javascript" src="jquery/jquery.1.10.js"></script>
<script type="text/javascript" src="js/util.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>

<script type="text/javascript">
	$(function() {
		var role = "${USER_INFO.role_id}";
		if(role == '1') {
			goAction('${pageContext.request.contextPath}/page/Main.jsp');
		} else if(role == '2') {
			goAction('${pageContext.request.contextPath}/goTeacher.do');
		} else if(role == '3') {
			goAction('${pageContext.request.contextPath}/goStudent.do');
		} else {
			goAction('${pageContext.request.contextPath}/page/Login.jsp');
		}
	});
</script>
</head>
<body>
</body>
</html>
