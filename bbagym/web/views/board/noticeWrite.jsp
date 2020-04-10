<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/views/common/header.jsp"%>	

	<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <!-- <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script> -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote.min.js"></script>

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
                            <td>
                            	<input type="text" name="writer" value="<%=logginMember.getM_ID()%>" readonly>
                            	<input type="hidden" name="mcode" value="<%=logginMember.getM_CODE()%>">
                           	</td>
                        </tr>
                        <tr>
                            <th>첨부파일</th>
                            <td><input type="file" name="upfile"/></td>
                        </tr>   
                        <tr>
                            <th>내용</th>
                            <td><textarea type="text" id="summernote" name="content" class="form-control" cols="50" rows="10"></textarea></td>
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
 
 <script>
        $(document).ready(function() {
            $('#summernote').summernote();
            });

        $(document).ready(function() {
             $('#summernote').summernote({
                height: 500,                 // set editor height
                minHeight: null,             // set minimum height of editor
                maxHeight: null,             // set maximum height of editor
                focus: true                  // set focus to editable area after initializing summernote
                

            });
        });
        
        
    </script>
    
<%@ include file="/views/common/footer.jsp"%>