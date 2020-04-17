	
	let count_photo=0;
	let count_program= 0; 
	
	function addPhoto(){
	    count_photo++;
	    if(count_photo<5){
	        const area=$(".div-photo");
	        const new_Input=$("<input>").attr("class","form-control-file photo-").attr("id","photo-"+count_photo).attr("name","photo-"+count_photo).attr("type","file");
	        //지우는 버튼 추가 해야함
	        $(new_Input).appendTo($(area));
	
	    }else{
	        alert("최대 개수를 초과하였습니다.");
	    }
	    
	}
	
	function deletePhoto(){
	    //구현해야 함
	}

	function addCount(){
		console.log(count_program);
		var div_here=$(".div-t-price-"+count_program);
		var div_row = $("<div>").addClass("form-group").addClass("row");
		var div_count= $("<div>").addClass("col-xs-3").append($("<label>").	html("횟수")).append($("<input>").attr({
			type:"text",
			name:"t-p-count-"+count_program,
			}).addClass("form-control"));

		var div_price=$("<div>").addClass("col-xs-7").append($("<label>").		html("가격")).append($("<input>").attr({
			type:"text",
			name:"t-p-price-"+count_program,
			}).addClass("form-control"));

		var div_btn=$("<div>").addClass("col-xs-2");

		var btn_add=$("<button>").attr("type","button").addClass("btn").addClass("btn-sm").addClass("btn-t-price").addClass("btn-primary").attr("onclick","addCount();").html("추가");

		var btn_del=$("<button>").attr("type","button").addClass("btn").addClass("btn-sm").addClass("btn-t-price").addClass("btn-warning").attr("onclick","delCount(this)").html("삭제");

		div_btn.append(btn_add).append(btn_del);
		div_row.append(div_count).append(div_price).append(div_btn);
		div_here.append(div_row);
	}

	function delCount(e){
		$(e).parent().parent().remove();
	}

	function addProgram(){
		var div_here=$(".div-program-"+count_program);
		count_program++;
		
		var div_1=$("<div>").addClass("row").addClass("div-program-"+count_program);

		var div_2=$("<div>").addClass("col-md-8").addClass("div-t-price-"+count_program);

		var div_3=$("<div>").addClass("form-group").append($("<label>").html("프로그램명")).append($("<input>").addClass("form-control").attr({type:"text",name:"tp"}));
		
		var div_4=$("<div>").addClass("form-group").addClass("row");
		
		var div_5=$("<div>").addClass("col-xs-3").append($("<label>").html("횟수")).append($("<input>").addClass("form-control").attr({type:"text", name:"t-p-count-"+count_program}));
		
		var div_6=$("<div>").addClass("col-xs-7").append($("<label>").html("가격")).append($("<input>").addClass("form-control").attr({type:"text", name:"t-p-price-"+count_program}));
		
		var div_7=$("<div>").addClass("col-xs-2").append($("<button>").addClass("btn").addClass("btn-primary").addClass("btn-sm").addClass("btn-t-price").attr({type:"button", onclick:"addCount();"}).html("추가"));
		
		div_new=div_1.append(div_2.append(div_3).append(div_4.append(div_5).append(div_6).append(div_7)));
		div_here.after(div_new);

	}

	function delProgram(){
		var area=$(".div-program-"+count_program);
		$(area).remove();
		count_program--;
	}
	