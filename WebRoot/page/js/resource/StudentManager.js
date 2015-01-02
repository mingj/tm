function goPage(currentPage) {
//	window.location = "goMessageManager.do?pageVo.currentPage=" + currentPage;
	$("#current").val(currentPage);
	$("#searchForm").submit();
}
