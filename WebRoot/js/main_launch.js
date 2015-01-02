
$(function() {
	$("ul li div a").each(function(i){
		var subTitle = $(this).html();
		var url = $(this).attr("rel");
		var icon = $(this).attr("icon");
		$(this).bind("click",{"subTitle":subTitle,"url":url,"icon":icon},openTab);
	});
});

function openTab(t) {
	if(!$('#tabs').tabs('exists',t.data.subtitle)){
		$('#tabs').tabs('add',{
			title:t.data.subTitle,
			content:createFrame(t.data.url),
			closable:true,
			icon:t.data.icon
		});
	}else{
		var p = $('#tabs').tabs('select',t.data.subtitle);
	}
	tabClose();
}

function createFrame(url)
{
	var s = '<iframe scrolling="auto" frameborder="0"  src="'+url+'" style="width:100%;height:99.8%;"></iframe>';
	return s;
}

function tabClose()
{
	/*双击关闭TAB选项卡*/
	$(".tabs-inner").dblclick(function(){
		var subtitle = $(this).children(".tabs-closable").text();
		$('#tabs').tabs('close',subtitle);
	});
}
