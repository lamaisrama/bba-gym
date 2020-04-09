	let count= 0; 
	let count_photo=0;
	
	function addPhoto(){
	    count_photo++;
	    if(count_photo<4){
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

	function addProgram(){
	    const area = document.querySelector(".div-here");
		    const div=document.querySelector(".program-"+count);
		    count++;
		    const div_row = $("<div>").addClass("row").addClass("program-"+(count));
		    const div_new=$("<div>").addClass("col-lg-10").addClass("col-md-10").addClass("col-sm-12");
		    const tabletag=`<table class="table striped"><tr><td colspan="2"> <label for="">${count+1}번째 프로그램명</label><span style="float:right;"><button type="button" class="btn btn-default btn-sm" onclick="deleteProgram();">삭제</button></span><input type="text" class="form-control" style="clear:both;" name="tp"></td></tr><tr><td><label for="">첫번째 횟수,가격<sub style="color: black;">사이에 반드시 <span style="font-weight:bolder; color:red;">","</span>를 넣어주세요</sub></label><input type="text" class="form-control" name="tp${count}p"></td><td><label for="">두번째 횟수, 가격<sub style="color: black;">사이에 반드시 <span style="font-weight:bolder; color:red;">","</span>를 넣어주세요</sub></label><input type="text" class="form-control" name="tp${count}p"></td></tr><tr><td><label for="">세번째 횟수,가격<sub style="color: black;">사이에 반드시 <span style="font-weight:bolder; color:red;">","</span>를 넣어주세요</sub></label><input type="text" class="form-control" name="tp${count}p"></td><td> <label for="">네번째 횟수, 가격<sub style="color: black;">사이에 반드시 <span style="font-weight:bolder; color:red;">","</span>를 넣어주세요</sub></label><input type="text" class="form-control" name="tp${count}p"></td></tr></table>`;

		    div_new.html($(tabletag));
		    div_new.appendTo(div_row);
		    div_row.appendTo(area);
	}

	function deleteProgram(){
		const area=document.querySelector(".program-"+count);
		console.log(area);
		$(area).remove();
		count--;

	}
	
	
	