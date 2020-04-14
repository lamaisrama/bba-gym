/**
 * 
 */


$(function(){
	
	
	$("#cpwd").blur(function(){
        const pwd=$("#pwd").val();
        const cpwd=$("#cpwd").val();

        if(pwd==cpwd){
            $("#result").html("비밀번호가 일치합니다.").css("color","green");
        }else{
            $("#result").html("비밀번호가 일치하지 않습니다.").css("color","red");
        }

    })
    


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

    $(function(){
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

    $($("#box").children()[1]).click(function(){
        location.href="main2.html";
    });
    


	
});