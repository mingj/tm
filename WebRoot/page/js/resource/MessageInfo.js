function del(info,fail) {
	if(confirm(info)) {
		$.post(
				"doMessageDel.do",
				{"messageVo.id":$("#message_id").val()},
				function(code) {
					if(code==400) {
						alert(fail);
					} else {
						window.location.href="goMessageManager.do"
					}
				},"json"
		);
	}
}
