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
	<s:text name="COMMON_TITLE"/>-<s:text name="LABEL.ADD"/>
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
						<li><a href="${pageContext.request.contextPath}/goMessageManager.do"><s:text name="LABEL.MESSAGE"></s:text></a> <span class="divider">/</span></li>
						<li><a href="#"><s:text name="LABEL.ADD"/></a></li>
					</ul>
				</div>
				<div class="row-fluid">
					<div class="box span12">
						<div class="box-header well">
							<h2>
								<i class="icon-plus"></i> 
								<s:text name="LABEL.ADD"/>
							</h2>
						</div>
						<div class="box-content">
							<form action="${pageContext.request.contextPath}/doMessageAdd.do" method="post" class="form-horizontal">
								<div class="control-group">
									<label class="control-label">
										<s:text name="LABEL.TITLE" />
									</label>
									<div class="controls">
										<input class="input-xlarge focused" name="messageVo.title" type="text" value="">
										<span class="help-inline error-color">*</span>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">
										<s:text name="LABEL.CONTENT" />
									</label>
									<div class="controls">
										<textarea name="messageVo.content" rows="20" cols="80" style="width:70%;" class="xheditor {tools:'Blocktag,Fontface,FontSize,Bold,Italic,Underline,FontColor,Removeformat|Align,List,Outdent,Indent,Link,Unlink,Hr,Emot,Table,Source,Fullscreen'}"></textarea>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">
										<s:text name="LABEL.COURSE_NAME" />
									</label>
									<div class="controls">
										<select id="course" name="messageVo.course_id" >
											<c:forEach items="${comboboxList}" var="item">
												<option value="${item.valueField }" >
													${item.textField}
												</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="form-actions">
									<button type="submit" class="btn btn-large btn-primary">
										<s:text name="BUTTON.SAVE"/>
									</button>
									<button type="button" class="btn btn-large btn-danger" onclick="goAction('${pageContext.request.contextPath}/goMessageManager.do');">
										<s:text name="BUTTON.CANCEL"/>
									</button>
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
	
</body>
</html>
