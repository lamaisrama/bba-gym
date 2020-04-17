<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.bbagym.model.vo.Notice" %>	
<%
	Notice n = (Notice)request.getAttribute("n");
%>
	
<%@ include file="/views/common/header.jsp"%>	

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/board.css">

<div class="page-header page-header-xs" data-parallax="true" style="background-image: url('<%=request.getContextPath()%>/assets/img/notice.jpg');"></div>

    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-8">
            <h2 class="text-center">공지글 수정</h2>
            <form action="<%=request.getContextPath() %>/board/noticeUpdateEnd" method="post" enctype="multipart/form-data">
                <div class="table table-responsive">
                    <input type="hidden" name="no" value="<%=n.getnCode() %>">
                    <table class="table table-striped text-center">
                        <tr>
                            <th>제목</th>
                            <td>
                                <input type="text" name="title" class="form-control" value="<%=n.getTitle() %>" required>
                            </td>
                        </tr>
                        <tr>
                            <th>작성자</th>
                            <td>
                            	<input type="hidden" name="writer" value="<%=n.getmCode() %>" class="form-control">
                            	<input type="text" value="<%=logginMember.getM_ID() %>" class="form-control" readonly>
                           	</td>
                        </tr>
                        <tr>
                            <th>첨부파일</th>
                            <td>
                            	<%if(n.getOriFileName()!=null){ %>
			            			<input type="file" name="upfile">
			            			<span id="fname"><%=n.getOriFileName() %></span>
			            		<%}else{ %>
			            			<input type="file" name="upfile">
			            		<%} %>
			            			<input type="hidden" name="oriFile" value="<%=n.getOriFileName()%>">
                            </td>
                        </tr>   
                        <tr>
                            <th colspan="2">&nbsp;</th>
                        </tr>
						<tr>
                            <td colspan="2">
                            	<form name="writeForm" action="/board/noticeSnImg" method="post">
                            		<textarea type="text" id="summernote" name="content" class="form-control" cols="1000" rows="1500"><%=n.getnContent() %></textarea>
                            	</form>	
                           	</td>
                        </tr>
                        <tr>
                        <%-- <%if(logginMember!=null && logginMember.getM_CODE().equals(n.getmCode())){ %> --%>
                            <td colspan="2" class="text-center" style="padding: 50px 50px;">
                                <input type="submit" class="btn btn-primary" value="수정완료!">
                                <button type="button" class="btn btn-warning" onclick="location.replace('<%=request.getContextPath()%>/board/noticeList')">취소</button>
                            </td>
						<%-- <%} %> --%>
                        </tr>
                    </table>
                </div>
            </form>
        </div>
    </div>
<script>
	//summernote
	$('#summernote').summernote({
            	placeholder: 'Hello Bbagym',
                height: 500,                 // set editor height
                minHeight: null,             // set minimum height of editor
                maxHeight: null,             // set maximum height of editor
                focus: true,                  // set focus to editable area after initializing summernote
                callbacks: {
           		 	onImageUpload: function(files) {
         		         for (var i = files.length - 1; i >= 0; i--) {
           		              sendFile(files[i], this);
           		             }
       		         }
          		 } 
        });
        
        $(document).ready(function() {
             $('#summernote').summernote({

            });
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
               	console.log(data);
                    $(editor).summernote('editor.insertImage', data.url);
                },
                error: function(data) {
                    console.log(data);
                }
            });
        }    
        
	// file
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