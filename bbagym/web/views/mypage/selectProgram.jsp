<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.bbagym.model.vo.Program" %>
<%
	List<Program> list = (List<Program>)(request.getAttribute("programs"));

%>
<!-- The Modal -->
<div style="visibility:hidden;">
<button type="button" id="modalBtn" data-toggle="modal" data-target="#myModal">Open Modal</button>
</div>
<div class="modal fade" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title" style="font-weight:bolder;">전환할 프로그램 선택</h4>
          <button type="button" class="close" data-dismiss="modal">×</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
        <table class="table .table-hover" style="text-align:center;">
        	<tr>
        		<th>프로그램명 </th>
        		<th>프로그램 상태</th>
        		<th>선택</th>
        	</tr>
       	  <%if(list.size()>0){ %>
          	<%for(Program p : list) {%>
	          	<tr>
	          		<td><%=p.getProgramName() %></td>
	          		<td><%=p.getStatus() %> </td>
	          		<td><button class="btn btn-primary" value="<%=p.getpCode() %>,<%=p.getStatus() %>" onclick="changeProgramStatus(this);">상태전환</button>
	          	</tr>
	          	
          	<%}
          }else{%>
          <tr>
          	<td colspan="3"><h4>표시할 내용이 없습니다.</h4></td>
          </tr>
          <%} %>
        </table>
        
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <p>
          <small style="color:blue;">Y에서 N으로 전환되면 해당 프로그램은 더 이상 회원을 받지 않습니다. <br> N->Y로 전환되면 다시 회원을 받습니다.</small>
          </p>
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
  