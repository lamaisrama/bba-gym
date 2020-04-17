
		let count= 0; 
		let count_photo=0;

		function addPhoto(){
		    count_photo++;
		    if(count_photo<5){
		        const area=$(".div-photo");
		        const new_Input=$("<input>").attr("class","form-control-file photo-").attr("name","c-photo"+count_photo).attr("type","file");
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
		    const div_new=$("<div>").addClass("col-lg-8").addClass("col-md-9").addClass("col-sm-12");
		    

		    // const div_1=document.createElement("div");
		    // div_1.classList.add("row");
		    // div_1.classList.add("program-"+(count+1));
		    // console.log(div_1);
		    // const div_2 = document.createElement("div");
		    // div_2.classList.add("col-lg-8");
		    // div_2.classList.add("col-md-9");
		    // div_2.classList.add("col-sm-12");
		    
		    const tabletag=`<table class="table striped"><tr><td colspan="2"> <label for="">${count+1}번째 프로그램명</label><span style="float:right;"><button type="button" class="btn btn-default btn-sm" onclick="deleteProgram();">삭제</button></span><input type="text" class="form-control" style="clear:both;" name="cp"></td></tr><tr><td><label for="">1개월 가격</label><input type="text" class="form-control" name="cp${count}p"></td><td><label for="">3개월 가격</label><input type="text" class="form-control" name="cp${count}p"></td></tr><tr><td><label for="">6개월 가격</label><input type="text" class="form-control" name="cp${count}p"></td><td> <label for="">12개월 가격</label><input type="text" class="form-control" name="cp${count}p"></td></tr></table>`;

		    div_new.html($(tabletag));
		    div_new.appendTo(div_row);
		    div_row.appendTo(area);

		}

		function deleteProgram(){
		    console.log('삭제 전 '+count);
		    const area=document.querySelector(".program-"+count);
		    console.log(area);
		    $(area).remove();
		    count--;

		}

