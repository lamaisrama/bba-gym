$(".nav-link").click(function(){ 
   const selected=this.id.substring(1);
   const area = $("#"+selected);
   $(".tab-pane").not(area).removeClass("active");
   $("#"+selected).toggleClass("active");
});



	const ct = document.getElementsByName("category")[0];
	$(ct).on("change",function(){
		
		if($(ct).is(":checked")==true){
			$("input:checkbox[name='category']").prop("checked", true);
		}else{
			$("input:checkbox[name='category']").prop("checked", false);
		}
	})
	
	


