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

	List<TrainerView> trainerlist = (List)request.getAttribute("trainerList"); /* trainerViewservlet에서 가져온 데이터 */
	String type = (String)request.getAttribute("type");
	String searchKeyword = (String)request.getAttribute("searchKeyword");
%>

<div class="page-header page-header-xs" data-parallax="true" style="background-image: url('<%=request.getContextPath()%>/assets/img/fabio-mangione.jpg');"></div>
<section>   


            <div id="box-search-outline">
                <div>
                 	<label for="search">Search</label>
				    <div id="box-search-inline">
				        <select class="custom-select" id="search-type">
				            <option value="total"<%=type==null||(type!=null&&type.equals("total")) ? "selected" : "" %>>전체</option><!-- 처음들오면 type=null이므로 전체  selected / 또한 total로 돌아오면 selected -->
				            <option value="member.m_name" <%=type!=null&&type.equals("member.m_name") ? "selected" : "" %>>이름</option><!--  type!=null아니며 타입값과같으면 selected -->
				            <option value="center.c_name" <%=type!=null&&type.equals("center.c_name") ? "selected" : "" %>>소속</option><!--  같음 -->
				            <option value="category_name" <%=type!=null&&type.equals("category_name") ? "selected" : "" %>>종목</option><!--  같음 -->
				        </select>
				        <input type="text" class="form-control" id="searchKeyword" placeholder="트레이너의 소속,이름,종목을 입력해주세요"
				        style="<%=searchKeyword!=null ? "display:block;" : "" %>" value="<%=searchKeyword!=null ? searchKeyword : "" %>"><!-- 값이 있으면 display none에서 block로 바꾸며 값을 넣어준다 -->
				    </div>
                </div>
            </div>
            
            
           
            <div id="box-board">
            
            	<%if(trainerlist.isEmpty()){ %> <!-- list가 비어있는경우 데이터가 없는것으로 아래 문장을 띄운다 -->
           				<div class="box" style="padding-bottom: 40px;"><h2>찾는 트레이너가 없습니다</h2> </div> 
				 <%}else {for(int i=0;i<trainerlist.size();i++){ %> <!--  있을경우 for문을 돌린다 -->
				
					<%if(i%3==0){ %> <!-- 3개씩 만들고 아래칸으로 내리기위해 만들어준다 -->
						<div class="box" style="padding-bottom: 40px;">
					<%} %>
					
                    <div class="content-box-outer" >
                        <div class="content-box-inner" >
                            <div class="bar"></div>
                            <div class="content-box-cotent">
                                <table >
                                    <tr>
                                        <td>이름 : <%=trainerlist.get(i).getM_name() %>
                                        	<input type="hidden" value="<%=trainerlist.get(i).getT_code() %>"><!-- trainerdetailservlet에 클린된 트레이너를 구별하기위해 tcode를 히든으로 감쳐 보낸다 -->
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>소속 : <%=trainerlist.get(i).getC_center() %></td>
                                   </tr>
                                    <tr>
                                        <td>주소 : <%=trainerlist.get(i).getM_addres2() %></td>
                                    </tr>
                                    <tr>
                                        <td>
                                        <%for(String s : trainerlist.get(i).getBadge()){ %> <!-- list에서 뱃지는 String[] 타입으로 가져왔다 다시 for문을 만들어준다  -->
                                        <span class="badge badge-info"><%=s %></span>&nbsp;&nbsp;
                                        <%} %>
                                    </tr>
                                </table>
                            </div>
                        </div>  
                    </div> <!-- content-box-outer-->
					
					<%if(i%3==2||i==trainerlist.size()-1){ %>	<!-- 3개가 만들어진뒤 닫아주기위해서 마지막 나머지 2일경우 닫아주며, 제일마지막 데이터가 나오면 닫아준다 -->
						</div>
					 <%} %>
					<%}} %>

              	
             

                    
             
                
        </div>
		
		<script>
		
				$(function(){
					
					/* 이미지 넣어주기  */
					var boxinner=$(".content-box-inner");
					
					<%if(!trainerlist.isEmpty()){ 
						for(int i=0;i<trainerlist.size();i++){
					%>
						$(boxinner[<%=i %>]).css("background-image","url('<%=request.getContextPath() %>/upload/trainer/<%=trainerlist.get(i).getT_img() %>')");
							 <%-- <%=trainerlist.get(i).getT_img() %> --%> 
					<%} }%>
					/* 이미지 넣어주기 */
					
					/* 엔터키 누를경우 serachServlet 데이터 전송 */
					$("#searchKeyword").keydown(function(key){
			    		if(key.keyCode==13){ /* 엔터일경우가 13   */
			    		var type=$("#search-type").find(":selected").val(); /* 지금 selected 되어있는 타입을 가져온다 */
			    		var searchKeyword=$("#searchKeyword").val(); /* input 태그에 들어있는 정보들을 가져온다 */
			    		location.replace("<%=request.getContextPath() %>/trainer/trainerFind.do?type="+type+"&searchKeyword="+searchKeyword);
			    		/* 타입과 키워드를 trianerseachservlet으로 보낸다 */
			    		}
			    	});
					/* 엔터키 누를경우 serachServlet으로 데이터 전송 */
			
					/* 트레이너박스 클릭시 상세 화면으로 이동 */
					$(".content-box-outer").on("click",function(){;
					var tcode = $(event.target).find("input").val(); /* 생성되어있는 content-box 즉 트레이너 설명 box를 클릭하면 상세보기로 이동하기위한 servlet으로 이동한다  */
					location.href="<%=request.getContextPath() %>/trainer/trainerDetail.do?tcode="+tcode;
					/* 클릭한박스에 input을 찾아 tcode를 동봉해 보낸다 */
					})
					/* 트레이너박스 클릭시 상세 화면으로 이동 */
					
					/* 상단 검색바 전체일경우 가리고 나머지는 보여준다 */
					 $("#search-type").on("change",function(){
	                        var type=$("#search-type").find(":selected").val();
	                        if(type!='total'){
	                            $("#searchKeyword").fadeIn(500);/* search-type이 전체가 아닐경우는 input창을 보여준다 */
	                        }else{
	            				location.href="<%=request.getContextPath() %>/trainer/trainerView.do?cPage="+1+"&type=total";
	            				/*serach-type이 전체로 바뀔 경우 기존에 trainerviewservlet에 제일첫페이지로 이동한다 */
	                        }
	                    });
					/* 상단 검색바 전체일경우 가리고 나머지는 보여준다 */

				})		
		
				
		</script>
     
        <div id="pageBar"><!-- 페이지바 JSP구현-->
            <%=request.getAttribute("pageBar") %> <!-- trainerviewservlet에서 가져온 pagebar -->
        </div>

</section>

<%@ include file="/views/common/footer.jsp"%>