<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.List, com.bbagym.model.vo.*" %>	
<% 
	Board b = (Board)request.getAttribute("board"); 
	List<BoardComment> comments = (List)request.getAttribute("comment");
%>

<%@ include file="/views/common/header.jsp"%>	

<style>
   h2{
       margin: 60px 0;
   }
   th{
       width: 150px;
   }
   /*댓글*/
   #comment-container{text-align: center;}
	table#tbl-comment{width:580px; margin:0 auto; border-collapse:collapse; clear:both; } 
	table#tbl-comment tr td{border-bottom:1px solid; border-top:1px solid; padding:5px; text-align:left; line-height:120%;}
	table#tbl-comment tr td:first-of-type{padding: 5px 5px 5px 50px;}
	table#tbl-comment tr td:last-of-type {text-align:right; width: 100px;}
	table#tbl-comment button.btn-reply{display:none;}
	table#tbl-comment tr:hover {background:lightblue;}
	table#tbl-comment tr:hover button.btn-reply{display:inline;}
	table#tbl-comment tr.level2 {color:mediumslateblue; font-size: 14px;}
	table#tbl-comment sub.comment-writer {color:navy; font-size:14px}
	table#tbl-comment sub.comment-date {color:tomato; font-size:10px}
	table#tbl-comment tr.level2 td:first-of-type{padding-left:100px;}
	table#tbl-comment tr.level2 sub.comment-writer {color:#8e8eff; font-size:14px}
	table#tbl-comment tr.level2 sub.comment-date {color:#ff9c8a; font-size:10px}
</style>

<div class="page-header page-header-xs" data-parallax="true" style="background-image: url('<%=request.getContextPath()%>/assets/img/fabio-mangione.jpg');"></div>

<section>
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-8">
                <h2 class="text-center"><i class="fa fa-heart heart"></i>&nbsp;&nbsp;Q&A<i class="fa fa-heart heart"></i></h2>
                    <div class="table table-responsive">
	                    <input type="hidden" name="no" value="<%=b.getQaCode() %>">
                        <table class="table table-striped text-center" style="margin-bottom:200px;">
                            <tr>
                                <th>제목</th>
                                <td>	
                                	<a href="<%=request.getContextPath()%>">
                        				<%=b.getTitle()%>
                        			</a>
                        		</td>
                            </tr>
                            <tr>
                                <th>작성자</th>
                                <td><%=b.getmId() %></td>
                            </tr>
                            <tr>
                                <th>작성일</th>
                                <td><%=b.getQaDate() %></td>
                            </tr>
                            <tr>
                                <th>첨부파일</th>
                                <td>
                                	<%if(b.getOriFileName()!=null){ %>
                                	<a href="javascript:void(0);" onclick="fileDownload('<%=b.getOriFileName()%>','<%=b.getNewFileName()%>');">
                                		<img src="<%=request.getContextPath()%>/resources/img/file.png" width="15px">
										<span><%=b.getOriFileName()%></span>                                		
                                	</a>
                                	<%} %> 
                                	
                                </td>
                            </tr>   
                            <tr>
                                <th colspan="2">내용</th>
                            </tr>
                            <tr><td colspan="2"><%=b.getQaContent() %></td></tr>
                            <tr>
                            <%if(logginMember!=null&&logginMember.getM_ID().equals("admin")||logginMember.getM_ID().equals(b.getmId())){%>
                                <td colspan="2" class="text-center">
                                    <button type="button" class="btn btn-warning" onclick="location.replace('<%=request.getContextPath()%>/board/boardUpdate?no=<%=b.getQaCode()%>')">수정</button>
                                    <button type="button" class="btn btn-primary" onclick="location.replace('<%=request.getContextPath()%>/board/boardDelete?no=<%=b.getQaCode()%>&fileName=<%=b.getOriFileName()%>')">삭제</button> 
                                </td>
                            <%} %>    
                            </tr>
                        </table>
                    </div>
            </div>
        </div>

        <!-- 댓글 -->
  		
  		<div id="comment-container">
  			<div class="comment-editor">
  				<form action="<%=request.getContextPath()%>/board/boardCommentInsert" method="post">
  					<textarea name="commentContent" cols="60" rows="3"></textarea>
					  <button type="submit" id="btn-insert">등록</button>
					  <input type="hidden" name="commentWriter" value="<%=b.getmCode()%>">
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
						<sub class="comment-writer"><%=logginMember.getM_ID()%></sub>
						<sub class="comment-date"><%=bc.getQaCommentDate() %></sub>
						<br>
						<%=bc.getQaCommentContent() %>
					</td>
					<td>
						<button class="btn-reply" value="<%=bc.getQaCommentCode()%>">등록</button>
					</td>
				</tr>
				<%}else{%>
					<tr class="level2">
						<td>
							<sub><%=logginMember.getM_ID()%></sub>
							<sub><%=bc.getQaCommentDate() %></sub>
							<br>
							<%=bc.getQaCommentContent() %>
						</td>
						<td></td>
					</tr>
				<%}%>	
			<%}
			} %>
		</table>
    </section>
    
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
	<script>
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
				const textarea=$("<textarea>").attr({"cols":"50","rows":"2",
													"name":"commentContent"});
				const button=$("<input>").attr({"type":"submit","value":"답글"});
				const writer=$("<input>").attr({"type":"hidden",
									"name":"commentWriter","value":"<%=logginMember.getM_CODE()%>"});
				const boardRef=$("<input>").attr({"type":"hidden",
					"name":"boardRef","value":"<%=b.getQaCode()%>"});
				const level=$("<input>").attr({"type":"hidden",
					"name":"level","value":"2"});
				const commentRef=$("<input>").attr({"type":"hidden",
					"name":"commentRef","value":$(this).val()});  
				
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