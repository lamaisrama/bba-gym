<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.bbagym.model.vo.*" %>
<%
	Notice n = (Notice)request.getAttribute("notice"); 
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
                <h2 class="text-center">공지사항</h2>
                    <div class="table table-responsive">
                        <table class="table table-striped text-center">
                            <tr>
                                <th>제목</th>
                                <td>	
                                	<a href="<%=request.getContextPath()%>">
                        			<%-- 	<%=n.getTitle()%> --%>
                        			</a>
                        		</td>
                            </tr>
                            <tr>
                                <th class="">작성자</th>
                                <td><%-- <%=n.getnCode() %> --%></td>
                            </tr>
                            <tr>
                                <th class="">작성일</th>
                                <td><%-- <%=n.getnDate() %> --%></td>
                            </tr>
                            <tr>
                                <th>첨부파일</th>
                                <td>
                                	<%-- 
                                	<%if(n.getOriFileName()!=null){ %>
                                	<a href="javascript:void(0);" onclick="fileDownload('<%=n.getOriFileName()%>','<%=n.getNewFileName()%>');">
                                		<img src="<%=request.getContextPath()%>/resources/img/file.png" width="15px">
										<span><%=n.getOriFileName()%></span>                                		
                                	</a>
                                	<%} %> 
                                	--%>
                                </td>
                            </tr>   
                            <tr>
                                <th colspan="2">내용</th>
                            </tr>
                            <tr><td colspan="2">Content</td></tr>
                            <tr>
                            <%-- <%if(loginMember!=null && loginMember.getUserId().equals("admin")) {%> --%>
                                <td colspan="2" class="text-center">
                                    <input type="button" class="btn btn-warning" onclick="" value="글수정" onclick="location.replace('<%=request.getContextPath()%>/board/noticeUpdate?no=<%=n.getmCode()%>')">
                                    <input type="button" class="btn btn-primary" onclick="" value="글삭제" onclick="location.replace('<%=request.getContextPath()%>/board/noticeDelete?no=<%=n.getmCode()%>&fileName=<%=n.getOriFileName()%>')"> 
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
		location.href="<%=request.getContextPath()%>/board/noticeDownload?ori=" + ori + "&rename=" + rename;
	}
</script>

<%@ include file="/views/common/footer.jsp"%>