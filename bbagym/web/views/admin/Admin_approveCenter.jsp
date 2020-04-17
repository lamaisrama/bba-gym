<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/admin/common/adminheader.jsp"%>
<%@ page import="java.util.List"%>
<%@ page import="com.bbagym.model.vo.*"%>
<%
	List<CenterEnroll> centerList = (List) request.getAttribute("centerList"); /* centerSearchServlet 가져온 데이터 */
%>
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<%--  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/board.css"> --%>
<!--===============================================================================================-->	
<link rel="stylesheet"href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<!--===============================================================================================-->	
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
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
		<h1>시설 등록 승인</h1>
		<br>


	</div>
	<!-- 상단 -->
<!--===============================================================================================-->	
	<table class="table">   
<!--===============================================================================================-->	
	
		<thead>
			<tr>
				<th>시설 코드</th>
				<th>시설 이름</th>
				<th>시설 주소</th>
				<th>연락처</th>
				
				<th>승인 상태</th>
				<th>확인</th>
				<th >사업자 시설승인</th>
			</tr>
		</thead>

		<tbody style="height: 45px">
			<%
				if (centerList.isEmpty()) {
			%>
			<h1>정보가 없습니다</h1>
			<%
				} else {
					for (CenterEnroll c : centerList) {
			%>
			<!-- for{ -->


			<tr>
				<input name="CODE" type="hidden" value="<%=c.getCode()%>">
				<td><%=c.getCode()%></td>
				<td><%=c.getName()%></td>
				<td><%=c.getAddress()%></td>
				<td><%=c.getTel()%></td>
				
				<td><input style="text-align:center;border:1px solid white;width:35px;"type="text" name="APPROVAL"
					value="<%=c.getApproval()%>" readonly></td>
				<!-- if( ) {-->
				
				
				
				
				
				<%
					if (c.getApproval() == null) {
				%>
					<td>
					
						<button onclick=""class="w3-panel w3-round-xxlarge w3-teal">심사중</button>
					
					</td>
				
				<%
					} else if (c.getApproval() != null) {
				%>
					<td>
					
						<button class="w3-panel w3-round-xxlarge w3-teal" onclick="" >Confirm</button>
					
					</td>

				
				<%
					}
				%>
				<td>
					<button  class="w3-panel w3-green" onclick="updateCheck();">승인</button>
					<button  class="w3-panel w3-red" onclick="noCheck();">거절</button>
				</td>

				<script>
				function updateCheck() {
					if (confirm("'승인'하시겠습니까??") == true){    //확인
						
						
						let l=$(event.target).parent().parent().find("input[name='CODE']")[0].value
						$(event.target).parent().parent().find("input[name='CODE']")[0].value
					//	console.log($(event.target).parent().parent().find("input[name='CODE']"));
					//	console.log(l);
						location.replace('<%=request.getContextPath()%>/admin/updateaApproval?CODE='+ l);

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
						location.replace('<%=request.getContextPath()%>/admin/noApproval?CODE='+ l);

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
	<br><br>
</div>


<!-- header에 section-view 아이디 div 닫아줌 -->
</section>
<%@ include file="/views/admin/common/adminfooter.jsp"%>