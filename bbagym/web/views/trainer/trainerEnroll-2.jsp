<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
<div class="page-header page-header-xs" data-parallax="true"
  style="background-image: url('<%=request.getContextPath()%>/assets/img/fabio-mangione.jpg');"></div>
<form  method="post" action="<%=request.getContextPath()%>/trainer/trainerEnrollEnd" encType="multipart/form-data">
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
      <div class="col-lg-10 col-md-10 col-sm-12">
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
        <br>
      </div>
    </div>
    <hr>
    <div class="row program-0">
      <div class="col-lg-10 col-md-10 col-sm-12 ">
      	<label for="">프로그램 등록</label>
        <table class="table striped">
          <tr>
            <td colspan="2">
              <label for="">프로그램명</label>
              <!-- <span style="float:right;"><button type="button" class="btn btn-default btn-sm" onclick="deleteProgram();">삭제</button></span> -->
              <input type="text" name="tp" class="form-control" required>
            </td>
          </tr>
          <tr>
            <td>
              <label for="">첫번째 횟수,가격 <sub style="color: black;">사이에 반드시 <span style="font-weight:bolder; color:red;">","</span>를 넣어주세요</sub></label>
              <input type="text" class="form-control" name="tp0p">
            </td>
            <td>
              <label for="">두번째 횟수,가격 <sub style="color: black;">사이에 반드시 <span style="font-weight:bolder; color:red;">","</span>를 넣어주세요</sub></label>
              <input type="text" class="form-control" name="tp0p">
            </td>
          </tr>
          <tr>
            <td>
              <label for="">세번째 횟수,가격 <sub style="color: black;">사이에 반드시 <span style="font-weight:bolder; color:red;">","</span>를 넣어주세요</sub></label>
              <input type="text" class="form-control" name="tp0p">
            </td>
            <td>
              <label for="">네번째 횟수,가격 <sub style="color: black;">사이에 반드시 <span style="font-weight:bolder; color:red;">","</span>를 넣어주세요</sub></label>
              <input type="text" class="form-control" name="tp0p">
            </td>
          </tr>
        </table>
      </div>
    </div>
  </div>
  <div class="container">
    <div class="row">
      <div class="col-lg-8 col-md-8 col-sm-12" style="text-align: center;">
        <button type="button" class="btn btn-warning btn-sm" onclick="addProgram();">프로그램 추가</button>
      </div>
    </div>
    <hr>
    <div class="row">
      <div class="col-lg-8 col-md-8 col-sm-12 info-footer">
          <button type="button" class="btn btn-secondary">미리보기</button>
          &nbsp;&nbsp;&nbsp;
          <button type="submit" class="btn btn-secondary" >등록</button>
        </div>
      </div>

    </div>
    <!--container 끝-->
</form>
<script src="<%=request.getContextPath()%>/js/script_trainner.js"></script>
<%@ include file="/views/common/footer.jsp"%>