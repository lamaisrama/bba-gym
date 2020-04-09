
		
	


$(function(){
	
	$(".nav-link").click(function(){ 
		   const selected=this.id.substring(1);
		   const area = $("#"+selected);
		   $(".tab-pane").not(area).removeClass("active");
		   $("#"+selected).toggleClass("active");
		});

	const ct = document.getElementsByName("category")[0];
	const ctAll = document.getElementsByName("category");
	
	//전체 체크시 모든 체크박스 체크,전체 언체크시 모든 체크 언체크
	$(ct).on("change",function(){
		
		if($(ct).is(":checked")==true){
			$("input:checkbox[name='category']").prop("checked", true);
		}else{
			$("input:checkbox[name='category']").prop("checked", false);
		}
	})
	
	//카테고리 checkbox에서 전체를 제외한 모든 박스가 클리되면 전체 체크, 안되어있으면 전체 언체크
	$(ctAll).not(ct).on("click",function(){
		
		if($(ct).is(":checked")==true){
				$(ct).prop("checked",false);
			
		}else if($(ct).is(":checked")==false){
			for(var i=1;i<8;i++){
				if($($(ctAll)[i]).is(":checked")==false){
					break;
				}
				if(i==7){
					$(ct).prop("checked",true);
				}
			}
		}
	})
	
	// 카테고리 클릭에 따라 검색 버튼 toggle 정렬 클릭시 fadein
	$("#acategory").on("click",function(){
		$(".searchBox").find("button").fadeToggle(500);
	});
	
	$("#asort").on("click",function(){
		$(".searchBox").find("button").fadeIn(500);
	})
	

})

	