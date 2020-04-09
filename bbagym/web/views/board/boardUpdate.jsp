<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.bbagym.model.vo.Board" %>	
<%
	Board b = (Board)request.getAttribute("b");
%>
	
<%@ include file="/views/common/header.jsp"%>	

<style>
    h2{
        margin: 30px 0;
    }
</style>

<div class="page-header page-header-xs" data-parallax="true" style="background-image: url('<%=request.getContextPath()%>/assets/img/fabio-mangione.jpg');"></div>

    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-8">
            <h2 class="text-center">게시글 수정</h2>
            <form action="<%=request.getContextPath() %>/board/boardUpdateEnd" method="post" enctype="multipart/form-data">
                <div class="table table-responsive">
                    <input type="hidden" name="no" value="<%=b.getQaCode() %>">
                    <table class="table table-striped text-center">
                        <tr>
                            <th>제목</th>
                            <td>
                                <input type="text" name="title" class="form-control" value="<%=b.getTitle() %>">
                            </td>
                        </tr>
                        <tr>
                            <th>작성자</th>
                            <td>
                            	<input type="hidden" name="writer" value="<%=b.getmCode() %>" class="form-control">
                            	<input type="text" value="<%=logginMember.getM_ID() %>" class="form-control" readonly>
                            </td>
                        </tr>
                        <tr>
                            <th>첨부파일</th>
                            <td>
                            	<%if(b.getOriFileName()!=null){ %>
			            			<input type="file" name="upfile">
			            			<span id="fname"><%=b.getOriFileName() %></span>
			            		<%}else{ %>
			            			<input type="file" name="upfile">
			            		<%} %>
			            			<input type="hidden" name="oriFile" value="<%=b.getOriFileName()%>">
                            </td>
                        </tr>   
                        <tr>
                            <th>내용</th>
                            <td><textarea type="text" name="content" class="form-control" cols="50" rows="10"><%=b.getQaContent() %></textarea></td>
                        </tr>
                        <tr>
                        <%-- <%if(logginMember!=null && logginMember.getM_CODE().equals(b.getmCode())){ %> --%>
                            <td colspan="2" class="text-center">
                                <input type="submit" class="btn btn-primary" value="수정완료">
                            </td>
						<%-- <%} %> --%>
                        </tr>
                    </table>
                </div>
            </form>
        </div>
    </div>
<script>

	$(function(){
		$("[name=upfile]").change(function(){
			if($(this).val()==""){
				$("$fname").show();
			}else{
				$("#fname").hide();
			}
		});
	});
	
</script>
<%@ include file="/views/common/footer.jsp"%>	