<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/admin/common/adminheader.jsp"%>
<%@ page import="java.util.List"%>
<%@ page import="com.bbagym.model.vo.*"%>
<%
	List<CenterEnroll> centerList = (List) request.getAttribute("centerList"); /* centerSearchServlet 가져온 데이터 */
%>
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>

<!-- 시설 등록 승인-->
<div id="center-approve"style="width: 100%; ">

	<div
		style="display: flex; justify-content: space-between; align-items: center; width: 100%;">
		<br><h1>시설 등록 승인</h1><br>
		
	</div>
	<!-- 상단 -->
	<table >
		<thead>
			<tr>
				<th>시설 코드</th>
				<th>시설 이름</th>
				<th>시설 주소</th>
				<th>연락처</th>
				<th >사업자승인</th>
				<th>상태</th>
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
					<button onclick="updateCheck();">승인</button>
					
				</td>
				<%
					} else if (c.getApproval() != null) {
				%>
				<td>
					<button onclick="" style="color: yellow; background-color: black;">승인완료</button>
					<button  onclick="noCheck();">취소</button>
				</td>

				<%
					}else if(c.getApproval()=="N"){
				%>
				<td>
					<button onclick="" style="color: yellow; background-color: black;">승인취소완료</button>
					<button onclick="updateCheck();">승인</button>
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
						location.replace('<%=request.getContextPath()%>/admin/updateaApproval?CODE='+ l);

						} else { //취소

							return false;
						}

					}
				function noCheck() {
					if (confirm("'승인취소'하시겠습니까??") == true){    //확인
						
						
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
	<div id="pageBar" class="pageBar" style="display:flex; justify-content:center;">
		<!-- 페이지바 JSP구현-->
		<br><br><br><br>
		<%=request.getAttribute("pageBar")%>

	</div>
	<br><br>
</div>


<!-- header에 section-view 아이디 div 닫아줌 -->
</section>
<%@ include file="/views/admin/common/adminfooter.jsp"%>