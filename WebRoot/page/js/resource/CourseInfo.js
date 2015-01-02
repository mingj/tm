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
			if(type) {
				$("#fileType").val(type);
			}
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
	    	 window.location.reload();
	     }
	});
	
	 
}



function del(info,fail) {
	if(confirm(info)) {
		$.post(
				"doCourseDel.do",
				{"courseVo.id":$("#course_id").val()},
				function(code) {
					if(code==400) {
						alert(fail);
					} else {
						window.location.href="goCourseManager.do"
					}
				},"json"
		);
	}
}

function delFile(info,fail,file_id) {
	if(confirm(info)) {
		$.post(
				"doResourceDel.do",
				{"resourceVo.id":file_id},
				function(code) {
					if(code==400) {
						alert(fail);
					} else {
						window.location.reload();
					}
				},"json"
		);
	}
}