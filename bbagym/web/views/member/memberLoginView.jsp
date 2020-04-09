<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.bbagym.model.vo.Member"%>


<%@ include file="/views/common/header.jsp"%>

<script src="<%=request.getContextPath()%>/js/jquery-3.4.1.min.js"></script>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/style.css">

	<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
	<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>





<div class="page-header page-header-xs" data-parallax="true"
	style="background-image: url('<%=request.getContextPath()%>/assets/img/fabio-mangione.jpg');"></div>
<div class="container pt-3 center-info ">
	<link rel="stylesheet" href="css/member-register.css">



	<div class="row">
		<div class="col-lg-8 col-md-8 col-sm-12">
			<h1 class="mt-4" style="text-align: center;">로그인</h1>
			<br>
			<h6 style="text-align: center;">
				<b>BBAGYM Login</b>
			</h6>


			<form action="<%=request.getContextPath()%>/member/login.do"
				method="post" onsubmit="return invalidate();">
				<div>
					<input type="text" class="input-field" placeholder="UserId"
						name="M_ID" id="M_ID" placeholder="ID" value="<%=saveId%>"
						required> <input type="password" class="input-field"
						placeholder="Enter Password" name="M_PW" id="M_PW"
						placeholder="PW" placeholder="비밀번호입력" required> <br><br><input
						type="checkbox" style="float: left" name="saveId" id="saveId"
						<%=!saveId.equals("") ? "checked" : ""%>>아이디 저장
						<div style="float:right">
						<img src="//img.echosting.cafe24.com/skin/base_ko_KR/member/btn_kakao_login.gif" alt="카카오계정 로그인(보류)">
						<img src="//img.echosting.cafe24.com/skin/base_ko_KR/member/btn_naver_login.gif" alt="네이버 로그인">
</div>
						 <br>
<br>
					<button class="submit" style="">Login</button><br>
					<input type="button" class="find" value="회원가입" onclick="location.replace('<%=request.getContextPath()%>/member/enrollMenu.do')"><br> 
					<input type="button" class="find" value="아이디/비밀번호 찾기">



<!-- 카카오톡로그인 


					<a id="kakao-login-btn"></a> 
					<a href="http://alpha-developers.kakao.com/logout"></a>


					<script type='text/javascript'>
						//<![CDATA[
						// 사용할 앱의 JavaScript 키를 설정해 주세요.
						Kakao.init('9b519046b1f235fcc5657c81c6fe8f4e');

						// 카카오 로그인 버튼을 생성합니다.
						Kakao.Auth.createLoginButton({
							container : '#kakao-login-btn',
							success : function(authObj) {
								alert(JSON.stringify(authObj));
							},
							fail : function(err) {
								alert(JSON.stringify(err));
							}
						});
						//
					</script>-->
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
			<br>
			<br>
			<br>
			<br>


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
	padding-left: 40px;
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

.kakao {
	padding: 10px 30px;
	cursor: pointer;
	display: block;
	margin: auto;
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
			<%@ include file="/views/common/footer.jsp"%>