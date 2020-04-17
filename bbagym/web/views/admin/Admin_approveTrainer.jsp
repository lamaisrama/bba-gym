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
				<th>소속센터</th>	
				<th>아이디</th>	
				<th>이름</th>
				<th>주소</th>
				<th>폰</th>
				<th>트레이너소개</th>
				
				<th >승인 상태</th>
				<th>확인</th>
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
				<td><%=t.getC_NAME() %>
				<td><%=t.getM_ID()%></td>
				<td><%=t.getM_NAME()%></td>
				<td><%=t.getM_ADDRESS_2()%></td>
				<td><%=t.getM_PHONE_2()%></td>
				<td><%=t.getT_INTRODUCTION()%></td>
				
				<td><input style="text-align:center;border:1px solid white;width:35px;" type="text" name="APPROVAL" value="<%=t.getAPPROVAL()%>" readonly></td>
				<!-- if( ) {-->
			
				
				
				
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
					<button onclick="" class="w3-panel w3-round-xxlarge w3-teal">Confirm</button>

				</td>

				<%
					}
				%>
				<td>
					<button class="w3-panel w3-green" onclick="updateCheck();">승인</button>
					<button  class="w3-panel w3-red" onclick="noCheck();">거절</button> <!-- 초기상태시 나오고 관리자가 승인 또는 거절시 처리된 상태로 표시 -->
				</td>

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