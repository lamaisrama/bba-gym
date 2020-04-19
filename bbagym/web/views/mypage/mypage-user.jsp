<%@page import="com.bbagym.model.vo.MypageUser"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	List<MypageUser> cmembership = (List)request.getAttribute("cmembership");
	List<MypageUser> tmembership = (List)request.getAttribute("tmembership");
	List<MypageUser> myPerfer = (List)request.getAttribute("myPerfer");
	Member m = (Member)request.getAttribute("newM");
%>

<%@ include file="/views/common/header.jsp"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/mypageUser.css">


<div class="page-header page-header-xs" data-parallax="true"
	style="background-image: url('<%=request.getContextPath()%>/assets/img/mypage.jpg');"></div>

<!--************ 왼쪽메뉴 ************-->
<section class="section-container">
	<nav>
		<div class="left-menu-container">
			<div class="profile-img">
				<img src="<%=request.getContextPath()%>/upload/member/<%=m.getM_IMAGE() %>"
					alt="my image" id="myImage" />
			</div>
			<div class="profile-info">
				<div>
					<span><%=m.getM_NAME()%>님 환영합니다</span>
				</div>
			</div>
			
			<div>
				<hr />
				<a class="updateMyProfile" href="<%=request.getContextPath()%>/member/memberEnrollView.do?M_ID=<%=logginMember.getM_ID()%>">회원정보수정</a>
				<a class="updateMyProfile" onclick="se1();">나의 센터 회원권</a>
				<a class="updateMyProfile" onclick="se2();">나의 트레이너 회원권</a>
				<a class="updateMyProfile" onclick="se3();">My 찜</a>
				<a class="updateMyProfile" onclick="se5();">쪽지함</a>
				<a class="updateMyProfile" onclick="se4();">전체보기</a>
				<a class="updateMyProfile" onclick="removeCheck();" >회원탈퇴</a>
			</div>
	</nav>
	
	
	
	<!--************ 본문 ************-->
	<div class="content-container">
		<h3>
			<span>M</span> <span>Y</span> <span>P</span> <span>A</span> <span>G</span>
			<span>E</span>
		</h3>
		<br>
		<div style="text-align: center; margin-bottom: 20px;">-사용자-</div>
		<div id="table">
			<div id="my">
				<div id="my-1">나의 회원권</div>
				<div id="my-2"><%=cmembership.size()+tmembership.size() %>개</div>
			</div>
			<hr />
		</div>

		<div class="my-3">나의 센터 회원권
		<div style="width: 95%; height: auto; margin: auto;">
			<table id="mycenter">
				<tr><th>센터명</th><th>프로그램명</th><th>이용달수</th><th>결제일</th><th>만료일</th><th>내점수</th></tr>
				<%for(MypageUser my : cmembership) {%>
				<tr>
					<td><a href="<%=request.getContextPath()%>/center/centerDetail.do?cCode=<%=my.getCcode() %>"><%=my.getCname() %></a></td>
					<td><%=my.getPname() %></td>
					<td><%=my.getMonth() %></td>
					<td><%=my.getPaydate() %></td>
					<td><%=my.getExpiredate() %></td>
					<td><%=my.getScore() %></td>
				</tr>
				<%} %>
			</table>
		</div>
		</div>
		
		<div class="my-3">나의 트레이너 회원권
		<div style="width: 95%; height: auto; margin: auto;">
			<table id="mytrainer">
				<tr><th>센터명</th><th>프로그램명</th><th>PT이용횟수</th><th>결제일</th><th>내점수</th></tr>
				<%for(MypageUser my : tmembership) {%>
				<tr>
					<td><a href="<%=request.getContextPath()%>/center/centerDetail.do?cCode=<%=my.getCcode() %>"><%=my.getCname()==null ? "프리랜서" : my.getCname()%></a></td>
					<td><%=my.getPname() %></td>
					<td><%=my.getCount() %></td>
					<td><%=my.getPaydate() %></td>
					<td><%=my.getScore() %></td>
				</tr>
				<%} %>
				
			</table>
		</div>
		</div>
		
		<div class="my-3">My 찜
		<div style="width: 95%; height: auto; margin: auto;">
			<table id="myprefer">
				<tr><th>센터명</th><th>주소</th><th>연락처</th><th>평점</th></tr>
				<%for(MypageUser my : myPerfer) {%>
				<tr>
					<td><a href="<%=request.getContextPath()%>/center/centerDetail.do?cCode=<%=my.getCcode() %>"><%=my.getCname()==null ? "프리랜서" : my.getCname()%></a></td>
					<td><%=my.getAddress() %></td>
					<td><%=my.getPhone() %></td>
					<td><%=my.getAvgscore() %></td>
				</tr>
				<%} %>
			</table>
		</div>
		</div>
		
		<div class="my-3" style="display:none">쪽지함
			<div style="width: 95%; height: auto; margin: auto;" id="container">
				
			</div>
			<div id="msg">
				<button class="btn btn-outline-info" data-toggle="modal" data-target="#myModal">쪽지보내기</button>
				
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
						  <label for="usr">받는이:</label>
						  <input type="text" class="form-control" id="msgrec">
						  <input type="hidden" class="form-control" id="msgsend" value="<%=logginMember.getM_CODE() %>">
						</div>
				        
				        <div class="form-group">
						  <label for="comment">내용 :</label>
						  <textarea class="form-control" rows="5" id="comment"></textarea>
						</div>
				      </div>
				
				      <!-- Modal footer -->
				      <div class="modal-footer">
				        <button type="button" class="btn btn-danger" data-dismiss="modal" id="send">쪽지보내기</button>
				        <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
				      </div>
				
				    </div>
				  </div>
				</div>
			</div>
			
						
	
		</div>
		

	</div>
	
	
	
	
	
	
	
	
