function goPage(currentPage) {
//	window.location = "goJobManager.do?pageVo.currentPage=" + currentPage;
	$("#current").val(currentPage);
	$("#searchForm").submit();
}

function delConfirm(id) {
	$("#course_id").val(id);
	$("#messageModal").modal({
		show:true
	});
}

function del(success,fail) {
	$.post(
			"doCourseDel.do",
			{"courseVo.id":$("#course_id").val()},
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
