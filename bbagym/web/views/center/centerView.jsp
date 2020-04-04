<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>


<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/sectionCenter.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

<div class="page-header page-header-xs" data-parallax="true" style="background-image: url('<%=request.getContextPath()%>/assets/img/istock.jpg');"></div>

    <div class="container outer">
        <div class="row">
            <div class="searchBox">
                <input type="text" name="search" placeholder="시설명, 주소로 검색해보세요" size="30">
                <button class="btn btn-warning btn-sm">Find!</button>
            </div>
        </div>
        <div class="row">
            <div class="sortBox">
                <ul class="nav nav-pills nav-tabs" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link" id="amap" data-toggle="tab" href="#map">지도검색</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" id="acategory" data-toggle="tab" href="#category">카테고리</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle"  id="asort" data-toggle="dropdown" href="#">정렬</a>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="#">평점순</a> <!--평점순으로 페이징 처리-->
                            <a class="dropdown-item" href="#">리뷰순</a> <!--리뷰가 많은순으로 페이징처리-->
                            <a class="dropdown-item" href="#">최신순</a> <!--최신순으로 페이징처리-->
                        </div>
                    </li>
                </ul>
            </div>
        </div>
        <div class="row tab-content">
            <div class="tab-pane container" id="map">
                <h3>map api 넣을 구역</h3>
            </div>
            <div class="tab-pane container" id="category">
                <form action="#" method="POST">
                    <input type="checkbox" name="total" value="total" id="total" checked><label for="total">전체</label>
                    <input type="checkbox" name="health" value="health" id="health"><label for="health" >헬스</label>
                    <input type="checkbox" name="GX" value="GX" id="GX"><label for="GX">GX</label>
                    <input type="checkbox" name="swimming" value="swimming" id="swimming"><label for="swimming">수영</label>
                    <input type="checkbox" name="plites" value="plites" id="plites"><label for="plites">필라테스</label>
                    <input type="checkbox" name="yoga" value="yoga" id="yoga"><label for="yoga">요가</label>
                    <br>
                    <input type="checkbox" name="UFC" value="UFC" id="UFC"><label for="UFC">격투기</label>
                    <input type="checkbox" name="dance" value="dance" id="dance"><label for="dance">댄스</label>
                    <input type="checkbox" name="golf" value="golf" id="golf"><label for="golf">골프</label>
                    <input type="checkbox" name="climbing" value="climbing" id="climbing"><label for="climbing">클라이밍</label>
                    <input type="checkbox" name="etc" value="etc" id="etc"><label for="etc">기타</label><br>
                    <button type="submit" class="btn btn-info" >검색</button>
                </form>
            </div>
        </div>
        <div class="row box-content" >
            <h1 style="margin-top: 50px;">시설 정보</h1>
            <br>
            <div class="content-box-outer"><!-- for문 돌려서 페이징 처리해야합니다 pagebarNo=5,numPerpage=5-->
                <div class="content-box-inner" style="background-image: url('https://img1.daumcdn.net/thumb/R720x0.q80/?scode=mtistory2&fname=http%3A%2F%2Fcfile24.uf.tistory.com%2Fimage%2F2579B237591E58961E0693');"> </div>
                <div class="bar"></div>
                <div class="content-box-cotent">
                    <table>
                        <tr>
                            <td colspan="3"></td>
                        </tr>
                        <tr>
                            <td colspan="2"><h2>AB휘트니스클럽</h2></td> <!-- 제목-->
                            <td><h2><i class="fas fa-heart"></i></h2></td><!-- 찜목록 ON/OFF-->
                        </tr>
                        <tr>
                            <td colspan="2">서울 종로구 대학로</td><!-- 위치 API-->
                            <td>10.9Km</td><!-- 거리 API-->
                        </tr>
                        <tr>
                            <td colspan="2"><i class="fas fa-thumbs-up"></i>&nbsp;&nbsp;5.0</td><!-- 평점 점수에따른 이미지변경-->
                            <td></td>
                        </tr>
                        <tr>
                            <td colspan="2"><span class="badge badge-info">헬스</span>&nbsp;&nbsp;<span class="badge badge-info">G.X</span></td><!-- 카테고리-->
                            <td style="padding: 0;"><a>정보 확인하기 ></a></td><!-- 정보 상세로 이동-->
                        </tr>
                        <tr>
                            <td colspan="3"></td>
                        </tr>
                    </table>
                </div><!-- for문 돌려서 페이징 처리해야합니다 -->
            </div>
        </div>
        <div id="pageBar"><!-- 페이지바 JSP구현-->
            <div >
                <ul class="pagination">
                    <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">Next</a></li>
                  </ul>
            </div>
        </div>
    </div><!-- outer container 끝 -->

<script src="<%=request.getContextPath() %>/js/centerViewJs.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<%@ include file="/views/common/footer.jsp"%>