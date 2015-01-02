function goPage(currentPage) {
	window.location = "goTeachResource.do?pageVo.currentPage=" + currentPage;
	$("#current").val(currentPage);
	$("#searchForm").submit();
}

function delConfirm(id) {
	$("#file_id").val(id);
	$("#messageModal").modal({
		show:true
	});
}

function del(success,fail) {
	$.post(
			"doResourceDel.do",
			{"resourceVo.id":$("#file_id").val()},
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


function uploadWin(type){
	$("#fileInput").val("");
	$.post(
		"main/queryDictionaryByJson.do",
		{"form.dictionaryKey":"RESOURCE_TYPE"},
		function(data){
			var html = "";
			for(var i=0; i<data.length; i++) {
				html += "<option value=\""+ data[i].dictionary_value + "\">"+data[i].dictionary_name+"</option>";
			}
			$("#fileType").html(html);
			$("#fileModel").modal({
				show:true
			});
		},"json"
	)
}

function upload(){
	$("#fileForm").ajaxSubmit({
		 type: $("#fileForm").attr("method"),
	     url: $("#fileForm").attr("action"),
	     dataType: "json",
	     success: function(result){
	    	 message.alert(result);
	    	 $("#fileModel").modal({
					show:false
			 });
	    	 window.location.href = "goTeachResource.do";
	     }
	});
	
	 
}

