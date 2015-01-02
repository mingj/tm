function checkRole(o) {
	var id = $(o).attr("id");
	if(id == "teacher") {
		$("#student").attr("checked","");
	} else if(id == "student") {
		$("#teacher").attr("checked","");
	}
}