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
			<h1 class="mt-4" style="text-align: center;">ID/PW SEARCH</h1>
			<br><br><br>
			<h3 style="text-align: center;">
				<b>아이디찾기</b>
				<p>아이디는 가입시 입력하신 이메일을 통해 찾을 수 있습니다.</p>
			</h3>

			<div>
				<form action="<%=request.getContextPath()%>/member/searchId.do" method="post" >
					<div>
					<input type="text" class="form-control" name="M_NAME" id="M_NAME" placeholder="   이름" required> <br>
					<input type="email" class="form-control" name="M_EMAIL" id="M_EMAIL"  placeholder="   이메일" required> <br>
				
					<br>

					</div>
					
					<button class="submit" style="">찾기</button>
					<br>
			</div>
			</form>

			<br> <br>
			<h3 style="text-align: center;">
				<b>비밀번호찾기</b>
				<p>비밀번호는 이름, 가입한 아이디, 이메일을 통해 찾으실 수 있습니다.</p>
			</h3>


			<form action="<%=request.getContextPath()%>/member/searchPw.do"method="post" >
				<div>
					<input type="text" class="form-control" name="M_ID" id="M_ID" placeholder="   아이디"  required> <br>
					<input type="text" class="form-control" name="M_NAME" id="M_NAME" placeholder="   이름" required> <br>
					<input type="email" class="form-control" name="M_EMAIL" id="M_EMAIL"  placeholder="   이메일" required><br>
					<br>

				</div>
				<br> <br>
				<button class="submit" style="">찾기</button>
				<br>
		</div>
		</form>


	</div>










	<br> <br> <br> <br>


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