</section>


<a class="top" href="#" title="맨위로">TOP</a>


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



			function se5(){
		
				$($(".my-3")[0]).css("display","none");
				$($(".my-3")[1]).css("display","none");
				$($(".my-3")[2]).css("display","none");
				$($(".my-3")[3]).css("display","flex");
			}


	
		function removeCheck() {

			 if (confirm("정말 '탈퇴'하시겠습니까??") == true){    //확인
				location.replace('<%=request.getContextPath()%>/member/memberDelete.do?M_ID=<%=logginMember.getM_ID()%>');
			 }else{   //취소
				 return false;
			 }

			}
	
			
		$(function(){
			var code={"code":<%=logginMember.getM_CODE() %>};
			
			$.ajax({
				url : "<%=request.getContextPath() %>/msg/msgget.do",
				data : code,
				dataType : "json",
				type : "post",
				success : function(data){
					let table=$("<table>").attr("id","myprefer");
					let th=$("<tr>").append($("<th>").html("제목"))
									.append($("<th>").html("읽음여부"))
									.append($("<th>").html("보낸이"))
									.append($("<th>").html("보낸날짜"))
									.append($("<th>").html("삭제"));
					table.append(th);
					for(let i=0;i<data.length;i++){
					let tr=$("<tr>").append($("<td>").append($("<a>").attr("href","#").html(data[i]["title"])))
									.append($("<td>").html(data[i]["readstatus"]))
									.append($("<td>").html(data[i]["name"]))
									.append($("<td>").html(data[i]["date"]))
									.append($("<input>").attr({"type":"hidden","value":data[i]["msgcode"]}))
									.append($("<td>").append($("<button>").attr({"onclick":"deletemsg();","type":"button"}).html("삭제")));
						table.append(tr);
					}
					$("#container").html(table);
				}
			})
			
			
			
		})
		
		function deletemsg(){
				var code = $(event.target).parent().prev().val();
				
				$.ajax({
					url : "<%=request.getContextPath() %>/msg/msgdelete.do",
					data : {"code":code},
					type : "post",
					success : function(data){
						location.reload();
					}
				})
			}
			
		</script>
		<script src="<%=request.getContextPath() %>/js/userpage.js"></script>

<%@ include file="/views/common/footer.jsp"%>