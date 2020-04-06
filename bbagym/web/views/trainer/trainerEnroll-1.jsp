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
			              <label for="c-address">수업 주소</label>
			              <input class="form-control" type="text" name="c_address">
			            </div>
		            <br>
			            <div class="form-group">
			              <label for="c-address">소속 센터</label>
			              <br>
			              <button class="btn btn-warning btn-sm" type="button" onclick="searchcenter();">찾기</button>
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
			open(url,"_blank",status);
			
		}

    
    
    </script>

<script src="<%=request.getContextPath()%>/js/script_trainner.js"></script>
<%@ include file="/views/common/footer.jsp"%>