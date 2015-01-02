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
	<s:text name="COMMON_TITLE"/>-<s:text name="TITLE.STUDENT_MAIN"/>
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
<script src="${pageContext.request.contextPath }/page/js/resource/StudentMain.js"></script>
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
				<!-- 教学通知列表 -->
				<div class="row-fluid">
					<div class="box span12">
						<div class="box-header well">
							<h2>
								<i class="icon-envelope"></i> 
								<s:text name="LABEL.TEACH_MESSAGE"/>
							</h2>
							<div class="box-icon">
								<a class="btn btn-primary btn-round" title="<s:text name="BUTTON.MORE"/>..." href="${pageContext.request.contextPath }/goStudentMessage.do">
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
				<!-- 已选课程列表 和 未选课程列表 start  -->
				<div class="row-fluid">
					<!-- 已选 start -->
					<div class="box span6">
						<div class="box-header well">
							<h2>
								<i class="icon-heart"></i>
								<s:text name="LABEL.SELECT_COURSE"></s:text>
							</h2>
							<div class="box-icon">
								<a class="btn btn-primary btn-round" title="<s:text name="BUTTON.MORE"/>..." href="${pageContext.request.contextPath }/goStudentCourse.do">
									<i class="icon-th-large icon-white"></i>
								</a>
							</div>
						</div>
						<div class="box-content">
							<div class="box-content">
								<ul class="dashboard-list">
									<c:forEach items="${scourseList}" var="item" varStatus="st">
									<c:if test="${st.index <10}">
									<li>
										<a href="${pageContext.request.contextPath }/goStudentCourseInfo.do?courseVo.id=${item.id}">
											<img class="dashboard-avatar" src="${pageContext.request.contextPath }/images/select.png">
										</a>
										<strong><s:text name="LABEL.COURSE_CODE"/>:</strong>${item.code}
										&nbsp;&nbsp;
										<strong><s:text name="LABEL.COURSE_NAME"/>:</strong> 
										<a href="${pageContext.request.contextPath }/goStudentCourseInfo.do?courseVo.id=${item.id}">
											${item.name}
										</a>
										<br>
										<strong><s:text name="LABEL.TEACHER"/>:</strong>${item.teacher_name }
										<a class="btn btn-small btn-danger" onclick="unelective('<s:text name="ALERT.CANCEL_ELECTIVE"/>','${item.id}');"><i class="icon-heart icon-white"></i><s:text name="LABEL.CANCEL_ELECTIVE"/></a>
										<br>
										<br>
									</li>
									</c:if>
									</c:forEach>
								</ul>
							</div>
						</div>
					</div>
					<!-- 已选 end -->
					<!-- 未选 start -->
					<div class="box span6">
						<div class="box-header well">
							<h2>
								<i class="icon-star"></i>
								<s:text name="LABEL.UNSELECT_COURSE"></s:text>
							</h2>
							<div class="box-icon">
								<a class="btn btn-primary btn-round" title="<s:text name="BUTTON.MORE"/>..." href="${pageContext.request.contextPath }/goStudentCourse.do?form.status=unselect">
									<i class="icon-th-large icon-white"></i>
								</a>
							</div>
						</div>
						<div class="box-content">
							<div class="box-content">
								<ul class="dashboard-list">
									<c:forEach items="${ucourseList}" var="item" varStatus="st">
									<c:if test="${st.index <10}">
									<li>
										<a href="#">
											<img class="dashboard-avatar" src="${pageContext.request.contextPath }/images/unselect.png">
										</a>
										<strong><s:text name="LABEL.COURSE_CODE"/>:</strong>${item.code}
										&nbsp;&nbsp;
										<strong><s:text name="LABEL.COURSE_NAME"/>:</strong> 
										<a href="#">
											${item.name}
										</a>
										<br>
										<strong><s:text name="LABEL.TEACHER"/>:</strong>${item.teacher_name }
										<a class="btn btn-small btn-primary" onclick="elective('<s:text name="ALERT.ELECTIVE"/>','${item.id}');"><i class="icon-heart icon-white"></i><s:text name="LABEL.ELECTIVE"/></a>
										<br>
										<br>
									</li>
									</c:if>
									</c:forEach>
								</ul>
							</div>
						</div>
					</div>
					<!-- 未选 end -->
							
				</div>
				<!-- 已选课程列表 和 未选课程列表 end  -->
			</div>
			<!-- content ends -->
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
