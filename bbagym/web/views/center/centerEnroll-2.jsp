<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
<div class="page-header page-header-xs" data-parallax="true"
  style="background-image: url('<%=request.getContextPath()%>/assets/img/fabio-mangione.jpg');"></div>
<form method="post" action="<%=request.getContextPath()%>/centerEnrollEnd" encType="multipart/form-data">
  <div class="container div-here">
    <div class="row">
      <div class="col-lg-8 col-md-8 col-sm-12">
        <h1 class="mt-4" style="text-align: center;">시설 등록</h1>
        <h6 style="text-align: right;"> <span style="color: grey;">1.기본 정보 입력</span> > <span><b>2. 상세 정보 입력</b></span>
        </h6>
        <br>
      </div>
    </div>
    <hr>
    <div class="row">
      <div class="col-lg-8 col-md-9 col-sm-12">
        <div class="form-group">
          <label for="exampleTextarea">시설 소개</label>
          <textarea class="form-control" name="c-text" id="c-text" rows="5"
            placeholder="시설에 대한 소개를 자세히 작성하여 사업자님의 시설을 어필해주세요." required></textarea>
        </div>
        <br>
        <div class="form-group">
          <label for="c-photo1">대표 사진 등록</label>
          <input type="file" class="form-control-file" name="c-photo" id="c-photo0" aria-describedby="fileHelp"
            required>
          <small id="fileHelp" class="form-text text-muted">사업자님의 시설을 대표할 수 있는 사진 한 장을 업로드해주세요.</small>
          <small id="fileHelp" class="form=text text-muted">가로 세로 비율은 2:1이 바람직합니다.</small>
          <!-- <small id="fileHelp" class="form-text text-muted">This is some placeholder block-level help text for the above input. It's a bit lighter and easily wraps to a new line.</small> -->
        </div>
        <br>
        <div class="form-group div-photo">
          <label for="exampleInputFile">시설 사진 등록</label>
          <div class="div-here">
            <input type="file" class="form-control-file" name="c-photo0" id="c-photo1" aria-describedby="fileHelp2"
              required>
            <small id="fileHelp2" class="form-text text-muted">사업자님의 시설을 보여줄 수 있는 사진을 한 장 이상 업로드해주세요. 최대 다섯장 까지 올릴 수
              있습니다.</small>
            <!-- <input type="file" class="form-control-file" name="" id=""> -->
          </div>
          <button type="button" class="btn btn-secondary btn-sm" onclick="addPhoto();">+</button>
          <!-- <small id="fileHelp" class="form-text text-muted">This is some placeholder block-level help text for the above input. It's a bit lighter and easily wraps to a new line.</small> -->
        </div>
        <br>
        <div class="form-group">
          <label for="exampleInputFile">시간표 등록</label>
          <input type="file" class="form-control-file" name="c-timetable" id="c-timetable" aria-describedby="fileHelp2">
          <small id="fileHelp2" class="form-text text-muted">센터 내의 프로그램에 대한 시간표가 있다면 업로드 해주세요.</small>
          <!-- <small id="fileHelp" class="form-text text-muted">This is some placeholder block-level help text for the above input. It's a bit lighter and easily wraps to a new line.</small> -->
        </div>
      </div>
    </div>
    <br>
    <hr>
    <div class="row program-0">
      <div class="col-lg-8 col-md-8 col-sm-12 ">
      	<label>프로그램 등록</label>
        <table class="table striped">
          <tr>
            <td colspan="2">
              <label for="">첫번째 프로그램명</label>
              <!-- <span style="float:right;"><button type="button" class="btn btn-default btn-sm" onclick="deleteProgram();">삭제</button></span> -->
              <input type="text" name="cp" class="form-control" required>
            </td>
          </tr>
          <tr>
            <td>
              <label for="">1개월 가격</label>
              <input type="text" class="form-control" name="cp0p" required>
            </td>
            <td>
              <label for="">3개월 가격</label>
              <input type="text" class="form-control" name="cp0p" required>
            </td>
          </tr>
          <tr>
            <td>
              <label for="">6개월 가격</label>
              <input type="text" class="form-control" name="cp0p" required>
            </td>
            <td>
              <label for="">12개월 가격</label>
              <input type="text" class="form-control" name="cp0p" required>
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
        <div class="info-footer-inner">
          <button type="button" class="btn btn-secondary">미리보기</button>
          &nbsp;&nbsp;&nbsp;
          <input type="submit" class="btn btn-secondary" value="enroll"></button>
        </div>
      </div>

    </div>
    <!--container 끝-->
</form>

<script src="<%=request.getContextPath()%>/js/script_center.js"></script>
<%@ include file="/views/common/footer.jsp"%>