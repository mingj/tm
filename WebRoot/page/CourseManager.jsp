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
<script src="${pageContext.request.contextPath }/page/js/resource/CourseManager.js"></script>
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
						<li><a href="${pageContext.request.contextPath}/goCourseManager.do"><s:text name="LABEL.COURSE_MANAGER"></s:text></a></li>
					</ul>
				</div>
				<div class="row-fluid">
					<div class="box span12">
						<div class="box-header well">
							<h2>
								<i class="icon-star"></i> 
								<s:text name="LABEL.COURSE_LIST"/>
							</h2>
							<div class="box-icon">
							</div>
						</div>
						<div class="box-content">
							<form id="searchForm" action="${pageContext.request.contextPath }/goCourseManager.do" method="post" class="form-inline">
								<input id="current" class="input" name="pageVo.currentPage" type="hidden" value="${pageVo.currentPage}">
								
								<label for="course_code"><s:text name="LABEL.COURSE_CODE"/>:</label>
						  		<input id="course_code" class="input" name="form.code" type="text" value="${form.code}">
						  		
								<label for="course_name"><s:text name="LABEL.COURSE_NAME"/>:</label>
								<input id="course_name" class="input" name="form.course_name" type="text" value="${form.course_name}">
								
								<button class="btn btn-warning" type="button" onclick="goPage(1)">
									<i class="icon-search icon-white"></i>
									<s:text name="BUTTON.SEARCH"></s:text>
								</button>
								
								<a class="btn btn-primary" href="${pageContext.request.contextPath}/goCourseAdd.do">
									<i class=" icon-plus icon-white"></i>
									<s:text name="BUTTON.ADD"></s:text>
								</a>
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
											<td>
												<a class="btn btn-success" href="${pageContext.request.contextPath}/goCourseInfo.do?courseVo.id=${item.id}">
													<i class="icon-eye-open icon-white"></i>  
													<s:text name="BUTTON.LOOK"/>                                           
												</a>
												<a class="btn btn-danger" href="#" onclick="delConfirm('${item.id}','${item.name }');">
													<i class="icon-trash icon-white"></i>  
													<s:text name="BUTTON.DEL"/>                                           
												</a>
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
	
	<div class="modal hide fade" id="messageModal">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">×</button>
			<h3><s:text name="ALERT.TOOLTIP"/></h3>
		</div>
		<div class="modal-body" id="messageModalBody">
			<p>
				<s:text name="ALERT.DELCONFIRM"/>
				<input id="course_id" type="hidden" value="">
			</p>
		</div>
		<div class="modal-footer">
			<a href="#" class="btn btn-primary" onclick="del('<s:text name='ALERT.DEL_SUCCESS'/>','<s:text name='ALERT.DEL_FAIL'/>');">
				<s:text name="BUTTON.CONFIRM"/>
			</a>
			<a href="#" class="btn" data-dismiss="modal">
				<s:text name="BUTTON.CANCEL"/>
			</a>
		</div>
	</div>

</body>
</html>
