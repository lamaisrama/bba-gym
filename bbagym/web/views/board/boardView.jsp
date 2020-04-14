<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.List, com.bbagym.model.vo.*" %>	
<% 
	Board b = (Board)request.getAttribute("board"); 
	
	List<BoardComment> comments = (List)request.getAttribute("comment");
%>

<%@ include file="/views/common/header.jsp"%>	

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/board.css">

<div class="page-header page-header-xs" data-parallax="true" style="background-image: url('<%=request.getContextPath()%>/assets/img/fabio-mangione.jpg');"></div>

<section>
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-8">
                <h2 class="text-center"><i class="fa fa-heart heart"></i>&nbsp;&nbsp;Q&A<i class="fa fa-heart heart"></i></h2>
                    <div class="table table-responsive">
	                    <input type="hidden" name="no" value="<%=b.getQaCode() %>">
                        <table class="table table-striped text-center"> 
                            <tr>
                                <th class="th-write">제목</th>
                                <td>	
                                	<b><%=b.getTitle()%></b>
                        		</td>
                            </tr>
                            <tr>
                                <th class="th-write">작성자</th>
                                <td><%=b.getmId() %></td>
                            </tr>
                            <tr>
                                <th class="th-write">작성일</th>
                                <td><%=b.getQaDate() %></td>
                            </tr>
                            <tr>
                                <th class="th-write">첨부파일</th>
                                <td>
                                	<%if(b.getOriFileName()!=null){ %>
                                	<a href="javascript:void(0);" onclick="fileDownload('<%=b.getOriFileName()%>','<%=b.getNewFileName()%>');">
                                		<img src="<%=request.getContextPath()%>/resources/img/file_2.png" width="20px">
										<span><%=b.getOriFileName()%></span>                                		
                                	</a>
                                	<%} %> 
                                </td>
                            </tr>   
                            <tr>
                                <th colspan="2">내용</th>
                            </tr>
                            <tr>
                            	<td colspan="2" style="padding:50px 30px;"><%=b.getQaContent() %></td>
                           	</tr>
                            <tr>
                                <td colspan="2" class="text-center">
                                	<button type="button" class="btn btn-primary" onclick="location.replace('<%=request.getContextPath()%>/board/boardList')">글목록</button>
                            <%if(logginMember!=null&&logginMember.getM_ID().equals("admin")||logginMember.getM_ID().equals(b.getmId())){%>
                                    <button type="button" class="btn btn-warning" onclick="location.replace('<%=request.getContextPath()%>/board/boardUpdate?no=<%=b.getQaCode()%>')">수정</button>
                                    <button type="button" class="btn btn-danger" onclick="location.replace('<%=request.getContextPath()%>/board/boardDelete?no=<%=b.getQaCode()%>&fileName=<%=b.getOriFileName()%>')">삭제</button> 
                            <%} %>    
                                </td>
                            </tr>
                        </table>
                    </div>
            </div>
        </div>

        <!-- 댓글 -->
  		<div id="comment-container">
  			<div class="comment-editor">
  				<form action="<%=request.getContextPath()%>/board/boardCommentInsert" method="post">
  					<textarea name="commentContent" cols="100" rows="3"></textarea>
					<br>
					  <button type="submit" id="btn-insert" class="btn btn-secondary">댓글등록</button>
					  <input type="hidden" name="commentWriter" value="<%=logginMember.getM_CODE()%>">
					  <input type="hidden" name="boardRef" value="<%=b.getQaCode()%>">
					  <input type="hidden" name="level" value="1">  <!-- 첫번째댓글 -->
					  <input type="hidden" name="commentRef" value="0">
  				</form>
		  	</div>
		</div>

		<!-- 댓글출력 -->
		<table id="tbl-comment">
			<%if(comments!=null && !comments.isEmpty()){ 
				for(BoardComment bc : comments){
					if(bc.getQaCommentLevel()==1){%>
						<tr class="level1">
						<td>
							<dl class="row">
								<dt class="col-sm-3"><sub class="comment-writer"><%=bc.getmId()%></sub></dt>
	  							<dd class="col-sm-9">
	  								<span class="comment-content"><%=bc.getQaCommentContent() %></span>
	  								&nbsp;&nbsp;<sub class="comment-date"><%=bc.getQaCommentDate() %></sub>
									<input type="hidden" name="nobc" value="<%=bc.getQaCommentCode() %>">
								</dd>
							</dl>
						</td>
						<td>
							<button class="btn btn-outline-primary btn-sm btn-reply" value="<%=bc.getQaCommentCode()%>">답글</button>
						<%if(logginMember!=null&&logginMember.getM_ID().equals("admin")||logginMember.getM_ID().equals(bc.getmId())){%>
							<button type="button" class="btn btn-outline-warning btn-sm btn-reply2" data-toggle="modal" data-target="#exampleModal" data-whatever="수정하기">수정</button>
							<button class="btn btn-outline-danger btn-sm btn-reply" onclick="location.replace('<%=request.getContextPath()%>/board/boardCommentDelete?no=<%=bc.getQaCommentCode()%>')">삭제</button>
						<%} %>
						</td>
					</tr>
				<%}else{%>
					<tr class="level2">
						<td>
							<dl class="row">
								<dt class="col-sm-3"><img src="<%=request.getContextPath()%>/resources/img/level2.png" width="15px;"><sub class="comment-writer"><%=bc.getmId()%></sub></dt>
								<dd class="col-sm-9">
									<%=bc.getQaCommentContent() %>&nbsp;&nbsp;
									<sub class="comment-date"><%=bc.getQaCommentDate() %></sub>
								</dd>
							</dl>
						</td>
						<td></td>
					</tr>
				<%}%>	
				
		<!-- 댓글 수정 창 start -->
		
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		    <div class="modal-dialog" role="document">
		        <div class="modal-content">
			        <div class="modal-body">
			            <form id="updateFrm" action="<%=request.getContextPath()%>/board/boardCommentUpdateEnd" method="post">
			            	<input type="hidden" name="no" value="<%=b.getQaCode() %>">
							<input type="hidden" name="nobc" >
				            <div class="form-group">
				            	원댓글&nbsp;&nbsp;<input type="text" name="content" value="<%=bc.getQaCommentContent() %>" style="width:100%;" readonly></br>
				                <label for="message-text" class="col-form-label">수정할 댓글 내용을 입력하셈</label>
				                <textarea class="form-control" name="commentContent" id="message-text"></textarea>
				            </div>
					    </form>
			        </div>
			        <div class="modal-footer">
			            <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			            <button type="button" class="btn btn-primary" onclick="updateComment();">수정댓글등록</button>
			        </div>
		        </div>
		    </div>
		</div>
		
			<%}
			} %>
		</table>
		
		<script>
			function updateComment(){
				$("#updateFrm").submit();
			}
		    $('#exampleModal').on('show.bs.modal', function (event) {
		   		// 값을 순회해서 가져오기
		    	const parent=$(event.relatedTarget).parent().prev().find("dd");
		   		const commentNo=parent.find("[name=nobc]").val();
		   		const curComment=parent.find("span.comment-content").html();

		   		var button = $(event.relatedTarget) // Button that triggered the modal
			    
			    //모달창에 있는 값 세팅하기
			    $(this).find("input[name=content]").val(curComment);
			    $(this).find("input[name=nobc]").val(commentNo);
			    
		    });
	    </script>

		<!-- 댓글 수정 창 end -->


    <footer>
    <div class="container">
      <div class="row">
        <div class="credits ml-auto">
          <span class="copyright">
           <i class="fa fa-heart heart"></i>
          </span>
        </div>
      </div>
    </div>
    </footer>
    <br><br><br><br><br>
    
