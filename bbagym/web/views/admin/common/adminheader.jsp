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
    <title>Admin Main</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/admin.css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

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



    <section>

        <div >
            <aside id="menu" style="width:20%"><!-- 관리자페이지 메뉴바 -->
<br><br><br>
                <table >
                	<tr >
                        <td><a class="updateMyProfile" href="<%=request.getContextPath()%>" >홈페이지 메인화면가기</a></td>
                    </tr>
                    <tr >
                        <td><a class="updateMyProfile"href="<%=request.getContextPath()%>/admin/passwordModify.do?M_Id=<%=logginMember.getM_ID()%>')" >관리자 비밀번호 수정</a></td>
                    </tr>
                    <tr>
                        <td><a class="updateMyProfile"href="<%=request.getContextPath()%>/admin/centerList.do" >시설 등록 승인</a></td>
                       <%--  <td><a class="updateMyProfile"href="<%=request.getContextPath()%>/admin/centerEnroll.do" >시설 등록 승인</a></td> --%>
                    </tr>
                    <tr>	
                        <td><a class="updateMyProfile"href="<%=request.getContextPath()%>/admin/trainerList.do">트레이너 등록 승인</a></td>
                    </tr>
                    <tr>
                        <td><a class="updateMyProfile"href="<%=request.getContextPath()%>/admin/memberlist.do">회원 관리</a></td>
                    </tr>
                    <%-- <tr>
                        <td><a class="updateMyProfile"href="<%=request.getContextPath()%>/admin/question.do" >문의 확인</a></td>
                    </tr>
                    <tr>
                        <td><a class="updateMyProfile"href="<%=request.getContextPath()%>/admin/Board.do" >게시글 관리(삭제:notcie에서글쓰기 관리자만보이게)</a></td>
                    </tr> --%>
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
	max-width: 100%;
	text-align: center;
	margin: 10px;
	padding: 10px;
	color: black;
	font-weight: bold;
	text-decoration: none;
}

.updateMyProfile:hover {

	background: yellow;
	color: yellow;
		-webkit-animation: tracking-in-expand 0.7s cubic-bezier(0.215, 0.610, 0.355, 1.000) both;
	        animation: tracking-in-expand 0.7s cubic-bezier(0.215, 0.610, 0.355, 1.000) both;
}
/* ----------------------------------------------
 * Generated by Animista on 2020-4-2 20:43:51
 * Licensed under FreeBSD License.
 * See http://animista.net/license for more info. 
 * w: http://animista.net, t: @cssanimista
 * ---------------------------------------------- */

/**
 * ----------------------------------------
 * animation tracking-in-expand
 * ----------------------------------------
 */
@-webkit-keyframes tracking-in-expand {
  0% {
    letter-spacing: -0.5em;
    opacity: 0;
  }
  40% {
    opacity: 0.6;
  }
  100% {
    opacity: 1;
  }
}
@keyframes tracking-in-expand {
  0% {
    letter-spacing: -0.5em;
    opacity: 0;
  }
  40% {
    opacity: 0.6;
  }
  100% {
    opacity: 1;
  }
}
            </style>

            <!-- header -->