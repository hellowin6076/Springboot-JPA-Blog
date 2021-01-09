let index = {
	init:function(){
		$("#btn-save").on("click",()=>{
			this.save();
		});

		$("#btn-update").on("click",()=>{
			this.update();
		});
	},
	
	save: function(){
		//alert('called users save');
		let data = {
			username:$("#username").val(),
			password:$("#password").val(),
			email:$("#email").val()
		};
		
		
		$.ajax({
			type:"POST",
			url:"/auth/joinProc",
			data:JSON.stringify(data),
			contentType:"application/json; charset=utf-8",
			dataType:"json"
		}).done(function(resp){
		
		if(resp.status === 500){
				alert("join failed!");
		}else{
			alert("join complete!");
			location.href = "/";
		}
		
		}).fail(function(error){
			alert(JSON.stringify(error));
		});
	},
	
		update: function(){
		//alert('called users save');
		let data = {
			id:$("#id").val(),
			username:$("#username").val(),
			password:$("#password").val(),
			email:$("#email").val()
		};
		
		$.ajax({
			type:"PUT",
			url:"/user",
			data:JSON.stringify(data),
			contentType:"application/json; charset=utf-8",
			dataType:"json"
		}).done(function(resp){
			alert("Update complete!");
			location.href = "/";
		}).fail(function(error){
			alert(JSON.stringify(error));
		});
	},
}

index.init();