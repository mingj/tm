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
	<s:text name="COMMON_TITLE"/>-<s:text name="TITLE.TEACHER_INFO"/>
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
<script src="${pageContext.request.contextPath }/page/js/resource/CourseInfo.js"></script>
<script src="${pageContext.request.contextPath }/jquery/jquery.form.js"></script>
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
						<li><a href="${pageContext.request.contextPath}/goCourseManager.do">课程管理</a> <span class="divider">/</span></li>
						<li><a href="#">${courseVo.name}</a></li>
					</ul>
				</div>
				<div class="row-fluid">
					<!-- TeacherInfo start -->
					<div class="box span12">
						<div class="box-header well">
							<h2>
								<i class="icon-star"></i> 
								<s:text name="LABEL.COURSE_INFO"/>
							</h2>
						</div>
						<!-- BOX 主内容区开始 -->
						<div class="box-content">
							<p>
								<a class="btn btn-info" href="${pageContext.request.contextPath}/goCourseEdit.do?courseVo.id=${courseVo.id}">
									<i class="icon-edit icon-white"></i>
									<s:text name="BUTTON.EDIT"></s:text>
								</a>
								<button class="btn btn-danger" onclick="del('<s:text name="ALERT.DELCONFIRM"/>','<s:text name="ALERT.DEL_FAIL"/>')">
									<i class="icon-remove icon-white"></i>
									<s:text name="BUTTON.DEL"></s:text>
								</button>
								<button class="btn btn-primary" onclick="uploadWin(4)">
									<i class="icon-arrow-up icon-white"></i>
									<s:text name="BUTTON.UPLOAD"></s:text>
								</button>
							</p>
							<!-- 标签页开始 -->
							<ul class="nav nav-tabs" id="myTab">
								<li class="active"><a href="#info"><s:text name="LABEL.COURSE_DESCRIPTION"/></a></li>
								<li><a href="#courseware"><s:text name="LABEL.COURSEWARE"/></a></li>
								<li><a href="#messages"><s:text name="LABEL.COURSE_RESOURCE"/></a></li>
							</ul>
							<!-- 标签页结束 -->
							<!-- 标签页内容区开始 -->
							<div id="myTabContent" class="tab-content">
								<div class="tab-pane active" id="info">
									<div class="page-header">
										<h1>${courseVo.code}-${courseVo.name}</h1>
									</div>
									${courseVo.description}
								</div>
								<!-- 课件列表 -->
								<div class="tab-pane" id="courseware">
									<table class="table table-striped table-bordered  bootstrap-datatable">
										<thead>
											<tr>
												<th><s:text name="LABEL.SER"/></th>
												<th><s:text name="LABEL.COURSEWARE_NAME"/></th>
												<th><s:text name="LABEL.CREATE_DATE"/></th>
												<th><s:text name="LABEL.ACTION"/></th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${wareList}" var="item" varStatus="st">
												<tr>
													<td width="32px">
														<span class="blue">${st.count}</span>
													</td>
													<td>
														<a href="${pageContext.request.contextPath}/${item.file_path}" class="btn">
															${item.file_name}
														</a>
													</td>
													<td>
														${item.create_date}
													</td>
													<td>
														<c:if test="${item.extension == 'PDF' || item.extension == 'pdf'}">
															<a class="btn btn-success" href="${pageContext.request.contextPath}/${item.file_path}">
																<i class="icon-eye-open icon-white"></i>  
																<s:text name="BUTTON.LOOK"/>                                           
															</a>
														</c:if>
														<a class="btn btn-info" target="_blank"  href="${pageContext.request.contextPath}/main/downloadFile.do?id=${item.id}">
															<i class="icon-arrow-down icon-white"></i>  
															<s:text name="BUTTON.DONWLOAD"/>                                           
														</a>
														<a class="btn btn-danger" href="#" onclick="delFile('<s:text name="ALERT.DELCONFIRM"/>','<s:text name="ALERT.DEL_FAIL"/>','${item.id}');">
															<i class="icon-remove icon-white"></i>
															<s:text name="BUTTON.DEL"></s:text>                                      
														</a>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<div class="alert alert-error">
										<strong><s:text name="ALERT.TOOLTIP"/></strong> <s:text name="ALERT.LOOK"/>
									</div>
								</div>
								<!-- 资源库列表 -->
								<div class="tab-pane" id="messages">
									<div class="page-header">
										<h3><s:text name="LABEL.TEXT_RESOURCE_LIB"></s:text></h3>
									</div>
									<table class="table table-striped table-bordered  bootstrap-datatable">
										<thead>
											<tr>
												<th><s:text name="LABEL.SER"/></th>
												<th><s:text name="LABEL.COURSEWARE_NAME"/></th>
												<th><s:text name="LABEL.CREATE_DATE"/></th>
												<th><s:text name="LABEL.ACTION"/></th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${textList}" var="item" varStatus="st">
												<tr>
													<td width="32px">
														<span class="blue">${st.count}</span>
													</td>
													<td>
														<a href="${pageContext.request.contextPath}/${item.file_path}" class="btn">
															${item.file_name}
														</a>
													</td>
													<td>
														${item.create_date}
													</td>
													<td>
														<a class="btn btn-info" target="_blank"  href="${pageContext.request.contextPath}/main/downloadFile.do?id=${item.id}">
															<i class="icon-arrow-down icon-white"></i>  
															<s:text name="BUTTON.DONWLOAD"/>                                           
														</a>
														<a class="btn btn-danger" href="#" onclick="delFile('<s:text name="ALERT.DELCONFIRM"/>','<s:text name="ALERT.DEL_FAIL"/>','${item.id}');">
															<i class="icon-remove icon-white"></i>
															<s:text name="BUTTON.DEL"></s:text>                                      
														</a>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<div class="page-header">
										<h3><s:text name="LABEL.IMAGE_RESOURCE_LIB"></s:text></h3>
									</div>
									<table class="table table-striped table-bordered  bootstrap-datatable">
										<thead>
											<tr>
												<th><s:text name="LABEL.SER"/></th>
												<th><s:text name="LABEL.COURSEWARE_NAME"/></th>
												<th><s:text name="LABEL.CREATE_DATE"/></th>
												<th><s:text name="LABEL.ACTION"/></th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${imageList}" var="item" varStatus="st">
												<tr>
													<td width="32px">
														<span class="blue">${st.count}</span>
													</td>
													<td>
														<a href="${pageContext.request.contextPath}/${item.file_path}" class="btn">
															${item.file_name}
														</a>
													</td>
													<td>
														${item.create_date}
													</td>
													<td>
														<a class="btn btn-info" target="_blank"  href="${pageContext.request.contextPath}/main/downloadFile.do?id=${item.id}">
															<i class="icon-arrow-down icon-white"></i>  
															<s:text name="BUTTON.DONWLOAD"/>                                           
														</a>
														<a class="btn btn-danger" href="#" onclick="delFile('<s:text name="ALERT.DELCONFIRM"/>','<s:text name="ALERT.DEL_FAIL"/>','${item.id}');">
															<i class="icon-remove icon-white"></i>
															<s:text name="BUTTON.DEL"></s:text>                                      
														</a>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<div class="page-header">
										<h3><s:text name="LABEL.VEDIO_RESOURCE_LIB"></s:text></h3>
									</div>
									<table class="table table-striped table-bordered  bootstrap-datatable">
										<thead>
											<tr>
												<th><s:text name="LABEL.SER"/></th>
												<th><s:text name="LABEL.COURSEWARE_NAME"/></th>
												<th><s:text name="LABEL.CREATE_DATE"/></th>
												<th><s:text name="LABEL.ACTION"/></th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${vedioList}" var="item" varStatus="st">
												<tr>
													<td width="32px">
														<span class="blue">${st.count}</span>
													</td>
													<td>
														<a href="${pageContext.request.contextPath}/${item.file_path}" class="btn">
															${item.file_name}
														</a>
													</td>
													<td>
														${item.create_date}
													</td>
													<td>
														<a class="btn btn-info" target="_blank" href="${pageContext.request.contextPath}/main/downloadFile.do?id=${item.id}">
															<i class="icon-arrow-down icon-white"></i>  
															<s:text name="BUTTON.DONWLOAD"/>                                           
														</a>
														<a class="btn btn-danger" href="#" onclick="delFile('<s:text name="ALERT.DELCONFIRM"/>','<s:text name="ALERT.DEL_FAIL"/>','${item.id}');">
															<i class="icon-remove icon-white"></i>
															<s:text name="BUTTON.DEL"></s:text>                                      
														</a>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
							<!-- 标签页内容区结束 -->
						</div>
						<!-- BOX 主内容区结束 -->
					</div>
					<!-- TeacherInfo end -->
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
	
	<div class="modal hide fade" id="fileModel">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">×</button>
			<h3><s:text name="LABEL.UPLOAD"/></h3>
		</div>
		<div class="modal-body" id="messageModalBody">
			<form id="fileForm" action="${pageContext.request.contextPath }/main/uploadFile.do" method="post" class="form-horizontal">
				<input type="hidden" id="course_id" name="form.course_id" value="${courseVo.id}">
				<div class="control-group">
					<label class="control-label" for="selectError3">
						<s:text name="LABEL.FILE_TYPE"></s:text>
					</label>
					<div class="controls">
						<select id="fileType" name="form.fileType">
						</select>
					</div>
				</div>
				<div class="control-group">
				  <label class="control-label" for="fileInput">
				  	<s:text name="LABEL.SELECT_FILE"/>
				  </label>
				  <div class="controls">
					<div class="uploader" id="uniform-fileInput">
					<input class="input-file uniform_on" id="fileInput" name="excel" type="file" size="19" style="opacity: 0;">
					<span class="filename">No file selected</span>
					<span class="action">Choose File</span></div>
				  </div>
				</div>
			</form>
		</div>
		<div class="modal-footer">
			<a href="#" class="btn btn-primary" onclick="upload();">
				<s:text name="BUTTON.CONFIRM"/>
			</a>
			<a href="#" class="btn" data-dismiss="modal">
				<s:text name="BUTTON.CANCEL"/>
			</a>
		</div>
	</div>
</body>
</html>
