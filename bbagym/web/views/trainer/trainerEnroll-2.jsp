<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
<style>
  .btn-t-price{ margin-top: 38px; }
</style>
<div class="page-header page-header-xs" data-parallax="true"
  style="background-image: url('<%=request.getContextPath()%>/assets/img/fabio-mangione.jpg');"></div>
<form  method="post" action="<%=request.getContextPath()%>/trainer/trainerEnrollEnd" encType="multipart/form-data" onsubmit="return t_validate();">
  <div class="container div-here">
    <div class="row">
      <div class="col-lg-8 col-md-8 col-sm-12">
        <h1 class="mt-4" style="text-align: center;">트레이너 등록</h1>
        <h6 style="text-align: right;"> <span style="color: grey;">1.기본 정보 입력</span> > <span><b>2. 상세 정보 입력</b></span>
        </h6>
      </div>
    </div>
    <hr>
    <div class="row">
      <div class="col-lg-8 col-md-8 col-sm-12">
        <div class="form-group">
          <label for="exampleTextarea">트레이너 소개</label>
          <textarea class="form-control" name="t-text" rows="3" placeholder="트레이너님에 대한 소개를 작성하여 트레이너님을 어필해주세요."></textarea>
        </div>
        <br>
        <div class="form-group">
          <label for="exampleTextarea">트레이너 경력</label>
           <textarea class="form-control" name="t-career" rows="2" placeholder="트레이너님의 경력 사항을 작성해주세요"></textarea>
        </div>
        <br>
        <div class="form-group">
          <label for="exampleInputFile">대표 사진 등록</label>
          <input type="file" class="form-control-file" id="photo-main" name="t_photo_main" aria-describedby="fileHelp">
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
        <div class="imgs_wrap"></div>
        <br>
      </div>
    </div>
    <hr>
    <!-- <span style="float:right;"><button type="button" class="btn btn-default btn-sm" onclick="deleteProgram();">삭제</button></span> -->
    <div class="row div-program-0">
      <div class="col-md-8 div-t-price-0">
      	<label for="">프로그램 등록</label>
        <div class="form-group">
          <label for="">프로그램 정보 입력</label>
          <input type="text" name="tp" class="form-control " placeholder= " 프로그램명을 입력해주세요" required>
          <div class="input-group mb-3">
            <div class="input-group-prepend">
              <span class="input-group-text"> 횟수 </span>
            </div>
            <input type="text" class="form-control" name="t-p-count-0">
            <div class="input-group-prepend">
              <span class="input-group-text"> 가격 </span>
            </div>
            <input type="text" class="form-control" name="t-p-price-0">
            <input type="button" class="btn btn-default btn-sm" value="삭제" disabled style="cursor: Default;">
            <input type="button" class="btn btn-primary btn-sm" value="추가" onclick="addCount(this);">
          </div>
        </div>     
      </div> <!--첫번째 프로그램 div 끝-->


      <br>
    </div>
  </div>

  <br>
  <div class="container container-add">
    <div class="row">
      <div class="col-lg-8 col-md-8 col-sm-12" style="text-align: center;">
        <button type="button" class="btn btn-warning" onclick="addProgram();">프로그램 추가</button>
        <button type="button" class="btn btn-secondary" onclick="delProgram();">삭제</button>
        <br><small style="color:red;"> &nbsp;삭제 시에는 마지막 프로그램이 삭제됩니다.</small>
      </div>

    </div>
    <hr>
    <div class="row">
      <div class="col-lg-8 col-md-8 col-sm-12 info-footer">	
          <button type="submit" class="btn btn-secondary" >등록</button>
        </div>
      </div>

    </div>
    <!--container 끝-->
</form>
<script src="<%=request.getContextPath()%>/js/script_trainner.js"></script>
<%@ include file="/views/common/footer.jsp"%>