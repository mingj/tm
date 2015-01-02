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
	<s:text name="COMMON_TITLE"/>-<s:text name="TITLE.STUDENT_REGISTER"/>
</title>
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
<script type="text/javascript">
	$(function(){
		$.post(
			"${pageContext.request.contextPath}/main/queryDictionaryByJson.do",
			{
				"form.dictionaryKey" : "SEX"
			},
			function(data) {
				var html = "";
				for(var i=0; i<data.length; i++) {
					html += "<option value=\""+data[i].dictionary_value + "\">" + data[i].dictionary_name + "</option>";
				}
				$("#sex").html(html);
			},"JSON"
		);
		
		$.post(
			"${pageContext.request.contextPath}/main/querySelectByJson.do",
			{
				"form.comboboxKey" : "name",
				"form.comboboxValue" : "id",
				"form.comboboxTable" : "t_org_info"
			},
			function(data) {
				var html = "";
				for(var i=0; i<data.length; i++) {
					html += "<option value=\""+data[i].valueField + "\">" + data[i].textField + "</option>";
				}
				$("#org").html(html);
			},"JSON"
		);
		
		
	});
	
	function reg(){
		$("#fm").ajaxSubmit({
			 type: $("#fm").attr("method"),
		     url: $("#fm").attr("action"),
		     dataType: "json",
		     success: function(result){
		     	if(result == '500') {
		     		alert("<s:text name="ALERT.REG_Y"/>");
		     		window.location.href = "${pageContext.request.contextPath}/page/Login.jsp";
		     	} else if(result == '700') {
		     		alert("学号重复");
		     	} else if(result == '800') {
		     		alert("学号不存在");
		     	} else {
		     		alert("<s:text name="ALERT.REG_N"/>");
		     	}
		     }
		});
	}
</script>
</head>

<body>
	<div class="container-fluid">
		<div class="row-fluid">

			<div class="row-fluid">
				<div class="span12 center login-header">
					<h2><s:text name="COMMON_WELCOME"/> <s:text name="COMMON_TITLE"/> <s:text name="COMMON_TITLE2"/></h2>
				</div>
			</div>

			<div class="row-fluid center">
				<div class="well span5 center login-box">
					<div class="alert alert-info">
						<s:text name="ALERT.REGISTER"></s:text>
					</div>
					<form id='fm' action="${pageContext.request.contextPath}/doStudentRegister.do" method="post" class="form-horizontal">
						<div class="control-group">
							<label class="control-label">
								<s:text name="LABEL.STUDENT_CODE"/>
							</label>
							<div class="controls">
								<input  name="studentVo.code" type="text" value="">
								<span class="help-inline error-color">*</span>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">
								<s:text name="LABEL.PASSWORD"/>
							</label>
							<div class="controls">
								<input  name="form.password" type="text" value="">
								<span class="help-inline error-color">*</span>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">
								<s:text name="LABEL.NAME"/>
							</label>
							<div class="controls">
								<input  name="studentVo.name" type="text" value="">
								<span class="help-inline error-color">*</span>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">
								<s:text name="LABEL.AGE"/>
							</label>
							<div class="controls">
								<input  name="studentVo.age" type="text" value="">
								<span class="help-inline error-color">*</span>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">
								<s:text name="LABEL.SEX"/>
							</label>
							<div class="controls">
								<select id="sex" name="studentVo.sex">
								
								</select>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">
								<s:text name="LABEL.EMAIL"/>
							</label>
							<div class="controls">
								<input  name="studentVo.email" type="text" value="">
								<span class="help-inline error-color">*</span>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">
								<s:text name="LABEL.MOBILE"/>
							</label>
							<div class="controls">
								<input  name="studentVo.mobile" type="text" value="">
								<span class="help-inline error-color">*</span>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">
								<s:text name="LABEL.ID_NUMBER"/>
							</label>
							<div class="controls">
								<input  name="studentVo.id_number" type="text" value="">
								<span class="help-inline error-color">*</span>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">
								<s:text name="LABEL.ORG"/>
							</label>
							<div class="controls">
								<select id="org" name="studentVo.org_id">
								
								</select>
								<span class="help-inline error-color">*</span>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">
								<s:text name="LABEL.CLASSES"/>
							</label>
							<div class="controls">
								<input  name="studentVo.classes" type="text" value="">
								<span class="help-inline error-color">*</span>
							</div>
						</div>
						<div class="form-actions">
							<button type="button" onclick="reg()" class="btn btn-primary">
								<s:text name="BUTTON.SAVE"/>
							</button>
							<button type="button" class="btn" onclick="goAction('${pageContext.request.contextPath}/page/Login.jsp');">
								<s:text name="BUTTON.CANCEL"/>
							</button>
					  	</div>
					</form>
				</div>
				<!--/span-->
			</div>
			<!--/row-->
		</div>
		<!--/fluid-row-->

	</div>
	<!--/.fluid-container-->
</body>
</html>
