<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ page import="java.util.List, com.bbagym.model.vo.Notice" %>
<%
	List<Notice> list = (List)request.getAttribute("list"); 
	String pageBar = (String)request.getAttribute("pageBar");
%>	
	
<%@ include file="/views/common/header.jsp"%>

<style>
    section#board-container{
    	margin:30px auto; text-align:center;
    }
</style>
    <div class="page-header page-header-xs" data-parallax="true" style="background-image: url('<%=request.getContextPath() %>/assets/img/fabio-mangione.jpg');"></div>
    <section id="board-container">
        <div class="container">

            <h1 class="display-4" style="text-align: center;">Notice</h1>
            <br>
            <br>
            <!-- 검색 -->
            <div align="right">
                <label for="">SearchType:</label>
                <select id="">
                    <option>Category</option>
                    <option value="">Notice</option>
                    <option value="">Event</option>
                </select>
                <input type="text" name="" id="">
                <button type="button" class="btn btn-sm btn-outline-secondary">search</button>
            </div>

            <!-- 게시판테이블 start -->
            <table class="table table-hover">
                <thead class="thead-light">
                    <tr>
                        <th scope="col">No</th>
                        <th scope="col" width="50%">Title</th>
                        <th scope="col">Writer</th>
                        <th scope="col">File</th>
                        <th scope="col">Date</th>
                        <th scope="col">rCount</th>
                    </tr>
                </thead>
                <tbody>
                <%if(list!=null){ %>
                	<%for(Notice n : list) {%>
                    <tr>
                        <td scope="row"><%=n.getnCode() %></td>
                        <td>
                        	<a href="<%=request.getContextPath()%>/board/noticeView?no=<%=n.getnCode()%>">
                        		<%=n.getTitle() %>
                        	</a>
                       	</td>
                        <td><%=n.getmCode() %></td>
                        <td><img src="/resources/img/file.png">
                        	<%if(n.getOriFileName()!=null) {%>
                        	<img src="<%=request.getContextPath()%>/resources/img/file.png" width="15px">
							<%} %>
						</td>
                        <td><%=n.getnDate() %></td>
                        <td><%=n.getReadCount() %></td>
                    </tr>
                    <%} %>
                 <%} %>
                </tbody>
            </table>
            <!-- 게시판테이블 end -->
            
            <!-- 글쓰기버튼 -->
            <%-- <%if(loginMember!=null&&loginMember.getM_ID().equals("admin")) {%> --%>
            <div align="right">
           		<input type="button" value="글쓰기" class="btn btn-sm btn-outline-secondary" 
           			onclick="location.replace('<%=request.getContextPath()%>/board/noticeWrite')">
            </div>
            <%-- <%} %> --%>
            <br>
            
            <!-- 페이징 start -->
            <nav aria-label="Page navigation example">
                <%=pageBar %>
            </nav>
            <!-- 페이징 end -->
        </div>    
	</section>

<%@ include file="/views/common/footer.jsp"%>