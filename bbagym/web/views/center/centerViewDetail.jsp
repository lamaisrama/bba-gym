<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.bbagym.model.vo.CenterDetail, com.bbagym.model.vo.CenterPrograms" %>

<%
	CenterDetail cd = (CenterDetail)request.getAttribute("cd");
	int cCode = (int)request.getAttribute("cCode");
	int mCode = (int)request.getAttribute("mCode");
	int score=1;
%>
	

<%@ include file="/views/common/header.jsp"%>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/centerViewDetail.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

<body data-spy="scroll" data-target=".navbar" data-offset="100"> <!--시설 이용후기등 메뉴바 클릭시 이동과 관련-->
<div class="page-header page-header-xs" data-parallax="true" style="background-image: url('<%=request.getContextPath()%>/assets/img/fabio-mangione.jpg');"></div>
<!-- section -->
    <div id="container">
        <div id="header-info">
            <div id="detail-header">
                <div id="all-info">
                    <div class="img-info">
                        <img src="<%=request.getContextPath()%>/resources/img/Gym-1.jpg" width="450" height="450">
                    </div>
                    <div class="text-info">
                        <div id="title"><h2 style="margin-right: auto;"><%=cd.getCenterName() %></h2>
                            <div class="jjim"><!--찜 좋아요-->
                            	<input type="hidden" value="<%=cCode %>">
								<h2 style="cursor: pointer;">
		                            <%if(cd.isJjim()==false){ %>
		                            <i class="far fa-heart" style='color:red'>
		                            <%}else{ %>
		                            <i class='fas fa-heart'  style='color:red'></i>
		                            <%} %>
		                            </i>
	                            </h2>
                            </div>
                        </div>
                        <div id="star-point" style="color: black;">
                        	<%for(;score<=cd.getCenterScore();score++){ %>
                            		<i class="fa fa-star"></i>&nbsp;&nbsp;
                            	<%} 
                            	if(score-cd.getCenterScore()<0.5){%>
                            		<i class="fa fa-star-half"></i>
                            	<%} score=1;%>
                            	<%=cd.getCenterScore()==0 ?  "0" : cd.getCenterScore() %>
                        </div><!--평점 어찌넣지?-->
                        <div id="address-phone"><h7><%=cd.getCenterAddr() %><br><%=cd.getCenterPhone() %></h7></div>
                        <div id="choice">옵션 선택
                            <select id="pChoice" name="choice" aria-placeholder="옵션선택" style="width: 100%; height: 40px;" >
                                <% String preName=(cd.getCenterPrograms().get(0)).getpName(); 
                                for(int i=0; i<cd.getCenterPrograms().size(); i++){ 
                                	CenterPrograms cp = cd.getCenterPrograms().get(i);
                               		if(i==0||!preName.equals(cp.getpName())) {
                               			preName=cp.getpName();%>
                                	<option value="<%=cp.getpCode()%>"><%=cp.getpName()%></option>
                                <%}
                                }%>
                            </select>
                        </div>
                        <div id="basket-button"><!--담기-->
                            <button type="button" class="btn btn-primary btn-baguni" style="width: 100%; height: 100%;" >회원권 담기</button>
                        </div>
                    </div>
                </div>    
            </div><!--detail-header-->
            
            <div id="detail-window">
                <div id="window-menu">
                    <ul class="nav nav-tabs nav-justified"><!--클릭시 메뉴바 태그 연결-->
                        <li class="nav-item">
                            <a class="nav-link" href="#section1"><h5>시설정보</h5></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#section2"><h5>사진</h5></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#section3"><h5>이용후기</h5></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#section4"><h5>위치</h5></a>
                        </li>
                    </ul>
                </div>
                <div id="menu-sebu">
                    <div class="bord-section">
                        <div id="section1" class="container-fluid">
	                    	<div id="notice-zone">
	                            <div id="notice">
	                                <p><%=cd.getCenterIntro() %></p>
	                            </div>
	                        </div> 
                            <div id="price-zone">    
                                <div id="price">
                                    <div class="price-title"><h5>가격정보</h5></div>
                                    <div id="price-buga">
										<%String preName1=(cd.getCenterPrograms().get(0)).getpName(); 
                                    	for(int i=0; i<cd.getCenterPrograms().size(); i++) {
                                    		CenterPrograms cp = cd.getCenterPrograms().get(i);
                                    		if(i==0||!preName1.equals(cp.getpName())) {
                                    			preName1=cp.getpName();%>

										<div class="buga-title"><h6><%=cp.getpName() %></h6></div>
														<div style="width: 730px;">
														<table id="price_table">
															<tr>
																<th></th>
	                                        				<%for(int j=0; j<cd.getCenterPrograms().size(); j++) { 
	                                        					CenterPrograms cp2 = cd.getCenterPrograms().get(j);
	                                        					if(preName1.equals(cp2.getpName())) {%>
																	<th><%=cp2.getMonth() %>개월</th>						
                                                				<%} 
                                        						}%>    
                                        				   	</tr>
                                        				   	<tr style="color: lightgray;">
                                        				   		<td>정상가</td>
                                        				   	<%for(int j=0; j<cd.getCenterPrograms().size(); j++) { 
	                                        					CenterPrograms cp2 = cd.getCenterPrograms().get(j);
	                                        					if(preName1.equals(cp2.getpName())) {%>
																	<td><%=(int)(cp2.getPrice()+(cp2.getPrice()*0.1)) %>원</td>						
                                                				<%} 
                                        						}%>
                                        				   	</tr>
                                        				   	<tr>
                                        				   		<td>BBAGYM 회원가</td>
                                        				   	<%for(int j=0; j<cd.getCenterPrograms().size(); j++) { 
	                                        					CenterPrograms cp2 = cd.getCenterPrograms().get(j);
	                                        					if(preName1.equals(cp2.getpName())) {%>
																	<td><%=cp2.getPrice() %>원</td>						
                                                				<%} 
                                        						}%>
                                        				   	</tr>
                                        				   	<tr style="font-size: 18px; font-weight: bolder;">
                                        				   		<td></td>
                                        				   	<%for(int j=0; j<cd.getCenterPrograms().size(); j++) { 
	                                        					CenterPrograms cp2 = cd.getCenterPrograms().get(j);
	                                        					if(preName1.equals(cp2.getpName())) {%>
																	<td><span>월 <%=(int)(cp2.getPrice()/cp2.getMonth()) %>원</span></td>						
                                                				<%} 
                                        						}%>
                                        				   	</tr>
                                        				</table>                                   			

		                                        <%} 
		                                        }%>
                                        	</div>  
                                </div>
                            </div>
                            <div id="time-zone">
                                <div id="time">
                                    <div id="time-play"><h5>운영시간</h5></div>
                                    <div id="time-con">
                                        <%=cd.getCenterOpenHours() %><br>
                                        [휴관일] <%=cd.getCenterHolidays() %>
                                    </div>
                                </div>
                            </div>
                            <div id="program-zone">
                                <div id="program">
                                    <div class="program-title"><h5>시설</h5></div>
                                    <div class="program-sebu">

                                        	<%for(int i=0; i<cd.getCenterFacilityNames().size(); i++){ %>
                                        		<%=cd.getCenterFacilityNames().get(i) %>&nbsp;&nbsp;
                                        	<%} %>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--이미지구역-->
                        <div id="section2" class="container-fluid">
                            <div id="image-zone">
                                <div id="image-title"><h5>사진</h5></div>
                                <div id="image-sebu">    
                                    <div class="img">
                                        <div class="col-md-12 ml-auto mr-auto">
                                        <%for(int i=0; i<cd.getCenterImgs().size();i++) { %>
                                            <a href="img/light01_s.jpg"><img src="img/light01.jpg" alt="이미지"></a>
                                            <%if(i%4==0&&i!=0){ %>
                                            	<br>
                                            <%} %>
							            <%} %>    
                                        </div>    
                                    </div>
                                </div>
                                <div class="button">펼쳐보기</div>    
                            </div>
                        </div>
                    
                        <div id="section3" class="container-fluid">
                            <div id="review-zone">
                                <div class="title-button">
                                    <div id="review-title"><h5>이용후기</h5></div>
                                    <div id="review-button">
                                        <button onclick="inputData();">후기 쓰기</button>
                                    </div>  
                                </div>    
                                <div id="review-content">
                                    <input type="text" id="content" placeholder="아직 작성된 후기가 없어요. 첫번째 후기를 남겨주세요." >
                                </div>
                                <script>
                                    function inputData(){
                                        var text=document.getElementById("content").value;
                                        document.getElementById("review-content").innerText+=text;
                                        alert(text);
                                    }
                                </script>
                            </div>
                        </div>

                        <div id="section4" class="container-fluid">
                            <div id="map-title"><h5>위치</h5></div>
                            <div id="map-api">지도api</div>
                        </div>

                    </div><!--bord-section-->
                    </div>    
                </div>
            </div><!--detail-window-->
        </div>
    </div>
    <!-- sectio끝 -->

	<script>
	
	$(function(){
		$(".btn-baguni").click(function(){
			location.href=<%=request.getContextPath()%>/baguni/baguniView.do?pCode=$('#pChoice option:selected').val();
		})
	})
	
	
			<%if(logginMember!=null){%>
			$(".fa-heart").parent().on("click",function(){
				var code = {ccode:$(this).parents(".jjim").find("input[type=hidden]").val()};
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
	</script>



<%@ include file="/views/common/footer.jsp"%>