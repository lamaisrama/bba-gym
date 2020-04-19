<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ page import="com.bbagym.model.vo.*, java.util.*" %>
<%
	List<TrainerView> myTrainer = (List<TrainerView>)request.getAttribute("myTrainer");
	List<CenterEnroll> myCenter = (List<CenterEnroll>)request.getAttribute("myCenter");
	Member m = (Member)request.getAttribute("newM");
%>

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/mypageUser.css">
<div class="page-header page-header-xs" data-parallax="true"
	style="background-image: url('<%=request.getContextPath()%>/assets/img/mypage.jpg');"></div>
<section class="section-container">
	
	<nav>
		<!-- 왼쪽메뉴 -->
		<div class="left-menu-container">
			<div class="profile-img">
			<%if(logginMember.getM_IMAGE()!=null){ %>
				<img src="<%=request.getContextPath()%>/upload/business/<%=m.getM_IMAGE()%>" alt="my image" id="myImage" />
			<%}else{ %>
				<img src="<%=request.getContextPath()%>/resources/img/admin/log.png" alt="my image" id="myImage" />
			<%} %>
			</div>
			<div class="profile-info">
				<div>
					<span>♥<%=m.getM_NAME()%>님 환영합니다♥</span>
					<button type="button" class="btn btn-primary" onclick="se5();">
					  Messages <span class="badge badge-dark" id="count" ></span>
					</button>
				</div>
			</div>

			<div>
				<hr>
				<a class="updateMyProfile" href="<%=request.getContextPath()%>/business/businessEnrollView.do?M_ID=<%=logginMember.getM_ID()%>">회원정보수정</a>
				<a class="updateMyProfile"  onclick="removeCheck();">회원탈퇴</a>
				<a class="updateMyProfile" onclick="se5();">쪽지함</a>
				<a class="updateMyProfile" href="#1" onclick="show();">시설 등록 현황</a>
				<a class="updateMyProfile" href="#1" onclick="show();">트레이너 등록 현황</a>
				<hr>
			</div>
		</div>
	</nav>
	<!-- 본문 -->
	
	<div class="content-container">
	  <br><br>
	  <h1 style="text-align:center;">My Page</h1>
	  <br>
	  <hr>

		<div class="category-1">
			<div class="MyEnroll">
				<h4 id="1" style="color:#6E675F; font-weight:bolder">시설 등록 현황</h4>
			</div>
			<hr/>
			<table id="table" class="table table-hover" style="text-align:center;">
				<tr id="tr" class="table-secondary">
					<th>시설명</th>
					<th>시설 주소</th>
					<th>시설 연락처</th>
					<th>상태</th>
					<th> </th>
				</tr>
				
			<%if(myCenter==null||myCenter.isEmpty()){ %>
				<tr>	
					<td colspan="5"><h6>데이터가 존재하지 않습니다.</h6></td>
				</tr>
			<%}else{
				for(CenterEnroll c : myCenter){ %>
				<tr>
					<td><%=c.getName()%></td>
					<td><%=c.getAddress() %></td>
					<td><%=c.getTel() %></td>
					<td><%=c.getApproval() %></td>
					<td>
						<%-- <button type="button" class="btn btn-secondary btn-sm" value="<%=c.getCode()%>" onclick="centerModify(this);">수정</button> --%>
						<button type="button" class="btn btn-secondary btn-sm" value="<%=c.getCode()%>" onclick="centerDelete(this);">삭제</button>
					</td>
				</tr>
				<%} 
			}%>
			</table>
			<br>
			<div class="MyEnroll2">
				<h4 id="2" style="color:#6E675F; font-weight:bolder">트레이너 등록 현황</h4>
			</div>
			
			<table id="table" class="table table-hover" style="text-align:center;">
				<tr id="tr" class="table-secondary">
					<th>트레이너이름</th>
					<th>소속센터</th>
					<th>등록일시</th>
					<th>상태</th>
					<th> </th>
				</tr>
		<%if(myTrainer==null||myTrainer.isEmpty()){ %>
				<tr>	
					<td colspan="5"><h5>데이터가 존재하지 않습니다.</h5></td>
				</tr>
		<%}else{ 
			for(TrainerView t : myTrainer){
			%>
				<tr>
					<td><%=t.getMname()%></td>
					<td><%= t.getCcenter()%></td>
					<td><%= t.getEnrollDate() %></td>
					<td><%= t.getApproval() %></td>
					<td>
						<%if(t.getApproval().equals("승인")){ %>
						<button type="button" class="btn btn-secondary btn-sm" value="<%=t.getTcode()%>" onclick="trainerInactivate(this)">프로그램확인</button>
						<%} %>
						<%-- <button type="button" class="btn btn-secondary btn-sm" value="<%=t.getTcode()%>" onclick="trainerModity(this);">수정</button> --%>
						<button type="button" class="btn btn-secondary btn-sm" value="<%=t.getTcode()%>" onclick="trainerDelete(this);">삭제</button>
					
					</td>
				</tr>
			<%}
			}%>
			</table>
			
			<div id="program-modal">
				
			</div>

			<a class="top" href="#" title="”맨"위로">TOP</a>
	
		</div>
		
		
		<div class="my-3" style="display:none">받은 쪽지함
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
						  <label for="usr">받는이(이메일):</label>
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
			
			<div class="my-3" style="display:none">보낸 쪽지함
			<div style="width: 95%; height: auto; margin: auto;" id="container2">
			
			
			</div>
			</div>

		</div>
		
	<script>
		function removeCheck() {
			 if (confirm("정말 '탈퇴'하시겠습니까??") == true){    //확인
				location.replace('<%=request.getContextPath()%>/member/memberDelete.do?M_ID=<%=logginMember.getM_ID()%>');
	 		}else{   //취소
		 		return false;
	    
	 		}
		}
	
		var isUsClicked = false;
		
		function updateMyProfile() {
			var el = document.getElementsByClassName("userinfo-update")[0];
			var back = document
					.querySelectorAll(".content-container>*:not(.popup)");
			console.log(back);
			// back.chi.style = "filter: blur(4px);";
			if (isUsClicked) {
				el.style = "visibility: hidden;";
				isUsClicked = false;
			} else {
				el.style = "visibility: visible;";
				isUsClicked = true;
			}
		}
		

		function centerDelete(e){
			var cCode=e.value;
			if(confirm('정말 삭제하시겠습니까?')){
				location.replace('<%=request.getContextPath()%>/mypage/centerDelete?cCode='+cCode);
			}
			else{
				return
			}
		}
		
		
		function trainerDelete(e){
			var tCode=e.value;
			console.log(tCode);
			if(confirm('정말 삭제하시겠습니까?')){
				location.replace('<%=request.getContextPath()%>/mypage/trainerDelete?tCode='+tCode);
			}else{
				return;
			}
		} 
		
		function trainerInactivate(e){
			var tCode=e.value;
			$.ajax({
				url:"<%=request.getContextPath()%>/mypage/trainerInactivate?tCode="+tCode,
				type:"get",
				success : function(data){
					$("#program-modal").html(data);
					$("#modalBtn").click();
	                /* setTimeout(() => {
						$("#modalBtn").trigger("click");
					}, 300); */
				}
				
			})
		}
		
		function changeProgramStatus(e){
			var split = e.value.split(',');
			var pCode=split[0];
			var status=split[1];
			location.replace("<%=request.getContextPath()%>/mypage/statusChange?pCode="+pCode+"&status="+status);
			
		}
		
		
		function se5(){
			
			$($(".category-1")[0]).css("display","none");
			$($(".my-3")[0]).css("display","flex");
			$($(".my-3")[1]).css("display","flex");
		}
		
		function show(){
			$($(".category-1")[0]).css("display","block");
			$($(".my-3")[0]).css("display","none");
			$($(".my-3")[1]).css("display","none");
		}
		
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
					location.reload();
				}
			})
			
		})
		
		$(function(){
			var code={"code":<%=logginMember.getM_CODE() %>};
			var url = "<%=request.getContextPath() %>/msg/msgdetail.do?code=";
			var count=0;
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
					let tr=$("<tr>").append($("<td>").append($("<a>").attr("href",url+data[i]["msgcode"]+"&who=b").html(data[i]["title"])))
									.append($("<td>").html(data[i]["readstatus"]))
									.append($("<td>").html(data[i]["name"]))
									.append($("<td>").html(data[i]["date"]))
									.append($("<input>").attr({"type":"hidden","value":data[i]["msgcode"]}))
									.append($("<td>").append($("<button>").attr({"onclick":"deletemsg1();","type":"button"}).html("삭제")));
						table.append(tr);
						
						if(data[i]["readstatus"]=='N'){
							count++;
						}
						
					}
					$("#container").html(table);
					$("#count").html(count);
					if(count>0){
						$("#count").remove("class","badge badge-dark");
						$("#count").attr("class","badge badge-danger");
					}
				}
			})
			
			

			$.ajax({
				url : "<%=request.getContextPath() %>/msg/msgget2.do",
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
					let tr=$("<tr>").append($("<td>").append($("<a>").attr("href",url+data[i]["msgcode"]+"&who=b").html(data[i]["title"])))
									.append($("<td>").html(data[i]["readstatus"]))
									.append($("<td>").html(data[i]["name"]))
									.append($("<td>").html(data[i]["date"]))
									.append($("<input>").attr({"type":"hidden","value":data[i]["msgcode"]}))
									.append($("<td>").append($("<button>").attr({"onclick":"deletemsg2();","type":"button"}).html("삭제")));
						table.append(tr);
					}
					$("#container2").html(table);
			
				}
			})
			
			
			
			
		})
		
		function deletemsg1(){
			var code = $(event.target).parent().prev().val();
		
			$.ajax({
				url : "<%=request.getContextPath() %>/msg/msgdelete.do",
				data : {"code":code,"flag":"r"},
				type : "post",
				success : function(data){
					location.reload();
				}
			})
		}
		
		function deletemsg2(){
			var code = $(event.target).parent().prev().val();

			$.ajax({
				url : "<%=request.getContextPath() %>/msg/msgdelete.do",
				data : {"code":code,"flag":"c"},
				type : "post",
				success : function(data){
					location.reload();
				}
			})
		}
	</script>	
	
</section>



<%@ include file="/views/common/footer.jsp"%>