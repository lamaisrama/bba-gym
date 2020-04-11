<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/admin/common/adminheader.jsp"%>
<%@ page import="java.util.List"%>
<%@ page import="com.bbagym.model.vo.*"%>
<%
	List<CenterEnroll> centerList = (List) request.getAttribute("centerList"); /* centerSearchServlet 가져온 데이터 */
%>
 <script src="http://code.jquery.com/jquery-3.4.1.min.js" ></script>
<!-- 시설 등록 승인-->
<div id="center-approve">

	<div
		style="display: flex; justify-content: space-between; align-items: center; width: 100%;">
		<h1>시설 등록 승인</h1>
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
		if (centerList.isEmpty()) {
	%>
	<h1>정보가 없습니다</h1>
	<%
		} else {
			for (CenterEnroll c : centerList) {
	%>
	<!-- for{ -->
	<table style="width:100%;height:25px">
		<thead>
			<tr>
			<th>시설 코드</th>
				<th>시설 이름</th>
				<th>시설 주소</th>
				<th>연락처</th>
				<th style="widht:10%">사업자승인</th>
				<th></th>
			</tr>
		</thead>

		<tr>
			<td></td>

		</tr>
		<tr>
			<input name="CODE" type="hidden" value="<%=c.getCode()%>">
			<td><%=c.getCode()%></td>
			<td><%=c.getName()%></td>
			<td><%=c.getAddress()%></td>
			<td><%=c.getTel()%></td>
			<td><input type="text" name="APPROVAL" value="<%=c.getApproval()%>"readonly></td>
			<!-- if( ) {-->

			<td>
				<button onclick="updateCheck();">승인</button>
				<button onclick="">거절</button> <!-- 초기상태시 나오고 관리자가 승인 또는 거절시 처리된 상태로 표시 -->
			</td>
			<script>
				function updateCheck() {
					if (confirm("'승인'하시겠습니까??") == true){    //확인
						
						
						let l=$(event.target).parent().parent().find("input[name='CODE']")[0].value
						$(event.target).parent().parent().find("input[name='CODE']")[0].value
					//	console.log($(event.target).parent().parent().find("input[name='CODE']"));
					//	console.log(l);
						location.replace('<%=request.getContextPath()%>/admin/updateaApproval?CODE='+l); 

					 }else{   //취소
						 
						 return false;
					 }

					 }
			</script>
		</tr>


<br><br>

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


<!-- header에 section-view 아이디 div 닫아줌 -->
</section>
<%@ include file="/views/admin/common/adminfooter.jsp"%>