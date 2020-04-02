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
                        <div id="section1" class="container-fluid">시설정보
                            <div id="notice">
                                <p>서대문역 1번출구 5분거리!! 3개 각층 넓고 쾌적한 VIP휘트니스!!
                                ▶3층 웨이트 및 P.T존! ▶2층 유산소존! ▶B1층 찜질방 및 G.X존</p>
                            </div>
                            <div id="price">
                                
                            </div>
                        </div>
                        <!--이미지구역-->
                        <div id="section2" class="container-fluid">
                            <div class="col-lg-3 col-md-4 col-6">
                                <a href="#" class="d-block mb-4 h-100">
                                      <img class="img-fluid img-thumbnail" src="https://source.unsplash.com/pWkk7iiCoDM/400x300" alt="">
                                    </a>
                              </div>
                              <div class="col-lg-3 col-md-4 col-6">
                                <a href="#" class="d-block mb-4 h-100">
                                      <img class="img-fluid img-thumbnail" src="https://source.unsplash.com/aob0ukAYfuI/400x300" alt="">
                                    </a>
                              </div>
                              <div class="col-lg-3 col-md-4 col-6">
                                <a href="#" class="d-block mb-4 h-100">
                                      <img class="img-fluid img-thumbnail" src="https://source.unsplash.com/EUfxH-pze7s/400x300" alt="">
                                    </a>
                              </div>
                              <div class="col-lg-3 col-md-4 col-6">
                                <a href="#" class="d-block mb-4 h-100">
                                      <img class="img-fluid img-thumbnail" src="https://source.unsplash.com/M185_qYH8vg/400x300" alt="">
                                    </a>
                              </div>
                        </div>
                    
                        <div id="section3" class="container-fluid">이용후기
                            
                        </div>

                        <div id="section4" class="container-fluid">
                            <div class="map">지도</div>
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