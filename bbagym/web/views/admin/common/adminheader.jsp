<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <header>

        <div class="container pt-4">
            <div id="log"> 
                <img src="<%=request.getContextPath()%>/resources/img/admin/log.png" width="100%" height="100%"><!-- 관리자페이지 로고 -->
            </div>
            <div id="welcome"><!-- 관리자페이지 타이틀 -->
                <nav>
                    <h1 style="font-size: 50px; color: white;">빠짐 관리자페이지</h1>
                </nav>
            </div>
        </div>

    </header>



    <section>

        <div >
            <aside id="menu" ><!-- 관리자페이지 메뉴바 -->

                <table >
                	<tr >
                        <td><a class="menu_bar" href="<%=request.getContextPath()%>" >홈페이지 메인화면가기</a></td>
                    </tr>
                    <tr >
                        <td><a class="menu_bar"href="<%=request.getContextPath()%>/admin/passwordModify.do" >비밀번호 수정</a></td>
                    </tr>
                    <tr>
                        <td><a class="menu_bar"href="<%=request.getContextPath()%>/admin/centerEnroll.do" >시설 등록 승인</a></td>
                    </tr>
                    <tr>
                        <td><a class="menu_bar"href="<%=request.getContextPath()%>/admin/trainerEnroll.do">트레이너 등록 승인</a></td>
                    </tr>
                    <tr>
                        <td><a class="menu_bar"href="<%=request.getContextPath()%>/admin/member.do" >회원 관리</a></td>
                    </tr>
                    <tr>
                        <td><a class="menu_bar"href="<%=request.getContextPath()%>/admin/question.do" >문의 확인</a></td>
                    </tr>
                    <tr>
                        <td><a class="menu_bar"href="<%=request.getContextPath()%>/admin/Board.do" >게시글 관리</a></td>
                    </tr>
                </table>

            </aside>

            <div id="section-view">

            <!-- header -->