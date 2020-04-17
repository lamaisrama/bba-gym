<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/views/common/header.jsp"%>	

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/board.css">

<div class="page-header page-header-xs" data-parallax="true" style="background-image: url('<%=request.getContextPath()%>/assets/img/fabio-mangione.jpg');"></div>
    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-8">
            <h2 class="text-center">공지글 작성</h2>
            <form action="<%=request.getContextPath() %>/board/noticeWriteEnd" method="post" enctype="multipart/form-data">
                <div class="table table-responsive">
                    <table class="table table-striped text-center">
                        <tr>
                            <th class="th-write">제목</th>
                            <td>
                                <input type="text" name="title" class="form-control" required>
                            </td>
                        </tr>
                        <tr>
                            <th class="th-write">작성자</th>
                            <td>
                            	<input type="text" name="writer" class="form-control" value="<%=logginMember.getM_ID()%>" readonly>
                            	<input type="hidden" name="mcode" value="<%=logginMember.getM_CODE()%>">
                           	</td>
                        </tr>
                        <tr>
                            <th class="th-write">첨부파일</th>
                            <td style="text-align:left;"><input type="file" name="upfile"/></td>
                        </tr>   
                        <tr>
                            <th class="th-write" colspan="2">&nbsp;</th>
                        </tr>
                        <tr>
	                        <td colspan="2">
	                        	<form name="writeForm" action="/board/noticeSnImg" method="post">
    	                        	<textarea type="text" id="summernote" name="content" class="form-control"></textarea>
    	                    	</form>    
    	                    </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="text-center" style="padding: 50px 50px;">
                            	<button type="button" class="btn btn-warning" onclick="location.replace('<%=request.getContextPath()%>/board/noticeList')">글목록</button>
                                <input type="submit" class="btn btn-primary" value="글등록">
                            </td>
                        </tr>
                    </table>
                </div>
            </form>
        </div>
    </div>
 <br><br><br><br><br>
 <script>
	 $(document).ready(function() {
	     $('#summernote').summernote({ 
	    	 
	     });
	 });
	 
	 $('#summernote').summernote({
	 	 placeholder: 'Hello Bbagym',
	     height: 500,                 
	     minHeight: null,             
	     maxHeight: null,             
	     focus: true,                 
	     lang: 'ko-KR',
	     callbacks: {
    		 onImageUpload: function(files) {
    		             for (var i = files.length - 1; i >= 0; i--) {
    		              sendFile(files[i], this);
    		             }
		         }
   		 } 
	});
	
	 // 이미지업로드 실행
     function sendFile(file, editor, welEdtiable) {
         var data = new FormData();
         data.append("file", file);
         $.ajax({ 
             data : data,
             type : "POST",
             url : "<%=request.getContextPath()%>/board/noticeSnImg",
             cache : false,
             contentType : false,
             processData : false,
             success : function(data) { 
                 $(editor).summernote('editor.insertImage', data.url);
             },
             error: function(data) {
                 console.log(data);
             }
         });
     }
	
	
 </script>
    
<%@ include file="/views/common/footer.jsp"%>