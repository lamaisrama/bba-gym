	
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

	function addCount(e){
		//횟수-가격정보 추가할 영역 선택
		
		var div_here=$(e).parentsUntil($(".col-md-8")).last();
		//row생성
		var div_group = $("<div>").addClass("input-group").addClass("mb-3");
		//내부 html 생성
		var div_pre_count=$("<div>").addClass("input-group-prepend").append($("<span>").addClass("input-group-text").html("횟수"));
		var div_pre_price=$("<div>").addClass("input-group-prepend").append($("<span>").addClass("input-group-text").html("가격"));
		
		//input 입력
		var input_count=$("<input>").addClass("form-control").attr({
				type:"text", 
				name:"t-p-count-"+count_program,
				});
		var input_price=$("<input>").addClass("form-control").attr({
				type:"text", 
				name:"t-p-price-"+count_program,
				});
		
		var input_delBtn = $("<input>").addClass("btn").addClass("btn-secondary").addClass("btn-sm").attr({ 
			type : "button",
			onclick: "delCount(this);", 
			value : "삭제" });

		var input_addBtn = $("<input>").addClass("btn").addClass("btn-primary").addClass("btn-sm").attr({
			type : "button", 
			onclick : "addCount(this);",
			value : "추가"});
		
		var div_new=div_group.append(div_pre_count).append(input_count).append(div_pre_price).append(input_price).append(input_delBtn).append(input_addBtn);
		div_here.append(div_new);
	}

	function delCount(e){
		$(e).parent().remove();
	}

	function addProgram(){
		var div_here=$(".div-program-"+count_program);
		count_program++;
		
		var div_1=$("<div>").addClass("row").addClass("div-program-"+count_program);

		var div_2=$("<div>").addClass("col-md-8").addClass("div-t-price-"+count_program);

		var div_3=$("<div>").addClass("form-group").append($("<label>").html("프로그램명")).append($("<input>").addClass("form-control").attr({type:"text",name:"tp"}));
		
		var div_4=$("<div>").addClass("input-group").addClass("mb-3");
		
		var div_5=$("<div>").addClass("input-group-prepend").append($("<span>").addClass("input-group-text").html("횟수"));

		var div_6=$("<input>").addClass("form-control").attr({type:"text", name:"t-p-count-"+count_program});
		
		var div_7=$("<div>").addClass("input-group-prepend").append($("<span>").addClass("input-group-text").html("가격"));
		
		var div_8=$("<input>").addClass("form-control").attr({type:"text", name:"t-p-price-"+count_program});
		
		var div_9=$("<input>").addClass("btn").addClass("btn-secondary").addClass("btn-sm").attr({ 
			type : "button",
			value : "삭제" ,
			
		}).css("cursor","default");

		var div_10= $("<input>").addClass("btn").addClass("btn-primary").addClass("btn-sm").attr({
			type : "button", 
			onclick : "addCount(this);",
			value : "추가"});
		
		div_new=div_1.append(div_2.append(div_3).append(div_4.append(div_5).append(div_6).append(div_7).append(div_8).append(div_9).append(div_10)));

		//앞 프로그램 뒤에 div 추가
		div_here.after(div_new);

	}

	function delProgram(){
		var area=$(".div-program-"+count_program);
		$(area).remove();
		count_program--;
	}
	
	var sel_files=[];

	$(document).ready(function(){
		$(".form-control-file").on("change",handleImgsFilesSelect)
	});
	function handleImgsFilesSelect(e){
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		filesArr.forEach(function(f){
			if(!f.type.match("image.*")){
				alert("확장자는 이미지 확장자만 가능합니다.");
				return;
			}
			sel_files.push(f);

			var reader = new FileReader();

			reader.onload=function(e){
				var img_html = "<img src=\""+e.target.result + "\" width='50' height='40'/>";
				$(".imgs_wrap").append(img_html);
			}
			reader.readAsDataURL(f);
		})
	}