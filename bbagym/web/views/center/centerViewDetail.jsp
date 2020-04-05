<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/centerViewDetail.css">

<body data-spy="scroll" data-target=".navbar" data-offset="100"> <!--시설 이용후기등 메뉴바 클릭시 이동과 관련-->
<div class="page-header page-header-xs" data-parallax="true" style="background-image: url('<%=request.getContextPath()%>/assets/img/fabio-mangione.jpg');"></div>
<!-- section -->
    <div id="container">
        <div id="header-info">
            <div id="detail-header">
                <div id="all-info">
                    <div class="img-info">
                        <img src="<%=request.getContextPath()%>/resources/img/Gym-1.jpg" width="450" height="450">
                    </div>
                    <div class="text-info">
                        <div id="title"><h2>서대문 VIP 휘트니스</h2>
                            <div class="heart"><!--찜 좋아요-->
                                <i onclick="myFunction(this)" class="fa fa-thumbs-up"></i>
                            </div>
                            <script> function myFunction(){ alert('찜 성공'); } </script>
                        </div>
                        <div id="star-point">★ ★ ★ ★ ★</div><!--평점 어찌넣지?-->
                        <div id="address-phone"><h7>서울특별시 서대문구 경기대로 68 동신빌딩 3층(2층,지하1층)<br>0504-3172-6306</h7></div>
                        <div id="choice">옵션 선택
                            <select name="choice" aria-placeholder="옵션선택" style="width: 100%; height: 40px;" >
                                <option value="one">헬스</option>
                                <option value="two">요가</option>
                                <option value="three">필라테스</option>
                                <option value="four">클라이밍</option>
                            </select>
                        </div>
                        <div id="basket-button"><!--담기-->
                            <button onclick="javascript:btn()" type="button" class="btn btn-primary" style="width: 100%; height: 100%;" >회원권 담기</button>
                        </div>
                        <script> function btn(){ alert('담기 성공'); } </script>
                    </div>
                </div>    
            </div><!--detail-header-->
            
            <div id="detail-window">
                <div id="window-menu">
                    <ul class="nav nav-tabs nav-justified"><!--클릭시 메뉴바 태그 연결-->
                        <li class="nav-item">
                            <a class="nav-link" href="#section1"><h5>시설정보</h5></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#section2"><h5>사진</h5></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#section3"><h5>이용후기</h5></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#section4"><h5>위치</h5></a>
                        </li>
                    </ul>
                </div>
                <div id="menu-sebu">
                    <div class="bord-section">
                        <div id="section1" class="container-fluid">
	                    	<div id="notice-zone">
	                            <div id="notice">
	                                <p>서대문역 1번출구 5분거리!! 3개 각층 넓고 쾌적한 VIP휘트니스!!
	                                ▶3층 웨이트 및 P.T존! ▶2층 유산소존! ▶B1층 찜질방 및 G.X존</p>
	                            </div>
	                        </div> 
                            <div id="price-zone">    
                                <div id="price">
                                    <div class="price-title"><h5>가격정보</h5></div>
                                    <div id="price-buga">
                                        <div class="buga-title"><h6>헬스</h6></div>
                                        <div id="contentt">
                                            1개월 3개월 6개월 12개월
                                        </div>
                                        <div class="buga-title"><h6>요가</h6></div>
                                        <div id="contentt">
                                            1개월 3개월 6개월 12개월
                                        </div>
                                        <div class="buga-title"><h6>필라테스</h6></div>
                                        <div id="contentt">
                                            1개월 3개월 6개월 12개월
                                        </div>
                                        
                                    </div>    
                                </div>
                            </div>
                            <div id="notice2-zone">
                                <div id="notice2">
                                    <div id="notice2-title"><h5>공지사항</h5></div>
                                    <div id="notice2-con">
                                    ※ONLY 다짐에서만 가능한 VIP휘트니스 선착순 우주 최저가 혜택
                                    -12개월권을 6개월 가격으로! 선착순 5명 (조기소진시 정상가전환)
                                    </div>
                                </div>
                            </div>
                            <div id="time-zone">
                                <div id="time">
                                    <div id="time-play"><h5>운영시간</h5></div>
                                    <div id="time-con">
                                        [평　일] 06:00 ~ 23:00<br>
                                        [토요일] 09:00 ~ 19:00<br>
                                        [일요일] 12:00 ~ 18:00<br>
                                        [휴관일] 둘째 ,넷째 주 일요일
                                    </div>
                                </div>
                            </div>
                            <div id="program-zone">
                                <div id="program">
                                    <div class="program-title"><h5>운영프로그램</h5></div>
                                    <div class="program-sebu">
                                        유료<Br>
                                        라커 (월 이용료 10,000원)<br>
                                        - ※단, 헬스 또는 헬스 + G.X 12개월 이상 등록시 월 5,000원)<br>
                                        무료<Br>
                                        찜질방 / 운동복 / 수건 / 주차 3시간 무료
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--이미지구역-->
                        <div id="section2" class="container-fluid">
                            <div id="image-zone">
                                <div id="image-title"><h5>사진</h5></div>
                                <div id="image-sebu">    
                                    <div class="img">
                                        <div class="col-md-12 ml-auto mr-auto text-center">
                                            <a href="img/light01_s.jpg"><img src="img/light01.jpg" alt="이미지"></a>
							                <a href="img/light02_s.jpg"><img src="img/light02.jpg" alt="이미지"></a>
							                <a href="img/light03_s.jpg"><img src="img/light03.jpg" alt="이미지"></a>
                                            <a href="img/light04_s.jpg"><img src="img/light04.jpg" alt="이미지"></a>
                                            <a href="img/light05_s.jpg"><img src="img/light05.jpg" alt="이미지"></a>
                                            <a href="img/light06_s.jpg"><img src="img/light06.jpg" alt="이미지"></a>
                                            <a href="img/light07_s.jpg"><img src="img/light07.jpg" alt="이미지"></a>
                                            <a href="img/light08_s.jpg"><img src="img/light08.jpg" alt="이미지"></a>
                                            <a href="img/light09_s.jpg"><img src="img/light09.jpg" alt="이미지"></a>
                                            <a href="img/light10_s.jpg"><img src="img/light10.jpg" alt="이미지"></a>
                                        </div>    
                                    </div>
                                </div>
                                <div class="button">펼쳐보기</div>    
                            </div>
                        </div>
                    
                        <div id="section3" class="container-fluid">
                            <div id="review-zone">
                                <div class="title-button">
                                    <div id="review-title"><h5>이용후기</h5></div>
                                    <div id="review-button">
                                        <button onclick="inputData();">후기 쓰기</button>
                                    </div>  
                                </div>    
                                <div id="review-content">
                                    <input type="text" id="content" placeholder="아직 작성된 후기가 없어요. 첫번째 후기를 남겨주세요." >
                                </div>
                                <script>
                                    function inputData(){
                                        var text=document.getElementById("content").value;
                                        document.getElementById("review-content").innerText+=text;
                                        alert(text);
                                    }
                                </script>
                            </div>
                        </div>

                        <div id="section4" class="container-fluid">
                            <div id="map-title"><h5>위치</h5></div>
                            <div id="map-api">지도api</div>
                        </div>

                    </div><!--bord-section-->
                    <div class="aside">
                        <div id="choice-bar">옵션 선택
                            <select name="choice" aria-placeholder="옵션선택" style="width: 100%; height: 40px;" >
                                <option value="one">헬스</option>
                                <option value="two">요가</option>
                                <option value="three">필라테스</option>
                                <option value="four">클라이밍</option>
                            </select>
                        </div>
                        <div id="basket-button2">
                            <button onclick="javascript:btn()" type="button" class="btn btn-primary" style="width: 100%; height: 100%;" >회원권 담기</button>
                        </div>
                        <script> function btn(){ alert('담기 성공'); } </script>
                    </div>    
                </div>
            </div><!--detail-window-->
        </div>
    </div>
    <!-- sectio끝 -->





<%@ include file="/views/common/footer.jsp"%>