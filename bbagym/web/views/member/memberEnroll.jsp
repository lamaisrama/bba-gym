<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
	<%@ page
	import="com.bbagym.model.vo.Member"%>


<% 
	Member info = (Member)session.getAttribute("info");
%>
	
<%@ include file="/views/common/header.jsp"%>


<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
<script src="<%=request.getContextPath()%>/js/jquery-3.4.1.min.js"></script>
<div class="page-header page-header-xs" data-parallax="true"style="background-image: url('<%=request.getContextPath()%>/assets/img/fabio-mangione.jpg');"></div>
<div class="container pt-3 center-info ">
	<div class="row">
		<div class="col-lg-8 col-md-8 col-sm-12">
			<h1 class="mt-4" style="text-align: center;">일반 회원가입</h1>
			<h6 style="text-align: right;">
				<span><b>1. 기본 정보 입력</b><p style="color:red;">* 필수입력</p></span>
			</h6>
			<hr>
			
			<form action="<%=request.getContextPath()%>/member/memberEnrollEnd" method="post" onsubmit="return fn_enroll_validate();" enctype="multipart/form-data">
				
					<label for="c-name"><pre style="color:red ; display:inline-block">*</pre>아이디</label>
					<div class="form-group" style="display: flex">

						<input type="text" class="form-control" 
							style="width: 80%;" placeholder="영문 대문자 또는 소문자로 시작하며 , 길이는 5~10자로 입력해주세요." name="userId" id="userId_" 
							<%if(info!=null ){ %> 
								value="<%=info.getM_ID() %>" readonly
							<%} %>
							required> 
							<input type="button" onclick="fn_duplicateId();" style="width: 20%;" value="중복확인">
					</div>
					<br> <label for="c-address"><pre style="color:red ; display:inline-block">*</pre>패스워드</label>
					<div class="form-group" style="display: flex">
						<input class="form-control" style="width: 40%;" type=password placeholder="패스워드" name="M_PW" id="password_"required> 
						<input class="form-control" style="width: 40%;" type="password" placeholder="패스워드확인" id="password_2" required><span  style="width:30%;" id="result"></span>					
					</div>
					<span><small>※ 비밀번호는 숫자, 특수문자 각 1회 이상, 영문은 2개 이상 사용하여 8자리 이상입니다. </small></span>
			
					

					
					<input type="hidden" name="M_STATUS" id="M_STATUS" required>
					<br> <label for="c-tel"><pre style="color:red ; display:inline-block">*</pre>이름</label>
					<div class="form-group" style="display: flex">

						<input type="tel" style="width: 50%;" class="form-control" name="M_NAME" id="M_NAME_" required>
						<input style="width: 25%;" type="radio" name="M_GENDER" id="M_GENDER0" value="M" checked > 
							<label for="M_GENDER0">남</label> 
							<input style="width: 25%;" type="radio" name="M_GENDER" id="M_GENDER1" value="F"> <label for="M_GENDER1">여</label>
					</div>
					<br>
					<div class="form-group">
					<label for="c-time"><pre style="color:red ; display:inline-block">*</pre>나이</label><input type="number"class="form-control" name="M_AGE" id="M_AGE" required><br>
						<label for="c-time"><pre style="color:red ; display:inline-block">*</pre>이메일&nbsp;&nbsp;</label>
						<button type="button"  class="btn btn-warning"  onclick="verify();">인증하기</button><br>
						<input type="email"class="form-control" name="M_EMAIL" id="M_EMAIL" 
						<%if(info!=null&&info.getM_EMAIL()!=null) {%>
							value="<%=info.getM_EMAIL() %>" readonly
						<%} %>
						required>
						<input type="hidden" id="verifyEmail" value="2">
					</div>
					<br>
					<div class="form-group"><label for="c-time"><pre style="color:red ; display:inline-block">*</pre>주소&nbsp;&nbsp;</label>
						 <button type="button" class="btn btn-warning" onclick="goPopup()">클릭</button>
			              <input type="text" class="form-control" type="text" name="M_ADDRESS" id="M_ADDRESS" placeholder="주소를 클릭하세요" required  style="margin-top:10px;" readonly required> <!-- 주소 api를 통해 오는 데이터   -->
					<br>
					<div class="form-group">
						<label for="c-time"><pre style="color:red ; display:inline-block">*</pre>PHONE</label> <input type="text"
							class="form-control" placeholder="(-없이) 01012345678" name="M_PHONE" id="M_PHONE" required>
					</div>
					<br>
					<div class="form-group div-photo">
						<label for="exampleInputFile">프로필 사진등록</label>
						<div class="div-here">
							<input type="file" class="form-control-file" aria-describedby="fileHelp" name="M_IMAGE" id="M_IMAGE"> 
								<small id="fileHelp" class="form-text text-muted">자신을 보여줄 수 있는 사진을 업로드해주세요. </small>
							
					<br>
					<div class="info-footer-inner">
						<a href="<%=request.getContextPath()%>/member/deletesession.do"><button type="button"class="btn btn-secondary">취소</button></a> &nbsp;&nbsp;&nbsp;
						<input class="btn btn-secondary" type="submit" value="가입"> 
					</div>
				
			</form>
		</div>
	</div>
	<hr>
