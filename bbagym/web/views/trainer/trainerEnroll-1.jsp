<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
<div class="page-header page-header-xs" data-parallax="true" style="background-image: url('<%=request.getContextPath()%>/assets/img/fabio-mangione.jpg');"></div>
  <div class="container pt-3 center-info ">
    <div class="row">
      <div class="col-lg-8 col-md-8 col-sm-12">
        <h1 class="mt-4" style="text-align: center;">트레이너 등록</h1>
        <h6 style="text-align: right;"> <span><b>1. 기본 정보 입력</b></span> > <span style="color: grey;">2.상세 정보 입력</span></h6>
        <hr>
        	<form action="<%=request.getContextPath() %>/trainer/enrollend1" method="post" enctype="multipart/form-data">
	          <fieldset>
	            <div class="form-group">
		              <label for="c-name">트레이너명</label>
		              <input type="text" class="form-control" id="c-name" placeholder="센터명을 입력하세요" name="t_name">
		            </div>
		            <br>
			            <div class="form-group">
			              <button type="button" class="btn btn-warning" onclick="goPopup()">수업주소</button>
			              <input type="text" class="form-control" type="text" name="c_address" id="c_address" placeholder="Enter Addr" required readonly style="margin-top:10px;"> <!-- 주소 api를 통해 오는 데이터   -->
			            </div>
		            <br>
			            <div class="form-group">
			              <label for="c-address">소속 센터</label>
			              <br>
			              <button class="btn btn-warning btn-sm" type="button" onclick="searchcenter();">찾기</button><!-- 자바스크립트를 통해 open 을한다  -->
			              <input type="text" class="form-control" name="c_name" id="c_name" readonly>
			              <input type="hidden" class="form-control" name="c_code" id="c_code" readonly>
			            </div>
		            <br>
			            <div class="form-group">
			              <label for="c-tel">연락처</label>
			              <input type="tel" class="form-control" name="c_phone">
			            </div>
		            <br>
			            <div class="form-group">
			              <label for="c-time">상담 가능 시간</label>
			              <input type="text" class="form-control" name="counsel">
			            </div>
		            <br>
		            <div class="form-group">
		              <label>카테고리</label> <br>
			              <div class="form-check-inline">
			                <label class="form-check-label" for="c-cat-1">
			                  <input type="checkbox" class="form-check-input" id="c-cat-1" name="c-cat" value="1">헬스
			                </label>
			              </div>
			              <div class="form-check-inline">
			                <label class="form-check-label" for="c-cat-2">
			                  <input type="checkbox" class="form-check-input" id="c-cat-2" name="c-cat" value="2">수영
			                </label>
			              </div>
			              <div class="form-check-inline">
			                <label class="form-check-label" for="c-cat-3">
			                  <input type="checkbox" class="form-check-input" id="c-cat-3" name="c-cat" value="3">필라테스
			                </label>
			              </div>
			              <div class="form-check-inline">
			                <label class="form-check-label" for="c-cat-4">
			                  <input type="checkbox" class="form-check-input" id="c-cat-4" name="c-cat" value="4">요가
			                </label>
			              </div>
			              <div class="form-check-inline">
			                <label class="form-check-label" for="c-cat-5">
			                  <input type="checkbox" class="form-check-input" id="c-cat-5" name="c-cat" value="5">스쿼시
			                </label>
			              </div>
			              <div class="form-check-inline">
			                <label class="form-check-label" for="c-cat-6">
			                  <input type="checkbox" class="form-check-input" id="c-cat-6" name="c-cat" value="6">격투기
			                </label>
			              </div>
			              <div class="form-check-inline">
			                <label class="form-check-label" for="c-cat-7">
			                  <input type="checkbox" class="form-check-input" id="c-cat-7" name="c-cat" value="7">기타
		                </label>
		              </div>
		            </div>
		            <br>
			            <div class="form-group">
			              <label for="c-sns-1">홈페이지</label>
			              <input class="form-control" type="text" name="homepage">
			            </div>
		            <br>
			            <div class="form-group">
			              <label for="c-sns-2">인스타그램</label>
			              <input class="form-control" type="text" name="instagram">
			            </div>
		            <br>
			            <div class="form-group">
			              <label for="c-sns-3">블로그</label>
			              <input class="form-control" type="text" name="blog">
			            </div>
		            <br>
			            <div class="form-group">
			              <label for="c-sns-4">기타 사이트</label>
			              <input class="form-control" type="text" name="etcpart">
			            </div>
		            <br>
			            <div class="form-group">
			              <label for="exampleInputFile">대표 사진 등록</label>
			              <input type="file" class="form-control-file" id="photo-main" name="photo_main" aria-describedby="fileHelp">
			              <small id="fileHelp" class="form-text text-muted">트레이너님을 대표할 수 있는 사진을 업로드해주세요.</small>
			            </div>
		            <br>
		            <div class="form-group div-photo">
		              <label for="exampleInputFile">사진 등록</label>
			              <div class="div-here">
			                <input type="file" class="form-control-file" id="photo-0" name="photo-0" aria-describedby="fileHelp">
			                <small id="fileHelp" class="form-text text-muted">트레이너님을 보여줄 수 있는 사진을 업로드해주세요. 최대 다섯장 까지 올릴 수 있습니다.</small>
			              </div>
		              <button type="button" class="btn btn-secondary btn-sm" onclick="addPhoto();">+</button>
		          	</div>
		          <br>
		          </fieldset>
		          <hr>
				    <div class="row">
				      <div class="col-lg-8 col-md-8 col-sm-12 info-footer">
				        <div class="info-footer-inner">
				          <button type="submit" class="btn btn-secondary">다음</button>
				      </div>
				    </div>
				    <br><br>
			  	</div>
        	</form>
      	</div>
    </div>
    
    <script>
    	
	    function searchcenter(){
			
			const url= "<%=request.getContextPath() %>/trainer/serachCenter.do";
			var status="height=500px, width=500px";
			console.log(url);
			open(url,"_blank",status); /* 소속센터를 찾기위해서 open하는 자바스크립트 */
			
		}
	    
	    function goPopup(){
	    	// 주소검색을 수행할 팝업 페이지를 호출합니다.
	    	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
	    	var pop = window.open("<%=request.getContextPath() %>/popup/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	    	
	    	// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
	        //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
	    }

	    function jusoCallBack(roadFullAddr){
	    		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.		
	    		document.getElementById('c_address').value = roadFullAddr;

	    }

    
    
    </script>

<script src="<%=request.getContextPath()%>/js/script_trainner.js"></script>
<%@ include file="/views/common/footer.jsp"%>