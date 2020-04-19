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
			<h1 class="mt-4" style="text-align: center;"><b><%=m.getM_NAME()%></b> 님의 회원정보</h1>
			<h6 style="text-align: right;">
			
			
			
			</h6>
			<hr>
			
			<form action="<%=request.getContextPath()%>/member/updateMember.do" method="post"  enctype="multipart/form-data">
				<input type="hidden" name="M_CODE" value="<%=m.getM_CODE()%>"/>
				<input type="hidden" name="M_LEVEL" value="<%=m.getM_LEVEL()%>"/>
					<label for="c-name">아이디</label>
					<div class="form-group" style="display: flex">
  					<input type="text" class="form-control" style="width: 100%;" name="id" value="<%=m.getM_ID()%>" readonly>
				
						
					</div>
					
					<br> <label for="c-tel">이름</label>
					<div class="form-group" style="display: flex" >

					 <input type="tel" style="width: 50%;" class="form-control" name="M_NAME" id="M_NAME_"  value="<%=m.getM_NAME()%>" readonly >
					 <input style="width: 25%;" type="radio" name="M_GENDER" id="M_GENDER0" value="M"  <%=m.getM_GENDER()=='M'?"checked":"" %>> 
							<label for="M_GENDER0">남</label> 
						<input style="width: 25%;" type="radio" name="M_GENDER" id="M_GENDER1" value="F" <%=m.getM_GENDER()=='F'?"checked":"" %>> 
						    <label for="M_GENDER1">여</label>
					</div>
					<br>
					<div class="form-group">
					<label for="c-time">나이</label> 
					<input type="number"class="form-control" name="M_AGE" id="M_AGE"  value="<%=m.getM_AGE()%>"readonly> <br>
						<label for="c-time">이메일</label>  
					<input type="text"class="form-control" name="M_EMAIL" id="M_EMAIL"  value="<%=m.getM_EMAIL()%>" readonly> 
					</div>
					<br>
					<div class="form-group"><label for="c-time">주소&nbsp&nbsp</label>
						
					<input type="text" class="form-control" name="M_ADDRESS" id="M_ADDRESS" placeholder="주소를 클릭하세요"  style="margin-top:10px;" value="<%=m.getM_ADDRESS()%>"  readonly> 
					</div>
					<br>
					<div class="form-group">
						<label for="c-time">PHONE</label>
						<input type="text" class="form-control" name="M_PHONE" id="M_PHONE" value="<%=m.getM_PHONE()%>" readonly> 
					</div>
					<br>
					
					<div class="info-footer-inner" style="display:flex; justify-content:center;">
					
				<a style="width:50%; text-decoration: none;"class="btn btn-secondary"href="<%=request.getContextPath()%>/admin/memberlist.do">돌아가기</a></td>
					
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
</script>

	
	<%@ include file="/views/common/footer.jsp"%>