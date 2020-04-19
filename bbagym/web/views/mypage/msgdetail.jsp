<%@page import="com.bbagym.model.vo.MypageUser,com.bbagym.model.vo.Msg"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
	Msg	 msg= (Msg)request.getAttribute("msg");
	char who = (char)request.getAttribute("who");
%>
    
<%@ include file="/views/common/header.jsp"%>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/mypageUser.css">


<div class="page-header page-header-xs" data-parallax="true"
	style="background-image: url('<%=request.getContextPath()%>/assets/img/mypage.jpg');"></div>

<!--************ 왼쪽메뉴 ************-->
<section class="section-container" style="margin-bottom:100px;margin-top:50px;">
	<nav>
		<div class="left-menu-container">
			<div class="profile-img">
				<img src="<%=request.getContextPath()%>/upload/member/<%=logginMember.getM_IMAGE() %>"
					alt="my image" id="myImage" />
			</div>
			<div class="profile-info">
				<div>
					<span><%=logginMember.getM_NAME()%>님 환영합니다</span><img src="#" width="10px" height="10px">
				</div>
			</div>
			
			<div>
				<hr />
				<a class="updateMyProfile" href="<%=request.getContextPath()%>/member/memberEnrollView.do?M_ID=<%=logginMember.getM_ID()%>">회원정보수정</a>
				<%if(who=='u') {%>
				<a class="updateMyProfile" href="<%=request.getContextPath()%>/mypage/mypageUser.do">돌아가기</a>
				<%} else {%>
				<a class="updateMyProfile" href="<%=request.getContextPath()%>/mypage/mypageBusiness.do">돌아가기</a>
				<%} %>
				<a class="updateMyProfile" onclick="removeCheck();" >회원탈퇴</a>
			</div>
	</nav>
	
	<div id="mag-box" class="container">
		<div id="title">
			<label for="usr">제목 :</label>
  			<input type="text" class="form-control" id="usr" value="<%=msg.getTitle() %>" readonly>
		</div>
		<div id="date">
			<label for="usr">작성일 :</label>
  			<input type="text" class="form-control" id="usr" value="<%=msg.getDate() %>" readonly>
		</div>
		<div id="content">
			<label for="comment">내용 :</label>
  			<textarea class="form-control" rows="10" id="comment" style="resize: none;" readonly><%=msg.getContent() %></textarea>
		</div>
		
		<div id="msg">
				<button class="btn btn-outline-info" data-toggle="modal" data-target="#myModal">답장하기</button>&nbsp&nbsp
				<%if(who=='u') {%>
				<button class="btn btn-outline-info" onclick="location.replace('<%=request.getContextPath()%>/mypage/mypageUser.do')" >돌아가기</button>
				<%} else { %>
				<button class="btn btn-outline-info" onclick="location.replace('<%=request.getContextPath()%>/mypage/mypageBusiness.do')" >돌아가기</button>
				<%} %>
								<!-- The Modal -->
				<div class="modal" id="myModal">
				  <div class="modal-dialog">
				    <div class="modal-content">
				
				      <!-- Modal Header -->
				      <div class="modal-header">
				        <h4 class="modal-title">쪽지 보내기</h4>
				        <button type="button" class="close" data-dismiss="modal">&times;</button>
				      </div>
				
				      <!-- Modal body -->
				      <div class="modal-body">
				        <div class="form-group">
						  <label for="usr">제목:</label>
						  <input type="text" class="form-control" id="msgtitle">
						</div>
						<div class="form-group">
						  <label for="usr">받는이(이메일):</label>
						  <input type="text" class="form-control" id="msgrec" value="<%=msg.getEmail() %>">
						  <input type="hidden" class="form-control" id="msgsend" value="<%=logginMember.getM_CODE() %>">
						</div>
				        
				        <div class="form-group">
						  <label for="comment">내용 :</label>
						  <textarea class="form-control" rows="5" id="comment"></textarea>
						</div>
				      </div>
				
				      <!-- Modal footer -->
				      <div class="modal-footer">
				        <button type="button" class="btn btn-danger" data-dismiss="modal" id="send">답장하기</button>
				        <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
				      </div>
				
				    </div>
				  </div>
				</div>
			</div>
	</div>
	
</section>	

<script>

		$("#send").on("click",function(){
			
			var msgtitle = $("#msgtitle").val();
			var msgrec = $("#msgrec").val();
			var msgsend = $("#msgsend").val();
			var comment = $("#comment").val();
			
			var data = {"title":msgtitle,"receiver":msgrec,"sender":msgsend,"content":comment};
			$.ajax({
				url : "<%=request.getContextPath() %>/msg/send.do",
				data : data,
				success : function(data){
					self.close();
					alert(data);
				}
			})
			
		})
		
		
		function deletemsg(){
				var code = <%=msg.getMsgcode() %>;
				console.log(code);
				$.ajax({
					url : "<%=request.getContextPath() %>/msg/msgdelete.do",
					data : {"code":code},
					type : "post",
					success : function(data){
						location.replace("<%=request.getContextPath()%>/mypage/mypageUser.do");
					}
				})
			}
		
		
</script>

<style>
	*{
		/* border : 1px solid red; */
	}
	
	#mag-box{
		display : flex;
		justify-content : center;
		flex-direction : column;
		margin : auto;
	}
	
</style>
<%@ include file="/views/common/footer.jsp"%>