<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/admin/common/adminheader.jsp"%>
<%@ page import="java.util.List" %>	
<%
	List<Member> list=(List)request.getAttribute("members");
%>
 <script src="http://code.jquery.com/jquery-3.4.1.min.js" ></script>
<style type="text/css">
    section#memberList-container {text-align:center;}
    
    section#memberList-container table#tbl-member {width:100%; border:1px solid gray; border-collapse:collapse;}
    section#memberList-container table#tbl-member th, table#tbl-member td {border:1px solid gray; padding:10px; }

    div#search-container {margin:0 0 10px 0; padding:3px; background-color: rgba(0, 188, 212, 0.3);}
    div#search-userId{display:inline-block;}
    div#search-userName{display:none;}
    div#search-gender{display:none;}

    </style>
					<!--회원 관리-->
                    <div id="member-list">
                        <div style="display: flex; justify-content: space-between; align-items: center;width: 100%;">
                            <h1>회원 관리</h1>
                            <div> 
                            	페이지수<select value=""  style=" padding: .3em .5em;"><!-- numPerpage -->
                                <option>10</option>
                                <option>20</option>
                                <option>30</option>
                            </select>
                            </div>
                        </div><!-- 상단 -->
                        
                       <table id="tbl-member">
            <thead>
            <tr> 
          
            <th>아이디</th>
		    <th>이름</th> 
		    <th>성별</th>
		    <th>나이</th>
		    <th>이메일</th>
		    <th>전화번호</th>
		    <th>주소</th>
		    <th>상태</th>
		   
		  
                </tr>
            </thead>
            <tbody>
			<%if(list.isEmpty()) {%>
				<tr>
					<td colspan="9">조회된 회원이 존재하지 않습니다</td>
				</tr>			
			<%}else{ 
				for(Member m : list){
			%>
	            <tr>
	            	<input name="CODE" type="hidden" style="width:50px" value="<%=m.getM_CODE()%>" readonly>
	                <td><%=m.getM_ID() %></td>
	                <td><%=m.getM_NAME() %></td>
	                <td><%=m.getM_GENDER() %></td>
	                <td><%=m.getM_AGE() %></td>
	                <td><%=m.getM_EMAIL() %></td>
	                <td><%=m.getM_PHONE() %></td>
	                <td><%=m.getM_ADDRESS() %></td>
	                <td style="width:40px"><%=m.getM_STATUS() %> <br>
	                	<%
					if(m.getM_STATUS()=='N'){
				%>
	                <button style="background-color:red;"onclick="removeCheck();" >탈퇴</button>
	            	<%}else{%>
	            		<button style="background-color:black;color:yellow;" onclick="" >탈퇴완료</button>
	            	<% 
	            	}
	            	%>
	            	<script>
				function removeCheck() {
					if (confirm("'탈퇴'하시겠습니까??") == true){    //확인
						
						
						let l=$(event.target).parent().parent().find("input[name='CODE']")[0].value
						
						/* console.log($(event.target).parent().parent().find("input[name='CODE']"));*/
						/* console.log(l); */  
						location.replace('<%=request.getContextPath()%>/admin/updateaStatus?CODE='+l);
					
					 }else{   //취소
						 
						 return false;
					 }

					 }
			</script>
	            </tr>		
       		<%}
			} %>
            </tbody>
        </table>
        <div id="pageBar">
        	<%=request.getAttribute("pageBar") %>
        </div>

</div> <!-- header에 section-view 아이디 div 닫아줌 -->
</section>
<%@ include file="/views/admin/common/adminfooter.jsp"%>