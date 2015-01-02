<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@include file="CommonPage.jsp"%>
<!DOCTYPE HTML>
<html>
  <head>
    <title><s:text name="COMMON_TITLE"></s:text></title>
    <link rel="shortcut icon"  type="image/x-icon" href="<%=root%>/images/smalllogo.png"  media="screen" >
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="<%=root%>/js/main_launch.js"></script>
	<style type="text/css">
		.head a:LINK{
			color: #fff; 
			font-family: 微软雅黑,黑体,Verdana;
			text-decoration: none;
		}
		.head a:hover{
			color: #EA0000; 
			font-family: 微软雅黑,黑体,Verdana;
			text-decoration: none;
		}
	</style>
  </head>
  
  <body  class="easyui-layout">
  	<noscript>
		<div
			style="position: absolute; z-index: 100000; height: 2046px; top: 0px; left: 0px; width: 100%; background: white; text-align: center;">
			<img src="<%=root%>/images/noscript.gif" alt='抱歉，请开启脚本支持！' />
		</div>
	</noscript>
	<div data-options="region:'north',split:false,border:false" class="head"
		style="overflow: hidden; height: 33px; background: url(<%=root%>/images/layout-browser-hd-bg.gif) #7f99be repeat-x center 50%; line-height: 30px; color: #fff; font-family: Verdana, 微软雅黑, 黑体">
		<span style="float: right; padding-right: 20px;">
			<a href="#" onclick="alertMessageByCode('真实姓名:${sessionScope.USER_INFO.name}')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-user'">${sessionScope.USER_INFO.name}</a>
			<a href="#" onclick="openPwd()" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-edit'">修改密码</a>
			<a href="#" onclick="alertMessageByCode('<s:text name="COMMON_DEPT"></s:text>')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-star'">单位信息</a>
			<a href="#" onclick="loginOut()" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-exit'">安全退出</a> 
		</span>
		<span style="padding-left: 10px; font-size: 16px;">
			<a href="#" onclick="alertMessageByCode('<s:text name="COMMON_NONE"/>')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-synchro'"><s:text name="COMMON_TITLE"></s:text></a> 
		</span>
	</div>
	<div data-options="region:'west',split:true" title="<s:text name="COMMON_NAVMENU"></s:text>" style="width:180px;">
		<div id="accordion_menu" class="easyui-accordion" fit="true" border="false"> 
	 	<s:if test="#session.USER_INFO.roleVo != null">
			<s:iterator id="menus" value="#session.USER_INFO.roleVo.menuList">
				<div title="<s:property value="name"/>" data-options="iconCls:'icon-directory'" style="overflow:auto;">
					<ul>
					<s:if test=" #menus.list != null ">
						<s:iterator id="subMenus" value="#menus.list">
							<li>
								<div ><a href="#" ref="<s:property value="order_num"/>" icon="" rel="${rootPath}<s:property value="path"/>"><s:property value="name"/></a></div>
							</li>
						</s:iterator>
					</s:if>
					</ul>  
        		</div>  
			</s:iterator>
	 	</s:if>
		</div>
	</div>
	
	<div id="divFrame" data-options="region:'center'">  
<!-- 		<iframe id="myFrame" name="myFrame" src="${rootPath}/main/goWelcome.do" style="padding:0 0 0 0 ;margin:0 0 0 0 ;frameborder:no;border:0;marginwidth:0;marginheight:0;scrolling:no;width:100%;height:99.5%;allowtransparency:yes"> -->
		
<!-- 		</iframe> -->
		<div id="tabs" class="easyui-tabs" fit="true" border="false"
			plain="true">
			<div title="<s:text name="COMMON_WELCOME"></s:text>" href="${rootPath}/main/goWelcome.do"></div>
		</div>
	</div>  
    
    <div data-options="region:'south',split:false" style="height: 30px; background: #D2E0F2;">
    	<div class="footer">
			<s:text name="COMMON_PRODUCTION_UNIT"></s:text>
		</div>
    </div>  
    
    <div id="editPwd" class="easyui-dialog" style="padding:10px" 
    	data-options="width:210,height:135, iconCls:'icon-base', buttons: '#dlg-buttons', modal:true, closed:true, closable:true">
		<div >
			<form id="editPwdFm" method="post" action="<%=root%>/main/doUpdatePassword.do">  
	            <table>  
	                <tr>  
	                    <td>密码:</td>  
	                    <td><input class="easyui-validatebox" type="password" id="editPasswordText" maxlength="256" name="form.password" data-options="required:true"></input></td>  
	                </tr> 
	                <tr>
						<td colspan="2" align="center">
							<a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-save'" onclick="submitPwd()"><s:text name="BUTTON.EDIT"></s:text></a>
							<a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-cancel'" onclick="closePwd()"><s:text name="BUTTON.CANCEL"></s:text></a>
						</td>
					</tr>
	            </table>  
	        </form>  
		</div>
	</div>
    
    <script type="text/javascript">
    	$(function(){
    		showMessage();
    	});
    	function showMessage() {
    		var now = new Date();
		    var year = now.getFullYear(); //getFullYear getYear
		    var month = now.getMonth();
		    var date = now.getDate();
		    var day = now.getDay();
		    var hour = now.getHours();
		    var minu = now.getMinutes();
		    var sec = now.getSeconds();
		    var week;
		    month = month + 1;
		    if (month < 10) month = "0" + month;
		    if (date < 10) date = "0" + date;
		    if (hour < 10) hour = "0" + hour;
		    if (minu < 10) minu = "0" + minu;
		    if (sec < 10) sec = "0" + sec;
		    var arr_week = new Array("星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六");
		    week = arr_week[day];
		    var time = "";
		    time = year + "年" + month + "月" + date + "日" + " " + hour + ":" + minu + ":" + sec + " " + week;
		    		
    		$.messager.show({
    			title:"提示",
    			showType:"fade",
    			timeout:5000,
    			msg:"${session.USER_INFO.name},欢迎使用本系统^_^<br>"+time
    		});
    	}
    	
    	function loginOut() {
    		$.messager.confirm("退出","你确定要退出系统吗?",function(r) {
    			if(r) {
    				goAction("${pageContext.request.contextPath}/main/goLoginOut.do");
    			}
    		});
    	}
    	
    	function openPwd() {
    		$.post(
    			"${pageContext.request.contextPath}/main/doQueryPwd.do",
    			{},
    			function(user) {
    				if(user != null) {
    					$("#editPasswordText").val(user.password);
    					$("#editPwd").dialog("open").dialog("setTitle", "修改密码");
    				} else {
    					alertMessageByCode("600");
    				}
    			},"json"
    		);
    	}
    	
    	function closePwd() {
    		$("#editPwd").dialog("close");
    	}
    	function submitPwd() {
    		$("#editPwdFm").form("submit", {
				onSubmit : function() {
					return $(this).form("validate");
				},
				success : function(code) {
					alertMessageByCode($.parseJSON(code));
					closePwd();
				}
			});
    	}
    </script>
  </body>
</html>
