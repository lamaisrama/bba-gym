<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.bbagym.model.vo.Board" %>
<%
	List<Board> list = (List)request.getAttribute("list"); 
	String pageBar = (String)request.getAttribute("pageBar");
	String searchType = request.getParameter("searchType");  
	String searchKeyword = request.getParameter("searchKeyword"); 
%>		
<%@ include file="/views/common/header.jsp"%>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/board.css">

    <div class="page-header page-header-xs" data-parallax="true" style="background-image: url('<%=request.getContextPath() %>/assets/img/qna.jpg');"></div>
    <section id="board-container">
        <div class="container">

            <h1 class="display-4" style="text-align: center;">Q&amp;A Board</h1>
            <br>
            <br>
            
            <!-- 검색start -->
            <div align="right">
                <label for="">SearchType:</label>
                <select id="searchType">
                    <option>Category</option>
                    <option value="title" <%=searchType!=null&&searchType.equals("title")?"selected":"" %>>Title</option>
                    <option value="content" <%=searchType!=null&&searchType.equals("content")?"selected":"" %>>Content</option>
                </select>
               
            	<div id="search-title">
					<form action="<%=request.getContextPath()%>/board/boardFinder" method="post">
						<input type="hidden" value="title" name="searchType">
						<input type="text" name="searchKeyword" placeholder="제목입력" value="<%=searchType!=null&&searchType.equals("title")?searchKeyword:""%>">
						<button type="submit" class="btn btn-sm btn-outline-secondary">검색</button>
					</form>
				</div>
            	<div id="search-content">
					<form action="<%=request.getContextPath()%>/board/boardFinder" method="post">
						<input type="hidden" value="qa_content" name="searchType">
						<input type="text" name="searchKeyword" placeholder="내용입력" value="<%=searchType!=null&&searchType.equals("qa_content")?searchKeyword:""%>">
						<button type="submit" class="btn btn-sm btn-outline-secondary">검색</button>
					</form>
				</div>
            </div>
			<!-- 검색end -->

            <!-- 게시판테이블 start -->
            <table class="table table-hover">
                <thead class="thead-light">
                    <tr>
                        <th scope="col">No</th>
                        <!-- <th scope="col">Category</th> -->
                        <th scope="col" width="50%">Title</th>
                        <th scope="col">Writer</th>
                        <th scope="col">File</th>
                        <th scope="col">Date</th>
                        <th scope="col">View</th>
                    </tr>
                </thead>
                <tbody>
                <%-- <%if(list!=null){ %> --%>
                <% if(list.isEmpty()){%>
						<tr>
							<td colspan="6">조회된 게시글이 존재하지 않습니다!</td>
						</tr>	
					<%}else{ 
	                	for(Board b : list) {%>
	                    <tr>
	                        <td scope="row"><%=b.getQaCode() %></td>
	                        <td>
	                        	<a href="<%=request.getContextPath()%>/board/boardView?no=<%=b.getQaCode()%>">
	                        		<%=b.getTitle() %>
	                        	</a>
	                       	</td>
	                        
	                        <td><i class="fa fa-heart heart"></i>&nbsp;<%=b.getmId() %>
	                        </td>
	                        
	                        <td>
	                        	<%if(b.getOriFileName()!=null) {%>
	                        	<img src="<%=request.getContextPath()%>/resources/img/file_2.png" width="20px">
								<%} %>
							</td>
	                        <td><%=b.getQaDate() %></td>
	                        <td><%=b.getReadCount() %></td>
	                    </tr>
	                    <%} 
                 } %>
                </tbody>
            </table>
            <!-- 게시판테이블 end -->
            <!-- 글쓰기버튼 -->
            <div align="right">
            	<button type="button" class="btn btn-sm btn-outline-secondary"
            		onclick="location.replace('<%=request.getContextPath() %>/board/boardWrite')">	
           			Write
           		</button>
           	</div>
            <br>
            <br>
            <!-- 페이징 start -->
            <nav aria-label="Page navigation example">
                <%=pageBar %>
            </nav>
            <!-- 페이징 end -->
        </div>    
	</section>
<br><br><br><br><br>

<script>
	$(function(){ 
		$("#searchType").change(function(){
			const title = $("#search-title");
			const content = $("#search-content");
					
			title.hide();
			content.hide();
			const type = $(this).val();
			console.log(type);
			$("#search-" + type).css("display", "inline-block");
		});
		$("#searchType").change(); 
	});
</script>







<%@ include file="/views/common/footer.jsp"%>