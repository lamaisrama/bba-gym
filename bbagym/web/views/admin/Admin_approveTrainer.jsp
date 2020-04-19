<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/admin/common/adminheader.jsp"%>
<%@ page import="java.util.List"%>
<%@ page import="com.bbagym.model.vo.*"%>
<%
	List<AdminTrainer> trainerList = (List) request.getAttribute("trainerList"); /* centerSearchServlet 가져온 데이터 */
%>
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<%--  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/board.css"> --%>
<!--===============================================================================================-->	
<link rel="stylesheet"href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<!--===============================================================================================-->	
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <!--===============================================================================================-->	
  	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet" type='text/css'>
	<link href='https://fonts.googleapis.com/css?family=PT+Sans:700' rel='stylesheet' type='text/css'>
<style type="text/css">

section#memberList-container {
	text-align: center;
}

section#memberList-container table#tbl-member {
	width: 100%;
	border: 1px solid gray;
	border-collapse: collapse;
}

section#memberList-container table#tbl-member th, table#tbl-member td {
	border: 1px solid gray;
	padding: 10px;
}

div#search-container {
	margin: 0 0 10px 0;
	padding: 3px;
	background-color: rgba(0, 188, 212, 0.3);
}

div#search-userId {
	display: inline-block;
}

div#search-userName {
	display: none;
}

