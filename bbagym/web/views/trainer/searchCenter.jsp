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
		
		<div id="box-search">
			소속명 입력 : &nbsp;<input type="text" id="c-name" name="c-name" list="c-address" size="30px" autocomplete="off" placeholder="소속명을 입력해주세요">&nbsp;<button id="search">검색</button>
		</div>
		<div id="container">
			
		</div>
	
</body>

		<script>
		
			$("#search").click(function(){
				var name={name:$("#c-name").val()};

				$.ajax({
					url : "<%=request.getContextPath() %>/trainer/searchName.do",
					dataType : "json",
					type : "post",
					data : name,
					success : function(data){
						let table=$("<table>").attr("id","table");
						let th=$("<tr>").append($("<th>").html("센터 이름"))
										.append($("<th>").html("센터 주소"))
										.append($("<th>").html("선택"));
						table.append(th);
						for(let i=0;i<data.length;i++){
						let tr=$("<tr>").append($("<td>").html(data[i]["c_name"]))
										.append($("<td>").html(data[i]["c_address"]))
										.append($("<input>").attr({"type":"hidden","value":data[i]["c_name"]}))
										.append($("<input>").attr({"type":"hidden","value":data[i]["c_code"]}))
										.append($("<td>").append($("<button>").attr({"onclick":"setupName();","type":"button"}).html("버튼")));
							table.append(tr);
						}
						$("#container").html(table);
					}
				})
				
				
			})
			
			
			function setupName(){
					var c_name=$(event.target).parent().prev().prev().val();
					var c_code=$(event.target).parent().prev().val();
					opener.document.getElementById("c_name").value=c_name;
					opener.document.getElementById("c_code").value=c_code;
					self.close();
				}
				
		
		</script>
		
		<style>
			#table{
				border : 1px solid black;
				border-collapse: collapse;
			}
			
			#table tr,#table th, #table td{
				border : 1px solid black;
				padding : 3px;
			}
			
			#box-search{
				display : flex;
				justify-content: center;
				align-items: center;
				margin-top: 20px;
			}
			
			#container{
				display : flex;
				justify-content: center;
				align-items: center;
				margin-top: 20px;
			}
			
			
		</style>
	
</html>