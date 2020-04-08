<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.List, com.bbagym.model.vo.Board" %>	
<% 
	Board b = (Board)request.getAttribute("board"); 
%>

<%@ include file="/views/common/header.jsp"%>	

<style>
   h2{
       margin: 30px 0;
   }
   th{
       width: 150px;
   }
</style>

<div class="page-header page-header-xs" data-parallax="true" style="background-image: url('<%=request.getContextPath()%>/assets/img/fabio-mangione.jpg');"></div>

<section>
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-8">
                <h2 class="text-center">Q&A</h2>
                    <div class="table table-responsive">
	                    <input type="hidden" name="no" value="<%=b.getQaCode() %>">
                        <table class="table table-striped text-center">
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
                                <td><%=b.getmCode() %></td>
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
                            <%-- <%if(logginMember!=null && logginMember.getM_ID().equals("admin")) {%> --%>
                                <td colspan="2" class="text-center">
                                    <button type="button" class="btn btn-warning" onclick="location.replace('<%=request.getContextPath()%>/board/boardUpdate?no=<%=b.getQaCode()%>')">수정</button>
                                    <button type="button" class="btn btn-primary" onclick="location.replace('<%=request.getContextPath()%>/board/boardDelete?no=<%=b.getQaCode()%>&fileName=<%=b.getOriFileName()%>')">삭제</button> 
                                </td>
                            <%-- <%} %>  --%>   
                            </tr>
                        </table>
                    </div>
            </div>
        </div>
</section>   

<script>
	function fileDownload(ori, rename){
		location.href="<%=request.getContextPath()%>/board/boardDownload?ori=" + ori + "&rename=" + rename;
	}
</script>

<%@ include file="/views/common/footer.jsp"%>	