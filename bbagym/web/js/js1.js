/**
 * 
 */


$(function(){
	


    $("#log").mouseover(function(){

            $("#leftbar").css({
            visibility :"visible"
        })
      
    });

    $("#log").click(function(){
        location.reload();
    })

    $("#leftbar").mouseleave(function(){
        $("#leftbar").css({
            visibility: "hidden"
         })
    })


     $("li").hover(function(){
            $(this).css({
                textDecoration :  "none"
            });
            $(this).children().css({
                color : "black"
            })
        },
        function(){
            $(this).children().css({
                color : "white"
            })
        });
    	
    	
       




	
});