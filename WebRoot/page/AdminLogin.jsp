<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@include file="CommonPage.jsp"%>
<!DOCTYPE HTML>
<html>
  <head>
    <title><s:text name="COMMON_TITLE"></s:text>-<s:text name="TITLE.LOGIN"></s:text></title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<script type="text/javascript">
		//在session失效时，使iframe的父窗口跳转登录页面,而不是iframe
		if (window != top) {
			top.location.href = location.href; 
		}
		var root="<%=root%>";
		var url = '';
		/**
		 * 执行reset操作
		 */
		function doReset() {
			$("#userName").val("");
			$("#passWord").val("");
		}
	
		/**
		 * Ajax执行登录操作
		 * @return
		 */
		function doLogin() {
			var validateResult = true;
			//easyui 表单验证
			$('#loginTable input').each(function() {
				if ($(this).attr('required') || $(this).attr('validType')) {
					if (!$(this).validatebox('isValid')) {
						//如果验证不通过，则返回false
						validateResult = false;
						return;
					}
				}
			});
			if (validateResult == false) {
				//如果验证不通过，则不执行登录操作
				return;
			}
	
			$('#loginForm').submit();
		}
		//设置弹出框的属性
		function setDialog(){
			$('#login').dialog({
				title : '用户登录',
				modal: false,         //模式窗口：窗口背景不可操作
				collapsible : false,  //可折叠，点击窗口右上角折叠图标将内容折叠起来
				resizable : false,    //可拖动边框大小
				closable : false,     //不提供关闭窗口按钮
				shadow : false,
				buttons: "#login-buttons"
			});
		}
		
		$(function() {
			setDialog();
			//焦点
			$("#userName").focus();
		});
		
		function doSave() {
			$("#dlgFm").form("submit", {
				url : url,
				onSubmit : function() {
					return $(this).form("validate");
				},
				success : function(code) {
					alertMessageByCode($.parseJSON(code));
					reloadDataGrid("dg");
					$("#dlg").dialog("close");
				}
			});
		}
	</script>
</head>
 <body class="login-body" onkeydown="if(event.keyCode==13){doLogin();}">
	<div id="login" style=" width: 320px; height: 180px;" >
		<form id="loginForm" method="post" action="<%=root%>/main/login.do" style="padding: 0;margin: 0;">  
            <table style="padding: 0;margin: 0;width: 100%;height: 100%;">  
            <input type="hidden" id="role_id" maxlength="256" name="form.role_id" value="1"/>
                <tr>  
                    <td align="right"><s:text name="LABEL.USERNAME"/>:</td>  
                    <td align="left"><input type="text" id="userName" maxlength="256" name="form.username" /><font class="ck">*</font></td>  
                </tr>  
                <tr>  
                    <td align="right"><s:text name="LABEL.PASSWORD"/>:</td>  
                    <td align="left"><input type="password" id="passWord" maxlength="256" name="form.password" /><font class="ck">*</font></td>  
                </tr>
            </table>  
        </form>  
	</div>
	<div id="login-buttons">
		<a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-start'" 
			onclick="doLogin();"><s:text name="BUTTON.LOGIN"></s:text></a>
		<a href="#" class="easyui-linkbutton"   data-options="plain:true,iconCls:'icon-reload'" 
			onclick="doReset();"><s:text name="BUTTON.RESET"></s:text></a>
	</div>
</body>
</html>