div#search-gender {
	display: none;
}
</style>
<!-- 시설 등록 승인-->
<div class="" style="width: 100%; padding-left: 20px;">
	<div
		style="display: flex; justify-content: space-between; align-items: center; width: 100%;">
		<br>
		<h1>트레이너 등록 승인</h1>
		<br>


	</div>
	<!-- 상단 -->
	<table class="table">   
		<thead>
			<tr>
			<th>확인</th>
				<th>소속센터</th>	
				<th>아이디</th>	
				<th>이름</th>
				<th>주소</th>
				<th>폰</th>
				<th>트레이너소개</th>
				
				<th >승인 상태</th>
				
				<th>트레이너 등록승인</th>
				
			</tr>
		</thead>

		<tbody style="height: 45px">
			<%
				if (trainerList.isEmpty()) {
			%>
			<h1>정보가 없습니다</h1>
			<%
				} else {
					for (AdminTrainer t : trainerList) {
			%>
			<!-- for{ -->


			<tr>
				<input name="CODE" type="hidden" value="<%=t.getC_CODE()%>">
					<%
					if (t.getAPPROVAL() == null) {
				%>
				<td>
					<button onclick="" class="w3-panel w3-round-xxlarge w3-teal">심사중</button>

				</td>
				<%
					} else if (t.getAPPROVAL() != null) {
				%>
				<td>
					
						<i style="color:red;"class="fa fa-check hvr-icon"></i>
				
					</td>

				<%
					}
				%>
				<td><%=t.getC_NAME() %>
				<td><%=t.getM_ID()%></td>
				<td><%=t.getM_NAME()%></td>
				<td><%=t.getM_ADDRESS_2()%></td>
				<td><%=t.getM_PHONE_2()%></td>
				<td><%=t.getT_INTRODUCTION()%></td>
				
				<td><input style="text-align:center;border:1px solid white;width:35px;" type="text" name="APPROVAL" value="<%=t.getAPPROVAL()%>" readonly></td>
				<!-- if( ) {-->
			
				
				
				
			
				<td>				
					<button class="btn btn-sunflower"  onclick="updateCheck();">승인</button>
					<button class="btn btn-dark-blue" onclick="noCheck();">거절</button>
				</td>
				<style>
				
/*All the button styles*/

* {-moz-box-sizing: border-box; -webkit-box-sizing: border-box; box-sizing: border-box;}
a{text-decoration:none;}

/********************
GENERIC BUTTON STYLES
********************/

.btn {font-size: 18px; white-space:nowrap; width:70px; padding:.8em ;font-family: Open Sans, Helvetica,Arial,sans-serif; line-height:18px; display: inline-block;zoom: 1; color: #fff; text-align: center; position:relative; -webkit-transition: border .25s linear, color .25s linear, background-color .25s linear; transition: border .25s linear, color .25s linear, background-color .25s linear;}

/*DARK BLUE BUTTON STYLES*/		
.btn.btn-dark-blue{background-color: #237fbc; border-color: #237fbc; -webkit-box-shadow: 0 3px 0 #1a5c87; box-shadow: 0 3px 0 #1a5c87;}
.btn.btn-dark-blue:hover{background-color:#166ea8;}
.btn.btn-dark-blue:active{ top: 3px; outline: none; -webkit-box-shadow: none; box-shadow: none;}


/*SUNFLOWER BUTTON STYLES*/		
.btn.btn-sunflower{background-color: #f2c500; border-color: #f2c500; -webkit-box-shadow: 0 3px 0 #b19001; box-shadow: 0 3px 0 #b19001;}
.btn.btn-sunflower:hover{background-color:#e3ba02;}
.btn.btn-sunflower:active{top: 3px; outline: none; -webkit-box-shadow: none; box-shadow: none;}

	


		
				</style>

				<script>
				function updateCheck() {
					if (confirm("'승인'하시겠습니까??") == true){    //확인
						
						
						let l=$(event.target).parent().parent().find("input[name='CODE']")[0].value
						$(event.target).parent().parent().find("input[name='CODE']")[0].value
					//	console.log($(event.target).parent().parent().find("input[name='CODE']"));
					//	console.log(l);
						location.replace('<%=request.getContextPath()%>/admin/updateaApproval2?CODE='+ l);

						} else { //취소

							return false;
						}

					}
				function updateCheck2() {
					if (confirm("'모든트레이너' 등록을 승인하시겠습니까??") == true){    //확인
						
						
					
						location.replace('<%=request.getContextPath()%>/admin/updateaApproval22');

						} else { //취소

							return false;
						}

					}
				function noCheck() {
					if (confirm("'거절'하시겠습니까??") == true){    //확인
						
						
						let l=$(event.target).parent().parent().find("input[name='CODE']")[0].value
						$(event.target).parent().parent().find("input[name='CODE']")[0].value
					//	console.log($(event.target).parent().parent().find("input[name='CODE']"));
					//	console.log(l);
						location.replace('<%=request.getContextPath()%>/admin/noApproval2?CODE='+ l);

						} else { //취소

							return false;
						}

					}
				</script>
			</tr>

	

	<%
		}
		}
	%>
	</tbody>
	</table>
	<div style="float:right;margin-right:50px;width:150px;">
		
	 		<a class="button12" style="text-decoration: none;" onclick="updateCheck2();">
   				<em> </em>   
    			<span>
     			ALL 승인
      			</span>
 		 	</a>
 	</div>
 		 	<style>
 		 	

.btn:hover::before {
  -webkit-transform-origin: right top;
  -ms-transform-origin: right top;
  transform-origin: right top;
  -webkit-transform: scale(1, 1);
  -ms-transform: scale(1, 1);
  transform: scale(1, 1)
}


/* Btn 12 */

.button12 {
  cursor: pointer;
  background-color: #000;
  width: 130px;
  height: 64px;
  padding:7px ;
  line-height: 64px;
  position: relative;
  transform: translate(-50%, -50%);
  -webkit-transform: translate(-50%, -50%);
  z-index: 0;
  background:#9A8A62;
  text-decoration: none;
}
.button12 span {
  color: #fff;
  display: inline;

  text-transform: uppercase;
  transform: scaleX(0.6);
  letter-spacing: 3px;
  transform-origin: center left;
  transition: color 0.3s ease;
  position: relative;
  z-index: 1;
}

.button12:before,
.button12:after {
  content: '';
  background: #fff;
  height: 50%;
  width: 0;
  position: absolute;
  text-decoration: none;
  transition: 0.3s cubic-bezier(0.785, 0.135, 0.15, 0.86);
  -webkit-transition:0.3s cubic-bezier(0.785, 0.135, 0.15, 0.86);
}
.button12:before {
  top: 0;
  left: 0;
 
}
.button12:after {
  bottom: 0;
  right: 0;
  left: auto;
}
.button12:hover:before {
  width: 100%;
  right: 0;
  left: auto;
}
.button12:hover:after {
  width: 100%;
  left: 0;
  right: auto;
}
.button12:hover span {
  color: black;
  text-decoration: none;
}
.button12:hover em {
  background: #000;
  transform: scaleX(.51);
  transform: scaleX(.51);
}
 		 	
 		 	</style>
<br>
	<div class="container" style="display:flex; justify-content:center;">
	  <ul class="pagination" ><li>
	
		<%=request.getAttribute("pageBar")%>
	
</ul>
</div>
	<br>
</div>


<!-- header에 section-view 아이디 div 닫아줌 -->
</section>
<%@ include file="/views/admin/common/adminfooter.jsp"%>