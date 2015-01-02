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
	<s:text name="COMMON_TITLE"/>-<s:text name="TITLE.STUDENT_INFO"/>
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
<script src="${pageContext.request.contextPath }/page/js/resource/StudentInfo.js"></script>
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
							<s:text name="LABEL.STUDENT_INFO"/>
						</h2>
						<div class="box-icon">
							<a class="btn btn-info btn-round" title="<s:text name="BUTTON.EDIT"/>" href="${pageContext.request.contextPath }/goStudentEdit.do">
								<i class="icon-edit icon-white"></i>
							</a>
						</div>
					</div>
					<div class="box-content">
						<form class="form-horizontal">
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
									<span class="input-xlarge uneditable-input">
										${studentVo.name}
									</span>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label">
									<s:text name="LABEL.AGE"/>
								</label>
								<div class="controls">
									<span class="input-xlarge uneditable-input">
										${studentVo.age}
									</span>
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
									<span class="input-xlarge uneditable-input">
										${studentVo.email}
									</span>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label">
									<s:text name="LABEL.MOBILE"/>
								</label>
								<div class="controls">
									<span class="input-xlarge uneditable-input">
										${studentVo.mobile}
									</span>
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
