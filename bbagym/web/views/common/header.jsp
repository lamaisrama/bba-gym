<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<html>
<head>
  <meta charset="utf-8" />
  <link rel="apple-touch-icon" sizes="76x76" href="<%=request.getContextPath() %>/assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="<%=request.getContextPath() %>/assets/img/logo_favicon.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <title>
    BBAGYM-빠짐
  </title>
  <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
  <!-- Fonts and icons -->
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
  <!-- CSS Files -->
  <link href="<%=request.getContextPath() %>/assets/css/paper-kit.css?v=2.2.0" rel="stylesheet" />
  <link href="<%=request.getContextPath() %>/assets/demo/demo.css" rel="stylesheet" />
  <!-- Latest compiled and minified CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <!-- jQuery library -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <!-- Popper JS -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <!-- Latest compiled JavaScript -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
 <!--   Core JS Files   -->
  <script src="<%=request.getContextPath()%>/assets/js/core/popper.min.js" type="text/javascript"></script>
  <!-- Control Center for Paper Kit: parallax effects, scripts for the example pages etc -->
  <script src="<%=request.getContextPath()%>/assets/js/paper-kit.js?v=2.2.0" type="text/javascript"></script>
  <script src="<%=request.getContextPath()%>/js/jquery-3.4.1.min.js"></script>
  
  
  
</head>

