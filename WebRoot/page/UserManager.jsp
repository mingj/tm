<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@include file="CommonPage.jsp"%>
<!DOCTYPE HTML>
<html>
  <head>
    <title><s:text name="COMMON_TITLE"></s:text>-用户管理</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  
  <body>
    <table id="dg" class="easyui-datagrid"
            data-options="align:'center',pagination:true,fit:true,rownumbers:true,border:false,singleSelect:true,striped:true,
            url:'${pageContext.request.contextPath}/main/queryUserDataGridByJson.do',method:'post',toolbar:'#dg-toolbar'">
        <thead>
            <tr>
                <th data-options="field:'username',width:100,align:'center'">用户名</th>
                <th data-options="field:'name',width:100,align:'center'">真实姓名</th>
                <th data-options="field:'password',width:100,align:'center'">密码</th>
                <th data-options="field:'role_name',width:100,align:'center'">角色</th>
                <th data-options="field:'create_time',width:160,align:'center'">创建时间</th>
                <th data-options="field:'update_time',width:160,align:'center'">修改时间</th>
                <th data-options="field:'isLock',width:100,align:'center'" formatter="formatterIsLock">是否锁定</th>
            </tr>
        </thead>
    </table>
    <div id="dg-toolbar" style="padding:5px;height:auto">
        <div>
            <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-add'" onclick="operation('add','${pageContext.request.contextPath}/main/doAddUser.do')"><s:text name="BUTTON.ADD"></s:text></a>
            <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-edit'" onclick="operation('edit','${pageContext.request.contextPath}/main/doUpdateUser.do')"><s:text name="BUTTON.EDIT"></s:text></a>
            <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-cancel'" onclick="operation('del','${pageContext.request.contextPath}/main/doDeleteUser.do')"><s:text name="BUTTON.DEL"></s:text></a>
        </div>
        <div>
           	用户名:
           		<input type="text" id="query_username" name="user.username" style="width:100px">
           	真实姓名:
           		<input type="text" id="query_name" name="user.name" style="width:100px">
           	角色:
           		<select id="query_role" name="user.role_id" class="easyui-combobox"
	                data-options="width:80,valueField:'id',textField:'name',url:'${pageContext.request.contextPath}/main/queryRoleListByJson.do'">
            	</select>
           	是否锁定:
           		<select id="query_islock" name="user.isLock" class="easyui-combobox"
	                data-options="width:80,valueField:'dictionary_value',textField:'dictionary_name',url:'${pageContext.request.contextPath}/main/queryDictionaryByJson.do?form.dictionaryKey=ISLOCK'">
           		</select>
           	<a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-search'" onclick="query()"><s:text name="BUTTON.SEARCH"></s:text></a>
           	<a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-reload'" onclick="resetQuery()"><s:text name="BUTTON.RESET"></s:text></a>
        </div>
    </div>
    
    <div id="dlg" class="easyui-dialog" style="padding:10px" 
    	data-options="width:300, iconCls:'icon-base', buttons: '#dlg-buttons', modal:true, closed:true, closable:true">  
	    <form id="dlgFm" action="" method="post">
	    	<input id="dlg_userid" type="hidden" style="width:150px;" name="user.id" value=""></input>
	    	<table style="border: 1">
          	 	<tr>  
	                <td align="right">用户名<font class="ck">*</font>:</td>  
	                <td align="left">
	                	<input id="dlg_username" type="text" maxlength="256" style="width:150px;" name="user.username" ></input>
	                </td>  
	            </tr>  
	            <tr>  
	                <td align="right">密码<font class="ck">*</font>:</td>  
	                <td align="left">
	                	<input id="dlg_password" type="password" maxlength="256" style="width:150px;" name="user.password" ></input>
	                </td>  
	            </tr>  
	            <tr>  
	                <td align="right">真实姓名:</td>  
	                <td align="left">
	                	<input id="dlg_name" type="text" maxlength="256" style="width:150px;" name="user.name" ></input>
	                </td>  
	            </tr>  
	            <tr>  
	                <td align="right">角色<font class="ck">*</font>:</td>  
	                <td align="left">
	                	<select id="dlg_role" name="user.role_id" class="easyui-combobox"
	                		data-options="width:150,valueField:'id',textField:'name',url:'${pageContext.request.contextPath}/main/queryRoleListByJson.do'">
	                	</select>
	                </td>  
	            </tr>  
	            <tr>  
	                <td align="right">是否锁定<font class="ck">*</font>:</td>  
	                <td align="left">
	                	<select id="dlg_isLock" name="user.isLock" class="easyui-combobox"
	                		data-options="width:150,valueField:'dictionary_value',textField:'dictionary_name',url:'${pageContext.request.contextPath}/main/queryDictionaryByJson.do?form.dictionaryKey=ISLOCK'">
	                	</select>
	                </td>  
	            </tr>  
           </table>
	    </form>
	</div>  
	<div id="dlg-buttons">  
   		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="save()">保存</a>  
   		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#dlg').dialog('close')">关闭</a>  
 	</div>  
  </body>
  <script type="text/javascript">
  	var url;
	function operation(type,url) {
		this.url = url;
		clearForm("dlgFm");
		switch(type) {
		case "add" :
			$("#dlg_role").combobox("reload");
			openDialog("dlg","新增");
			break;
		case "edit" :
			var row = $("#dg").datagrid("getSelected");
			if(row) {
				$("#dlg_role").combobox("reload");
				loadForm(row);
				openDialog("dlg","修改");
			} else {
				alertMessageByCode("unSelect");
			}
			break;
		case "del" :
			var row = $("#dg").datagrid("getSelected");
			if(row) {
				$.messager.confirm("确认框","你确定要删除该行数据吗?", function(r) {
					if(r) {
						$.post(
							url,
							{"user.id":row.id},
							function(code) {
								alertMessageByCode(code);
								reloadDataGrid("dg");
							},"json"
						); 
					}
				});
			} else {
				alertMessageByCode("unSelect");
			}
			break;
		}
	}
	
	/**
	 * 保存表单
	 */
	function save() {
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
	
	/**
	 * 为表单加载数据
	 * @param row
	 */
	function loadForm(row) {
		$.post(
			"${pageContext.request.contextPath}/main/queryUserByJson.do",
			{"form.user_id":row.id},
			function(data){
				if(data != null) {
					$("#dlg_userid").val(data.id);
					$("#dlg_username").val(data.username);
					$("#dlg_password").val(data.password);
					$("#dlg_name").val(data.name);
					$("#dlg_role").combobox("setValue",data.role_id);
					$("#dlg_isLock").combobox("setValue",data.isLock);
				}
			},"json"
		);
	}
	
	/**
	 * 查询
	 */
	function query() {
		$("#dg").datagrid({
			pageNumber : 1,
			queryParams : {
				"form.username" : $("#query_username").val(),
				"form.role_id" : $("#query_role").combobox("getValue"),
				"form.isLock" : $("#query_islock").combobox("getValue"),
				"form.name" : $("#query_name").val()
			}
		});
	}
	
	function formatterIsLock(key) {
		var value = "";
		if(key == "1") {
			value = "是";
		} else if(key == "0") {
			value = "否";
		}
		return value;
	}
  </script>
</html>
