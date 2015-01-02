function messageModal(content) {
	$("#messageModalBody p").html(content);
	$("#messageModal").modal({
		show:true
	});
	
}