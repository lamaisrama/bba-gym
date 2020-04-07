<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
	<%@ page
	import="com.bbagym.model.vo.Member"%>

	
<%@ include file="/views/common/header.jsp"%>

<script src="<%=request.getContextPath()%>/js/jquery-3.4.1.min.js"></script>

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">



<div class="page-header page-header-xs" data-parallax="true"style="background-image: url('<%=request.getContextPath()%>/assets/img/fabio-mangione.jpg');"></div>
<div class="container pt-3 center-info ">
<link rel="stylesheet" href="css/member-register.css">

    <style>
    * {
    margin: 0;
    padding: 0;
    font-family: sans-serif;
}

.togglebtn {
    
    padding: 10px 30px;
    cursor: pointer;
    background: transparent;
    border: 0;
    outline: none;
    position: relative;
}
#btn {
    
    top: 0;
    left: 0;
    position: absolute;
    width: 110px;
    height: 100%;
    background: linear-gradient(to right, #fffff6, rgb(255, 199, 199));
    border-radius: 30px;
    transition: .5s;
}
.input-group {
    
    top: 90px;
    position: absolute;
    width: 280px;
    transition: .5s;
}
.input-field {
    
    width: 100%;
    padding: 10px 0;
    margin: 5px 0;
    border: none;
    border-bottom: 1px solid #999;
    outline: none;
    background: transparent;
 }

.submit {
    
    width: 85%;
    padding: 10px 30px;
    cursor: pointer;
    display: block;
    margin: auto;
    background: linear-gradient(to right, #fffff6, rgb(255, 199, 199));
    border: 0;
    outline: none;
    border-radius: 30px;
}
.find {

    width: 85%;
    padding: 10px 30px;
    cursor: pointer;
    display: block;
    margin: auto;
    background: linear-gradient(to right, #fffff6, rgb(255, 199, 199));
    border: 0;
    outline: none;
    border-radius: 30px;

}
.checkbox {
    
    margin: 30px 10px 30px 0;
}
span {
    
    color: #777;
    font-size: 12px;
    bottom: 126px; /*68px*/
    position: absolute;
}
#login {
    
    left: 50px;
}
      </style>   

	<div class="row">
		<div class="col-lg-8 col-md-8 col-sm-12">
			<h1 class="mt-4" style="text-align: center;">로그인</h1><br>
			<h6 style="text-align: center;">
				<b>Member Login</b>
			</h6>
			
			
			<form action="<%=request.getContextPath()%>/member/login.do" method="post" onsubmit="return invalidate();">
				<div>
                <input type="text" class="input-field" placeholder="UserId" name="M_ID" id="M_ID" placeholder="ID" value="<%=saveId%>" required>
                <input type="password" class="input-field" placeholder="Enter Password" name="M_PW" id="M_PW" placeholder="PW" placeholder="비밀번호입력" required>
                <input type="checkbox" class="checkbox" name="saveId" id="saveId" <%=!saveId.equals("") ? "checked" : ""%> >아이디 저장
                <button class="submit">Login</button>
                <br>
                <input type="button" class="find" value="아이디/비밀번호 찾기">
                </div>
            </form>
		
     <script>
			$(function() {//onload;

			});
			function invalidate() {
				//유효성검사 -> 입력받는 값이 내가 원한대로 입력할 수 있게 확인
				// 예) 아이디는 4글자이상, 영문자포함,숫자포함 그외는 안됨!->정규표현식
				const userId = $("#userId").val();
				const password = $("#password").val();
				if (userId.trim().length == 0) {
					alert("아이디를 입력하세요");
					$("#userId").focus();
					return false;//전송중단!
				}
				if (password.trim().length == 0) {
					alert("비밀번호를 입력하세요");
					$("#password").focus();
					return false;
				}
				return true;
			}
		</script>
            <br><br><br><br>
	<%@ include file="/views/common/footer.jsp"%>