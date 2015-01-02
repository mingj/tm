function goPage(currentPage) {
//	window.location = "goMessageManager.do?pageVo.currentPage=" + currentPage;
	$("#current").val(currentPage);
	$("#searchForm").submit();
}

function delConfirm(id) {
	$("#message_id").val(id);
	$("#messageModal").modal({
		show:true
	});
}

function del(success,fail) {
	$.post(
			"doMessageDel.do",
			{"messageVo.id":$("#message_id").val()},
			function(code) {
				if(code=="500") {
					alert(success);
					window.location.reload();
				} else {
					alert(fail);
				}
			},"json"
	);
}

