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
			<h1 class="mt-4" style="text-align: center;">회원가입</h1>
			<h6 style="text-align: right;">
				<span><b>1. 기본 정보 입력</b><p style="color:red;">* 필수입력</p></span>
			</h6>
			<hr>
			
			<form action="<%=request.getContextPath()%>/member/memberEnrollEnd" method="post" onsubmit="return fn_enroll_validate();" enctype="multipart/form-data">
				
					<label for="c-name"><pre style="color:red ; display:inline-block">*</pre>아이디</label>
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
					<br> <label for="c-address"><pre style="color:red ; display:inline-block">*</pre>패스워드</label>
					<div class="form-group" style="display: flex">
						<input class="form-control" style="width: 50%;" type=password placeholder="패스워드" name="M_PW" id="password_" required> 
						<input class="form-control" style="width: 50%;" type="password" placeholder="패스워드확인" id="password_2" required>
					</div>
					<br> <label for="c-tel"><pre style="color:red ; display:inline-block">*</pre>이름</label>
					<div class="form-group" style="display: flex">

						<input type="tel" style="width: 50%;" class="form-control" name="M_NAME" id="M_NAME_" required>
						<input style="width: 25%;" type="radio" name="M_GENDER" id="M_GENDER0"
							value="M" checked> 
							<label for="M_GENDER0">남</label> 
							<input style="width: 25%;" type="radio" name="M_GENDER" id="M_GENDER1" value="F"> <label for="M_GENDER1">여</label>
					</div>
					<br>
					<div class="form-group">
					<label for="c-time"><pre style="color:red ; display:inline-block">*</pre>나이</label><input type="number"class="form-control" name="M_AGE" id="M_AGE" required><br>
						<label for="c-time"><pre style="color:red ; display:inline-block">*</pre>이메일</label> <input type="text"class="form-control" name="M_EMAIL" id="M_EMAIL"required>
					</div>
					<br>
					<div class="form-group">
						 <button type="button" class="btn btn-warning" onclick="goPopup()">주소</button>
			              <input type="text" class="form-control" type="text" name="M_ADDRESS" id="M_ADDRESS" placeholder="주소를 클릭하세요" required  style="margin-top:10px;"> <!-- 주소 api를 통해 오는 데이터   -->
					<br>
					<div class="form-group">
						<label for="c-time"><pre style="color:red ; display:inline-block">*</pre>PHONE</label> <input type="text"
							class="form-control" placeholder="(-없이) 01012345678" name="M_PHONE" id="M_PHONE" required>
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
						<input class="btn btn-secondary" type="submit" value="가입"> 
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
	
	
	function goPopup(){
    	// 주소검색을 수행할 팝업 페이지를 호출합니다.
    	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
    	var pop = window.open("<%=request.getContextPath() %>/popup/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
    	
    	// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/arerddrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
        //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
    }

    function jusoCallBack(roadFullAddr){
    		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.		
    		document.getElementById('M_ADDRESS').value = roadFullAddr;

    }
</script>
	
	<%@ include file="/views/common/footer.jsp"%>