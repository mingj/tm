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
	<s:text name="COMMON_TITLE"/>-<s:text name="TITLE.TEACH_RESOURCE"/>
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
<script src="${pageContext.request.contextPath }/page/js/resource/StudentResource.js"></script>
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
				<!-- TeacherInfo start -->
				<div class="row-fluid">
					<div class="box span12">
						<div class="box-header well">
							<h2>
								<i class="icon-th-list"></i> 
								<s:text name="LABEL.RESOURCE_LIST"/>
							</h2>
							<div class="box-icon">
							</div>
						</div>
						<div class="box-content">
							<form id="searchForm" action="${pageContext.request.contextPath }/goStudentResource.do" method="post" class="form-inline">
						  		<input id="current" class="input" name="pageVo.currentPage" type="hidden" value="${pageVo.currentPage}">
						  		<label for="file_name"><s:text name="LABEL.FILE_NAME"/>:</label>
						  		<input id="file_name" class="input" name="form.file_name" type="text" value="${form.file_name}">
								<button class="btn btn-warning" type="button" onclick="goPage(1)">
									<i class="icon-search icon-white"></i>
									<s:text name="BUTTON.SEARCH"></s:text>
								</button>
							</form>
							<table class="table table-striped table-bordered  bootstrap-datatable">
								<thead>
									<tr>
										<th></th>
										<th><s:text name="LABEL.COURSEWARE_NAME"/></th>
										<th><s:text name="LABEL.CREATE_DATE"/></th>
										<th><s:text name="LABEL.TEACHER"/></th>
										<th><s:text name="LABEL.FILE_TYPE"/></th>
										<th><s:text name="LABEL.ACTION"/></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${resourceMap.rows}" var="item" varStatus="st">
										<tr>
											<td width="32px">
												<c:if test="${item.resource_type=='1' }">
													<i class="icon32 icon-color icon-video"></i>
												</c:if>
												<c:if test="${item.resource_type=='2' }">
													<c:choose>
														<c:when test="${item.extension ==  'pdf'}">
															<i class="icon32 icon-color icon-pdf"></i>
														</c:when>
														<c:when test="${item.extension ==  'doc' || item.extension ==  'docx'}">
															<i class="icon32 icon-color icon-doc"></i>
														</c:when>
														<c:when test="${item.extension ==  'xls' || item.extension ==  'xlsx'}">
															<i class="icon32 icon-color icon-xls"></i>
														</c:when>
														<c:otherwise>
															<i class="icon32 icon-color icon-document"></i>
														</c:otherwise>
													</c:choose>
												</c:if>
												<c:if test="${item.resource_type=='3' }">
													<i class="icon32 icon-color icon-image"></i>
												</c:if>
												<c:if test="${item.resource_type=='4' }">
													<i class="icon32 icon-color icon-page"></i>
												</c:if>
											</td>
											<td>
												<a target="_blank" href="${pageContext.request.contextPath}/main/downloadFile.do?id=${item.id}" class="btn">
													${item.file_name}
												</a>
											</td>
											<td>
												${item.create_date}
											</td>
											<td>
												${item.teacher_name}
											</td>
											<td>
												${item.resource_type_name }
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
