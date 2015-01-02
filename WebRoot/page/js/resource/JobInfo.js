function del(info,fail) {
	if(confirm(info)) {
		$.post(
				"doJobDel.do",
				{"jobVo.id":$("#job_id").val()},
				function(code) {
					if(code==400) {
						alert(fail);
					} else {
						window.location.href="goPublishJob.do"
					}
				},"json"
		);
	}
}
