<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/admin/common/adminheader.jsp"%>
<%@ page
	import="com.bbagym.model.vo.Member"%>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
h4{
	text-align:center;
}
  #change{
  justify-content:center;
			display:flex;
  	 position:absolute; 
    left:50%;
	margin-left:-100px;  
	
    }
    .blue_button {
    border: solid 1px #328cca;
    height: 40px;
    font-size: 20px;
    /*border-radius*/
    -moz-border-radius: 5px;
    -webkit-border-radius: 5px;
    border-radius: 5px;
    color: #fff;
    background-image: -moz-linear-gradient(top, #3798db, #2c7cd2);
    background-image: -o-linear-gradient(top, #3798db, #2c7cd2);
    background-image: -ms-linear-gradient(top, #3798db, #2c7cd2);
    background-image: -webkit-linear-gradient(top, #3798db, #2c7cd2);
    background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0, #3798db), color-stop(1, #2c7cd2));
    filter:"progid:DXImageTransform.Microsoft.gradient(startColorStr=#3798db, EndColorStr=#2c7cd2)";
    background-image: linear-gradient(top, #3798db, #2c7cd2);
    width: 215px;
    background-color: #2b96f1;
    /*box-shadow*/
    -moz-box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
    -webkit-box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
    box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
    cursor: pointer
}
.blue_button:hover {
    background-image: -moz-linear-gradient(top, #3fadf9, #3493f9);
    background-image: -o-linear-gradient(top, #3fadf9, #3493f9);
    background-image: -webkit-linear-gradient(top, #3fadf9, #3493f9);
    background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0, #3fadf9), color-stop(1, #3493f9));
    filter:"progid:DXImageTransform.Microsoft.gradient(startColorStr=#3fadf9, EndColorStr=#3493f9)";
    background-image: linear-gradient(top, #3fadf9, #3493f9)
}
</style>
	
	<div class="container" 
	style="justify-content:center;
	display:flex;
			
    position:absolute; 
    top:320px; left:50%; 
    margin-left:-100px; 
    width:200px; height:200px; 
 	">

			<!-- 1. 비밀번호 수정-->
	       <form name="" action="<%=request.getContextPath()%>/admin/admInupdatePasswordEnd" method="post" >
	       
	      <h4><b>현재 비밀번호</b></h4>
	    <div class="input-group" style="width:450px;"><span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
				<input class="form-control"type="password" name="password" id=""  placeholder="Password"required>
				
		</div><br>
		   <h4><b>새로운 비밀번호</b></h4>		
		<div class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
				<input class="form-control"type="password" name="password_new" id="password_new" placeholder="New Password" required>
				
		</div><br>
		  <h4> <b>새로운 비밀번호 확인</b></h4>
		<div class="input-group">	<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
				<input class="form-control"type="password" id="password_chk" placeholder="Confirm Password" required>
			
		</div>		<br>
				<input class="blue_button" id="change" type="submit" onclick="return password2_validate();" value="비밀번호변경" /><br><br>
				<input type="hidden" name="M_ID" value="admin" />
			<!-- 정규화 비밀번호 검사--> <!-- 자스 이용하여 비밀번호 다르면 red 같으면 green-->
			<%-- <input type="hidden" name="M_STATUS" value="<%=request.getParameter("M_STATUS") %>" /> --%>
			
			</form>
			
	</div>
			



	

	</div> <!-- header에 section-view 아이디 div 닫아줌 -->
	<script>
		function password2_validate(){
			var pw=document.querySelector("#password_new").value;
			var pwck=document.querySelector("#password_chk").value;
			if(pw!=pwck){
				alert("새 패스워드가 일치하지 않습니다.");
				return false;
			}
			return true;
		}
	</script>
</section>
<%@ include file="/views/admin/common/adminfooter.jsp"%>