<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-8">
            <h2 class="text-center">공지글 작성</h2>
            <form action="<%=request.getContextPath() %>/board/noticeWriteEnd" method="post" enctype="multipart/form-data">
                <div class="table table-responsive">
                    <table class="table table-striped text-center">
                        <tr>
                            <th>제목</th>
                            <td>
                                <input type="text" name="title" class="form-control">
                            </td>
                        </tr>
                        <tr>
                            <th>작성자</th>
                            <td><input type="text" name="writer" value="<%=logginMember.getM_NAME()%>" readonly></td>
                        </tr>
                        <tr>
                            <th>첨부파일</th>
                            <td><input type="file" name="upfile"/></td>
                        </tr>   
                        <tr>
                            <th>내용</th>
                            <td><textarea type="text" name="content" class="form-control" cols="50" rows="10"></textarea></td>
                        </tr>
                        <tr>
                            <td colspan="2" class="text-center">
                                <input type="submit" class="btn btn-primary" value="글등록">
                            </td>
                        </tr>
                    </table>
                </div>
            </form>
        </div>
    </div>
    
<%@ include file="/views/common/footer.jsp"%>