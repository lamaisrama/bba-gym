<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <% 
    	boolean isUseable=(boolean)request.getAttribute("isUseable"); 
    	String userId=request.getParameter("M_ID");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중복확인</title>
</head>
<body>
<div id="checkid-container">

			<%if(!isUseable){ %>
				[<span><%=userId %></span>]는 사용이 가능합니다.
				<br><br>
				<button	type='button' onclick="setUserId();">닫기</button>
			<%}else{ %>
				[<span><%=userId %></span>]는 이미 사용 중 입니다.
				<br><br>
				<input type="text" id="userId" 
				placeholder="아이디를 입력하세요"
				/>&nbsp;&nbsp;<button type="button" onclick="fn_duplicate();" >중복검사</button>
			<%} %>
			
	</div>
	<script>
		function fn_duplicate(){
			var id=document.querySelector("#userId").value;
			if(id.trim().length<4){
				alert("아이디를 4글자 이상 입력하세요.");
			return;
			}
		location.replace('<%=request.getContextPath()%>/member/userIdCheck.do?M_ID='+id);
	}
		
		function setUserId(){
			//부모창에 있는 userId입력창에 userId값을 넣기!
			opener.document.getElementById("userId_").value='<%=userId%>';
			self.close();
		}
		
		
	</script>
</body>
</html>