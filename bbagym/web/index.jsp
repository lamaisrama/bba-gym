<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		<source src="<%=request.getContextPath() %>/resources/video/run.mp4" type="video/mp4">
	</video>
	        <div id="leftbar"> 
	        	<div>

				    <ul>	<!--로그인한멤버 -->		        
				     <%if (logginMember!=null&&logginMember.getM_LEVEL()==1) {%>
				          <a href="<%=request.getContextPath()%>/center/centerSearch.do"> <li>센터 찾기</li></a>		<!-- /views/center/centerView.jsp -->
				     	 <a href="<%=request.getContextPath()%>/center/centerEnroll.do"> <li>센터 등록</li></a>	

				         <a href="<%=request.getContextPath()%>/trainer/trainerView.do"> <li>트레이너 찾기</li></a>	<!-- /views/trainner/trainnerView.jsp -->				 
<!--로그인한멤버 -->		 <a href="<%=request.getContextPath()%>/trainer/trainerEnroll.do"> <li>트레이너 등록</li></a>	

				         <a href="<%=request.getContextPath()%>/notice/notice.do"><li>Notice</li></a>				<!-- /views/board/noticeList.jsp -->
				         <a href="<%=request.getContextPath()%>/notice/q&a.do"><li>Q&A</li>		 </a>
				         <a href="<%=request.getContextPath()%>/mypage/mypageUser.do"><li>My page</li></a>			<!-- /views/mypage/mypage-user.jsp -->
				     <%} else if (logginMember!=null&&logginMember.getM_LEVEL()==2) {%>		         
				         <a href="<%=request.getContextPath()%>/center/centerSearch.do"> <li>센터 찾기</li></a>		<!-- /views/center/centerView.jsp -->
				     	 <a href="<%=request.getContextPath()%>/center/centerEnroll.do"> <li>센터 등록</li></a>	
				         <a href="<%=request.getContextPath()%>/trainer/trainerView.do"> <li>트레이너 찾기</li></a>	<!-- /views/trainner/trainnerView.jsp -->				 
<!--로그인한사업자 -->		 <a href="<%=request.getContextPath()%>/trainer/trainerEnroll.do"> <li>트레이너 등록</li></a>	
				         <a href="<%=request.getContextPath()%>/notice/notice.do"><li>Notice</li></a>				<!-- /views/board/noticeList.jsp -->
				         <a href="<%=request.getContextPath()%>/notice/q&a.do"><li>Q&A</li></a>						<!-- /views/board/boardList.jsp -->
				         <a href="<%=request.getContextPath()%>/mypage/mypageBusiness.do"> <li>My page-사업자</li></a><!-- /views/mypage/mypage-business.jsp -->
				   
				     <%}else {%>
				         <a href="<%=request.getContextPath()%>/center/centerSearch.do"> <li>센터 찾기</li></a>		<!-- /views/center/centerView.jsp -->
<!-- 로그인x기본 -->		 <a href="<%=request.getContextPath()%>/trainer/trainerView.do"> <li>트레이너 찾기</li></a>	<!-- /views/trainner/trainnerView.jsp -->
				         <a href="<%=request.getContextPath()%>/notice/notice.do"><li>Notice</li></a>				<!-- /views/board/noticeList.jsp -->
				         <a href="<%=request.getContextPath()%>/notice/q&a.do"><li>Q&A</li></a>						<!-- /views/board/boardList.jsp -->
				     <%} %>

				   <%-- <a href="<%=request.getContextPath()%>/views/center/centerViewDetail.jsp"> <li>센터 상세보기</li></a>
				        <a href="<%=request.getContextPath()%>/views/trainner/trainnerViewDetail.jsp"> <li>트레이너 상세보기</li></a> --%>
				        
				        
				    </ul>
			    </div>				          
			</div>  
	<section>	
		<div class="container-fiuld">
			<div id="log">
	       <!--   <nav><h2>
	             BBAGYM
	         </h2></nav> -->
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
	       		<input type="text" name="search" placeholder="어떤 운동을 찾으시나요?" size="50px" background-color:"grey">
	       </div>
	   	</div>

	   	
	    <div id="box">
	    <%
			if (logginMember == null) {
		%>
	        <div>
	        	<button type="button" class="btn btn-outline-primary text-white" data-toggle="modal" data-target="#join" onclick="location.replace('<%=request.getContextPath()%>/member/memberEnroll.do')">회원가입</button> &nbsp; 
	        	<input type="button" class="btn btn-outline-primary text-white" value="로그인"" onclick="location.replace('<%=request.getContextPath()%>/member/membeLoginView.do')">			<%-- <a href="<%=request.getContextPath()%>/common/mainlogin.do"> --%>

	        	</div>
	    	</div>
	    <%
			} else {
		%>
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
			               			<button type="button" class="btn btn-outline-primary text-white"
			               			onclick="location.replace('<%=request.getContextPath()%>/member/memberEnrollView.do?M_ID=<%=logginMember.getM_ID()%>')"
			               			>정보수정</button>
			        		  	  </div>
			      				</div>	
			      				
	         </nav>
	     </div>
			<%
					}
				%>

		</div>	<!-- 첫 div 끝 -->
	</section>

<script src="<%=request.getContextPath()%>/js/js1.js">
</script>
<%@ include file="/views/common/footer.jsp"%>