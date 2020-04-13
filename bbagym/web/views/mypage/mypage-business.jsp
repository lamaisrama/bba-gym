<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/mypageUser.css">

<div class="page-header page-header-xs" data-parallax="true"
	style="background-image: url('<%=request.getContextPath()%>/assets/img/fabio-mangione.jpg');"></div>
<section class="section-container">
	
	<nav>
		<!-- 왼쪽메뉴 -->
		<div class="left-menu-container">
			<div class="profile-img">
				<img src="<%=request.getContextPath()%>/resources/img/ksh.jpeg"
					alt="my image" id="myImage" />
			</div>
			<div class="profile-info">
				<div>
					<span>♥<%=logginMember.getM_NAME()%>님 환영합니다♥</span>
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
				<hr>
				<a class="updateMyProfile" href="<%=request.getContextPath()%>/business/businessEnrollView.do?M_ID=<%=logginMember.getM_ID()%>">회원정보수정</a>
				<a class="updateMyProfile" href="" onclick="updateMyProfile()">MY
					찜목록</a> <a class="updateMyProfile" href="" onclick="updateMyProfile()">나의
					회원권</a> <a class="updateMyProfile" href="" onclick="updateMyProfile()">장바구니</a>
				<a class="updateMyProfile"  onclick="removeCheck();">회원탈퇴</a>
				
				<hr>
			</div>

			
	</nav>
	<!-- 본문 -->
	<div class="content-container">
		<h3>
			<span>M</span> <span>Y</span> <span>P</span> <span>A</span> <span>G</span>
			<span>E</span>
		</h3>
		<br>
		<div style="text-align: center;">-사업자-</div>
		
		<div class="parent">
			<div class="first">
				<img src="<%=request.getContextPath()%>/resources/img/1.png"
					id="img">
				<div>
					<a href="#1">MY 시설 등록현황(클릭)</a>
				</div>
			</div>
			<div class="second">
				<img src="<%=request.getContextPath()%>/resources/img/2.png"
					id="img">
				<div>
					<a href="#2">트레이너 등록 현황(클릭)</a>
				</div>
			</div>
			<div class="third">
				<img src="<%=request.getContextPath()%>/resources/img/3.png"
					id="img">
				<div>
					<a href="#3">실시간 상담 내용(클릭)</a>
				</div>
			</div>
		</div>
		
		<div class="category-1">
			<div class="MyEnroll">
				<a name="1" > 내 시설 등록 현황
				</a>
			</div>
			<hr/>
			<table id="table">
				<tr id="tr">
					<th>ID</th>
					<th>이름</th>
					<th>나이</th>
					<th>성별</th>
					<th>연락처</th>
					<th>시설명</th>
					<th>시설 지역</th>
					<th>상태</th>
				</tr>
				<tr>
					<td>user01</td>
					<td>김상학</td>
					<td>27</td>
					<td>남자</td>
					<td>01074947383</td>
					<td>강남피트니스센터</td>
					<td>강남구</td>
					<td>
						<button>진행중</button>
					</td>
				</tr>
				<tr>
					<td>user01</td>
					<td>김상학</td>
					<td>27</td>
					<td>남자</td>
					<td>01074947383</td>
					<td>부처스포츠센터</td>
					<td>경기도 부천시</td>
					<td>
						<button>거절</button>
					</td>
				</tr>
				<tr>
					<td>user01</td>
					<td>김상학</td>
					<td>27</td>
					<td>남자</td>
					<td>01074947383</td>
					<td>강남생활체육센터</td>
					<td>강남구</td>
					<td>
						<button>승인</button>
					</td>
				</tr>
				<tr>
					<td>user01</td>
					<td>김상학</td>
					<td>27</td>
					<td>남자</td>
					<td>01074947383</td>
					<td>KH스포츠센터</td>
					<td>역삼동</td>
					<td>
						<button>승인</button>
					</td>
				</tr>
			</table>
			
			<div class="MyEnroll2">
				<a name="2"> <span>트레이너 등록 현황</span>
				</a>
			</div>
			<hr/>
			<div></div>
			<table id="table">
				<tr id="tr"">
					<th>ID</th>
					<th>이름</th>
					<th>나이</th>
					<th>성별</th>
					<th>연락처</th>
					<th>등록종류</th>
					<th>등록일시</th>
					<th>상태</th>
				</tr>
				<tr>
					<td>user01</td>
					<td>김상학</td>
					<td>27</td>
					<td>남자</td>
					<td>01074947383</td>
					<td>헬스</td>
					<td>20/04/01</td>
					<td>
						<button>심사중</button>
					</td>
				</tr>
				<tr>
					<td>user01</td>
					<td>김상학</td>
					<td>27</td>
					<td>남자</td>
					<td>01074947383</td>
					<td>요가</td>
					<td>20/04/01</td>
					<td>
						<button>승인완료</button>
					</td>
				</tr>
				<tr>
					<td>user01</td>
					<td>김상학</td>
					<td>27</td>
					<td>남자</td>
					<td>01074947383</td>
					<td>피트니스</td>
					<td>20/04/01</td>
					<td>
						<button>심사중</button>
					</td>
				</tr>
				<tr>
					<td>user01</td>
					<td>김상학</td>
					<td>27</td>
					<td>남자</td>
					<td>01074947383</td>
					<td>피트니스</td>
					<td>20/04/01</td>
					<td>
						<button>심사중</button>
					</td>
				</tr>
				<tr>
					<td>user01</td>
					<td>김상학</td>
					<td>27</td>
					<td>남자</td>
					<td>01074947383</td>
					<td>피트니스</td>
					<td>20/04/01</td>
					<td>
						<button>심사중</button>
					</td>
				</tr>
				<tr>
					<td>user01</td>
					<td>김상학</td>
					<td>27</td>
					<td>남자</td>
					<td>01074947383</td>
					<td>수영</td>
					<td>20/04/01</td>
					<td>
						<button>심사중</button>
					</td>
				</tr>
				<tr>
					<td>user01</td>
					<td>김상학</td>
					<td>27</td>
					<td>남자</td>
					<td>01074947383</td>
					<td>헬스</td>
					<td>20/04/01</td>
					<td>
						<button>승인완료</button>
					</td>
				</tr>
				<tr>
					<td>user01</td>
					<td>김상학</td>
					<td>27</td>
					<td>남자</td>
					<td>01074947383</td>
					<td>헬스</td>
					<td>20/04/01</td>
					<td>
						<button>승인완료</button>
					</td>
				</tr>
				<tr>
					<td>user01</td>
					<td>김상학</td>
					<td>27</td>
					<td>남자</td>
					<td>01074947383</td>
					<td>헬스</td>
					<td>20/04/01</td>
					<td>
						<button>승인완료</button>
					</td>
				</tr>
				<tr>
					<td>user01</td>
					<td>김상학</td>
					<td>27</td>
					<td>남자</td>
					<td>01074947383</td>
					<td>수영</td>
					<td>20/04/01</td>
					<td>
						<button>승인완료</button>
					</td>
				</tr>
			</table>
	
			<div class="MyEnroll3">
				<a name="3"> <span>실시간 상담 내용</span>
				</a>
			</div>
	<hr/>
			<a class="top" href="#" title="”맨"위로">TOP</a>
	
		</div>
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
</section>



<%@ include file="/views/common/footer.jsp"%>