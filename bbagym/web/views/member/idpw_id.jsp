<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.bbagym.model.vo.Member"%>
<%
	Member logginMember = (Member) session.getAttribute("logginMember");

Cookie[] cookies = request.getCookies();
String saveId = "";
if (cookies != null) {
	for (Cookie c : cookies) {
		if (c.getName().equals("saveId")) {
			saveId = c.getValue();
		}
	}
}
%>  


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
			<h1 class="mt-4" style="text-align: center;"></h1>
			<br>
			<h3 style="text-align: center;">
				
			</h3>

			<div>
	<!-- 		<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br> -->


			<form action="<%=request.getContextPath()%>/member/searchId.do" method="post" onsubmit="">
				<div style="width:50%;padding-top:250px">
					<div style="text-align:center;">♥회원가입 시 등록한 아이디는 <br><br><strong><h1> [ <%=logginMember.getM_ID()%> ]</h1></strong><br> 입니다.♥</div>
					

				</div>
				<br>											
				<button type="button"class="submit" onclick="location.replace('<%=request.getContextPath()%>/member/logoutgologin.do?M_ID=<%=logginMember.getM_ID()%>')">로그인페이지로 이동</button>
				<br><button type="button"class="submit" onclick="location.replace('<%=request.getContextPath()%>/member/logout.do?M_ID=<%=logginMember.getM_ID()%>')">메인 화면으로 돌아가기</button>
				
				<br>
				<button type="button"class="submit" onclick="location.replace('<%=request.getContextPath()%>/member/logoutgopw.do?M_ID=<%=logginMember.getM_ID()%>')">비밀번호 찾기</button>
				<br>
		</div>
		</form>


	</div>










	<br> <br> <br> <br><br> <br>


	<style>
* {
	margin: 0;
	padding: 0;
	font-family: sans-serif;
	/* border: 1px solid rgb(211, 208, 208); */
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