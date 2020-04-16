<%@page import="com.bbagym.model.vo.MypageUser"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	List<MypageUser> cmembership = (List)request.getAttribute("cmembership");
	List<MypageUser> tmembership = (List)request.getAttribute("tmembership");
	List<MypageUser> myPerfer = (List)request.getAttribute("myPerfer");
%>

<%@ include file="/views/common/header.jsp"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/mypageUser.css">


<div class="page-header page-header-xs" data-parallax="true"
	style="background-image: url('<%=request.getContextPath()%>/assets/img/fabio-mangione.jpg');"></div>

<!--************ 왼쪽메뉴 ************-->
<section class="section-container">
	<nav>
		<div class="left-menu-container">
			<div class="profile-img">
				<img src="<%=request.getContextPath()%>/upload/member/<%=logginMember.getM_IMAGE() %>"
					alt="my image" id="myImage" />
			</div>
			<div class="profile-info">
				<div>
					<span><%=logginMember.getM_NAME()%>님 환영합니다</span>
				</div>
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
				<div id="my-2"><%=cmembership.size()+tmembership.size() %>개</div>
			</div>
			<hr />
			<div id="menu">	
				<div id="menu3">
					My 찜<a href="#myprefer" style="text-decoration: none;">
						<button style="float: right;">></button>
					</a>
					<div><%=myPerfer.size() %>개</div>
				</div>
			</div>
		</div>

		<div id="my-3">나의 센터 회원권</div>
		<div style="width: 95%; height: auto; margin: 0 auto;">
			<table id="mycenter">
				<tr><th>센터명</th><th>프로그램명</th><th>이용달수</th><th>결제일</th><th>만료일</th><th>내점수</th></tr>
				<%for(MypageUser my : cmembership) {%>
				<tr>
					<td><a href="<%=request.getContextPath()%>/center/centerDetail.do?cCode=<%=my.getCcode() %>"><%=my.getCname() %></a></td>
					<td><%=my.getPname() %></td>
					<td><%=my.getMonth() %></td>
					<td><%=my.getPaydate() %></td>
					<td><%=my.getExpiredate() %></td>
					<td><%=my.getScore() %></td>
				</tr>
				<%} %>
			</table>
		</div>
		
		<div id="my-3">나의 트레이너 회원권</div>
		<div style="width: 95%; height: auto; margin: 0 auto;">
			<table id="mytrainer">
				<tr><th>센터명</th><th>프로그램명</th><th>PT이용횟수</th><th>결제일</th><th>내점수</th></tr>
				<%for(MypageUser my : tmembership) {%>
				<tr>
					<td><a href="<%=request.getContextPath()%>/center/centerDetail.do?cCode=<%=my.getCcode() %>"><%=my.getCname()==null ? "프리랜서" : my.getCname()%></a></td>
					<td><%=my.getPname() %></td>
					<td><%=my.getCount() %></td>
					<td><%=my.getPaydate() %></td>
					<td><%=my.getScore() %></td>
				</tr>
				<%} %>
				
			</table>
		</div>
		
		<div id="my-3">My 찜</div>
		<div style="width: 95%; height: auto; margin: 0 auto;">
			<table id="myprefer">
				<tr><th>센터명</th><th>주소</th><th>연락처</th><th>평점</th></tr>
				<%for(MypageUser my : myPerfer) {%>
				<tr>
					<td><a href="<%=request.getContextPath()%>/center/centerDetail.do?cCode=<%=my.getCcode() %>"><%=my.getCname()==null ? "프리랜서" : my.getCname()%></a></td>
					<td><%=my.getAddress() %></td>
					<td><%=my.getPhone() %></td>
					<td><%=my.getAvgscore() %></td>
				</tr>
				<%} %>
			</table>
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