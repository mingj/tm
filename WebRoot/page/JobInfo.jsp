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
	<s:text name="COMMON_TITLE"/>-<s:text name="LABEL.JOB_INFO"/>
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
<script src="${pageContext.request.contextPath }/page/js/resource/JobInfo.js"></script>
<script src="${pageContext.request.contextPath }/jquery/jquery.form.js"></script>
<%@include file="Ue.jsp"%>
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
			<div id="content" class="span10">
				<div>
					 <ul class="breadcrumb">
						<li><a href="${pageContext.request.contextPath}/goPublishJob.do"><s:text name="LABEL.PUBLISH_JOB"></s:text></a> <span class="divider">/</span></li>
						<li><a href="#"><s:text name="LABEL.JOB_INFO"/></a></li>
					</ul>
				</div>
				<div class="row-fluid">
					<div class="box span12">
						<div class="box-header well">
							<h2>
								<i class="icon-pencil"></i> 
								<s:text name="LABEL.JOB_INFO"/>
							</h2>
						</div>
						<div class="box-content">
							<p>
								<a class="btn btn-info" href="${pageContext.request.contextPath}/goJobEdit.do?jobVo.id=${jobVo.id}">
									<i class="icon-edit icon-white"></i>
									<s:text name="BUTTON.EDIT"></s:text>
								</a>
								<button class="btn btn-danger" onclick="del('<s:text name="ALERT.DELCONFIRM"/>','<s:text name="ALERT.DEL_FAIL"/>')">
									<i class="icon-remove icon-white"></i>
									<s:text name="BUTTON.DEL"></s:text>
								</button>
							</p>
							<form action="${pageContext.request.contextPath}/doJobEdit.do" method="post" class="form-horizontal">
								<div class="control-group">
									<label class="control-label">
										<s:text name="LABEL.TITLE" />
									</label>
									<div class="controls">
										<input type="hidden" value="${jobVo.id }" id="job_id">
										<span class="input-xlarge uneditable-input">${jobVo.title }</span>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">
										<s:text name="LABEL.CONTENT" />
									</label>
									<div class="controls">
										${jobVo.content }
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">
										<s:text name="LABEL.COURSE_NAME" />
									</label>
									<div class="controls">
										<span class="input-xlarge uneditable-input">${jobVo.course_name}</span>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">
										<s:text name="LABEL.FINISH_DATE" />
									</label>
									<div class="controls">
										<span class="input-xlarge uneditable-input">${jobVo.finish_date }</span>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- content ends -->
			<!--/#content.span10-->
		</div>
		<!--/fluid-row-->
		<hr>
		
		<%@include file="footer.jsp" %>
	</div>
	<!--/.fluid-container-->
	<script type="text/javascript">
		$(function(){
			$("#finish_date").val("${jobVo.finish_date }");
		})
	</script>
</body>
</html>
