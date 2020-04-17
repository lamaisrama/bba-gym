<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ include file="/views/common/header.jsp"%>  --%>
<%@ page
	import="com.bbagym.model.vo.Member"%>
<%
	Member logginMember = (Member) session.getAttribute("logginMember");

	/* Cookie[] cookies = request.getCookies();
	String saveId = "";
	if (cookies != null) {
		for (Cookie c : cookies) {
			if (c.getName().equals("saveId")) {
			
				saveId = c.getValue();
			}
		}
	} */
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>bbagym</title>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/css2.css">
	<link href="<%=request.getContextPath() %>/assets/css/bootstrap.min.css" rel="stylesheet" />
	<link href="<%=request.getContextPath() %>/assets/css/paper-kit.css?v=2.2.0" rel="stylesheet" />
	<link href="<%=request.getContextPath() %>/assets/demo/demo.css" rel="stylesheet" />
	<!-- Jquery File -->
	<script src="<%=request.getContextPath()%>/js/jquery-3.4.1.min.js"></script>
</head>
<body>    

	<video autoplay muted loop id="backgroundvideo">
		<source src="<%=request.getContextPath() %>/resources/video/run4.mp4" type="video/mp4">
	</video>
	        <div id="leftbar"> 
	        	<div>

				    <ul>		        
						 <li><a href="<%=request.getContextPath()%>/member/memberloginview.do"> Login</a></li>
				         <li><a href="<%=request.getContextPath()%>/center/centerView.do">센터 찾기</a></li>		<!-- /views/center/centerView.jsp -->
<!-- 로그인x기본 -->		 <li><a href="<%=request.getContextPath()%>/trainer/trainerView.do">트레이너 찾기</a></li>	<!-- /views/trainner/trainnerView.jsp -->
				         <li><a href="<%=request.getContextPath()%>/notice/notice.do">Notice</a></li>				<!-- /views/board/noticeList.jsp -->
				         <li><a href="<%=request.getContextPath()%>/notice/q&a.do">Q&A</a></li>						<!-- /views/board/boardList.jsp -->
				    

				        
				        
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
		          <a class="navbar-brand" href="<%=request.getContextPath() %>/index.jsp" >
		         	<img src="<%=request.getContextPath()%>/resources/img/logo-1.png" width="100px"></a>
		         </nav>       
	   		</div>
			
	     <div id="content">
	         <nav>
	             <p>
	             당신 주변의 운동 시설과 트레이너<br>
	             <b>'빠짐'</b>이 찾아드릴게요
	             </p>
	             <br>
	             <br>
	         </nav>
	     </div>
	
	  
	      <div id ="box">
	   
	        <div id="bt">																								
	        	<button type="button" class="btn btn-outline-info"  onclick="location.replace('<%=request.getContextPath()%>/member/memberEnroll.do')" >일반 회원가입</button> &nbsp; 
	        	<button type="button" class="btn btn-outline-info" onclick="location.replace('<%=request.getContextPath()%>/business/businessEnroll.do')" >사업자 회원가입</button> &nbsp; 
	      	</div>
	      	<div>
	      		<button type="button" class="btn btn-outline-info" onclick="log();" style="margin-right:30px;">로그인</button>
	      	</div>
	   	 </div>
	    	


		</div>	<!-- 첫 div 끝 -->
	</section>
	
	<script>
	
	function log(){
		location.href= "<%=request.getContextPath()%>/member/memberloginview.do";
	}
	</script>
	

	<script src="<%=request.getContextPath()%>/js/js1.js"></script>






<%@ include file="/views/common/footer.jsp"%>