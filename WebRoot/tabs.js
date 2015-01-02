$(function() {
	//为菜单关联点击事件
	$("a[class=subMenu]").each(function(i){
		var subTitle = $(this).html();
		var url = $(this).attr("rel");
		$(this).bind("click",{"subTitle":subTitle,"url":url},openTab);
	});
});

/**
 * 打开TAB页 
 * @param map
 */
function openTab(map){
	//if(!$('#tabs').tabs('exists',map.data.subtitle)){
		$('#tabs').tabs('add',{
			title:map.data.subTitle,
			content:createFrame(map.data.url),
			closable:true
		});
	//}else{
	//}
}

/**
 * 创建TAB页主体内容
 * @param url
 * @returns {String}
 */
function createFrame(url)
{
	var s = '<iframe scrolling="auto" frameborder="0"  src="'+url+'" style="width:100%;height:99.8%;"></iframe>';
	return s;
}

/**
 * Tabs控件封装
 */
$.fn.tabs = function(type,params) {
	if(type == "add") {
		if($("div[class=menu] ul").length > 0) {
			var menu = $("div[class=menu] ul").html();
			menu = menu.replace(/ol/g, "li");
			var head = "<div class=\"menu\"><ul><ol index=\""+params.title+"\"><div class=\"menutxt01\"><a href=\"javascript:selectTab('"+params.title+"')\" >"+params.title+"</a></div>"
			if(params.closable == true) {
				head += "<div class=\"menu_delete\"><a href=\"#\"><img src=\"images/menudelete.png\" /></a></div>";
			}
			menu += head;
			$("div[class=menu] ul").html(menu);
			$(".detail").hide();
			$(".tabs").append("<div index=\""+params.title+"\" class=\"detail\">" + params.content + "</div>");
		} else {
			var head = "<div class=\"menu\"><ul><ol index=\""+params.title+"\"><div class=\"menutxt01\"><a href=\"javascript:selectTab('"+params.title+"')\">"+params.title+"</a></div>"
			if(params.closable == true) {
				head += "<div class=\"menu_delete\"><a href=\"#\"><img src=\"images/menudelete.png\" /></a></div>";
			}
			head += "</ol></ul></div>";
			$(".tabs").html(head);
			$(".tabs").append("<div index=\""+params.title+"\" class=\"detail\">" + params.content + "</div>");
		}
	}
	if(type == "exists") {
		
	}
	if(type == "close") {
		
	}
};

/**
 * 选择TABS方法
 * @param index
 */
function selectTab(index) {
	var menu = $("div[class=menu] ul").html();
	menu = menu.replace(/ol/g, "li");
	$("div[class=menu] ul").html(menu);
	var children = $("div[class=menu] ul").children();
	menu = "";
	for(var i = 0; i < children.length; i++) {
		if(children[i].indexOf("index=\""+params+"\"") > -1) {
			children[i] = children[i].replace(/li/g,"ol");
		}
		menu += children[i];
	}
	$("div[class=menu] ul").html(menu);
	
	$(".detail").hide();
	$("div[index="+index+"]").show();
}
$.fn.tabs.defaults = {
};