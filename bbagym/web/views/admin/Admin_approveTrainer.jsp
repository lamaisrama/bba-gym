<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/admin/common/adminheader.jsp"%>
<%@ page import="java.util.List"%>
<%@ page import="com.bbagym.model.vo.*"%>
<%
	List<AdminTrainer> trainerList = (List) request.getAttribute("trainerList"); /* centerSearchServlet 가져온 데이터 */
%>
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>

<!-- 시설 등록 승인-->
<div id="center-approve"style="width: 100%; ">

	<div
		style="display: flex; justify-content: space-between; align-items: center; width: 100%;">
		<br><h1>트레이너 등록 승인</h1><br>
		
	</div>
	<!-- 상단 -->
	<table >
		<thead>
			<tr>
				<th>소속센터</th>	
				<th>아이디</th>	
				<th>이름</th>
				<th>주소</th>
				<th>폰</th>
				<th>트레이너소개</th>
				<th >사업자승인</th>
				<th>상태</th>
				
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
					<button onclick="updateCheck();">승인</button>
					<button onclick="">거절</button> <!-- 초기상태시 나오고 관리자가 승인 또는 거절시 처리된 상태로 표시 -->
				</td>
				<%
					} else if (t.getAPPROVAL() != null) {
				%>
				<td>
					<button onclick="" style="color: yellow; background-color: black;">승인완료</button>

				</td>

				<%
					}
				%>

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
				</script>
			</tr>

	

	<%
		}
		}
	%>
	</tbody>
	</table>
<br>
	<div id="pageBar" class="pageBar" style="display:flex; justify-content:center;">
		<!-- 페이지바 JSP구현-->
		<br><br><br><br>
		<%=request.getAttribute("pageBar")%>

	</div>
	<br>
</div>


<!-- header에 section-view 아이디 div 닫아줌 -->
</section>
<%@ include file="/views/admin/common/adminfooter.jsp"%>