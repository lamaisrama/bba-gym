<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
<div class="page-header page-header-xs" data-parallax="true" style="background-image: url('<%=request.getContextPath()%>/assets/img/fabio-mangione.jpg');"></div>
 <form>
  <div class="container div-here">
    <div class="row">
      <div class="col-lg-8 col-md-8 col-sm-12">
        <h1 class="mt-4" style="text-align: center;">시설 등록</h1>
        <h6 style="text-align: right;"> <span style="color: grey;">1.기본 정보 입력</span> > <span><b>2. 상세 정보 입력</b></span> 
        </h6>
      </div>
    </div>
    <hr>
    
      <div class="row">
        <div class="col-lg-8 col-md-9 col-sm-12">
          <div class="form-group">
            <label for="exampleTextarea">시설 소개</label>
            <textarea class="form-control" name="center_text" id="exampleTextarea" rows="3" placeholder="시설에 대한 소개를 자세히 작성하여 사업자님의 시설을 어필해주세요."></textarea>
          </div>
        </div>
      </div>
      <div class="row program-0">
        <div class="col-lg-8 col-md-8 col-sm-12 ">
          <table class="table striped">
            <tr>
              <td colspan="2"> 
                  <label for="">프로그램명</label>
                  <!-- <span style="float:right;"><button type="button" class="btn btn-default btn-sm" onclick="deleteProgram();">삭제</button></span> -->
                  <input type="text" class="form-control">
              </td>
            </tr>
            <tr>
              <td>
                <label for="">1개월 가격</label>
                <input type="text" class="form-control">
              </td>
              <td>
                <label for="">3개월 가격</label>
                <input type="text" class="form-control">
              </td>
            </tr>
            <tr>
              <td>
                <label for="">6개월 가격</label>
                <input type="text" class="form-control">
              </td>
              <td> 
                <label for="">12개월 가격</label>
                <input type="text" class="form-control">
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
            <a href="<%=request.getContextPath()%>/views/center/centerEnroll-1.jsp"><button type="button" class="btn btn-secondary">이전</button></a>
            &nbsp;&nbsp;&nbsp;
            <button type="button" class="btn btn-secondary">미리보기</button>
          &nbsp;&nbsp;&nbsp;
            <button type="button" class="btn btn-secondary">등록</button>
        </div>
      </div>

  </div> <!--container 끝-->
</form>

<script src="<%=request.getContextPath()%>/js/script_center.js"></script>
<%@ include file="/views/common/footer.jsp"%>