<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/mypageUser.css">


<div class="page-header page-header-xs" data-parallax="true"
	style="background-image: url('<%=request.getContextPath()%>/assets/img/fabio-mangione.jpg');"></div>

<!--************ 왼쪽메뉴 ************-->
<section class="section-container">
	<nav>
		<div class="left-menu-container">
			<div class="profile-img">
				<img src="<%=request.getContextPath()%>/resources/img/ksh.jpeg"
					alt="my image" id="myImage" />
			</div>
			<div class="profile-info">
				<div>
					<span><%=logginMember.getM_NAME()%>님 환영합니다</span>
				</div>
			</div>
			<div class="parent1">
				<a href="http://fb.com/"><img
					src="<%=request.getContextPath()%>/resources/img/fb.png"
					width="30px" overflow="hidden" id="img1"></a> <a
					href="https://www.instagram.com/"><img
					src="<%=request.getContextPath()%>/resources/img/ist.png"
					width="30px" overflow="hidden" id="img2"></a> <a
					href="https://twitter.com/"><img
					src="<%=request.getContextPath()%>/resources/img/twi.png"
					width="30px" overflow="hidden" id="img3"></a>
			</div>
			<div>
				<hr />
				<a class="updateMyProfile" href="<%=request.getContextPath()%>/member/memberEnrollView.do?M_ID=<%=logginMember.getM_ID()%>">회원정보수정</a>
				<a class="updateMyProfile" onclick="removeCheck();" >회원탈퇴</a>
			</div>
	</nav>
	
	
	
	<!--************ 본문 ************-->
	<div class="content-container">
		<h3>
			<span>M</span> <span>Y</span> <span>P</span> <span>A</span> <span>G</span>
			<span>E</span>
		</h3>
		<br>
		<div style="text-align: center; margin-bottom: 20px;">-사용자-</div>
		<div id="table">
			<div id="my">
				<div id="my-1">나의 회원권</div>
				<div id="my-2">아직 활성화된 회원권이 없습니다.</div>
			</div>
			<hr />
			<div id="menu">	
				<div id="menu3">
					My 찜<a href="#myprefer" style="text-decoration: none;">
						<button style="float: right;">></button>
					</a>
					<div>0개</div>
				</div>
				<div id="menu4">
					장바구니<a href="#4" style="text-decoration: none;">
						<button style="float: right;">></button>
					</a>
					<div>0개</div>
				</div>
			</div>
		</div>

		<div id="my-1">나의 센터 회원권</div>
		<div style="width: 95%; height: 150px; margin: 0 auto;">
			<table id="mycenter">
				<tr><th>센터명</th><th>프로그램명</th><th>이용달수</th><th>결제일</th><th>만료일</th><th>내점수</th></tr>
				<tr>
					<td><a href="#">1</a></td>
					<td>2</td>
					<td>3</td>
					<td>4</td>
					<td>5</td>
					<td>6</td>
				</tr>
			</table>
		</div>
		
		<div id="my-1">나의 트레이너 회원권</div>
		<div style="width: 95%; height: 150px; margin: 0 auto;">
			<table id="mytrainer">
				<tr><th>센터명</th><th>프로그램명</th><th>PT이용횟수</th><th>결제일</th><th>내점수</th></tr>
				<tr>
					<td><a href="#">1</a></td>
					<td>2</td>
					<td>3</td>
					<td>4</td>
					<td>5</td>
				</tr>
				
			</table>
		</div>
		
		<div id="my-1">My 찜</div>
		<div style="width: 95%; height: 150px; margin: 0 auto;">
			<table id="myprefer">
				<tr><th>센터명</th><th>주소</th><th>연락처</th><th>평점</th></tr>
				<tr>
					<td><a href="#">1</a></td>
					<td>2</td>
					<td>3</td>
					<td>4</td>
				</tr>
			</table>
		</div>
		
		<div id="my-1">장바구니</div>
		<div style="width: 95%; height: 150px; margin: 0 auto;"></div>

		
		
		<div class="parent">
			<div class="first">
				<img src="<%=request.getContextPath()%>/resources/img/1.png"
					id="img">
				<div>
					<a href="#1">시설등록 요청</a>
				</div>
			</div>
			<div class="second">
				<img src="<%=request.getContextPath()%>/resources/img/2.png"
					id="img">
				<div>
					<a href="#2">공지/이벤트</a>
				</div>
			</div>
			<div class="third">
				<img src="<%=request.getContextPath()%>/resources/img/3.png"
					id="img">
				<div>
					<a href="#3">고객센터</a>
				</div>
			</div>
			<div class="third">
				<img src="<%=request.getContextPath()%>/resources/img/sh.png"
					id="img">
				<div>
					<a href="#3">나의정보</a>
				</div>
			</div>
		</div>

	</div>
</section>

<a class="top" href="#" title="맨위로">TOP</a>

	<script>
			function removeCheck() {
	
				 if (confirm("정말 '탈퇴'하시겠습니까??") == true){    //확인
					location.replace('<%=request.getContextPath()%>/member/memberDelete.do?M_ID=<%=logginMember.getM_ID()%>');
				 }else{   //취소
					 return false;
				 }

				}
		
				var isUsClicked = false;
				function updateMyProfile() {
					var el = document.getElementsByClassName("userinfo-update")[0];
					var back = document
							.querySelectorAll(".content-container>*:not(.popup)");
					console.log(back);
					// back.chi.style = "filter: blur(4px);";
					if (isUsClicked) {
						el.style = "visibility: hidden;";
						isUsClicked = false;
					} else {
						el.style = "visibility: visible;";
						isUsClicked = true;
					}
				}
		</script>

<!-- <div class="paging">
			<a href="##" class="btn_arr prev"> <span class="hide">이전페이지</span>
			</a> <a href="##" class="on">1</a>
			D : 활성화페이지일 경우 : on 처리
			<a href="##">2</a> <a href="##">3</a> <a href="##">4</a> <a href="##">5</a>
			<a href="##" class="btn_arr next"> <span class="hide">다음페이지</span>
			</a> <br> <br> <br>
		</div> -->

<%@ include file="/views/common/footer.jsp"%>