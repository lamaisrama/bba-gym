<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
	<%@ page
	import="com.bbagym.model.vo.Member"%>
<%
   Member m=(Member)request.getAttribute("member");
%>
<%@ include file="/views/common/header.jsp"%>


<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
<script src="<%=request.getContextPath()%>/js/jquery-3.4.1.min.js"></script>
<div class="page-header page-header-xs" data-parallax="true"style="background-image: url('<%=request.getContextPath()%>/assets/img/fabio-mangione.jpg');"></div>
<div class="container pt-3 center-info ">
	<div class="row">
		<div class="col-lg-8 col-md-8 col-sm-12">
			<h1 class="mt-4" style="text-align: center;">사업자 회원정보수정</h1>
			<h6 style="text-align: right;">
			
			
				<span><b>1. 기본 정보 입력</b></span>
			</h6>
			<hr>
			
			<form action="<%=request.getContextPath()%>/business/updateBusiness.do" method="post"  enctype="multipart/form-data">
				<input type="hidden" name="M_CODE" value="<%=m.getM_CODE()%>"/>
				<input type="hidden" name="M_LEVEL" value="<%=m.getM_LEVEL()%>"/>
					
					<div class="form-group"style="text-align:center;">
						<label for="c-time" ><pre style="color:green ; display:inline-block">*</pre>사업자 등록 번호</label><input type="text"class="form-control" 
							style="width:40%;margin-left:215px;text-align:center;" name="BUSINESS_CODE" id="BUSINESS_CODE" value="<%=m.getBUSINESS_CODE() %>" readonly><br>
						
					</div>
				<hr>
				<br>
					
					<label for="c-name">아이디</label>
					<div class="form-group" style="display: flex">
  					<input type="text" class="form-control" style="width: 100%;" name="id" value="<%=m.getM_ID()%>" readonly>
				
						
					</div>
					
					<br> <label for="c-tel"><pre style="color:red ; display:inline-block">*</pre>이름</label>
					<div class="form-group" style="display: flex" >

					 <input type="tel" style="width: 50%;" class="form-control" name="M_NAME" id="M_NAME_"  value="<%=m.getM_NAME()%>" required>
					 <input style="width: 25%;" type="radio" name="M_GENDER" id="M_GENDER0" value="M"  <%=m.getM_GENDER()=='M'?"checked":"" %>> 
							<label for="M_GENDER0">남</label> 
						<input style="width: 25%;" type="radio" name="M_GENDER" id="M_GENDER1" value="F" <%=m.getM_GENDER()=='F'?"checked":"" %>> 
						    <label for="M_GENDER1">여</label>
					</div>
					<br>
					<div class="form-group">
					<label for="c-time"><pre style="color:red ; display:inline-block">*</pre>나이</label> 
					<input type="number"class="form-control" name="M_AGE" id="M_AGE"  value="<%=m.getM_AGE()%>"required> <br>
						<label for="c-time">이메일</label>  
					<input type="text"class="form-control" name="M_EMAIL" id="M_EMAIL"  value="<%=m.getM_EMAIL()%>" readonly> 
					</div>
					<br>
					<div class="form-group"><label for="c-time"><pre style="color:red ; display:inline-block">*</pre>주소&nbsp&nbsp</label>
						<button type="button" class="btn btn-warning" onclick="goPopup()">클릭</button>
					<input type="text" class="form-control" name="M_ADDRESS" id="M_ADDRESS" placeholder="주소를 클릭하세요" readonly required  style="margin-top:10px;" value="<%=m.getM_ADDRESS()%>" required> 
					</div>
					<br>
					<div class="form-group">
						<label for="c-time"><pre style="color:red ; display:inline-block">*</pre>PHONE</label>
						<input type="text" class="form-control" name="M_PHONE" id="M_PHONE" value="<%=m.getM_PHONE()%>" required> 
					</div>
					<br>
					<div class="form-group div-photo">
						<label for="exampleInputFile">사진 등록</label>
						<div class="div-here">
							<%if(m.getM_IMAGE()!=null) { %>
        				 <input class="form-control-file" aria-describedby="fileHelp" type="file" name="M_IMAGE"/>
         					<span id="fname"><%=m.getM_IMAGE() %></span>
        				 <%} else{ %>
        				 <input class="form-control-file" aria-describedby="fileHelp" type="file" name="M_IMAGE"/>
         					<%} %>
         				<input class="form-control-file" aria-describedby="fileHelp" type="hidden" name="M_IMAGE" value="<%=m.getM_IMAGE() %>"/>
         				
						<small id="fileHelp" class="form-text text-muted">자신을 보여줄 수 있는 사진을 업로드해주세요. </small>
					<br>
						<div class="form-group">
						<label for="c-time">사업자 PHONE</label> <input type="text"
							class="form-control" placeholder="(-없이) 01012345678" name="M_PHONE2" id="M_PHONE2" value="<%=m.getM_PHONE2()%>"/>
						</div>
					<br>
					<div class="form-group">
						 <button type="button" class="btn btn-warning" onclick="goPopup2()">사업장 주소</button>
			              <input type="text" class="form-control" type="text" name="M_ADDRESS_2" id="M_ADDRESS_2" placeholder="주소를 클릭하세요" required  style="margin-top:10px;" value="<%=m.getM_ADDRESS_2() %>" readonly/> <!-- 주소 api를 통해 오는 데이터   -->
					</div>	
							
					<br>
					<div class="info-footer-inner">
						<a href="<%=request.getContextPath()%>">
						<button type="button" class="btn btn-secondary">취소</button></a> &nbsp;&nbsp;&nbsp;
						<input class="btn btn-secondary" type="submit" value="수정"> &nbsp;&nbsp;&nbsp;
						<input class="btn btn-secondary" type="button" value="비밀번호 수정" onclick="open('<%=request.getContextPath()%>/member/updatePassword.do?M_ID=<%=m.getM_ID()%>','_blank','width=400px,height=210px');"/> 
					</div>
				
			</form>
		</div>
	</div>
	<hr>
	<script>
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
    function goPopup2(){
    	// 주소검색을 수행할 팝업 페이지를 호출합니다.
    	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
    	var pop = window.open("<%=request.getContextPath() %>/popup/jusoPopup2.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
    	
    	// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/arerddrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
        //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
    }

    function jusoCallBack2(roadFullAddr){
    		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.		
    		document.getElementById('M_ADDRESS_2').value = roadFullAddr;
   
    }
    
</script>

	
	<%@ include file="/views/common/footer.jsp"%>