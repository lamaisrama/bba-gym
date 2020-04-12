<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/admin/common/adminheader.jsp"%>
<%@ page import="java.util.List"%>
<%@ page import="com.bbagym.model.vo.*"%>
<%
	List<TrainerDetail2> trainerList = (List) request.getAttribute("trainerList"); 
%>


<!--트레이너 등록 승인-->

<div id="trainer-approve">

	<div
		style="display: flex; justify-content: space-between; align-items: center; width: 100%;">
		<h1>트레이너 등록 승인</h1>
		<div>
			페이지수<select value="페이지수" style="padding: .3em .5em;">
				<!-- numPerpage -->
				<option>10</option>
				<option>20</option>
				<option>30</option>
			</select>
		</div>
	</div>
	<!-- 상단 -->

	<%
		if (trainerList.isEmpty()) {
	%>
	<h1>정보가 없습니다</h1>
	<%
		} else {
			for (TrainerDetail2 t : trainerList) {
	%>
	<table>
		<thead>
			<tr>
				<th>소속 센터</th>
				<th>트레이너 이름</th>
				<th>트레이너 주소</th>
				<th>연락처</th>
				<th>사업자승인</th>
				<th></th>
			</tr>
		</thead>
		<tr>
			<!-- for{ -->
			<td><%=t.getC_name()%></td>
			<td><%=t.getT_name() %></td>
			<td><%=t.getM_address_2() %> </td>
			<td><%=t.getM_phone_2() %></td>
			<td><%=t.getApproval() %></td>
			<td>
				<button onclick="">미리보기</button>
				<button onclick="updateCheck();">승인</button>
				<button onclick="">거절</button>
			</td>
				
		</tr>
		<!-- }-->
	</table>
	
	
			<%
					} 
		}
				%>
				
				
				
				
				
				
		<div id="pageBar">
		<!-- 페이지바 JSP구현-->
		<%=request.getAttribute("pageBar") %>

	</div>	

</div>

</div>
<!-- header에 section-view 아이디 div 닫아줌 -->
</section>
<%@ include file="/views/admin/common/adminfooter.jsp"%>