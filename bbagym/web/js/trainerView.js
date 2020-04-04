$("#searchKeyword").keydown(function(key){
            		if(key.keyCode==13){
            		var type=$("#search-type").find(":selected").val()
            		var searchKeyword=$("#searchKeyword").val()
				
            		location.replace("<%=request.getContextPath() %>/trainer/trainerFind.do?type="+type+"&searchKeyword="+searchKeyword);
            		
            		}
            	});


$(".content-box-outer").on("click",function(){
    var c = $(event.target).find("input").val();
    console.log(c);
})
