<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.bbagym.model.vo.CenterDetail, com.bbagym.model.vo.CenterPrograms" %>
<%@ include file="/views/common/header.jsp"%>

<%@ page import="com.bbagym.model.vo.*, java.util.List" %>


<%
	CenterDetail cd = (CenterDetail)request.getAttribute("cd");
	List<Comment> comments = (List)request.getAttribute("comments");
	int cCode = (int)request.getAttribute("cCode");
	int mCode = (int)request.getAttribute("mCode");
	int score=1;
	int count=0;	
%>
	
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/centerViewDetail.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<!-- 카카오맵 API 불러오는 script -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=910ff98ddccfbc580e580a9ce7d7285d&libraries=services"></script>



<body data-spy="scroll" data-target=".navbar" data-offset="100"> <!--시설 이용후기등 메뉴바 클릭시 이동과 관련-->
<div class="page-header page-header-xs" data-parallax="true" style="background-image: url('<%=request.getContextPath()%>/upload/center/<%=cd.getCenterMainImg() %>');"></div>
<!-- section -->
    <div id="container">
        <div id="header-info">
            <div id="detail-header">
                <div id="all-info">
                	<br>
                    <div class="img-info">
                        <img src="<%=request.getContextPath()%>/upload/center/<%=cd.getCenterMainImg() %>" width="450" height="320">
                    </div>
                    <div class="text-info">
                        <div id="title"><h2 style="margin-right:auto;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><%=cd.getCenterName() %><strong></strong></h2>
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
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>평점</strong>
                        <div id="star-point" style="color: black;">
                        	<%for(;score<=cd.getCenterScore();score++){ %>
                            		<i class="fa fa-star"></i>&nbsp;&nbsp;
                            	<%} 
                            	if(score-cd.getCenterScore()<0.5){%>
                            		<i class="fa fa-star-half"></i>
                            	<%} score=1;%>
                            	<%=cd.getCenterScore()==0 ?  "<span style='color:grey; font-weight:lighter'>아직 등록된 평점이 없습니다  </span>" : cd.getCenterScore() %>
                        </div>

                        
        				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>센터 주소</strong><div id="address-phone"><p><%=cd.getCenterAddr() %></p></div>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>센터 전화번호</strong><div id="address-phone"><p>☎&nbsp<%=cd.getCenterPhone() %></p></div>
                        
                        
                        
                        <div id="choice" style="text-align:center;">옵션 선택<br>
                            <select class="custom-select" style="width:500px;" id="baguni">
					         		<%for(CenterPrograms cp : cd.getCenterPrograms()){  %>
						           		<option value="<%="c/"+cp.getpCode()+"/"+cp.getMonth()%>">프로그램명 : <%=cp.getpName() %> 가격 : <%=cp.getPrice() %>원 횟수: <%=cp.getMonth() %>달</option>
						            <%} %> 
							 </select>
							 <button id="baguni2" type="submit" class="btn btn-info" style="margin-top:20px" >장바구니에 담기</button> 

                        </div>

                    </div>
                </div>    
            </div><!--detail-header-->
            <br><br>
            <div id="detail-window">
                <div id="window-menu">
                    <ul class="nav nav-tabs nav-justified"><!--클릭시 메뉴바 태그 연결-->
                        <li class="nav-item">
                            <a class="nav-link" href="#section1"><h5><small>시설정보</small></h5></a>
                        </li>
                        <li class="nav-item">

                            <a class="nav-link" href="#section2"><h5><small>사진</h5></small></a>


                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#section3"><h5><small>이용후기</h5></small></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#section4"><h5><small>위치</h5></small></a>
                        </li>
                    </ul>
                </div>
                <div id="menu-sebu">
                    <div class="bord-section">
                        <div id="price" class="container-fluid">
	                    	<div id="price-title"><h5><b>센터소개</b></h5>
	                            <div id="notice">
	                                <p><%=cd.getCenterIntro() %></p>
	                            </div>
	                        </div> 
	                      <br><hr>
                            <div id="price-zone"> 
                               
                                <div id="price">                              
                                    <div class="price-title"><h5><b>가격정보</b></h5></div>
                                    
                                    
                                    
                                    <div id="price-buga">
										<%String preName1=(cd.getCenterPrograms().get(0)).getpName(); 
                                    	for(int i=0; i<cd.getCenterPrograms().size(); i++) {
                                    		CenterPrograms cp = cd.getCenterPrograms().get(i);
                                    	if(i==0||!preName1.equals(cp.getpName())) {
                                    			preName1=cp.getpName();%>

													<div style="display:flex; color: #17A2B8;justify-content:center;width:100px;height:50px;"><h5><b><%=cp.getpName() %></b></h5></div>
														<div >
														<table id="price_table" >
															<tr>
																<th></th>
	                                        				<%for(int j=0; j<cd.getCenterPrograms().size(); j++) { 
	                                        					CenterPrograms cp2 = cd.getCenterPrograms().get(j);
	                                        					if(preName1.equals(cp2.getpName())) {%>
																	<th><%=cp2.getMonth() %>개월</th>						
                                                				<%} 
                                        						}%>    
                                        				   	</tr>
                                        				   	<tr style="color: grey;">
                                        				   		<td>정상가</td>
                                        				   	<%for(int j=0; j<cd.getCenterPrograms().size(); j++) { 
	                                        					CenterPrograms cp2 = cd.getCenterPrograms().get(j);
	                                        					if(preName1.equals(cp2.getpName())) {%>
																	<td><%=(int)(cp2.getPrice()+(cp2.getPrice()*0.1)) %>원</td>						
                                                				<%} 
                                        						}%>
                                        				   	</tr>
                                        				   	<tr style="color:blue; font-size: 18px; font-weight: bolder;">
                                        				   		<td>BBAGYM 회원가</td>
                                        				   	<%for(int j=0; j<cd.getCenterPrograms().size(); j++) { 
	                                        					CenterPrograms cp2 = cd.getCenterPrograms().get(j);
	                                        					if(preName1.equals(cp2.getpName())) {%>
																	<td><b><%=cp2.getPrice() %>원</b></td>						
                                                				<%} 
                                        						}%>
                                        				   	</tr>

                                        				</table>                                   			
<br>
		                                        <%} 
		                                        }%>
                                        	</div>  
                                </div>
                            </div>
                           
                                <hr>
                                <div id="time-zone">
	                                <div id="time">
	                                    <div id="time-play"><h5><b>운영시간</b></h5></div>
	                                    <div id="time-con"> 
	                                       <%=cd.getCenterOpenHours() %><br><br>
	                                        [휴관일] <%=cd.getCenterHolidays() %>
	                                    </div>
	                                </div>
                            	</div>
                             	<hr>
                            <div id="program-zone">
                                <div id="program">
                                    <div class="program-title"><h5><b>시설</b></h5></div>
                                   <div class="program-sebu" style="color: rgb(146, 142, 142);">

                                        	<%for(int i=0; i<cd.getCenterFacilityNames().size(); i++){ %>
                                        		<%=cd.getCenterFacilityNames().get(i) %>&nbsp;&nbsp;
                                        	<%} %>

                                    </div>
                                </div>
                            </div>

						</div>
						<hr>
						<!--이미지구역-->
						<div id="section2" class="container-fluid">
							<div id="image-zone">
								<div id="image-title">
									<h5><b>사진</b></h5>
								</div>
								<div id="image-sebu">
									<div class="img">
										<div class="col-md-12 ml-auto mr-auto">
											<div id="demo" class="carousel slide" data-ride="carousel">
												<!-- Indicators -->
												<ul class="carousel-indicators">
												<%if(cd.getCenterImgs()!=null &&!cd.getCenterImgs().isEmpty()) { %>
													<li data-target="#demo" data-slide-to="0" class="active"></li>
												
												<%for(int i=1;i<cd.getCenterImgs().size();i++) { %>
													<li data-target="#demo" data-slide-to=i></li>
												<%}
												
												}%>
												</ul>
						
												<!-- The slideshow -->
												<div class="carousel-inner">
										<%if(cd.getCenterImgs()!=null &&!cd.getCenterImgs().isEmpty()) { %>
													<div class="carousel-item active">
														<img src="<%=request.getContextPath() %>/upload/center/<%=cd.getCenterImgs().get(0)%>" alt="centerImg1">
													</div>													
                                        	<% if(cd.getCenterImgs().size()>1){
                                        		for(int i=1;i<cd.getCenterImgs().size();i++) { %>
													<div class="carousel-item">
														<img src="<%=request.getContextPath() %>/upload/center/<%=cd.getCenterImgs().get(i)%>" alt="centerImg">
													</div>
												<%} 
											}%>
												</div>
						
												<!-- Left and right controls -->
												<a class="carousel-control-prev" href="#demo" data-slide="prev">
													<span class="carousel-control-prev-icon"></span>
												</a>
												<a class="carousel-control-next" href="#demo" data-slide="next">
													<span class="carousel-control-next-icon"></span>
												</a>
						
											</div>
                                        
                                        <%}else {%>
                                        	<h4>No image :-( </h4>
                                        <% }%>    
                                        </div>    
                                    </div>
                                </div>
                            </div>
                        </div>
                       <hr>
                        <div id="section4" class="container-fluid"> <br>

                            <div id="map-title"><h5><b>위치</b></h5></div>
                            <br>
                           	<div id="map-api" style="width:600px; height:400px;"></div>
                        </div>
                          
                        <div id="section3" class="container-fluid" style="height:auto;">
                            <hr><div id="review-zone">
                            	<div id="review-title"><h5>리뷰</h5></div>
                                <div class="title-button">
                                    <div id="review-title" style="text-align: initial"><h5 style="margin-top:8px">이용후기</h5></div>
                            <%if(logginMember!=null&&cd.isBuy()==true) {%>
								<div id="review-button">
                                        <button class="btn btn-primary enterComment" style="width:100px">후기 쓰기</button>
                                    </div>  
							<%}%>
                                </div>    
                                <div id="review-content">
                                	<div id="comment-container">
                                		<div class="comment-editor hidden">
	                                		 <%if(logginMember!=null&&cd.isBuy()==true) {%>
												<form action="<%=request.getContextPath()%>/center/commentInsert.do" method="post" id="comment-form">
													    <div>
													    	<label style="margin:0px">평점</label><br>
        													<input type="number" name="orderScore" id="orderScore" min="1" max="5" required>/5점
    													</div>
													<button type="submit" id="btn-insert" class="btn btn-primary">등록</button>
													<textarea name="commentContent" cols="88" rows="3" required></textarea>
														<div id="choice1">
															<select id="orderChoice" name="orderChoice" aria-placeholder="결제내역 선택" required>
																<option value="">결제내역 선택</option>
																<%boolean flag= false;
																for(int i=0; i<cd.getBuyInfo().size(); i++) {
																	BuyInfo bi = cd.getBuyInfo().get(i);
																	if(bi.getScore()==0) {
																	flag = true;%>
																	<option name="orderCode" value="<%=bi.getOrderCode()%>" data-meta="<%=bi.getpCode()%>" data-meta2="<%=bi.getMonth()%>"><%=bi.getpName()%>/<%=bi.getMonth() %>개월</option>

																<%}else {%>
																	
																<%}
																} 
																if(flag==false){%>
																	<option value="" disabled>선택 항목 없음</option>
																<%} %>
															</select>
														</div>
													<input type="hidden" name="commentWriter" value="<%=logginMember.getM_CODE()%>">
													<input type="hidden" name="centerCode" value="<%=cCode%>">
													<input type="hidden" name="memberName" value="<%=logginMember.getM_NAME()%>">
													<input type="hidden" name="level" value="1">
													<input type="hidden" name="commentRef" value="0">
												</form>
											<%}%>
										</div>
									<%if(comments!=null && !comments.isEmpty()) { %>
										<table id="tbl-comment">
											<!-- 뎃글 출력하기 -->
												<%for(Comment c : comments) {
												if(c.getCommentLevel()==1) {%>
												<tr class="level1">
													<td>
													<div id="star-point1" style="color: black;">
														<%for(int i=1;i<=c.getOrderScore();i++){%>
						                            		<i class="fa fa-star"></i>&nbsp;&nbsp;
						                            	<%}%>
						                             	 <%-- if(score-c.getOrderScore()<0.5){%>
						                            		<i class="fa fa-star-half"></i>
						                            	<%} score=1;%> --%>
						                            	<%=c.getOrderScore()==0 ?  "0" : c.getOrderScore() %>
						                        </div>
														<sub class="comment-writer" style="color: gray;"><%=c.getmId() %></sub>
														<input type="hidden" name="mCode" value="<%=c.getmCode()%>">
														<sub class="comment-date"><%=c.getCommentDate() %></sub>
														<sub class="program">구매 상품 : <%=c.getpName() %>/<%=c.getMonth() %>개월</sub>
														<input type="hidden" name="orderCode" value="<%=c.getOrderCode()%>">
														<br>
														<%=c.getCommentContent() %>
													</td>
													<td>
														<button class="btn-reply btn btn-primary" value="<%=c.getCommentCode()%>">등록</button>
													</td>
												</tr>
												<%} else {%>
												<tr class="level2">
													<td>
														<sub><%=c.getmId() %></sub>
														<sub><%=c.getCommentDate() %></sub>
														<br>
														<%=c.getCommentContent() %>
													</td>
													<td>
														
													</td>
												</tr>
												<%}
												}%>
										</table>
											<%} else {%>
	                                    <input type="text" id="content" placeholder="아직 작성된 후기가 없어요. 첫번째 후기를 남겨주세요." readonly>
	                                    	<%} %>
									</div>
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
			location.href="<%=request.getContextPath()%>/baguni/baguniView.do?pCode=$('#pChoice option:selected').val()";
		})
	});
	
	
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
			
	        $(".enterComment").click(function(){
	            $(".comment-editor").toggleClass("hidden")
	        })
			
	    	$(function(){
	    		$(".btn-reply").click(function(){
	    			if(<%=logginMember!=null%>) {
	    				const tr = $("<tr>");
	    				const td = $("<td>").css({
	    					"display":"none", "text-align":"left"
	    				}).attr("colspan",2);
	    				const form = $("<form>").attr({
	    					"action":"<%=request.getContextPath()%>/center/commentInsert.do", "method":"post"
	    				});
	    				const textarea = $("<textarea>").attr({"cols":"50","rows":"2","name":"commentContent", "id":"commentContent"});
	    				const button = $("<input>").attr({"type":"submit","value":"답글", "class":"btn btn-primary", "id":"btn-reply2"});
	    				const writer = $("<input>").attr({"type":"hidden","name":"commentWriter", "value":"<%=logginMember!=null?logginMember.getM_CODE():""%>"});
	    				const centerCode = $("<input>").attr({"type":"hidden","name":"centerCode", "value":"<%=cCode%>"});
	    				const level = $("<input>").attr({"type":"hidden","name":"level", "value":"2"});
	    				const commentRef = $("<input>").attr({"type":"hidden","name":"commentRef", "value":$(this).val()});
	    				const ordercode =$("<input>").attr({"type":"hidden","name":"orderChoice","value":$(this).parent().prev().find("input[name=orderCode]").val(), "data": $(this).parent().prev().find("input[name=orderCode]").data("meta"), "data": $(this).parent().prev().find("input[name=orderCode]").data("meta2")})
	    				form.append(textarea).append(button).append(writer).append(centerCode).append(level).append(commentRef).append(ordercode);
	    				td.append(form);
	    				tr.append(td);
	    				($(this).parent().parent()).after(tr);
	    				tr.children("td").slideDown(500);
	    				$(this).off("click");   /* off=>이벤트 삭제 */

	    			}
	    		});
	    	});
	        
	        
	        /* price comma추가하기 */
	        
        $(function () {
            let reg = new RegExp(/\d+/);

            $(".custom-select>option").each(function (i, item) {
                let a = $(item).text();
                console.log(reg.exec(a)[0]);
                $(item).html(a.replace(reg.exec(a)[0],reg.exec(a)[0].replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,")));  
                //text에 숫자만 받아오기 (여기서 정규표현식으로 comma추가해주기)
            })
        })

	        $("#baguni2").on("click",function(){
	      		
	      		var baguni =  {"baguni":$("#baguni").val()};
	      		
	      		console.log(baguni);
	      		
	      		$.ajax({
	      			url : "<%=request.getContextPath() %>/ShoppingBaguniServlet.do",
	      			data : baguni,
	      			success : function(data){
	      				alert("바구니 담기 성공!");
	      			},
	      			error : function(r,e,m){
	      				alert("바구니 담기 실패! 로그인을 확익해주세요");
	      			}
	      		})
	      		
	      	});

			//지도 출력
			var container = document.getElementById('map-api'),
			    options = {
			         center: new kakao.maps.LatLng(<%=cd.getAddrY()%>, <%=cd.getAddrX()%>),
			         level: 3
			    };
			 
			var map = new kakao.maps.Map(container, options);
			
			//지도 클릭한 위치에 표출할 마커 - 중앙에 마커 생성
			var marker = new kakao.maps.Marker({
				position: map.getCenter(),
				clickable: true
			});
			//마커가 지도 위에 표시되도록 설정
			marker.setMap(map);
	</script>



<%@ include file="/views/common/footer.jsp"%>
