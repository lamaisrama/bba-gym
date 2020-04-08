<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.bbagym.model.vo.*" %>	
<%@ include file="/views/common/header.jsp"%>

<%
	List<CenterEnroll> centerList = (List)request.getAttribute("centerList"); /* centerSearchServlet 가져온 데이터 */
	int score=1;
	String keyword=(String)request.getAttribute("keyword");
%>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/sectionCenter.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

<div class="page-header page-header-xs" data-parallax="true" style="background-image: url('<%=request.getContextPath()%>/assets/img/istock.jpg');"></div>

    <div class="container outer">
        <div class="row">
            <div class="searchBox">
                <input type="text" name="search" id="search" placeholder="시설명, 주소로 검색해보세요" size="40" value="<%=keyword!=null ? keyword : "" %>">
                <button class="btn btn-warning btn-sm" onclick="serachKeyword();">Find!</button>
            </div>
        </div>
        <div class="row">
            <div class="sortBox">
                <ul class="nav nav-pills nav-tabs" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link" id="amap" data-toggle="tab" href="#map">지도검색</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" id="acategory" data-toggle="tab" href="#category">카테고리</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle"  id="asort" data-toggle="dropdown" href="#">정렬</a>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="#">평점순</a> <!--평점순으로 페이징 처리-->
                            <a class="dropdown-item" href="#">리뷰순</a> <!--리뷰가 많은순으로 페이징처리-->
                            <a class="dropdown-item" href="#">최신순</a> <!--최신순으로 페이징처리-->
                        </div>
                    </li>
                </ul>
            </div>
        </div>
        <div class="row tab-content">
            <div class="tab-pane container" id="map">
                <h3>map api 넣을 구역</h3>
            </div>
            <div class="tab-pane container" id="category">
                <form action="<%=request.getContextPath() %>/center/sortCategory.do?keyword=<%=keyword!=null ? keyword : null %>" method="POST">
                    <input type="checkbox" name="category" value="0" id="total"><label for="total">전체</label>
                    <input type="checkbox" name="category" value="1" id="swimming"><label for="swimming">수영</label>
                    <input type="checkbox" name="category" value="2" id="GX"><label for="GX">GX</label>
                    <input type="checkbox" name="category" value="3" id="health"><label for="health" >헬스</label>
                    <input type="checkbox" name="category" value="4" id="UFC"><label for="UFC">격투기</label> 
                    <br>
                    <input type="checkbox" name="category" value="5" id="plites"><label for="plites">필라테스</label>
                    <input type="checkbox" name="category" value="6" id="yoga"><label for="yoga">요가</label>
                    <input type="checkbox" name="category" value="7" id="etc"><label for="etc">기타</label><br>
                    <button type="submit" class="btn btn-info" >검색</button>
                </form>
            </div>
        </div>
        <h1 style="margin-top: 50px; text-align:center;">시설 정보</h1>
        <div class="row box-content" >
        	<%if(centerList.isEmpty()) {%>
        		<h1>정보가 없습니다</h1>
        	<%} else{ for(CenterEnroll c: centerList){%>
            <div class="content-box-outer"><!-- for문 돌려서 페이징 처리해야합니다 pagebarNo=5,numPerpage=5-->
                <div class="content-box-inner"></div>
                <div class="bar"></div>
                <div class="content-box-cotent">
                    <table>
                        <tr>
                            <td colspan="3"><input type="hidden" value="<%=c.getCode() %>"></td>
                        </tr>
                        <tr>
                            <td colspan="2"><h2><%=c.getName() %></h2></td> <!-- 제목-->
                            <td><h2>
                            <%if(c.getPrefer()==false){ %>
                            <i class="far fa-heart" style='color:red'>
                            <%}else{ %>
                            <i class='fas fa-heart'  style='color:red'></i>
                            <%} %>
                            </i></h2></td><!-- 찜목록 ON/OFF-->
                        </tr>
                        <tr>
                            <td colspan="2"><%=c.getAddress() %></td><!-- 위치 API-->
                            <td>10.9Km</td><!-- 거리 API-->
                        </tr>
                        <tr>
                            <td colspan="2">
                            	<%for(;score<=c.getScore();score++){ %>
                            		<i class="fa fa-star"></i>&nbsp;&nbsp;
                            	<%} 
                            	if(score-c.getScore()<0.5){%>
                            		<i class="fa fa-star-half"></i>
                            	<%} score=1;%>
                            	<%=c.getScore()==0 ?  "0" : c.getScore() %>
                            </td><!-- 평점 점수에따른 이미지변경-->
                            <td></td>
                        </tr>
                        <tr>
                        	<td colspan="2">
                        	<%for(String s : c.getCategories()) {%>
                            	<span class="badge badge-info"><%=s %></span>&nbsp;<!-- 카테고리-->
                            <%} %>
                            </td>
                            <td style="padding: 0;"><a href="<%=request.getContextPath()%>/center/centerDetail.do?cCode=<%=c.getCode()%>">정보 확인하기 ></a></td><!-- 정보 상세로 이동-->
                        </tr>
                        <tr>
                            <td colspan="3"></td>
                        </tr>
                    </table>
                </div><!-- for문 돌려서 페이징 처리해야합니다 -->
            </div><!-- content-box-outer -->
            <%} }%>
        </div>
        <div id="pageBar"><!-- 페이지바 JSP구현-->
            <%=request.getAttribute("pageBar") %> <!-- trainerviewservlet에서 가져온 pagebar -->
        </div>
    </div><!-- outer container 끝 -->
    
    <script>
    
   		/* 이미지 넣어주기 */
    	var boxinner=$(".content-box-inner");
		
		<%if(!centerList.isEmpty()){ 
			for(int i=0;i<centerList.size();i++){
		%>
		$(boxinner[<%=i %>]).css("background-image","url('https://i.ytimg.com/vi/RMeXxJ3Y2KI/maxresdefault.jpg')");
			 <%-- <%=centerList.get(i).getMainImage() %> --%> 
		<%} }%>
		/* 이미지 넣어주기 */
	
		/* 찜하기 ajax */
		<%if(logginMember!=null){%>
		$(".fa-heart").parent().on("click",function(){
			var code = {ccode:$(this).parents(".content-box-cotent").find("input[type=hidden]").val()};
			var i= $(this).find("i");
			 $.ajax({
				url : "<%=request.getContextPath() %>/center/centerPrefer.do",
				data : code,
				type : "post",
				success : function(data){
					if(data=="true"){
						i.removeClass('far');
						i.addClass('fas');
					}else{
						i.removeClass('fas');
						i.addClass('far');
					}
				}
			}) 
		});
		<%} else{ %>
			$(".fa-heart").parent().on("click",function(){
		        alert("로그인후 이용하세요");
			});
		<%}%>
		
		/* 찜하기 ajax */
		
		/* 키워드 검색 */
		function serachKeyword(){
            		var search=$("#search").val();
            		location.href="<%=request.getContextPath() %>/center/search.do?keyword="+search;
            	}
		/* 키워드 검색 */

    </script>

<script src="<%=request.getContextPath() %>/js/centerViewJs.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<%@ include file="/views/common/footer.jsp"%>