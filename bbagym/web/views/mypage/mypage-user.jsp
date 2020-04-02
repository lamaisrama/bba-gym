<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>

 <style>
	body * {
	    /* border: 1px solid rgb(211, 208, 208); */
	    font-family: 'Gothic A1', sans-serif;
	}
</style>
<div class="page-header page-header-xs" data-parallax="true" style="background-image: url('<%=request.getContextPath()%>/assets/img/fabio-mangione.jpg');"></div>
<section class="section-container">
            <style>
                .section-container {
                    display: flex;
                    margin-left: auto;
                    margin-right: auto;
                    box-sizing: border-box;
                    width: 1170px;
                    height: 100%;
                    position: relative;
                }
            </style>
            <nav>
                <!-- 왼쪽메뉴 -->
                <div class="left-menu-container">
                    <div class="profile-img">
                        <img src="<%=request.getContextPath() %>/resources/img/ksh.jpeg" alt="my image" id="myImage"/>
                    </div>
                    <div class="profile-info">
                        <div>
                            <span>♥김상학님 환영합니다♥</span>
                        </div>
                    </div>
                    <div class="parent1">
                        <a href="http://fb.com/"><img src="<%=request.getContextPath() %>/resources/img/fb.png" width="30px" overflow="hidden" id="img1"></a>
                        <a href="https://www.instagram.com/"><img src="<%=request.getContextPath() %>/resources/img/ist.png" width="30px" overflow="hidden" id="img2"></a>
                        <a href="https://twitter.com/"><img src="<%=request.getContextPath() %>/resources/img/twi.png" width="30px" overflow="hidden" id="img3"></a>
                    </div>
                    <div>
                        <hr/>
                        <a class="updateMyProfile" href="" onclick="updateMyProfile()">회원정보수정</a>
                        <a class="updateMyProfile" href="" onclick="updateMyProfile()">회원탈퇴</a>
                    </div>
                    <style>
                        .parent1 {
                            display: inline-block;
                            margin-left: 11px;
                            margin-top: 0;
                            margin-bottom: 15px;
                        }
                        #img1 {
                            margin-right: 20px;
                            margin-left: 16px;
                        }
                        #img2 {
                            margin-right: 20px;
                        }
                        #img3 {
                            margin-right: 18px;
                        }
                    </style>
                    <script>
                        var isUsClicked = false;
                        function updateMyProfile() {
                            var el = document.getElementsByClassName("userinfo-update")[0];
                            var back = document.querySelectorAll(".content-container>*:not(.popup)");
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
                    <style>
                        /* 왼쪽 메뉴 */
                        #myImage {
                            border-radius: 50%;
                            border: 6px solid #fff;
                            width: 135px;
                            height: 135px;
                            margin-left: auto;
                            margin-right: auto;
                        }
                        .left-menu-container {
                            /* border: 1px solid black; */
                            box-sizing: border-box;
                            height: auto;
                            width: auto;
                            padding-bottom: 50px;
                            font-weight: bold;
                            margin-top: 100px;
                            margin-right: 20px;
                        }
                        .left-menu-container > .profile-img {
                            border: 1px solid white;
                            box-sizing: border-box;
                            width: 150px;
                            height: 150px;
                            margin-top: 10px;
                            margin-left: auto;
                            margin-right: auto;
                            font-weight: bold;
                        }
                        .left-menu-container > .profile-info {
                            box-sizing: border-box;
                            margin-top: 20px;
                            margin-bottom: 20px;
                            display: flex;
                            flex-direction: row;
                            overflow: hidden;
                            width: 200px;
                            height: auto;
                        }
                        .left-menu-container > .profile-info > div {
                            box-sizing: border-box;
                            display: flex;
                            flex-direction: column;
                            max-width: 100%;
                            margin: 0 auto; /* div가운데정렬 */
                        }
                        .updateMyProfile {
                            box-sizing: border-box;
                            display: flex;
                            flex-direction: column;
                            max-width: 100%;
                            text-align: center;
                            margin: 10px;
                            padding: 10px;
                            padding
                            color10pxrgb(0, 0, 0);
                            text-decoration: none;
                        }
                        .updateMyProfile:hover {
                            background: #5457de;
                            color: white;
                            font-size: 19px;
                        }
                    </style>
                </nav>
                <!-- 본문 -->
                <div class="content-container">
                    <h3>
                        <span>M</span>
                        <span>Y</span>
                        <span>P</span>
                        <span>A</span>
                        <span>G</span>
                        <span>E</span>
                    </h3>
                    <div style="text-align: center; margin-bottom: 20px;">-사용자-</div>
                    <div id="table">
                        <div id="my">
                            <div id="my-1">나의 회원권</div>
                            <div id="my-2">
                                아직 활성화된 회원권이 없습니다.</div>
                        </div>
                        <hr/>
                        <div id="menu">
                            <div id="menu1">
                                나의 포인트<button style="float:right;">></button>
                                <div>100P</div>
                            </div>
                            <div id="menu2">
                                나의 출석현황<button style="float:right;">></button>
                                <div>-</div>
                            </div>
                            <div id="menu3">
                                My 찜<a href="#3" style="text-decoration: none;">
                                    <button style="float:right;">></button>
                                </a>
                                <div>0개</div>
                            </div>
                            <div id="menu4">
                                장바구니<a href="#4" style="text-decoration: none;">
                                    <button style="float:right;">></button>
                                </a>
                                <div>0개</div>
                            </div>
                        </a>
                    </div>
                </div>
                <style>
                    #table {
                        background-color: gainsboro;
                        margin: 10px 10px 30px;
                    }
                    #my {
                        display: flex;
                        font-size: 18px;
                    }
                    #my-1 {
                        display: flex;
                        padding: 10px;
                        margin-right: 20px;
                        margin-left: 20px;
                        font-weight: bolder;
                        border-bottom: 1px solid gainsboro;
                    }
                    #my-2 {
                        display: flex;
                        padding: 10px;
                        color: rgba(56, 56, 247, 0.979);
                        font-weight: bolder;
                    }
                    #menu {
                        display: flex;
                        margin: 18px;
                        font-size: 18px;
                        font-weight: bolder;
                    }
                    #menu1 {
                        padding: 10px;
                        float: left;
                        width: 25%;
                    }
                    #menu1 > div {
                        margin-top: 20px;
                        font-size: 22px;
                        color: rgba(56, 56, 247, 0.979);
                    }
                    #menu2 {
                        padding: 10px;
                        float: left;
                        width: 25%;
                        margin-right: 20px;
                    }
                    #menu2 > div {
                        margin-top: 20px;
                        font-size: 22px;
                        color: rgba(56, 56, 247, 0.979);
                    }
                    #menu3 {
                        padding: 10px;
                        float: right;
                        width: 25%;
                        margin-right: 20px;
                    }
                    #menu3 > div {
                        margin-top: 20px;
                        font-size: 22px;
                        color: rgba(56, 56, 247, 0.979);
                    }
                    #menu4 {
                        padding: 10px;
                        float: left;
                        width: 25%;
                        margin-right: 20px;
                    }
                    #menu4 > div {
                        margin-top: 20px;
                        font-size: 22px;
                        color: rgba(56, 56, 247, 0.979);
                    }
                    .content-container {
                        position: relative;
                        box-sizing: border-box;
                        width: 1170px;
                        height: auto;
                        padding: 18px 30px 50px;
                        /* border: 1px solid blue; */
                    }
                    h3 {
                        height: 100px;
                        display: flex;
                        justify-content: center;
                        align-items: center;
                        /* background-color:rgb(0, 0, 0); */
                    }
                    h3 span {
                        position: relative;
                        display: inline-block;
                        top: 35px;
                        /* animation: bounce .3s ease infinite alternate; */
                        font-family: 'Titan One', cursive;
                        font-size: 50px;
                        color: rgb(82, 82, 82);
                        text-shadow: 0 1px 0 rgb(172, 172, 172), 0 2px 0 rgb(172, 172, 172), 0 3px 0 rgb(172, 172, 172), 0 4px 0 rgb(172, 172, 172), 0 5px 0 rgb(172, 172, 172), 0 6px 0 transparent, 0 7px 0 transparent, 0 8px 0 transparent, 0 9px 0 transparent, 0 10px 10px rgba(0, 0, 0, 0.4);
                    }
                </style>
                <div id="my-1">나의 회원권</div>
                <div style="width: 95%;height: 150px; margin:0 auto;"></div>
                <a name="3">
                    <div id="my-1">My 찜</div>
                </a>
                <div style="width: 95%;height: 150px; margin:0 auto;"></div>
                <div class="paging">
                    <a href="##" class="btn_arr prev">
                        <span class="hide">이전페이지</span>
                    </a>
                    <a href="##" class="on">1</a>
                    <!-- D : 활성화페이지일 경우 : on 처리 -->
                    <a href="##">2</a>
                    <a href="##">3</a>
                    <a href="##">4</a>
                    <a href="##">5</a>
                    <a href="##" class="btn_arr next">
                        <span class="hide">다음페이지</span>
                    </a>
                </div>
                <a name="4">
                    <div id="my-1">장바구니</div>
                </a>
                <div style="width: 95%;height: 150px; margin:0 auto;"></div>
                <style>
                    .paging .hide {
                        display: block;
                        height: 0;
                        width: 0;
                        font-size: 0;
                        line-height: 0;
                        margin: 0;
                        padding: 0;
                        overflow: hidden;
                    }
                    .paging {
                        padding: 19px;
                        text-align: center;
                    }
                    .paging a {
                        display: inline-block;
                        width: 23px;
                        height: 23px;
                        padding-top: 2px;
                        vertical-align: middle;
                    }
                    .paging a:hover {
                        text-decoration: underline;
                    }
                    /* .paging .btn_arr{text-decoration:none;} */
                    .paging .btn_arr,
                    .paging .on {
                        margin: 0 3px;
                        padding-top: 0;
                        border: 1px solid #ddd;
                        border-radius: 30px;
                        background: url('/front/img/com/btn_paging.png') no-repeat;
                    }
                    .paging .on {
                        padding-top: 1px;
                        height: 22px;
                        color: #fff;
                        font-weight: bold;
                        background: #000;
                    }
                    .paging .on:hover {
                        text-decoration: none;
                    }
                </style>
                <div class="paging">
                    <a href="##" class="btn_arr prev">
                        <span class="hide">이전페이지</span>
                    </a>
                    <a href="##" class="on">1</a>
                    <!-- D : 활성화페이지일 경우 : on 처리 -->
                    <a href="##">2</a>
                    <a href="##">3</a>
                    <a href="##">4</a>
                    <a href="##">5</a>
                    <a href="##" class="btn_arr next">
                        <span class="hide">다음페이지</span>
                    </a>
                    <br>
                    <br>
                    <br>
                </div>
                <div class="parent">
                    <div class="first"><img src="<%=request.getContextPath() %>/resources/img/1.png" id="img">
                        <div>
                            <a href="#1">시설등록 요청</a>
                        </div>
                    </div>
                    <div class="second"><img src="<%=request.getContextPath() %>/resources/img/2.png" id="img">
                        <div>
                            <a href="#2">공지/이벤트</a>
                        </div>
                    </div>
                    <div class="third"><img src="<%=request.getContextPath() %>/resources/img/3.png" id="img">
                        <div>
                            <a href="#3">고객센터</a>
                        </div>
                    </div>
                    <div class="third"><img src="<%=request.getContextPath() %>/resources/img/sh.png" id="img">
                        <div>
                            <a href="#3">나의정보</a>
                        </div>
                    </div>
                </div>
                <style>
                    .parent {
                        display: inline-flexbox;
                        width: 100%;
                        height: 200px;
                        margin-top: 30px;
                        margin-bottom: 40px;
                        padding-top: 20px;
                    }
                    .first {
                        float: left;
                        width: 17%;
                        box-sizing: border-box;
                        margin: 0 auto;
                    }
                    .first > div {
                        text-align: center;
                        padding: 10px;
                    }
                    .first > div > a {
                        text-decoration: none;
                        font-weight: bold;
                        color: black;
                    }
                    .first > img {
                        border-radius: 50%;
                        display: block;
                        margin: 0 auto;
                        width: 100px;
                        height: 100px;
                    }
                    .second {
                        float: left;
                        margin-left: 5%;
                        width: 28%;
                    }
                    .second > div {
                        text-align: center;
                        padding: 10px;
                    }
                    .second > div > a {
                        text-decoration: none;
                        font-weight: bold;
                        color: black;
                    }
                    .second > img {
                        border-radius: 50%;
                        display: block;
                        margin: 0 auto;
                        width: 100px;
                        height: 100px;
                    }
                    .third {
                        float: left;
                        width: 25%;
                        box-sizing: border-box;
                    }
                    .third > div {
                        text-align: center;
                        padding: 10px;
                    }
                    .third > div > a {
                        text-decoration: none;
                        font-weight: bold;
                        color: black;
                    }
                    .third > img {
                        border-radius: 50%;
                        display: block;
                        margin: 0 auto;
                        width: 100px;
                        height: 100px;
                    }
                </style>
            </div>
        </section>
        <a class="top" href="#" title="맨위로">TOP</a>
        <style>
            .top {
                display: scroll;
                position: fixed;
                bottom: 10px;
                right: 50px;
                background-color: black;
                color: white;
                text-decoration: none;
                padding: 2px;
            }
        </style>

<%@ include file="/views/common/footer.jsp"%>