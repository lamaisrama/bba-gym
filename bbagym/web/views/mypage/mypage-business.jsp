<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>

<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@200&display=swap" rel="stylesheet">
<style>
    body * {
        /* border: 1px solid rgb(211, 208, 208); */
        font-family: 'Gothic A1', sans-serif;
    }
    .header-container {
        display: flex;
        margin-left: auto;
        margin-right: auto;
        border: 1px solid red;
        box-sizing: border-box;
        width: 1170px;
        height: 110px;
        margin-bottom: 30px;
    }
</style>
    <div class="page-header page-header-xs" data-parallax="true" style="background-image: url('<%=request.getContextPath()%>/assets/img/fabio-mangione.jpg');"></div>    
	<section class="section-container">
	    <style>
	.section-container {
	    display: flex;
	    margin-left: auto;
	    margin-right: auto;
	    /* border: 2px solid green; */
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
	<a class="updateMyProfile" href="" onclick="updateMyProfile()">MY 찜목록</a>
	<a class="updateMyProfile" href="" onclick="updateMyProfile()">나의 회원권</a>
	<a class="updateMyProfile" href="" onclick="updateMyProfile()">장바구니</a>
	<a class="updateMyProfile" href="" onclick="updateMyProfile()">회원탈퇴</a>
	    <hr/>
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
	    <div style="text-align: center;">-사업자-</div>
	<style>
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
	    font-size: 40px;
	    color: rgb(82, 82, 82);
	    text-shadow: 0 1px 0 rgb(172, 172, 172), 0 2px 0 rgb(172, 172, 172), 0 3px 0 rgb(172, 172, 172), 0 4px 0 rgb(172, 172, 172), 0 5px 0 rgb(172, 172, 172), 0 6px 0 transparent, 0 7px 0 transparent, 0 8px 0 transparent, 0 9px 0 transparent, 0 10px 10px rgba(0, 0, 0, 0.4);
	}
 /* h3 span:nth-child(2) { animation-delay: .1s; }
h3 span:nth-child(3) { animation-delay: .2s; }
h3 span:nth-child(4) { animation-delay: .3s; }
h3 span:nth-child(5) { animation-delay: .4s; }
h3 span:nth-child(6) { animation-delay: .5s; } */
	  @keyframes bounce {
	      100% {
	          top: -20px;
	          text-shadow: 0 1px 0 #CCC, 0 2px 0 #CCC, 0 3px 0 #CCC, 0 4px 0 #CCC, 0 5px 0 #CCC, 0 6px 0 #CCC, 0 7px 0 #CCC, 0 8px 0 #CCC, 0 9px 0 #CCC, 0 50px 25px rgba(0, 0, 0, 0.2);
	      }
	  }
	</style>
     <div class="parent">
         <div class="first"><img src="<%=request.getContextPath() %>/resources/img/1.png" id="img">
             <div>
                 <a href="#1">MY 시설 등록현황(클릭)</a>
             </div>
         </div>
         <div class="second"><img src="<%=request.getContextPath() %>/resources/img/2.png" id="img">
             <div>
                 <a href="#2">트레이너 등록 현황(클릭)</a>
             </div>
         </div>
         <div class="third"><img src="<%=request.getContextPath() %>/resources/img/3.png" id="img">
             <div>
                 <a href="#3">실시간 상담 내용(클릭)</a>
             </div>
         </div>
     </div>
     <style>
         .parent {
             display: inline-flexbox;
             width: 100%;
             height: 170px;
             margin-top: 30px;
             margin-bottom: 40px;
             padding-top: 20px;
             background-color: rgba(220, 220, 220, 0.63);
         }
         .first {
             float: left;
             width: 30%;
             box-sizing: border-box;
             margin: 0 auto;
         }
         .first > div {
             text-align: center;
             padding: 10px;
         }
         .first>div:hover {
             text-align: center;
             padding: 10px;
             background-color: rgb(241, 120, 120);
             color: white;
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
             width: 30%;
         }
         .second > div {
             text-align: center;
             padding: 10px;
         }
         .second>div:hover {
             text-align: center;
             padding: 10px;
             background-color: rgb(133, 250, 158);
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
             float: right;
             width: 30%;
             box-sizing: border-box;
         }
         .third > div {
             text-align: center;
             padding: 10px;
         }
         .third>div:hover {
             text-align: center;
             padding: 10px;
             background-color: rgba(104, 232, 255, 0.445);
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
    <!-- <div><a name="uu"></a></div> -->
    <div class="category-1">
        <div class="MyEnroll">
            <a name="1">
                <span>MY 시설 등록 현황</span>
            </a>
        </div>
        <table id="table">
            <tr id="tr" ">
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
        <style>
            .MyEnroll {
                display: flex;
                width: 150px;
                margin-top: 10px;
                margin-left: 20px;
                box-sizing: border-box;
                font-weight: bold;
                background-color: rgb(241, 120, 120);
                margin-bottom: 20px;
            }
            #table {
                width: 100%;
                text-align: center;
            }
        </style>
        <div class="MyEnroll2">
            <a name="2">
                <span>트레이너 등록 현황</span>
            </a>
        </div>
        <div></div>
        <table id="table">
            <tr id="tr" ">
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
        <style>
            .MyEnroll2 {
                display: flex;
                width: 150px;
                margin-top: 25px;
                margin-left: 20px;
                box-sizing: border-box;
                font-weight: bold;
                background-color: rgb(133, 250, 158);
                margin-bottom: 20px;
            }
        </style>
        <div class="MyEnroll3">
            <a name="3">
                <span>실시간 상담   내용</span>
            </a>
        </div>
        <style>
            .MyEnroll3 {
                display: flex;
                width: 150px;
                margin-top: 25px;
                margin-left: 20px;
                box-sizing: border-box;
                font-weight: bold;
                background-color: rgba(104, 232, 255, 0.445);
            }
        </style>
        <a class="top" href="#" title="”맨" 위로">TOP</a>
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
    </div>
</section>

    <style>
        .footer-container {
            display: flex;
            margin-left: auto;
            margin-right: auto;
            border: 1px solid red;
            box-sizing: border-box;
            width: 1170px;
            height: 250px;
            padding-top: 38px;
            padding-bottom: 56px;
            margin-top: 30px;
        }
    </style>


<%@ include file="/views/common/footer.jsp"%>