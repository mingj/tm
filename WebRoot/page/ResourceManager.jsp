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
<script src="${pageContext.request.contextPath }/page/js/resource/ResourceManager.js"></script>
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
							<form id="searchForm" action="${pageContext.request.contextPath }/goTeachResource.do" method="post" class="form-inline">
						  		<input id="current" class="input" name="pageVo.currentPage" type="hidden" value="${pageVo.currentPage}">
						  		<label for="file_name"><s:text name="LABEL.FILE_NAME"/>:</label>
						  		<input id="file_name" class="input" name="form.file_name" type="text" value="${form.file_name}">
								<button class="btn btn-warning" type="button" onclick="goPage(1)">
									<i class="icon-search icon-white"></i>
									<s:text name="BUTTON.SEARCH"></s:text>
								</button>
								<button class="btn btn-primary" onclick="uploadWin()" type="button">
									<i class="icon-arrow-up icon-white"></i>
									<s:text name="BUTTON.UPLOAD"></s:text>
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
									<c:forEach items="${textMap.rows}" var="item" varStatus="st">
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
												<a class="btn btn-danger" href="#" onclick="delConfirm('${item.id}','${item.file_name }');">
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
				<input id="file_id" type="hidden" value="">
			</p>
		</div>
		<div class="modal-footer">
			<a href="#" class="btn btn-primary" onclick="del('<s:text name='ALERT.DEL_SUCCESS'/>','<s:text name='ALERT.DEL_FAIL'/>');" data-dismiss="modal">
				<s:text name="BUTTON.CONFIRM"/>
			</a>
			<a href="#" class="btn" data-dismiss="modal">
				<s:text name="BUTTON.CANCEL"/>
			</a>
		</div>
	</div>


	<div class="modal hide fade" id="fileModel">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">×</button>
			<h3><s:text name="LABEL.UPLOAD"/></h3>
		</div>
		<div class="modal-body">
			<form id="fileForm" action="${pageContext.request.contextPath }/main/uploadFile.do" method="post" class="form-horizontal">
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