<script>
	
	// 파일
	function fileDownload(ori, rename){
		location.href="<%=request.getContextPath()%>/board/boardDownload?ori=" + ori + "&rename=" + rename;
	}
	
	// 댓글
	$(function(){
		$(".btn-reply").click(function(){
			if(<%=logginMember!=null%>){
				const tr=$("<tr>");
				const td=$("<td>").css({"display":"none", "text-align":"left"}).attr("colspan", 2);
				const form=$("<form>").attr({
					"action":"<%=request.getContextPath()%>/board/boardCommentInsert",
					"method":"post"
				});
				const textarea=$("<textarea>").attr({"cols":"80","rows":"2",
													"name":"commentContent"});
				const button=$("<input>").attr({"type":"submit","value":"등록", "class":"btn btn-outline-primary btn-sm btn-reply"});
				const writer=$("<input>").attr({"type":"hidden",
									"name":"commentWriter","value":"<%=logginMember.getM_CODE()%>"});
				const boardRef=$("<input>").attr({"type":"hidden","name":"boardRef","value":"<%=b.getQaCode()%>"});
				const level=$("<input>").attr({"type":"hidden","name":"level","value":"2"});
				const commentRef=$("<input>").attr({"type":"hidden","name":"commentRef","value":$(this).val()});  
				
				form.append(textarea).append(button).append(writer)
				.append(boardRef).append(level).append(commentRef);
				
				td.append(form);
				tr.append(td);
				($(this).parent().parent()).after(tr);
				tr.children("td").slideDown(500);
				$(this).off("click");
			}
		});
	});
	
</script>

<%@ include file="/views/common/footer.jsp"%>	