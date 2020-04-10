<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/admin/common/adminheader.jsp"%>
<%@ page
	import="com.bbagym.model.vo.Member"%>


	
		<div>

			<!-- 1. 비밀번호 수정-->
	       <form name="" action="<%=request.getContextPath()%>/admin/admInupdatePasswordEnd" method="post" >
	        <div id="password">
				현재 비밀번호 : <input type="password" name="password" id="" required><hr>
				새로운 비밀번호 : <input type="password" name="password_new" id="password_new" required><hr>
				새로운 비밀번호 확인 : <input type="password" id="password_chk" required><hr>
				<input type="submit" onclick="return password2_validate();" value="비밀번호변경" />
				<input type="hidden" name="M_ID" value="admin" />
			</div><!-- 정규화 비밀번호 검사--> <!-- 자스 이용하여 비밀번호 다르면 red 같으면 green-->
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