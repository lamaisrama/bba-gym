<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.bbagym.model.vo.Member"%>

<%@ include file="/views/common/header.jsp"%>
<%
	Member info = (Member) session.getAttribute("info");
%>

<script src="<%=request.getContextPath()%>/js/jquery-3.4.1.min.js"></script>

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/searchid.css">

<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>

<div class="page-header page-header-xs" data-parallax="true"
	style="background-image: url('<%=request.getContextPath()%>/assets/img/fabio-mangione.jpg');"></div>
<div class="container pt-3 center-info ">







	<div id="container">
		<div>
			<h1 class="mt-4" style="text-align: center;">ID SEARCH</h1>
			<h3 style="text-align: center;">
				<p>아이디는 가입시 입력하신 이메일을 통해 찾을 수 있습니다.</p>
			</h3>

			<div id="search-id"><br>
				<form action="<%=request.getContextPath()%>/member/searchId.do"method="post" onsubmit="return fn_enroll_validate();">
					<div>
						<input type="text" class="form-control" name="M_NAME" id="M_NAME"
							placeholder="NAME" required> <br>
						<button type="button" class="btn btn-warning" onclick="verify();" style="margin-bottom : 5px;">인증하기</button>
						<input type="email" class="form-control" name="M_EMAIL"id="M_EMAIL" placeholder="EMAIL" required
							<%if (info != null && info.getM_EMAIL() != null) {%>
							value="<%=info.getM_EMAIL()%>" readonly <%}%> required>
						<br> <input type="hidden" id="verifyEmail" value="2">
						<br>

					</div>

					<button id="bt1" >아이디 찾기</button>
				


				</form>
			</div>
			
			<div id="bt2">
				<button type="button"class="submit" onclick="location.replace('<%=request.getContextPath()%>/member/logoutgologin.do')">로그인페이지로이동</button>
				<button type="button"class="submit" onclick="location.replace('<%=request.getContextPath()%>/member/logout.do')">메인 화면으로돌아가기</button>
				<button type="button"class="submit" onclick="location.replace('<%=request.getContextPath()%>/member/pw.do')">비밀번호찾기</button>
			</div>

		</div>

	</div>


</div>

<script>
	function fn_enroll_validate() {
	
		var verifyEmail = $("#verifyEmail").val();
		//현재text에 입력되어 있는 값
		if(verifyEmail==2){
			alert("이메일 인증이 되어있지 않습니다.");
			$("M_EMAIL").focus();
			return false;
		}
		
		return true;
	} 
		
		   verify= function() {
			  // 이메일 검증 스크립트 작성
			  var M_EMAIL = document.querySelector("#M_EMAIL").value;
			  var ouath =generateRandom(10000000,999999999);
			  var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			  // 검증에 사용할 정규식 변수 regExp에 저장

			  if (M_EMAIL.match(regExp) != null) {
				  

	 			window.open("<%=request.getContextPath()%>/views/member/mail_certification.jsp?M_EMAIL="
							+ M_EMAIL + "&ouath=" + ouath, "",
					"width=370, height=360");
			code = ouath;
		} else {
			alert('이메일 형식을 다시 확인해주세요');
		}
	};

	var generateRandom = function(min, max) {
		var ranNum = Math.floor(Math.random() * (max - min + 1)) + min;
		return ranNum;
	}
</script>








<br>
<br>
<br>
<br>



<%@ include file="/views/common/footer.jsp"%>