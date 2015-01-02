function messageModal(content) {
	$("#messageModalBody p").html(content);
	$("#messageModal").modal({
		show:true
	});
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
						window.location.href="goStudent.do"
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
						window.location.href="goStudent.do"
					}
				},"json"
		);
	}
}