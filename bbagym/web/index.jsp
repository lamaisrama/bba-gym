<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ include file="/views/common/header.jsp"%> --%>

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
				    <ul>
				        <a href="<%=request.getContextPath()%>/views/center/centerView.jsp"> <li>센터 찾기</li></a>
				        <a href="<%=request.getContextPath()%>/views/center/centerViewDetail.jsp"> <li>센터 상세보기</li></a>
				        <a href="<%=request.getContextPath()%>/views/center/centerEnroll-1.jsp"> <li>센터 등록</li></a>
				        <a href="<%=request.getContextPath()%>/views/trainner/trainnerView.jsp"> <li>트레이너 찾기</li></a>
				        <a href="<%=request.getContextPath()%>/views/trainner/trainnerViewDetail.jsp"> <li>트레이너 상세보기</li></a>
				        <a href="<%=request.getContextPath()%>/views/trainner/trainnerEnroll-1.jsp"> <li>트레이너 등록</li></a>
				        <a href="<%=request.getContextPath()%>/views/board/notice.jsp"> <li>Notice</li></a>
				        <a href="#"> <li>Q&A</li></a>
				        <a href="<%=request.getContextPath()%>/views/mypage/mypage-user.jsp"> <li>My page</li></a>
				        <a href="<%=request.getContextPath()%>/views/mypage/mypage-business.jsp"> <li>My page-사업자</li></a>
				        
				        
				        
				        
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
	             <b>빠짐</b>이 찾아드릴게요
	             </p>
	         </nav>
	     </div>
	
	    <div id="search">
	       <div>
	       		<input type="text" name="search" placeholder="어떤 운동을 찾으시나요?" size="50px" background-color:"grey">
	       </div>
	   	</div>
	    <div id="box">
	        <div><button type="button" class="btn btn-outline-primary text-white" data-toggle="modal" data-target="#join" >회원가입</button> &nbsp; <button type="submit" class="btn btn-outline-primary text-white">로그인</button></div>
	    </div>
	         	
	       	<div style="display:none;">
	       		<h1><%=session.getAttribute("name") %>님 환영홥니다</h1>
	       		<form action="<%=request.getContextPath()%>/logout.do" method="post">
	       		<div id="box">
	               <div>
	               		<button type="submit" class="btn btn-outline-primary text-white">로그아웃</button>
	        	   </div>
	      		</div>	
	      		</form>
			</div>
		</div>	<!-- 첫 div 끝 -->
	</section>

<script src="<%=request.getContextPath()%>/js/js1.js">
</script>
<%@ include file="/views/common/footer.jsp"%>