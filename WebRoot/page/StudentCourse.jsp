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
	<s:text name="COMMON_TITLE"/>-<s:text name="TITLE.COURSE_MANAGER"/>
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
<script src="${pageContext.request.contextPath }/page/js/resource/StudentCourse.js"></script>
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
				<!-- TeacherInfo start -->
				<div>
					 <ul class="breadcrumb">
						<li><a href="${pageContext.request.contextPath}/goStudentCourse.do"><s:text name="LABEL.COURSE_MANAGER"></s:text></a></li>
					</ul>
				</div>
				<div class="row-fluid">
					<div class="box span12">
						<div class="box-header well">
							<h2>
								<i class="icon-star"></i> 
								<s:text name="LABEL.COURSE_LIST"/>
							</h2>
						</div>
						<div class="box-content">
							<form id="searchForm" action="${pageContext.request.contextPath }/goStudentCourse.do" method="post" class="form-inline">
								<input id="current" class="input" name="pageVo.currentPage" type="hidden" value="${pageVo.currentPage}">
								
								<label for="course_code"><s:text name="LABEL.COURSE_CODE"/>:</label>
						  		<input id="course_code" class="input" name="form.code" type="text" value="${form.code}">
						  		
								<label for="course_name"><s:text name="LABEL.COURSE_NAME"/>:</label>
								<input id="course_name" class="input" name="form.course_name" type="text" value="${form.course_name}">
						  		
								<label for="status"><s:text name="LABEL.STATUS"/>:</label>
								<select id="status" name="form.status">
									<option value="select" <c:if test="${form.status == 'select'}">selected="selected"</c:if> ><s:text name="LABEL.SELECT_COURSE"/></option>
									<option value="unselect" <c:if test="${form.status == 'unselect'}">selected="selected"</c:if>><s:text name="LABEL.UNSELECT_COURSE"/></option>
								</select>
								
								<button class="btn btn-warning" type="button" onclick="goPage(1)">
									<i class="icon-search icon-white"></i>
									<s:text name="BUTTON.SEARCH"></s:text>
								</button>
							</form>
							<table class="table table-striped table-bordered  bootstrap-datatable">
								<thead>
									<tr>
										<th></th>
										<th><s:text name="LABEL.COURSE_CODE"/></th>
										<th><s:text name="LABEL.COURSE_NAME"/></th>
										<th><s:text name="LABEL.CREATE_DATE"/></th>
										<th><s:text name="LABEL.TEACHER"/></th>
										<th><s:text name="LABEL.STATUS"/></th>
										<th><s:text name="LABEL.ACTION"/></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${courseMap.rows}" var="item" varStatus="st">
										<tr>
											<td width="32px">
												<i class="icon32 icon-blue icon-bookmark"></i>
											</td>
											<td>
												${item.code}
											</td>
											<td>
												<c:if test="${empty item.isSelect}">
													<a href="#" class="btn">
														${item.name}
													</a>
												</c:if>
												<c:if test="${not empty item.isSelect}">
													<a href="${pageContext.request.contextPath}/goStudentCourseInfo.do?courseVo.id=${item.id}" class="btn">
														${item.name}
													</a>
												</c:if>
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
											<td>
												<c:if test="${empty item.isSelect}">
													<a class="btn btn-primary" onclick="elective('<s:text name="ALERT.ELECTIVE"/>','${item.id}');">
														<i class="icon-heart icon-white"></i><s:text name="LABEL.ELECTIVE"/>
													</a>
												</c:if>
												<c:if test="${not empty item.isSelect}">
													<a class="btn btn-danger" onclick="unelective('<s:text name="ALERT.CANCEL_ELECTIVE"/>','${item.id}');">
														<i class="icon-heart icon-white"></i><s:text name="LABEL.CANCEL_ELECTIVE"/>
													</a>
												</c:if>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<!-- 分页开始  -->
							<%@include file="Pagenate.jsp" %>
							<!-- 分页结束  -->   
						</div>
					</div>
					<!-- TeacherInfo end -->
				</div>
				<!-- content ends -->
			</div>
			<!--/#content.span10-->
		</div>
		<!--/fluid-row-->
		<hr>
		
		<%@include file="footer.jsp" %>
	</div>
	<!--/.fluid-container-->

</body>
</html>
