<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.bbagym.common.MailSend"  %>
<%

String M_EMAIL = request.getParameter("M_EMAIL");
String ouath = request.getParameter("ouath");
MailSend ms = new MailSend();
ms.gmailSend(ouath,M_EMAIL); 
 

%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>

	인증번호 : <input type="text" id="certify">
	<button type="button" onclick="certify();">인증</button>
	<div id="result"></div>
	<p id="authTime" class="auth_time"></p>
	<input type="hidden" id="intervalId"/>
	
</body>


<script>

$(function(){
	var intervalId = $('#intervalId').val();
	var ouath = <%=ouath %>;
	
	dailyMissionTimer(2.99);

	function dailyMissionTimer(duration) {		
		
	    var timer = duration * 60;
	    var minutes, seconds;

	    var interval = setInterval(function(){

	    	$('#intervalId').val(interval);
	        minutes = parseInt(timer / 60 % 60, 10);
	        seconds = parseInt(timer % 60, 10);
			
	        minutes = minutes < 10 ? "0" + minutes : minutes;
	        seconds = seconds < 10 ? "0" + seconds : seconds;
			$('#authTime').text(minutes + " : " + seconds);

	        if (--timer < 0) {
	            timer = 0;
	            clearInterval(interval);
	            opener.alert("시간이 초과하였습니다 다시 인증해주세요.");
				self.close();
	        }
	    }, 1000);
	}
	

	certify = function(){
		
		var certify = $("#certify").val();
		
		if(certify==ouath){
			opener.alert("인증성공");
			opener.document.getElementById("verifyEmail").value=1;
			self.close();
		}else{
			opener.alert("인증실패!");
			opener.document.getElementById("verifyEmail").value=2;
			self.close();
		}
	}
})


</script>


</html>