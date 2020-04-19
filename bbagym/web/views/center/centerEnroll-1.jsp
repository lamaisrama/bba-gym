<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ page import="com.bbagym.model.vo.CenterEnroll" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
<!-- 카카오맵 API 불러오는 script -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=910ff98ddccfbc580e580a9ce7d7285d&libraries=services"></script>

<div class="page-header page-header-xs" data-parallax="true" style="background-image: url('<%=request.getContextPath()%>/resources/img/runners-test.gif');"></div>
<div class="container pt-3 center-info">
	<form action="<%=request.getContextPath() %>/centerEnroll.do" method="post">

    <div class="row">
      <div class="col-lg-8 col-md-8 col-sm-12">
        <h1 class="mt-4" style="text-align: center;">시설 등록</h1>
        <h6 style="text-align: right;"> <span><b>1. 기본 정보 입력</b></span> > <span style="color: grey;">2.상세 정보 입력</span></h6>
        <hr>
          <fieldset>
          	<input type="hidden" name="m-code" value="<%=logginMember.getM_CODE()%>">
            <div class="form-group">
              <label for="c-name">센터명</label>
              <input type="text" class="form-control" name ="c-name" id="c-name" placeholder="센터명을 입력하세요" required>
            </div>
            <br>
            <div class="form-group">
              <label for="c-address">센터 주소</label>
              <button type="button" class="btn btn-warning" onclick="goPopup()">센터주소</button>
              <input type="text" class="form-control" type="text" name="c-address" id="c-address" placeholder="Enter Addr">
              <input type="hidden" id="addrX" name="addrX" value="">
			  <input type="hidden" id="addrY" name="addrY" value="">
              <!-- 주소 api를 통해 오는 데이터   -->
            </div>
            <br>
            <div class="form-group">
              <label for="c-tel">센터 연락처</label>
              <input type="tel" name="c-tel" id="c-tel" class="form-control" required>
            </div>
            <br>
            <div class="form-group">
              <label for="c-operating-hr">운영시간</label>
              <input type="text" name="c-operating-hr" id="c-operating-hr" class="form-control"  required>
            </div>
            <br>
            <div class="form-group">
              <label for="c-holiday">휴무일</label>
              <input type="text" name="c-holiday" id="c-holiday" class="form-control" required>
            </div>
            <br>
            <div class="form-group">
              <label>카테고리</label> <br>
              <div class="form-check-inline">
                <label class="form-check-label" for="c-cat-1">
                  <input type="checkbox" class="form-check-input" id="c-cat-1" name="c-cat" value="1">수영
                </label>
              </div>
              <div class="form-check-inline">
                <label class="form-check-label" for="c-cat-2">
                  <input type="checkbox" class="form-check-input" id="c-cat-2" name="c-cat" value="2">GX
                </label>
              </div>
              <div class="form-check-inline">
                <label class="form-check-label" for="c-cat-3">
                  <input type="checkbox" class="form-check-input" id="c-cat-3" name="c-cat" value="3">헬스
                </label>
              </div>
              <div class="form-check-inline">
                <label class="form-check-label" for="c-cat-4">
                  <input type="checkbox" class="form-check-input" id="c-cat-4" name="c-cat" value="4">골프
                </label>
              </div>
              <div class="form-check-inline">
                <label class="form-check-label" for="c-cat-5">
                  <input type="checkbox" class="form-check-input" id="c-cat-5" name="c-cat" value="5">필라테스
                </label>
              </div>
              <div class="form-check-inline">
                <label class="form-check-label" for="c-cat-6">
                  <input type="checkbox" class="form-check-input" id="c-cat-6" name="c-cat" value="6">요가
                </label>
              </div>
              <div class="form-check-inline">
                <label class="form-check-label" for="c-cat-7">
                  <input type="checkbox" class="form-check-input" id="c-cat-7" name="c-cat" value="7">테니스
                </label>
              </div>
            </div>
            <br>
            <div class="form-group">
              <label>편의시설</label> <br>
              <div class="form-check-inline">
                <label class="form-check-label" for="c-fac-1">
                  <input type="checkbox" class="form-check-input" id="c-fac-1" name="c-fac" value="1">샤워시설
                </label>
              </div>
              <div class="form-check-inline">
                <label class="form-check-label" for="c-fac-2">
                  <input type="checkbox" class="form-check-input" id="c-fac-2" name="c-fac" value="2">운동복
                </label>
              </div>
              <div class="form-check-inline">
                <label class="form-check-label" for="c-fac-3">
                  <input type="checkbox" class="form-check-input" id="c-fac-3" name="c-fac" value="3">수건
                </label>
              </div>
              <div class="form-check-inline">
                <label class="form-check-label" for="c-fac-4">
                  <input type="checkbox" class="form-check-input" id="c-fac-4" name="c-fac" value="4">개인락커
                </label>
              </div>
              <div class="form-check-inline">
                <label class="form-check-label" for="c-fac-5">
                  <input type="checkbox" class="form-check-input" id="c-fac-5" name="c-fac" value="5">인바디
                </label>
              </div>
              <div class="form-check-inline">
                <label class="form-check-label" for="c-fac-6">
                  <input type="checkbox" class="form-check-input" id="c-fac-6" name="c-fac" value="6">와이파이
                </label>
              </div>
              <div class="form-check-inline">
                <label class="form-check-label" for="c-fac-7">
                  <input type="checkbox" class="form-check-input" id="c-fac-7" name="c-fac" value="7">주차장
                </label>
              </div>
              <div class="form-check-inline">
                <label class="form-check-label" for="c-fac-8">
                  <input type="checkbox" class="form-check-input" id="c-fac-8" name="c-fac" value="8">기타
                </label>
              </div>
            </div>
            <br>
            <div class="form-group">
              <label for="c-sns-1">홈페이지</label>
              <input class="form-control" type="text" name="sns-homepage" id="c-sns-1">
            </div>
            <br>
            <div class="form-group">
              <label for="c-sns-2">인스타그램</label>
              <input class="form-control" type="text" name="sns-insta" id="c-sns-2">
            </div>
            <br>
            <div class="form-group">
              <label for="c-sns-3">블로그</label>
              <input class="form-control" type="text" name="sns-blog" id="c-sns-3">
            </div>
            <br>
            <div class="form-group">
              <label for="c-sns-4">기타 사이트</label>
              <input class="form-control" type="text" name="sns-etc" id="c-sns-4">
            </div>
            <br>
          </fieldset>
        
	      </div>
	    </div>
	    <hr>
	    <div class="row">
	      <div class="col-lg-8 col-md-8 col-sm-12 info-footer">
	        <div class="info-footer-inner">
	        	<input type="submit" class="btn btn-primary" name="제출" value="다음">
		    </div>
	      </div>
	    </div>

	    
	<script>
		
		function goPopup(){
		// 주소검색을 수행할 팝업 페이지를 호출합니다.
		// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
		var pop = window.open("<%=request.getContextPath() %>/popup/jusoPopupXY.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
		
		// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/arerddrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
	    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
		}
		
		function jusoCallBack(roadFullAddr, entX, entY){
			console.log(roadFullAddr, entX, entY);
			
			// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.		
			document.getElementById('c-address').value = roadFullAddr;
			
			
			//주소 정보에 해당하는 좌표값을 요청한다.
			var geocoder = new kakao.maps.services.Geocoder();

			var callback = function(result, status) {
			    if (status === kakao.maps.services.Status.OK) {
			        console.log('변환 x:'+result[0].x); // 126.570667
			        console.log('변환 y:'+result[0].y); // 33.45070100000001
			        document.getElementById("addrX").value=result[0].x;
			        document.getElementById("addrY").value=result[0].y;
			    }
			};

			geocoder.addressSearch(roadFullAddr, callback);
			
/*				//입력한 좌표를 다른 좌표계의 좌표로 변환한다.
			var geocoder = new kakao.maps.services.Geocoder();
		    

 			var callback = function(result, status) {
			    if (status === kakao.maps.services.Status.OK) {
			        console.log('변환 x:'+result[0].x); // 126.570667
			        console.log('변환 y:'+result[0].y); // 33.45070100000001
			        document.getElementById("addrX").value=result[0].x;
			        document.getElementById("addrY").value=result[0].y;
			    }
			};
	
			// TM 좌표를 WGS84 좌표계의 좌표로 변환한다
				//도로명주소 도움센터에서 제공하는 좌표API의 좌표 체계는 EPSG-5179(UTM-K (GRS80))
			geocoder.transCoord(entX, entY, callback, {
			    input_coord: kakao.maps.services.Coords.CONGNAMUL,
			    output_coord: kakao.maps.services.Coords.WGS84
			}); */
			

		}
	
	</script>
      		

	
<script src="<%=request.getContextPath()%>/js/script_center.js"></script>
<%@ include file="/views/common/footer.jsp"%>