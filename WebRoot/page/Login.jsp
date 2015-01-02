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
<%@include file="TmHead.jsp"%>
<title>
	<s:text name="COMMON_TITLE"/>-<s:text name="TITLE.LOGIN"/>
</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!-- 引用公共JS -->
<%@include file="TmFoot.jsp"%>
<!-- 引用页面JS -->
<script type="text/javascript" src="${pageContext.request.contextPath}/page/js/resource/Login.js"></script>
</head>

<body>
	<div class="container-fluid">
		<div class="row-fluid">

			<div class="row-fluid">
				<div class="span12 center login-header">
					<h2><s:text name="COMMON_WELCOME"/> <s:text name="COMMON_TITLE"/> <s:text name="COMMON_TITLE2"/></h2>
				</div>
			</div>

			<div class="row-fluid center">
				<div class="well span5 center login-box">
					<div class="alert alert-info">
						<s:text name="ALERT.LOGIN"></s:text>
					</div>
					<form class="form-horizontal" action="${pageContext.request.contextPath}/main/login.do" method="post">
						<fieldset>
							<div class="input-prepend" title="<s:text name="LABEL.USERNAME"/>" data-rel="tooltip">
								<span class="add-on">
									<i class="icon-user"></i>
								</span>
								<input autofocus class="input-large span10" name="form.username"
									id="username" type="text" value="" />
							</div>
							<div class="clearfix"></div>
							<div class="input-prepend" title="<s:text name="LABEL.PASSWORD"/>" data-rel="tooltip">
								<span class="add-on">
									<i class="icon-lock"></i>
								</span>
								<input class="input-large span10" name="form.password" id="password"
									type="password" value="" />
							</div>
							<div class="clearfix"></div>
							<label class="radio">
							  <input type="radio" id="admin" name="form.role_id" value="1" <s:if test="#request.form.role_id == 1">checked="checked"</s:if>/>
								<s:text name="LABEL.ADMIN"></s:text>
							</label>
							<label class="radio">
							  <input type="radio" id="teacher" name="form.role_id" value="2" <s:if test="#request.form.role_id == 2">checked="checked"</s:if>/>
								<s:text name="LABEL.TEACHER"></s:text>
							</label>
							<label class="radio">
							  <input type="radio" id="student" name="form.role_id" value="3" <s:if test="#request.form.role_id == 3">checked="checked"</s:if>/>
								<s:text name="LABEL.STUDENT"></s:text>
							</label>
							<p class="center span5">
								<button type="submit" class="btn btn-primary"><s:text name="TITLE.LOGIN"/></button>
								<button type="button" class="btn btn-warning" onclick="goAction('${pageContext.request.contextPath}/page/TeacherRegister.jsp')"><s:text name="LABEL.TEACHER_REGISTER"/></button>
								<button type="button" class="btn btn-success" onclick="goAction('${pageContext.request.contextPath}/page/StudentRegister.jsp')"><s:text name="LABEL.STUDENT_REGISTER"/></button>
							</p>
						</fieldset>
					</form>
					<div class="alert alert-error">
						<s:text name="ALERT.BROWSER"></s:text>
					</div>
				</div>
				<!--/span-->
			</div>
			<!--/row-->
		</div>
		<!--/fluid-row-->

	</div>
	<!--/.fluid-container-->
</body>
</html>
