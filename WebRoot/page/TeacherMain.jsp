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
	<s:text name="COMMON_TITLE"/>-<s:text name="TITLE.TEACHER_MAIN"/>
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
<script src="${pageContext.request.contextPath }/page/js/resource/TeacherMain.js"></script>
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
				<!--  -->
				<div class="sortable row-fluid">
					<a data-rel="tooltip" title="${messageCount}<s:text name="LABEL.NUM"/>" class="well span3 top-block" href="${pageContext.request.contextPath }/goMessageManager.do">
						<span class="icon32 icon-red icon-user"></span>
						<div>
							<s:text name="LABEL.TEACH_MESSAGE_NUM" />
						</div>
						<div>${messageCount}</div>
						<span class="notification">${messageCount}</span>
					</a>
					
					<a data-rel="tooltip" title="${courseCount}<s:text name="LABEL.NUM"/>" class="well span3 top-block" href="${pageContext.request.contextPath }/goCourseManager.do">
						<span class="icon32 icon-color icon-star-on"></span>
						<div>
							<s:text name="LABEL.COURSE_NUM" />
						</div>
						<div>${courseCount}</div>
						<span class="notification green">${courseCount}</span>
					</a>
	
					<a data-rel="tooltip" title="${jobCount }<s:text name="LABEL.NUM"/>" class="well span3 top-block" href="${pageContext.request.contextPath }/goPublishJob.do">
						<span class="icon32 icon-color icon-envelope-closed"></span>
						<div>
							<s:text name="LABEL.JOB_NUM" />
						</div>
						<div>${jobCount }</div>
						<span class="notification green">${jobCount }</span>
					</a>
				</div>
				
				
				<!-- 教学通知列表 -->
				<div class="row-fluid">
					<div class="box span12">
						<div class="box-header well">
							<h2>
								<i class="icon-envelope"></i> 
								<s:text name="LABEL.TEACH_MESSAGE"/>
							</h2>
							<div class="box-icon">
								<a class="btn btn-primary btn-round" title="<s:text name="BUTTON.MORE"/>..." href="${pageContext.request.contextPath }/goMessageManager.do">
									<i class="icon-th-large icon-white"></i>
								</a>
							</div>
						</div>
						<div class="box-content">
							<ul class="dashboard-list span12">
								<c:forEach items="${messageMap.rows}" var="item" varStatus="st">
									<c:if test="${st.index <= 5 }">
									<li>
										<table>
											<tr>
												<td width="3%">
													<span class="icon32 icon-red icon-volume-on"></span>
												</td>
												<td  width="70%">
													<strong><s:text name="LABEL.MESSAGE"/>:</strong> 
													<a href="#" onclick="messageModal('${item.content}');">${item.title}</a>
												</td>
												<td width="27%">
													<strong>
														<s:text name="LABEL.TEACHER"/>:
													</strong> 
													<a href="#">
														${item.teacher_name}
													</a>
													<strong>
														<s:text name="LABEL.DATE"/>:
													</strong> 
													${item.create_date}
												</td>
											</tr>
										</table>
									</li>
									</c:if>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
				
				<!-- 课程列表  -->
				<div class="row-fluid">
					<div class="box span12">
						<div class="box-header well">
							<h2>
								<i class="icon-star"></i> 
								<s:text name="LABEL.COURSE_LIST"/>
							</h2>
							<div class="box-icon">
								<a class="btn btn-primary btn-round" title="<s:text name="BUTTON.MORE"/>..." href="${pageContext.request.contextPath }/goCourseManager.do">
									<i class="icon-th-large icon-white"></i>
								</a>
							</div>
						</div>
						<!-- 内容开始 -->
						<div class="box-content">
							<table class="table table-striped table-bordered  bootstrap-datatable">
								<thead>
									<tr>
										<th></th>
										<th><s:text name="LABEL.COURSE_CODE"/></th>
										<th><s:text name="LABEL.COURSE_NAME"/></th>
										<th><s:text name="LABEL.CREATE_DATE"/></th>
										<th><s:text name="LABEL.TEACHER"/></th>
										<th><s:text name="LABEL.STATUS"/></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${courseMap.rows}" var="item" varStatus="st">
										<c:if test="${st.index < 6 }">
										<tr>
											<td width="32px">
												<i class="icon32 icon-blue icon-bookmark"></i>
											</td>
											<td>
												${item.code}
											</td>
											<td>
												<a href="${pageContext.request.contextPath}/goCourseInfo.do?courseVo.id=${item.id}" class="btn">
													${item.name}
												</a>
											</td>
											<td>
												${item.create_date}
											</td>
											<td>
												${item.teacher_name}
											</td>
											<td>
												<span class="label label-success">
												${item.status}
												</span>
											</td>
										</tr>
										</c:if>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<!-- 内容结束 -->
					</div>
				</div>
				
				<!-- 教学资料库 列表 开始 -->
				<div class="row-fluid sortable">
					<!-- Vedio start -->
					<div class="box span4">
						<div class="box-header well">
							<h2>
								<i class="icon-th"></i>
								<s:text name="LABEL.VEDIO_RESOURCE_LIB"/>
							</h2>
							<div class="box-icon">
								<a class="btn btn-primary btn-round" title="<s:text name="BUTTON.MORE"/>..." href="${pageContext.request.contextPath }/goTeachResource.do">
									<i class="icon-th-large icon-white"></i>
								</a>
							</div>
						</div>
						<div class="box-content">
							<ul class="dashboard-list">
								<c:forEach items="${vedioMap.rows}" var="item" varStatus="vs">
								<li>
									<a target="_blank"  href="${pageContext.request.contextPath}/main/downloadFile.do?id=${item.id}">
										<i class="icon icon-color icon-video"></i>
										${item.file_name}.${item.extension}
									</a>
								</li>
								</c:forEach>
							</ul>
						</div>
					</div>
					<!-- Vedio end -->
					<!-- Text start -->
					<div class="box span4">
						<div class="box-header well">
							<h2>
								<i class="icon-th"></i>
								<s:text name="LABEL.TEXT_RESOURCE_LIB"/>
							</h2>
							<div class="box-icon">
								<a class="btn btn-primary btn-round" title="<s:text name="BUTTON.MORE"/>..." href="${pageContext.request.contextPath }/goTeachResource.do">
									<i class="icon-th-large icon-white"></i>
								</a>
							</div>
						</div>
						<div class="box-content">
							 <ul class="dashboard-list">
								<c:forEach items="${textMap.rows}" var="item" varStatus="vs">
								<li>
									<a target="_blank"  href="${pageContext.request.contextPath}/main/downloadFile.do?id=${item.id}">
										<i class="icon icon-color icon-document"></i>
										${item.file_name}.${item.extension}  
									</a>
								</li>
								</c:forEach>
							</ul>
						</div>
					</div>
					<!-- Text end -->
					<!-- Image start -->
					<div class="box span4">
						<div class="box-header well">
							<h2>
								<i class="icon-th"></i>
								<s:text name="LABEL.IMAGE_RESOURCE_LIB"/>
							</h2>
							<div class="box-icon">
								<a class="btn btn-primary btn-round" title="<s:text name="BUTTON.MORE"/>..." href="${pageContext.request.contextPath }/goTeachResource.do">
									<i class="icon-th-large icon-white"></i>
								</a>
							</div>
						</div>
						<div class="box-content">
							 <ul class="dashboard-list">
								<c:forEach items="${imageMap.rows}" var="item" varStatus="vs">
								<li>
									<a target="_blank"  href="${pageContext.request.contextPath}/main/downloadFile.do?id=${item.id}">
										<i class="icon icon-color icon-image"></i>
										${item.file_name}.${item.extension}         
									</a>
								</li>
								</c:forEach>
							</ul>
						</div>
					</div>
					<!-- Image end -->
				</div>
				<!-- 教学资料库 列表 结束-->
			</div>
			<!-- content ends -->
			<!--/#content.span10-->
		</div>
		<!--/fluid-row-->
		<hr>
		
		<%@include file="footer.jsp" %>
	</div><!--/.fluid-container-->
	
	
	<div class="modal hide fade" id="messageModal">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">×</button>
			<h3><s:text name="LABEL.TEACH_MESSAGE"/></h3>
		</div>
		<div class="modal-body" id="messageModalBody">
			<p></p>
		</div>
		<div class="modal-footer">
			<a href="#" class="btn btn-primary" data-dismiss="modal">
				<s:text name="BUTTON.CONFIRM"/>
			</a>
			<a href="#" class="btn" data-dismiss="modal">
				<s:text name="BUTTON.CANCEL"/>
			</a>
		</div>
	</div>
</body>
</html>
