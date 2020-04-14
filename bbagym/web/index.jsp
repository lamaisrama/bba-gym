<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding
	="UTF-8"%>
<%-- <%@ include file="/views/common/header.jsp"%>  --%>
<%@ page	



	import="com.bbagym.model.vo.Member"%>
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

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>bbagym</title>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/css1.css">
	<link href="<%=request.getContextPath() %>/assets/css/bootstrap.min.css" rel="stylesheet" />
	<link href="<%=request.getContextPath() %>/assets/css/paper-kit.css?v=2.2.0" rel="stylesheet" />
	<link href="<%=request.getContextPath() %>/assets/demo/demo.css" rel="stylesheet" />
	<!-- Jquery File -->
	<script src="<%=request.getContextPath()%>/js/jquery-3.4.1.min.js"></script>
</head>
<body>    


	<video autoplay muted loop id="backgroundvideo">
		<source src="<%=request.getContextPath() %>/resources/video/run3.mp4" type="video/mp4">
	</video>
	        <div id="leftbar"> 
	      
	        	<div>

				    <ul>	<!--로그인한멤버 -->	
				    	        
				     <%if (logginMember!=null&&logginMember.getM_LEVEL()==1&&logginMember.getM_STATUS()=='N') {%>
				         <li><a href="<%=request.getContextPath()%>/center/centerView.do">센터 찾기</a></li>	<!-- /views/center/centerView.jsp -->
				         <li><a href="<%=request.getContextPath()%>/trainer/trainerView.do">트레이너 찾기</a></li>	<!-- /views/trainner/trainnerView.jsp -->				 
<!--로그인한멤버 -->		 <li><a href="<%=request.getContextPath()%>/board/noticeList">Notice</a></li>				<!-- /views/board/noticeList.jsp -->
				         <li><a href="<%=request.getContextPath()%>/board/boardList">Q&A</a></li>
				         <li><a href="<%=request.getContextPath()%>/mypage/mypageUser.do">My page</a></li>	<!-- /views/mypage/mypage-user.jsp -->
				     
				     <%} else if (logginMember!=null&&logginMember.getM_LEVEL()==2&&logginMember.getM_STATUS()=='N') {%>		         
				         <li><a href="<%=request.getContextPath()%>/center/centerView.do">센터 찾기</a></li>		<!-- /views/center/centerView.jsp -->
				     	 <li><a href="<%=request.getContextPath()%>/center/centerEnroll.do">센터 등록</a></li>	
				         <li><a href="<%=request.getContextPath()%>/trainer/trainerView.do">트레이너 찾기</a></li>	<!-- /views/trainner/trainnerView.jsp -->				 
<!--로그인한사업자 -->		 <li><a href="<%=request.getContextPath()%>/trainer/trainerEnroll.do">트레이너 등록</a></li>	
				         <li><a href="<%=request.getContextPath()%>/board/noticeList">Notice</a></li>				<!-- /views/board/noticeList.jsp -->
				         <li><a href="<%=request.getContextPath()%>/board/boardList">Q&A</a></li>						<!-- /views/board/boardList.jsp -->
				         <li><a href="<%=request.getContextPath()%>/mypage/mypageBusiness.do">My page-사업자</a></li><!-- /views/mypage/mypage-business.jsp -->
				     
				     <%} else if (logginMember!=null&&logginMember.getM_LEVEL()==0&&logginMember.getM_STATUS()=='N') {%>		         
				         <li><a href="<%=request.getContextPath()%>/center/centerView.do"> 센터 찾기</a></li>		<!-- /views/center/centerView.jsp -->
				     	 <li><a href="<%=request.getContextPath()%>/center/centerEnroll.do">센터 등록</a></li>	
				         <li><a href="<%=request.getContextPath()%>/trainer/trainerView.do">트레이너 찾기</a></li>	<!-- /views/trainner/trainnerView.jsp -->				 
<!--admin -->		 <li><a href="<%=request.getContextPath()%>/trainer/trainerEnroll.do">트레이너 등록</a></li>	
				         <li><a href="<%=request.getContextPath()%>/board/noticeList">Notice</a></li>				<!-- /views/board/noticeList.jsp -->
				         <li><a href="<%=request.getContextPath()%>/board/boardList">Q&A</a></li>						<!-- /views/board/boardList.jsp -->
				         <li><a href="<%=request.getContextPath()%>/admin/adminMain.do">관리자페이지 이동</a></li><!-- /views/mypage/mypage-business.jsp -->
				    
				     <%}else {%>
				         <li><a href="<%=request.getContextPath()%>/center/centerView.do">센터 찾기</a></li>		<!-- /views/center/centerView.jsp -->
<!-- 로그인x기본 -->		 <li><a href="<%=request.getContextPath()%>/trainer/trainerView.do">트레이너 찾기</a></li>	<!-- /views/trainner/trainnerView.jsp -->
				         <li><a href="<%=request.getContextPath()%>/board/noticeList">Notice</a></li>			<!-- /views/board/noticeList.jsp -->
				         <li><a href="<%=request.getContextPath()%>/board/boardList">Q&A</a></li>						<!-- /views/board/boardList.jsp -->
				     <%} %> 
				    </ul>
			    </div>				          
			</div>  
	<section>	
		<div class="container-fiuld">
			<div id="log">
		         <nav>
		         	<img src="<%=request.getContextPath()%>/resources/img/logo-1.png" width="100px">
		         </nav>       
	   		</div>
			
	     <div id="content">
	         <nav>
	             <p>
	             당신 주변의 운동 시설과 트레이너<br>
	             <b>'빠짐'</b>이 찾아드릴게요
	             </p>
	         </nav>
	     </div>
	
	    <div id="search">
	       <div>
	       		<input type="text" id="search1" name="search" placeholder="찾는 시설의 주소나 이름을 입력해주세요" onclick="serachKeyword();" size="50px" background-color:"grey">
	       </div>
	   	</div>
	   	
	    <div id="box">
	    <%if (logginMember == null) {%>
	        <div>																								
	        	<button type="button" class="btn btn-outline-primary text-white" data-toggle="modal" data-target="#join"  onclick="location.replace('<%=request.getContextPath()%>/member/enrollMenu.do')">회원가입</button> &nbsp; 
	        	<input type="button" class="btn btn-outline-primary text-white"  onclick="location.replace('<%=request.getContextPath()%>/member/membeLoginView.do')"  value="로그인"><%-- <a href="<%=request.getContextPath()%>/common/mainlogin.do"> --%>

	        	</div>
	    	</div>
	    <%} else {%>
			<div id="content">
         		<nav>
		             <p>
		             	<b><%=logginMember.getM_NAME()%>님 </b>환영합니다
		             </p>
	             <div id="box">
	             		  <div>
	               			<button type="button" class="btn btn-outline-primary text-white"
	               			onclick="location.replace('<%=request.getContextPath()%>/member/logout.do?M_ID=<%=logginMember.getM_ID()%>')"
	               			>로그아웃</button>
	               			 <%if (logginMember.getM_LEVEL()==1&&logginMember.getM_STATUS()=='N') {%>
	               			<button type="button" class="btn btn-outline-primary text-white"
	               			onclick="location.replace('<%=request.getContextPath()%>/member/memberEnrollView.do?M_ID=<%=logginMember.getM_ID()%>')"
	               			>정보수정</button>
	               			<%}else if (logginMember.getM_LEVEL()==0&&logginMember.getM_STATUS()=='N') {%>
	               			<button type="button" class="btn btn-outline-primary text-white"
	               			onclick="location.replace('<%=request.getContextPath()%>/member/memberEnrollView.do?M_ID=<%=logginMember.getM_ID()%>')"
	               			>정보수정</button>
	               			<%}else if (logginMember.getM_LEVEL()==2&&logginMember.getM_STATUS()=='N') {%>
	               			<button type="button" class="btn btn-outline-primary text-white"
	               			onclick="location.replace('<%=request.getContextPath()%>/business/businessEnrollView.do?M_ID=<%=logginMember.getM_ID()%>')"
	               			>정보수정</button>
	               			<%}else %>
	               			<%} %>
	               			
	        		  	  </div>
			      	</div>	
		         </nav>
		     </div>

		</div>	<!-- 첫 div 끝 -->
	</section>
	
	<script>

		onload=function(){

			navigator.geolocation.getCurrentPosition(handleGeoSucces, handleGeoError);

		}

		
		function handleGeoSucces(position){
			const latitude = position.coords.latitude;
			const longitude = position.coords.longitude;
			console.log(latitude, longitude);
			 $.ajax({
				url:"<%=request.getContextPath()%>/getCoord.do?lat="+latitude+"&lng="+longitude,
				type:"get",
				dataType:"text",
				success : function(data){
					console.log(data);
					console.log('위치 저장 완료');
				}
				
			})
		}
	
		function handleGeoError(){
			alert('회원님의 위치정보를 확인할 수 없어 기본 위치로 설정되어 안내합니다');
		}
	

		$("#search1").keydown(function(key){
    		if(key.keyCode==13){ /* 엔터일경우가 13   */
    			var search=$(this).val();
    			location.href="<%=request.getContextPath() %>/center/search.do?keyword="+search;
    		}
		
		});
	</script>

<script src="<%=request.getContextPath()%>/js/js1.js">
</script>
<br><br><br><br>
<br><br><br><br>
<%@ include file="/views/common/footer.jsp"%>