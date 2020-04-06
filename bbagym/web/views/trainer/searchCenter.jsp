<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.bbagym.model.vo.Center" %>    
<!DOCTYPE html>

<%
	List<Center> list = (List)request.getAttribute("centerinfo");
%>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<%=request.getContextPath() %>/js/jquery-3.4.1.min.js"></script>
</head>
<body>
	
		주소<input type="text" id="address" list="c-address" autocomplete="off">
 		<datalist id="c-address">
			<%for(Center c : list){ %>
			<option value="<%=c.getC_address() %>"></option>
			<%} %>
		</datalist>
		<div id="container"></div>
	
</body>

		<script>
		
			$("#address").change(function(){
				var ad={address:$("#address").val()};
				
				$.ajax({
					url : "<%=request.getContextPath() %>/trainer/searchName.do",
					dataType : "json",
					type : "post",
					data : ad,
					success : data =>{
						let input=$("<input>").attr("type","text").attr("list","c-name")
						let datalist=$("<datalist>").attr("id","c-name");
						for(let i=0;i<data.length;i++){
						let option=$("<option>").attr("value",data[i]["c_name"]);
						let inputhidden=$("<input>").attr("id",i).attr("value",data[i]["c_code"]).attr("type","hidden");
						option.append(inputhidden);
						datalist.append(option);
						}
						input.append(datalist);
						$("#container").html(input);
					}
				})
				
				
			})
				
		
		</script>
	
</html>