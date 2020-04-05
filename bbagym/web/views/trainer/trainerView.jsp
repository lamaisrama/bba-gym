<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.bbagym.model.vo.TrainerView" %>	
<%@ include file="/views/common/header.jsp"%>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/sectionTrainer.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

<%

	List<TrainerView> list = (List)request.getAttribute("trainerList");

%>

<div class="page-header page-header-xs" data-parallax="true" style="background-image: url('<%=request.getContextPath()%>/assets/img/fabio-mangione.jpg');"></div>
<section>   


            <div id="box-search-outline">
                <div>
                 	<label for="search">Search</label>
				    <div id="box-search-inline">
				        <select class="custom-select" id="search-type">
				            <option value="total" selected>전체</option>
				            <option value="userId">이름</option>
				            <option value="center">소속</option>
				            <option value="category">종목</option>
				        </select>
				        <input type="text" class="form-control" id="searchKeyword" placeholder="트레이너의 소속,이름,종목을 입력해주세요">
				    </div>
                </div>
            </div>
            <!--  -->
            
           
            <div id="box-board">
           
				 <%for(int i=0;i<list.size();i++){ %> 
				
					<%if(i%3==0){ %>
						<div class="box" style="padding-bottom: 40px;">
					<%} %>
					
                    <div class="content-box-outer" >
                        <div class="content-box-inner" style="background-image: url('https://lh3.googleusercontent.com/proxy/uS-RKnA55lQW0WYuA3EC-_jhINsMETch_p-G9AJ0TGHsfDLmXh76mP7D5FQ02yohWW3flh31rlxplObmWzcgPeGJ8w41n8WumN2mC--5GNDKGAFVvVtDstKQmFYIB7JrVg9VNdnr8Md-Pu64Sgs0wzHwD9V2kQINvqTV');"><!-- 이미지처리-->
                            <div class="bar"></div>
                            <div class="content-box-cotent">
                                <table >
                                    <tr>
                                        <td>이름 : <%=list.get(i).getM_name() %>
                                        	<input type="hidden" value="<%=list.get(i).getT_code() %>">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>소속 : <%=list.get(i).getC_center() %></td>
                                   </tr>
                                    <tr>
                                        <td>주소 : <%=list.get(i).getM_addres2() %></td>
                                    </tr>
                                    <tr>
                                        <td>
                                        <%for(String s : list.get(i).getBadge()){ %>
                                        <span class="badge badge-info"><%=s %></span>&nbsp;&nbsp;
                                        <%} %>
                                    </tr>
                                </table>
                            </div>
                        </div>  
                    </div> <!-- content-box-outer-->
					
					<%if(i%3==2||i==list.size()-1){ %>	
						</div>
					 <%} %>
					<%} %>

              	
             

                    
             
                
        </div>
		
		<script>
				$("#searchKeyword").keydown(function(key){
		    		if(key.keyCode==13){
		    		var type=$("#search-type").find(":selected").val();
		    		var searchKeyword=$("#searchKeyword").val();
		    		
		    		location.replace("<%=request.getContextPath() %>/trainer/trainerFind.do?type="+type+"&searchKeyword="+searchKeyword);
		    		
		    		}
		    	});
		
		
				$(".content-box-outer").on("click",function(){
				var tcode = $(event.target).find("input").val();
				location.href="<%=request.getContextPath() %>/trainer/trainerFind.do?tcode="+tcode;
				})

		</script>
        
        <div id="pageBar"><!-- 페이지바 JSP구현-->
            <%=request.getAttribute("pageBar") %>
        </div>

</section>

<%@ include file="/views/common/footer.jsp"%>