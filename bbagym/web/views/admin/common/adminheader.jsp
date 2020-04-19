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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>빠짐 관리자페이지</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/admin.css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
   <link rel="icon" type="image/png" href="<%=request.getContextPath() %>/assets/img/logo_favicon.png">
  	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/demo-page.css"  media="all">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/hover.css"  media="all">
  <link href="https://fonts.googleapis.com/css2?family=Abril+Fatface&family=Dancing+Script:wght@500&display=swap" rel="stylesheet">
</head>


<body>
    <!-- header -->
    <header style="width:100%;">

        <div class="container pt-4" >
            <div id="log"> 
                <a class="navbar-brand" href="<%=request.getContextPath() %>/views/admin/Admin_Main.jsp" >
                		         	<img src="<%=request.getContextPath()%>/resources/img/logo-1.png" width="100px"></a>
            </div>
            <div id="welcome"><!-- 관리자페이지 타이틀 -->
                <nav>
                    <h1 style="font-size: 50px; color: white;">빠짐 관리자페이지<i class="fa fa-heart heart"></i></h1>
                </nav>
            </div>
        </div>

    </header>


<br>
    <section>

        <div > <br><br><br> 
            <aside id="menu" ><!-- 관리자페이지 메뉴바 -->

                <table style="width:400px;" >
                <tr>
                        <td><p style="color:black;font-size:20px;font-family: 'Abril Fatface', cursive;text-decoration: none;display:flex; justify-content:center;"href="">
                        KIM SANGHAK<br>PARK NAJUNG<br>KIM BEOMSHIN<br>KIMGAYOUNG<br>SEO WON</p></td>
                    </tr>
                	<tr >
                        <td><a class="hvr-sweep-to-right" href="<%=request.getContextPath()%>"  style="text-decoration: none;display:flex; justify-content:center;">홈페이지 메인화면가기</a></td>
                    </tr>
                    <tr >
                        <td><a style="text-decoration: none;display:flex; justify-content:center;"class="hvr-sweep-to-right"href="<%=request.getContextPath()%>/admin/passwordModify.do?M_Id=<%=logginMember.getM_ID()%>')" >관리자 비밀번호 수정</a></td>
                    </tr>
                    <tr>
                        <td><a style="text-decoration: none;display:flex; justify-content:center;"class="hvr-sweep-to-right"href="<%=request.getContextPath()%>/admin/centerList.do" >시설 등록 승인</a></td>
                       <%--  <td><a class="updateMyProfile"href="<%=request.getContextPath()%>/admin/centerEnroll.do" >시설 등록 승인</a></td> --%>
                    </tr>
                    <tr>	
                        <td><a style="text-decoration: none;display:flex; justify-content:center;"class="hvr-sweep-to-right"href="<%=request.getContextPath()%>/admin/trainerList.do">트레이너 등록 승인</a></td>
                    </tr>
                    <tr>
                        <td><a style="text-decoration: none;display:flex; justify-content:center;"class="hvr-sweep-to-right"href="<%=request.getContextPath()%>/admin/memberlist.do">회원 관리</a></td>
                    </tr>
                    
                    <tr>
                        <td><img src="<%=request.getContextPath()%>/resources/img/shshsh.png" width="100%" height="150px"display="flex" justify-content="center"></td>
                    
                    </tr>
                    <!--  <tr><span style="font-family: 'Dancing Script', cursive;display:flex; justify-content:center;">naasda josdsdunh</span></tr>
               		  <tr> -->
                  
                </table>

            </aside>

            <div id="section-view" >
            
            <style>
            .body{
            border: 1px solid white;
            }
            
            .updateMyProfile {
         border: 1px solid white;
	box-sizing: border-box;
	display: flex;
	flex-direction: column;
	text-align: center;
	margin: 10px;
	padding: 10px;
	color: #111111b9;
	font-weight: bold;
	text-decoration: none;
}

.updateMyProfile:hover {

	background: black;
	color: white;
	text-decoration: none;
-webkit-animation: blink-2 0.9s both;
	        animation: blink-2 0.9s both;
}
/* ----------------------------------------------
 * Generated by Animista on 2020-4-18 15:22:49
 * Licensed under FreeBSD License.
 * See http://animista.net/license for more info. 
 * w: http://animista.net, t: @cssanimista
 * ---------------------------------------------- */

/**
 * ----------------------------------------
 * animation blink-2
 * ----------------------------------------
 */
@-webkit-keyframes blink-2 {
  0% {
    opacity: 1;
  }
  50% {
    opacity: 0.2;
  }
  100% {
    opacity: 1;
  }
}
@keyframes blink-2 {
  0% {
    opacity: 1;
  }
  50% {
    opacity: 0.2;
  }
  100% {
    opacity: 1;
  }
}


            </style>

            <!-- header -->