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
        	<form action="<%=request.getContextPath() %>/trainer/trainerEnrollFirst" method="post">
	          <fieldset>
	            <div class="form-group">
		              <label for="t-name">트레이너명 <small> &nbsp; 가입 시 입력하신 이름으로 등록됩니다.</small></label>
		              <input type="hidden" name="m-code" value="<%=logginMember.getM_CODE()%>">
		              <input type="text" class="form-control" name="t-name" id="m-name" value="<%=logginMember.getM_NAME() %>" readonly>
		            </div>
		            <br>
			            <div class="form-group">
			              <label for="t-name">트레이너명 <small> &nbsp; 가입시 입력하신 사업장 주소로 등록됩니다.</small></label>
			              <!-- <button type="button" class="btn btn-warning" onclick="goPopup()">수업주소 </button> -->
			              <!-- <input type="text" class="form-control" name="t-address" id="t-address" placeholder="Enter Addr" required readonly style="margin-top:10px;"> --> <!-- 주소 api를 통해 오는 데이터   -->
			              <input type="text" class="form-control" name="t-address2" value="<%=logginMember.getM_ADDRESS_2() %>" readonly>
			            </div>
		            <br>
			            <div class="form-group">
			              <label for="t-tel">연락처 <small> &nbsp; 가입시 입력하신 사업자 연락처로 등록됩니다.</small></label>
			              <input type="tel" class="form-control" name="t-tel" required value="<%=logginMember.getM_PHONE2()%>" readonly>
			            </div>
		            <br>
			            <div class="form-group">
			              <label for="c-address">소속 센터</label>
			              <br>
			              <button class="btn btn-warning btn-sm" type="button" onclick="searchcenter();">찾기</button><!-- 자바스크립트를 통해 open 을한다  -->
			              <input type="text" class="form-control" name="c_name" id="c_name" value="프리랜서" style="margin-top:10px" readonly >
			              <input type="hidden" class="form-control" name="c_code" id="c_code" value="0" readonly>
			            </div>
		            <br>
			            <div class="form-group">
			              <label for="t-counsel">상담 가능 시간</label>
			              <input type="text" class="form-control" name="t-counsel" id="t-counsel">
			            </div>
		            <br>
		            <div class="form-group">
		              <label>카테고리</label> <br>
			              <div class="form-check-inline">
			                <label class="form-check-label" for="c-cat-1">
			                  <input type="checkbox" class="form-check-input" id="c-cat-1" name="t-cat" value="1">헬스
			                </label>
			              </div>
			              <div class="form-check-inline">
			                <label class="form-check-label" for="c-cat-2">
			                  <input type="checkbox" class="form-check-input" id="c-cat-2" name="t-cat" value="2">수영
			                </label>
			              </div>
			              <div class="form-check-inline">
			                <label class="form-check-label" for="c-cat-3">
			                  <input type="checkbox" class="form-check-input" id="c-cat-3" name="t-cat" value="3">필라테스
			                </label>
			              </div>
			              <div class="form-check-inline">
			                <label class="form-check-label" for="c-cat-4">
			                  <input type="checkbox" class="form-check-input" id="c-cat-4" name="t-cat" value="4">요가
			                </label>
			              </div>
			              <div class="form-check-inline">
			                <label class="form-check-label" for="c-cat-5">
			                  <input type="checkbox" class="form-check-input" id="c-cat-5" name="t-cat" value="5">스쿼시
			                </label>
			              </div>
			              <div class="form-check-inline">
			                <label class="form-check-label" for="c-cat-6">
			                  <input type="checkbox" class="form-check-input" id="c-cat-6" name="t-cat" value="6">격투기
			                </label>
			              </div>
			              <div class="form-check-inline">
			                <label class="form-check-label" for="c-cat-7">
			                  <input type="checkbox" class="form-check-input" id="c-cat-7" name="t-cat" value="7">기타
		                </label>
		              </div>
		            </div>
		            <br>
			            <div class="form-group">
			              <label for="t-homepage">홈페이지</label>
			              <input class="form-control" type="text" name="t-homepage" id="t-homepage">
			            </div>
		            <br>
			            <div class="form-group">
			              <label for="t-insta">인스타그램</label>
			              <input class="form-control" type="text" name="t-insta" id="t-insta">
			            </div>
		            <br>
			            <div class="form-group">
			              <label for="t-blog">블로그</label>
			              <input class="form-control" type="text" name="t-blog" id="t-blog">
			            </div>
		            <br>
			            <div class="form-group">
			              <label for="t-etc">기타 사이트</label>
			              <input class="form-control" type="text" name="t-etc" id="t-etc">
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
	    	
	    	// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/arerddrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
	        //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
	    }

	    function jusoCallBack(roadFullAddr){
	    		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.		
	    		document.getElementById('t-address').value = roadFullAddr;

	    }

    
    
    </script>

<script src="<%=request.getContextPath()%>/js/script_trainner.js"></script>
<%@ include file="/views/common/footer.jsp"%>