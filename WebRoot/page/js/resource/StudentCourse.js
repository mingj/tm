function goPage(currentPage) {
//	window.location = "goJobManager.do?pageVo.currentPage=" + currentPage;
	$("#current").val(currentPage);
	$("#searchForm").submit();
}

function elective(msg,id) {
	if(confirm(msg)) {
		$.post(
				"doElective.do",
				{"courseVo.id":id},
				function(code) {
					if(code==400) {
						alert(fail);
					} else {
						window.location.href="goStudentCourse.do?form.status=" + $("#status").val();
					}
				},"json"
		);
	}
}
function unelective(msg,id) {
	if(confirm(msg)) {
		$.post(
				"doUnElective.do",
				{"courseVo.id":id},
				function(code) {
					if(code==400) {
						alert(fail);
					} else {
						window.location.href="goStudentCourse.do?form.status=" + $("#status").val();
					}
				},"json"
		);
	}
}