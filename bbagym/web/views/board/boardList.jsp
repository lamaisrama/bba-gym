<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.bbagym.model.vo.Board" %>
<%
	List<Board> list = (List)request.getAttribute("list"); 
	String pageBar = (String)request.getAttribute("pageBar");
%>		
<%@ include file="/views/common/header.jsp"%>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/board.css">

    <div class="page-header page-header-xs" data-parallax="true" style="background-image: url('<%=request.getContextPath() %>/assets/img/fabio-mangione.jpg');"></div>
    <section id="board-container">
        <div class="container">

            <h1 class="display-4" style="text-align: center;">Q&A Board</h1>
            <br>
            <br>
            <!-- 검색 -->
            <!-- <div align="right">
                <label for="">SearchType:</label>
                <select id="">
                    <option>Category</option>
                    <option value="">Center</option>
                    <option value="">Trainer</option>
                    <option value="">Bbagym</option>
                </select>
                <input type="text" name="" id="">
                <button type="button" class="btn btn-sm btn-outline-secondary">search</button>
            </div> -->

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
                        <th scope="col">rCount</th>
                    </tr>
                </thead>
                <tbody>
                <%-- <%if(list!=null){ %> --%>
                	<%for(Board b : list) {%>
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
                    <%} %>
                 <%-- <%} %> --%>
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
<%@ include file="/views/common/footer.jsp"%>