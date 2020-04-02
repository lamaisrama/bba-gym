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
            visibility:"visible"
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
        $("a").hover(function(){
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
    
    function validate(){
        const id=document.getElementById("userid");
        const pwd=document.getElementById("pwd");
        const cpwd=document.getElementById("cpwd");

        var reg=/^[a-zA-Z0-9]{5,15}$/; 


        if(!reg.test(id.value)){    
            alert("아이디 영/숫자 5글자 이상입니다");
            return false;
        };

        reg= /(?=.*\d{0,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{2,50}).{8,50}$/;

        if(!reg.test(pwd.value)){
            alert("비밀번호 특수문자 1글자이상,8글자 이상입니다.");
            return false;
        }

        if(pwd.value != cpwd.value){
            alert("비밀번호가 같지 않습니다.")
            return false;
        }

        return true;
    };

	
});