<body class="profile-page sidebar-collapse">
  <!-- Navbar -->
  <nav class="navbar navbar-expand-lg fixed-top navbar-transparent " color-on-scroll="300">
    <div class="container">
      <div class="navbar-translate">
        <a class="navbar-brand" href="<%=request.getContextPath() %>/index.jsp" rel="tooltip" title="BBAGYM" data-placement="bottom" target="_self" style="font-size: 18px;">
          <i>빠Gym</i>
        </a>
        <button class="navbar-toggler navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-bar bar1"></span>
          <span class="navbar-toggler-bar bar2"></span>
          <span class="navbar-toggler-bar bar3"></span>
        </button>
      </div>
      <div class="collapse navbar-collapse justify-content-end" id="navigation">
        <ul class="navbar-nav">

         <%if (logginMember!=null&&logginMember.getM_LEVEL()==1&&logginMember.getM_STATUS()=='N') {%>
         <li class="nav-item"><a href="<%=request.getContextPath()%>/center/centerView.do" class="nav-link" style="font-size: 16px;">&nbsp;센터찾기</a></li>
        
        <li class="nav-item"><a href="<%=request.getContextPath()%>/trainer/trainerView.do" target="_self" class="nav-link" style="font-size: 16px;">&nbsp;트레이너찾기</a></li>
    
                  <li class="nav-item"><a href="<%=request.getContextPath()%>/notice/notice.do" target="self" class="nav-link" style="font-size: 16px;">&nbsp;Notice</a> </li>
          <li class="nav-item"><a href="<%=request.getContextPath()%>/notice/q&a.do" target="self" class="nav-link" style="font-size: 16px;">Q&A&nbsp;&nbsp;</a></li>
         <%} else if (logginMember!=null&&logginMember.getM_LEVEL()==2&&logginMember.getM_STATUS()=='N') {%>	
         <li class="nav-item"><a href="<%=request.getContextPath()%>/center/centerView.do" class="nav-link" style="font-size: 16px;">&nbsp;센터찾기</a></li>	
 		<li class="nav-item"><a href="<%=request.getContextPath()%>/center/centerEnroll.do" class="nav-link" style="font-size: 16px;">&nbsp;센터 등록</a></li>
          <li class="nav-item"><a href="<%=request.getContextPath()%>/trainer/trainerView.do" target="_self" class="nav-link" style="font-size: 16px;">&nbsp;트레이너찾기</a></li>
        <li class="nav-item"><a href="<%=request.getContextPath()%>/trainer/trainerEnroll.do" class="nav-link" style="font-size: 16px;">&nbsp;트레이너 등록</a></li>
		           <li class="nav-item"><a href="<%=request.getContextPath()%>/notice/notice.do" target="self" class="nav-link" style="font-size: 16px;">&nbsp;Notice</a> </li>
          <li class="nav-item"><a href="<%=request.getContextPath()%>/notice/q&a.do" target="self" class="nav-link" style="font-size: 16px;">Q&A&nbsp;&nbsp;</a></li>
		  <%}else {%>
          <li class="nav-item"><a href="<%=request.getContextPath()%>/center/centerView.do" class="nav-link" style="font-size: 16px;">&nbsp;센터찾기</a></li>
          <li class="nav-item"><a href="<%=request.getContextPath()%>/trainer/trainerView.do" target="_self" class="nav-link" style="font-size: 16px;">&nbsp;트레이너찾기</a></li>
          <li class="nav-item"><a href="<%=request.getContextPath()%>/notice/notice.do" target="self" class="nav-link" style="font-size: 16px;">&nbsp;Notice</a> </li>
          <li class="nav-item"><a href="<%=request.getContextPath()%>/notice/q&a.do" target="self" class="nav-link" style="font-size: 16px;">Q&A&nbsp;&nbsp;</a></li>
          
            <%} %>
           
           <div id="box">
            <%
					if (logginMember == null) {
				%>
				
	        <div>
	        
	       <input type="button" class="btn btn-outline-primary text-red"  onclick="location.replace('<%=request.getContextPath()%>/member/membeLoginView.do')"  value="로그인">
	       <input type="button" class="btn btn-outline-primary text-red" value="회원가입"  onclick="location.replace('<%=request.getContextPath()%>/member/enrollMenu.do')" />
	        	
	        	&nbsp; 
	 		 	 
	 		</div>
			
	   			 
	    
	     <%
					} else if(logginMember!=null&&logginMember.getM_LEVEL()==1&&logginMember.getM_STATUS()=='N'){
				%>

          <!-- HelloUser Dropdown -->
    <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="font-size: 16px;">
           <%=logginMember.getM_NAME()%>님◟( ˘ ³˘)◞ ♥, 안녕하세요!
          </a>
            <div class="dropdown-menu dropdown-menu-right animate slideIn" aria-labelledby="navbarDropdown">
              <a class="dropdown-item" href="<%=request.getContextPath()%>/mypage/mypageUser.do">My Page</a>
              <a class="dropdown-item" href="<%=request.getContextPath()%>/member/memberEnrollView.do?M_ID=<%=logginMember.getM_ID()%>">회원 정보수정</a>
              <a class="dropdown-item" href="<%=request.getContextPath()%>/mypage/baguni.do">장바구니</a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="<%=request.getContextPath()%>/member/logout.do">로그아웃</a>
            </div>
          
          </li>
          <%
			}
					else if(logginMember!=null&&logginMember.getM_LEVEL()==2&&logginMember.getM_STATUS()=='N')
			
			{
		  %>
		   <!-- HelloUser Dropdown -->
   		 <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="font-size: 16px;">
           <%=logginMember.getM_NAME()%>님◟( ˘ ³˘)◞ ♥, 안녕하세요!
          </a>
            <div class="dropdown-menu dropdown-menu-right animate slideIn" aria-labelledby="navbarDropdown">
              <a class="dropdown-item" href="<%=request.getContextPath()%>/mypage/mypageBusiness.do">My Page-사업자</a>
            <a class="dropdown-item" href="<%=request.getContextPath()%>/business/businessEnrollView.do?M_ID=<%=logginMember.getM_ID()%>">회원 정보수정</a>
              
              <a class="dropdown-item" href="<%=request.getContextPath()%>/mypage/baguni.do">장바구니</a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="<%=request.getContextPath()%>/member/logout.do">로그아웃</a>
            </div>
            <%} %>
          </li>
		</div>
				
        </ul>
      </div>
    </div>
  </nav>
 
  <!-- End Navbar -->

  <!-- 아래 div는 각 jsp마다 제일 위에 붙여줘야 header background가 생깁니다.-->
  <!-- <div class="page-header page-header-xs" data-parallax="true" style="background-image: url('assets/img/fabio-mangione.jpg');"></div> --> 

