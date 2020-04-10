<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>패스워드 변경</title>
    <style>
    div#updatePassword-container{
      /*   background: green; */
    }
    div#updatePassword-container table {
        margin:0 auto;
        border-spacing: 20px;
    }
    div#updatePassword-container table tr:last-of-type td {
        text-align:center;
    }
    </style>
</head>
<body>
<div id="updatePassword-container">
		<form name="" action="<%=request.getContextPath()%>/member/updatePasswordEnd" method="post" >
			<table>
				<tr>
					<th>현재 비밀번호</th>
					<td><input type="password" name="password" id="password" required></td>
				</tr>
				<tr>
					<th>변경할 비밀번호</th>
					<td>
						<input type="password" name="password_new" id="password_new" required>
					</td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td>	
						<input type="password" id="password_chk" required><br>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" onclick="return password_validate();" value="변경" />&nbsp;
						<input type="button" onclick="self.close();" value="닫기" />						
					</td>
				</tr>
			</table>
			<input type="hidden" name="M_ID" value="<%=request.getParameter("M_ID") %>" />
		</form>
	</div>
	<script>
		function password_validate(){
			var pw=document.querySelector("#password_new").value;
			var pwck=document.querySelector("#password_chk").value;
			if(pw!=pwck){
				alert("새 패스워드가 일치하지 않습니다.");
				return false;
			}
			return true;
		}
	</script>
</body>
</html>



