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
	<s:text name="COMMON_TITLE"/>-<s:text name="TITLE.STUDENT_INFO"/>-<s:text name="TITLE.EDIT"/>
</title>
<base target="_self">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!-- 引用公共JS -->
<%@include file="TmFoot.jsp"%>
<!-- 引用页面JS -->
</head>

<body>
	<!-- topbar starts -->
	<%@include file="TopBar.jsp" %>
	<!-- topbar ends -->
	
	<div class="container-fluid">
		<div class="row-fluid">
			<!-- left menu starts -->
			<%@include file="LeftMenu.jsp" %>
			<!-- left menu ends -->
			
			<%@include file="noScript.jsp" %>
			
			<!-- content starts -->
			<div id="content" class="span5">
				<!-- TeacherInfo start -->
				<div class="box span12">
					<div class="box-header well">
						<h2>
							<i class="icon-user"></i> 
							<s:text name="LABEL.STUDENT_INFO"/>-<s:text name="LABEL.EDIT"/>
						</h2>
						<div class="box-icon">
						</div>
					</div>
					<div class="box-content">
						<form action="${pageContext.request.contextPath}/doStudentEdit.do" method="post" class="form-horizontal">
							<div class="control-group">
								<label class="control-label">
									<s:text name="LABEL.STUDENT_CODE"/>
								</label>
								<div class="controls">
									<span class="input-xlarge uneditable-input">
										${studentVo.code}
									</span>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label">
									<s:text name="LABEL.NAME"/>
								</label>
								<div class="controls">
									<input class="input-xlarge focused" name="studentVo.name" type="text" value="${studentVo.name}">
									<span class="help-inline error-color">*</span>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label">
									<s:text name="LABEL.AGE"/>
								</label>
								<div class="controls">
									<input class="input-xlarge focused" name="studentVo.age" type="text" value="${studentVo.age}">
									<span class="help-inline error-color">*</span>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label">
									<s:text name="LABEL.SEX"/>
								</label>
								<div class="controls">
									<span class="input-xlarge uneditable-input">
										${studentVo.sex}
									</span>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label">
									<s:text name="LABEL.EMAIL"/>
								</label>
								<div class="controls">
									<input class="input-xlarge focused" name="studentVo.email" type="text" value="${studentVo.email}">
									<span class="help-inline error-color">*</span>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label">
									<s:text name="LABEL.MOBILE"/>
								</label>
								<div class="controls">
									<input class="input-xlarge focused" name="studentVo.mobile" type="text" value="${studentVo.mobile}">
									<span class="help-inline error-color">*</span>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label">
									<s:text name="LABEL.ID_NUMBER"/>
								</label>
								<div class="controls">
									<span class="input-xlarge uneditable-input">
										${studentVo.id_number}
									</span>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label">
									<s:text name="LABEL.ORG"/>
								</label>
								<div class="controls">
									<span class="input-xlarge uneditable-input">
										${studentVo.org_name}
									</span>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label">
									<s:text name="LABEL.CLASSES"/>
								</label>
								<div class="controls">
									<span class="input-xlarge uneditable-input">
										${studentVo.classes}
									</span>
								</div>
							</div>
							<div class="form-actions">
								<button type="submit" class="btn btn-primary">
									<s:text name="BUTTON.SAVE"/>
								</button>
								<button class="btn" onclick="goAction('${pageContext.request.contextPath}/goStudentInfo.do');">
									<s:text name="BUTTON.CANCEL"/>
								</button>
						  	</div>
						</form>
					</div>
				</div>
				<!-- TeacherInfo end -->
			</div>
			<!-- content ends -->
			<!--/#content.span10-->
		</div>
		<!--/fluid-row-->
		<hr>
		
		<%@include file="footer.jsp" %>
	</div>
	<!--/.fluid-container-->
</body>
</html>
