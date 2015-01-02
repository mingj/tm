function goPage(currentPage) {
	window.location = "goStudentResource.do?pageVo.currentPage=" + currentPage;
	$("#current").val(currentPage);
	$("#searchForm").submit();
}
