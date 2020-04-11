<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/admin/common/adminheader.jsp"%>
<%@ page import="java.util.List"%>
<%@ page import="com.bbagym.model.vo.*"%>
<%
	List<CenterEnroll> centerList = (List) request.getAttribute("centerList"); /* centerSearchServlet 가져온 데이터 */
%>
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




<%if(centerList.isEmpty()) {%>
        		<h1>정보가 없습니다</h1>
        	<%} else{ for(CenterEnroll c: centerList){%>
			<!-- for{ -->
	<table>
		<thead>
			<tr>
				<th>시설 이름</th>
				<th>시설 주소</th>
				<th>연락처</th>
				<th>사업자승인</th>
				<th></th>
			</tr>
		</thead>
		
		<tr>
			<td><input type="hidden" value="<%=c.getCode()%>"></td>

		</tr>
		<tr>
		<td><%=c.getName()%></td>
		<td><%=c.getAddress()%></td>
		<td><%=c.getTel()%></td>
		<td><%=c.getApproval()%></td>
		<!-- if( ) {-->

		<td>
			<button onclick="">미리보기</button>
			<button onclick="">승인</button>
			<button onclick="">거절</button> <!-- 초기상태시 나오고 관리자가 승인 또는 거절시 처리된 상태로 표시 -->
		</td>

		</tr>

		


	</table>
	<%
			}
			}
		%>
<div id="pageBar">
	<!-- 페이지바 JSP구현-->
	<%=request.getAttribute("pageBar")%>
	
</div>

</div>


<!-- header에 section-view 아이디 div 닫아줌 -->
</section>
<%@ include file="/views/admin/common/adminfooter.jsp"%>