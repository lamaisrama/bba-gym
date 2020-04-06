<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
	<%@ page
	import="com.bbagym.model.vo.Member"%>

	
<%@ include file="/views/common/header.jsp"%>


<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
<script src="<%=request.getContextPath()%>/js/jquery-3.4.1.min.js"></script>
<div class="page-header page-header-xs" data-parallax="true"style="background-image: url('<%=request.getContextPath()%>/assets/img/fabio-mangione.jpg');"></div>
<div class="container pt-3 center-info ">
	<div class="row">
		<div class="col-lg-8 col-md-8 col-sm-12">
			<h1 class="mt-4" style="text-align: center;">회원정보수정</h1>
			<h6 style="text-align: right;">
				<span><b>1. 기본 정보 입력</b></span>
			</h6>
			<hr>
			
			<form action="" method="post" onsubmit="return fn_enroll_validate();" enctype="multipart/form-data">
				
					<label for="c-name">아이디</label>
					<div class="form-group" style="display: flex">

						<input type="text" class="form-control" 
							style="width: 80%;" placeholder="4글자 이상 입력하세요" name="userId" id="userId_" required> 
							<input type="button" onclick="fn_duplicateId();" style="width: 20%;" value="중복확인">
									<script>
               		function fn_duplicateId(){
                	  var userId=$("#userId_").val();
                  	  if(userId.trim().length<4){
                      alert("아이디를 4글자 이상 입력하세요!");
                     return;
                  }
                  
                  const url="<%=request.getContextPath()%>/member/userIdCheck.do?M_ID="+ userId;
				  var status = "height=200px, width=300px";
				  open(url, "_blank", status);

						}
				</script>
					</div>
					
					<br> <label for="c-tel">이름</label>
					<div class="form-group" style="display: flex">

						<input type="tel" style="width: 50%;" class="form-control" name="M_NAME" id="M_NAME_">
						<input style="width: 25%;" type="radio" name="M_GENDER" id="M_GENDER0"
							value="M" checked> 
							<label for="M_GENDER0">남</label> 
							<input style="width: 25%;" type="radio" name="M_GENDER" id="M_GENDER1" value="F"> <label for="M_GENDER1">여</label>
					</div>
					<br>
					<div class="form-group">
					<label for="c-time">나이</label><input type="number"class="form-control" name="M_AGE" id="M_AGE"><br>
						<label for="c-time">이메일</label> <input type="text"class="form-control" name="M_EMAIL" id="M_EMAIL">
					</div>
					<br>
					<div class="form-group">
						<label for="c-time">주소</label> <input type="text"
							class="form-control" name="M_ADDRESS"
					id="M_ADDRESS">
					</div>
					<br>
					<div class="form-group">
						<label for="c-time">PHONE</label> <input type="text"
							class="form-control" placeholder="(-없이) 01012345678" name="M_PHONE" id="M_PHONE">
					</div>
					<br>
					<div class="form-group div-photo">
						<label for="exampleInputFile">사진 등록</label>
						<div class="div-here">
							<input type="file" class="form-control-file" aria-describedby="fileHelp" name="M_IMAGE" id="M_IMAGE"> 
								<small id="fileHelp" class="form-text text-muted">자신을 보여줄 수 있는 사진을 업로드해주세요. </small>
							
					<br>
					<div class="info-footer-inner">
						<a href="<%=request.getContextPath()%>"><button type="button"
								class="btn btn-secondary">취소</button></a> &nbsp;&nbsp;&nbsp;
						<input class="btn btn-secondary" type="submit" value="수정"> 
					</div>
				
			</form>
		</div>
	</div>
	<hr>
<script>
	function fn_enroll_validate() {
		//아이디가 4글자이상 입력되었는지
		//패스워드가맞는지
		var userId = $("#userId_").val();
		var pw = $("#password_").val();
		var pwck = $("#password_2").val();
		//현재text에 입력되어 있는 값

		//정규표현식
		/* var reg=/[a-zA-Z0-9]{8,13}/
		//아이디가 4글자 이상 입력됬는지
		if(!reg.test(userId.trim())){
			alert("영문자(대소)나 숫자로 이루어진 8글자이상 13글자 이하로 작성하세요");
		} */

		if (userId.trim().length < 4) {
			alert("아이디를 4글자이상입력하세요.");
			$("#userId_").focus();
			return false;
		} else if (pw.trim() != pwck.trim()) {
			alert("패스워드가 일치하지 않습니다.");
			$("password_").focus();
			return false;
		}

		return true;
	}
</script>
	
	<%@ include file="/views/common/footer.jsp"%>