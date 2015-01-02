
function goToAction(label_value) {
	$("div[label="+label_value+"]").focus(function() {
	});
}

/**
 * 跳转ACTION
 * @param url
 */
function goAction(url) {
	window.location.href = url;
}

/**
 * 清理表单数据
 * @param formId
 */
function clearForm(formId){
	$("#" + formId).form("clear");
}

/**
 * 加载下拉框数据
 * @param id
 * @param url
 */
function loadSelect(id,url) {
	$("#" + id).combobox("reload",url);
}
/**
 * 加载多个下拉框的数据
 * @param ids
 * @param urls
 */
function loadSelects(ids,urls) {
	for(var i=0; i<ids.length; i++) {
		$("#" + ids[i]).combobox("reload",urls[i]);
	}
}

function loadComBoboxs(ids,urls,rootPath) {
	for(var i=0; i<ids.length; i++) {
		$("#" + ids[i]).combobox({
			url : rootPath + urls[i]
		});
	}
}

/**
 * 打开模态窗口并设置标题
 * @param id
 * @param title
 */
function openDialog(id,title) {
	$("#" + id).dialog("setTitle",title).dialog("open");
}

/**
 * 打开操作提示框
 * @param code
 */
function alertMessageByCode(code) {
	if(code == "400") {
		$.messager.alert("提示", "操作错误");
	} else if(code == "500") {
		$.messager.alert("提示", "操作成功");
	} else if(code == "600") {
		$.messager.alert("提示", "服务器无响应");
	} else if(code == "701") {
		$.messager.alert("提示", "数据有重复");
	} else if(code == "unSelect") {
		$.messager.alert("提示", "请选择一行数据");
	} 
	else {
		$.messager.alert("提示", code);
	}
}
var message = {
		alert : function(code){
			if(code == "400") {
				alert("操作错误");
			} else if(code == "500") {
				alert("操作成功");
			} else if(code == "600") {
				alert("服务器无响应");
			} else if(code == "701") {
				alert("数据有重复");
			} else if(code == "unSelect") {
				alert("请选择一行数据");
			} 
			else {
				alert(code);
			}
		}
};

/**
 * 重载DataGrid的数据
 * @param id
 */
function reloadDataGrid(id) {
	$("#" + id).datagrid("reload");
}

/**
 * 清除搜索表单数据
 */
function resetQuery() {
	$("input[id^='query_']").val("");
	$("select[id^='query_']").combobox("setValue","");
}

/**
 * 格式化VALUE为NAME（从其他表出）
 * @param url
 * @param table
 * @param comboboxKey
 * @param comboboxValue
 * @param comboboxWhere
 * @param value
 * @param rowDatam
 * @param rowIndex
 */
function loadTable(url) {
	$.post(
		url,
		{
			"form.comboboxWhere" : "",
			"form.comboboxValue" : "id",
			"form.comboboxTable" : "t_customer_info",
			"form.comboboxKey" : "name"
		},
		function(json) {
			cust = json;
		},"json"
	);
	$.post(
			url,
			{
				"form.comboboxWhere" : "",
				"form.comboboxValue" : "id",
				"form.comboboxTable" : "t_contact_info",
				"form.comboboxKey" : "name"
			},
			function(json) {
				cont = json;
			},"json"
		);
	
}

/**
 * 返回SEX的NAME
 * @param value
 * @param data
 * @param index
 * @returns
 */
function getSexName(value,data,index){
	for(var i=0; i<dict.length; i++) {
		var obj = dict[i];
		if(obj.dictionary_key == "SEX" && obj.dictionary_value == value) {
			return obj.dictionary_name;
		}
	}
	return value;
}

/**
 * 返回Conutry的NAME
 * @param value
 * @param data
 * @param index
 * @returns
 */
function getConutryName(value,data,index){
	for(var i=0; i<dict.length; i++) {
		var obj = dict[i];
		if(obj.dictionary_key == "CONUTRY" && obj.dictionary_value == value) {
			return obj.dictionary_name;
		}
	}
	return value;
}

/**
 * 返回PROVINCE的NAME
 * @param value
 * @param data
 * @param index
 * @returns
 */
function getProvinceName(value,data,index){
	for(var i=0; i<dict.length; i++) {
		var obj = dict[i];
		if(obj.dictionary_key == "PROVINCE" && obj.dictionary_value == value) {
			return obj.dictionary_name;
		}
	}
	return value;
}

/**
 * 返回CUSTOMER_TYPE的NAME
 * @param value
 * @param data
 * @param index
 * @returns
 */
function getCustomerTypeName(value,data,index){
	for(var i=0; i<dict.length; i++) {
		var obj = dict[i];
		if(obj.dictionary_key == "CUSTOMER_TYPE" && obj.dictionary_value == value) {
			return obj.dictionary_name;
		}
	}
	return value;
}

/**
 * 返回CITY的NAME
 * @param value
 * @param data
 * @param index
 * @returns
 */
function getCityName(value,data,index){
	for(var i=0; i<dict.length; i++) {
		var obj = dict[i];
		if(obj.dictionary_key == "CITY" && obj.dictionary_value == value) {
			return obj.dictionary_name;
		}
	}
	return value;
}

/**
 * 返回CITY_CODE的NAME
 * @param value
 * @param data
 * @param index
 * @returns
 */
function getCityCodeName(value,data,index){
	for(var i=0; i<dict.length; i++) {
		var obj = dict[i];
		if(obj.dictionary_key == "CITY_CODE" && obj.dictionary_value == value) {
			return obj.dictionary_name;
		}
	}
	return value;
}

/**
 * 返回STAGE的NAME
 * @param value
 * @param data
 * @param index
 * @returns
 */
function getStageName(value,data,index){
	for(var i=0; i<dict.length; i++) {
		var obj = dict[i];
		if(obj.dictionary_key == "STAGE" && obj.dictionary_value == value) {
			return obj.dictionary_name;
		}
	}
	return value;
}

/**
 * 返回MARKET_TYPE的NAME
 * @param value
 * @param data
 * @param index
 * @returns
 */
function getMarketTypeName(value,data,index){
	for(var i=0; i<dict.length; i++) {
		var obj = dict[i];
		if(obj.dictionary_key == "MARKET_TYPE" && obj.dictionary_value == value) {
			return obj.dictionary_name;
		}
	}
	return value;
}

/**
 * 返回客户名字
 * @param value
 * @param data
 * @param index
 * @returns
 */
function getCustomerName(value,data,index) {
	for(var i=0; i<cust.length; i++) {
		var obj = cust[i];
		if(obj.textField == value) {
			return obj.valueField;
		}
	}
	return value;
}

/**
 * 返回联系人名字
 * @param value
 * @param data
 * @param index
 * @returns
 */
function getContactName(value,data,index) {
	for(var i=0; i<cont.length; i++) {
		var obj = cont[i];
		if(obj.textField == value) {
			return obj.valueField;
		}
	}
	return value;
}

/**
 * 返回用户名字
 * @param value
 * @param data
 * @param index
 */
function getUserName(value,data,index) {
	for(var i=0; i<users.length; i++) {
		var obj = users[i];
		if(obj.textField == value) {
			return obj.valueField;
		}
	}
	return value;
	
}

function checkForm(){
	var flag = true;
	$("select").each(function() {
		if(this.combobox('getValue') == '') {
			flag=false;
			return false;
		}
	});
	
	return flag;
}