<script>

	function fn_duplicateId(){
		  var userId=$("#userId_").val();
		  var reg = /^[A-za-z0-9]/g;

		  if(userId.trim().length<5){
	    	alert("아이디를 5글자 이상 입력하세요.");
	   		return;
		 }else if(!reg.test(userId)){
			 alert("영문 대문자 또는 소문자로 시작하며 , 길이는 5~10자로 입력해주세요.");
		   	return;
		 }
	
	const url="<%=request.getContextPath()%>/member/userIdCheck.do?M_ID="+ userId;
	var status = "height=200px, width=300px";
	open(url, "_blank", status);
	
	}

	function fn_enroll_validate() {
		//아이디가 5글자이상 입력되었는지
		//패스워드가맞는지
		//이메일 인증이 되었는지
		var userId = $("#userId_").val();
		var pw = $("#password_").val();
		var pwck = $("#password_2").val();
		var verifyEmail = $("#verifyEmail").val();
		var reg1 = /^[A-za-z0-9]/g;
		var reg2 = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
		
		//현재text에 입력되어 있는 값

		//정규표현식
		/* var reg=/[a-zA-Z0-9]{8,13}/
		//아이디가 4글자 이상 입력됬는지
		if(!reg.test(userId.trim())){
			alert("영문자(대소)나 숫자로 이루어진 8글자이상 13글자 이하로 작성하세요");
		} */
		 //var regPw = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
		 // 특수문자 / 문자 / 숫자 포함 형태의 8~15자리 이내의 암호 정규식

		if (userId.trim().length < 5) {
			alert("아이디를 5글자이상입력하세요.");
			$("#userId_").focus();
			return false;
		} else if(!reg2.test(pw)){
			alert('숫자, 특수문자 각 1회 이상, 영문은 2개 이상 사용하여 8자리 이상 입력해야합니다');
			return false;
		}else if(!reg1.test(userId)){
			 alert("영문 대문자 또는 소문자로 시작하며 , 길이는 5~10자로 입력해주세요.");
			   	return;
		} else if (pw.trim() != pwck.trim()) {
			alert("패스워드가 일치하지 않습니다.");
			$("password_").focus();
			return false;
		} else if(verifyEmail==2){
			alert("이메일 인증이 되어있지 않습니다.");
			$("M_EMAIL").focus();
			return false;
		} 
		
		return true;
	}var pwck=document.getElementById("password_");
    	pwck.onkeyup=function(){
        var pw=document.getElementById("password_2");
        var span=document.getElementById("result");
        var reg=/[a-zA-Z0-9]{8,13}/

        if(pw.value==this.value){
            span.innerHTML="비밀번호가 일치합니다.";
            span.style.color="green";
            span.style.fontWeight="bolder";
        }else{
            span.innerHTML="비밀번호가 일치하지 않습니다.";
            span.style.color="red";
            span.style.fontWeight="bolder";
            // this.value="";
        }
    }
	
	 var pwck=document.getElementById("password_2");
     pwck.onkeyup=function(){
         var pw=document.getElementById("password_");
         var span=document.getElementById("result");

         if(pw.value==this.value){
             span.innerHTML="비밀번호가 일치합니다.";
             span.style.color="green";
             span.style.fontWeight="bolder";
         }else{
             span.innerHTML="비밀번호가 일치하지 않습니다.";
             span.style.color="red";
             span.style.fontWeight="bolder";
             // this.value="";
         }
     }
	
	
	function goPopup(){
    	// 주소검색을 수행할 팝업 페이지를 호출합니다.
    	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
    	var pop = window.open("<%=request.getContextPath() %>/popup/jusoPopup.jsp","pop","width=800,height=300, scrollbars=yes, resizable=yes"); 
    	
    	// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/arerddrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
        //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
    }

    function jusoCallBack(roadFullAddr){
    		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.		
    		document.getElementById('M_ADDRESS').value = roadFullAddr;

    }

    
    
    verify= function() {
		  // 이메일 검증 스크립트 작성
		  var M_EMAIL = document.querySelector("#M_EMAIL").value;
		  var ouath =generateRandom(10000000,999999999);
		  var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		  // 검증에 사용할 정규식 변수 regExp에 저장

		  if (M_EMAIL.match(regExp) != null) {
			  

 			window.open("<%=request.getContextPath() %>/views/member/mail_certification.jsp?M_EMAIL="+M_EMAIL+"&ouath="+ouath, "", "width=370, height=360");
 			code = ouath;
		  }
		  else {
		    alert('이메일 형식을 다시 확인해주세요');
		  }
		};
	
		

		
		var generateRandom = function (min, max) {
			  var ranNum = Math.floor(Math.random()*(max-min+1)) + min;
			  return ranNum;
			}






		

</script>
	
	<%@ include file="/views/common/footer.jsp"%>