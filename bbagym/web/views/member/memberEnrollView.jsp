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
			
			<form action="<%=request.getContextPath()%>/member/updateMember.do" method="post"  enctype="multipart/form-data">
				
					<label for="c-name">아이디</label>
					<div class="form-group" style="display: flex">
  					<input type="text" class="form-control" style="width: 100%;" name="id" value="<%=m.getM_ID()%>" readonly>
				
						
					</div>
					
					<br> <label for="c-tel">이름</label>
					<div class="form-group" style="display: flex" >

					 <input type="tel" style="width: 50%;" class="form-control" name="M_NAME" id="M_NAME_"  value="<%=m.getM_NAME()%>" >
					 <input style="width: 25%;" type="radio" name="M_GENDER" id="M_GENDER0" value="M"  <%=m.getM_GENDER()=='M'?"checked":"" %>> 
							<label for="M_GENDER0">남</label> 
						<input style="width: 25%;" type="radio" name="M_GENDER" id="M_GENDER1" value="F" <%=m.getM_GENDER()=='F'?"checked":"" %>> 
						    <label for="M_GENDER1">여</label>
					</div>
					<br>
					<div class="form-group">
					<label for="c-time">나이</label> 
					<input type="number"class="form-control" name="M_AGE" id="M_AGE"  value="<%=m.getM_AGE()%>"> <br>
						<label for="c-time">이메일</label>  
					<input type="text"class="form-control" name="M_EMAIL" id="M_EMAIL"  value="<%=m.getM_EMAIL()%>" readonly> 
					</div>
					<br>
					<div class="form-group">
						<label for="c-time">주소</label> 
					<input type="text" class="form-control" name="M_ADDRESS" id="M_ADDRESS" value="<%=m.getM_ADDRESS()%>"> 
					</div>
					<br>
					<div class="form-group">
						<label for="c-time">PHONE</label>
						<input type="text" class="form-control" name="M_PHONE" id="M_PHONE" value="<%=m.getM_PHONE()%>"> 
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
					<div class="info-footer-inner">
						<a href="<%=request.getContextPath()%>"><button type="button"
								class="btn btn-secondary">취소</button></a> &nbsp;&nbsp;&nbsp;
						<input class="btn btn-secondary" type="submit" value="수정"> 
					</div>
				
			</form>
		</div>
	</div>
	<hr>

	
	<%@ include file="/views/common/footer.jsp"%>