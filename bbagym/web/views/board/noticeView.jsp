<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="/views/common/header.jsp"%>	

<div class="page-header page-header-xs" data-parallax="true" style="background-image: url('<%=request.getContextPath()%>/assets/img/fabio-mangione.jpg');"></div>

<section>
	<div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-8">
            <h2 class="text-center">공지글 작성</h2>
            <form action="" method="post">
                <div class="table table-responsive">
                    <table class="table table-striped">
                        <tr>
                            <td>제목</td>
                            <td colspan="3"></td>
                        </tr>
                        <tr>
                            <td class="danger">작성자</td>
                            <td>writer</td>
                        </tr>
                        <tr>
                            <td class="danger">작성일</td>
                            <td>Date</td>
                        </tr>
                        <tr>
                            <td>첨부파일</td>
                            <td colspan="4"></td>
                        </tr>   
                        <tr>
                            <td>내용</td>
                            <td colspan="3">Content</textarea></td>
                        </tr>
                        <tr>
                            <td colspan="4" class="text-center">
                                <input type="hidden" name="" value="">
                                <input type="button" class="btn btn-warning" onclick="" value="글수정">
                                <input type="button" class="btn btn-primary" onclick="" value="글삭제">
                            </td>
                        </tr>
                    </table>
                </div>

            </form>

        </div>
    </div>
</section>    
<%@ include file="/views/common/footer.jsp"%>