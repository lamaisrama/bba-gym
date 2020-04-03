<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="/views/common/header.jsp"%>	

<div class="page-header page-header-xs" data-parallax="true" style="background-image: url('<%=request.getContextPath()%>/assets/img/fabio-mangione.jpg');"></div>

	<div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-8">
            <!-- <h1 class="display-4 text-center">답변글 작성</h1> -->
            <h2 class="text-center">답변글 작성</h2>
            <form action="" method="POST">
                <div class="table table-responsive">
                    <table class="table">
                        <tr>
                            <td>작성자</td>
                            <td>admin</td>
                            <!-- <td><input type="text" class="form-control" name="writer"></td> -->
                        </tr>
                        <tr>
                            <td>제목</td>
                            <td><input type="text" class="form-control" value="[답변]" name=""></td>
                        </tr>
                        <tr>
                            <td>글내용</td>
                            <td><textarea class="form-control" name="" cols="50" rows="10"></textarea></td>
                        </tr>
                        <tr>
                            <td colspan="2" class="text-center">
                                <input type="hidden" name="">
                                <input type="submit" class="btn btn-success" value="답글등록">
                                <input type="reset" class="btn btn-warning" value="취소">
                                <input type="button" class="btn btn-primary" value="글목록" onclick="">
                            </td>
                        </tr>
                    </table>
                </div>
            </form>
        </div>
    </div>
    
<%@ include file="/views/common/footer.jsp"%>