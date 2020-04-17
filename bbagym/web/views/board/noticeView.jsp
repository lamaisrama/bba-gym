<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.bbagym.model.vo.*" %>
<%
	Notice n = (Notice)request.getAttribute("notice"); 
%>		
<%@ include file="/views/common/header.jsp"%>	

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/board.css">

<div class="page-header page-header-xs" data-parallax="true" style="background-image: url('<%=request.getContextPath()%>/assets/img/fabio-mangione.jpg');"></div>

<section>
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-8">
                <h2 class="text-center"><i class="fa fa-heart heart"></i>&nbsp;&nbsp;공지사항<i class="fa fa-heart heart"></i></h2>
                    <div class="table table-responsive">
	                    <input type="hidden" name="no" value="<%=n.getnCode() %>">
                        <table class="table table-striped text-center" style="margin-bottom:200px;">
                            <tr>
                                <th class="th-write">제목</th>
                                <td><b><%=n.getTitle()%></b></td>
                            </tr>
                            <tr>
                                <th class="th-write">작성자</th>
                                <td><%=n.getmId() %></td>
                            </tr>
                            <tr>
                                <th class="th-write">작성일</th>
                                <td><%=n.getnDate() %></td>
                            </tr>
                            <tr>
                                <th class="th-write">첨부파일</th>
                                <td>
                                	<%if(n.getOriFileName()!=null){ %>
                                	<a href="javascript:void(0);" onclick="fileDownload('<%=n.getOriFileName()%>','<%=n.getNewFileName()%>');">
                                		<img src="<%=request.getContextPath()%>/resources/img/file_3.png" width="20px">
										<span><%=n.getOriFileName()%></span>                                		
                                	</a>
                                	<%} %> 
                                	
                                </td>
                            </tr>   
                            <tr>
                                <th colspan="2">&nbsp;</th>
                            </tr>
                            <tr><td colspan="2" style="padding:50px 30px;"><%=n.getnContent() %></td></tr>
                            <tr>
                                <td colspan="2" class="text-center">
                                	<button type="button" class="btn btn-primary" onclick="location.replace('<%=request.getContextPath()%>/board/noticeList')">글목록</button>
                            <%if(logginMember!=null && logginMember.getM_ID().equals("admin")) {%>
                                    <button type="button" class="btn btn-warning" onclick="location.replace('<%=request.getContextPath()%>/board/noticeUpdate?no=<%=n.getnCode()%>')">수정</button>
                                    <button type="button" class="btn btn-danger" onclick="location.replace('<%=request.getContextPath()%>/board/noticeDelete?no=<%=n.getnCode()%>&fileName=<%=n.getOriFileName()%>')">삭제</button> 
                            <%} %>    
                                </td>
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