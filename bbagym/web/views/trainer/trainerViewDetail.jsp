<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.bbagym.model.vo.*, java.util.List" %>
<%@ include file="/views/common/header.jsp"%>

<%
	TrainerDetail td = (TrainerDetail)request.getAttribute("td");
	List<Comment> comments = (List)request.getAttribute("comments");
	int tCode = (int)request.getAttribute("tCode");
	int mCode = (int)request.getAttribute("mCode");
	int score=1;
	int count=0;
%>	
	
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/trainerViewDetail.css">

 <div class="page-header page-header-xs" data-parallax="true" style="background-image: url('<%=request.getContextPath()%>/upload/trainer/<%=td.getProf_img()%>');">
    <div class="filter"></div>
  </div>
  <div class="section profile-content">
    <div class="container">
      <div class="owner">
        <div class="avatar">
          <img src="<%=request.getContextPath()%>/upload/trainer/<%=td.getProf_img() %>" alt="Circle Image" class="img-circle img-no-padding img-responsive">
        </div>
        <div class="name">
          <h4 class="title"><%=td.getT_name() %></h4>
            <br />
<%--           </h4><%for(String s : td.gettProgramNames()){  %>
        	<h6><%=s %></h6>
          <%} %> --%>
        </div>
      </div>
      <div class="row">	
        <div class="col-md-6 ml-auto mr-auto text-center">
          <p>
           <br><br>
            <strong>전화번호</strong>&nbsp;&nbsp;<%=td.getM_phone_2() %> <br>
            <strong>근무지</strong>&nbsp;&nbsp; <%=td.getC_name() %><br>
            <%=td.getM_address_2() %>
          </p>
          <br />
           <select class="custom-select" style="width:500px;" id="baguni">
         		<%if(td.getTrainerPrograms()!=null && !td.getTrainerPrograms().isEmpty()) {
         		for(TrainerProgram s : td.getTrainerPrograms()){  %>
	           		<option value="<%="t/"+s.getPcode()+"/"+s.getCount()%>">프로그램명 : <%=s.getpName() %> 가격 : <%=s.getPrice() %>원 횟수: <%=s.getCount() %>회</option>
	            <%} 
	            }else {%>
	            	<option value=""  selected disabled>선택 항목 없음</option>
	            <%} %> 
		 </select>
		 <button id="baguni2" type="submit" class="btn btn-info" style="margin-top:20px" >장바구니에 담기</button>
        </div>
      </div>
      <br/><br>
      <div class="nav-tabs-navigation">
        <div class="nav-tabs-wrapper">
          <ul class="nav nav-tabs" role="tablist">
            <li class="nav-item">
              <a class="nav-link active" data-toggle="tab" href="#follows" role="tab">트레이너정보</a>
            </li>
          </ul>
        </div>
      </div>
      <!-- Tab panes -->
      <div class="tab-content following">
        <div class="tab-pane active" id="follows" role="tabpanel">
          <div class="row">
          <% if(td.getTrainerPrograms()!=null && !td.getTrainerPrograms().isEmpty()) { 
          String preName=(td.getTrainerPrograms().get(0)).getpName();%>
            <div class="col-md-6 ml-auto mr-auto text-center" >
              <%
              for(int i=0; i<td.getTrainerPrograms().size(); i++){
            	  TrainerProgram tp=td.getTrainerPrograms().get(i);
              	if(i==0||!preName.equals(tp.getpName())){
              		preName=tp.getpName();
              	%>
              		<h5><%=tp.getpName() %>
                	<br/>
                <small id="program-price">
                <% 
                	for(int j=0;j<td.getTrainerPrograms().size();j++){
                		TrainerProgram tp2=td.getTrainerPrograms().get(j);
                		if(preName.equals(tp2.getpName())){%>
                		<del>정상가 <%=tp2.getCount()%>회 <%=(int)(tp2.getPrice()+(tp2.getPrice()*0.1))%>원</del><br>
                 	 <small style="color: #9A9A9A; line-height: 1.5em; font-size: 100%; font-weight: 400;">빠짐회원가  <%=tp2.getCount()%>회  <%=tp2.getPrice() %>원</small><br><br>
                  	<%}
                	}%>
                </small>
              </h5>
              	<% }%>
              <%} 
              } else {%>
              		<h3 style="margin-left: auto; margin-right:auto; margin-top:10px;">현재 프로그램이 없습니다.</h3>
              <%} %>
            </div>
          </div>
          <br><hr><br>
          <div class="row">
            <div class="col-md-6 ml-auto mr-auto text-center">
              <h5>트레이너소개
                <br/>
                <small>
                  <%=td.getT_text() %>
                </small>
              </h5>
            </div>
          </div>
          <br><hr><br>
          <div class="row">
            <div class="col-md-6 ml-auto mr-auto text-center">
              <h5>자격 및 경력사항
                <br/>
                <small><%=td.getT_career() %></small>
              </h5>
            </div>
          </div>
          <br><hr><br>
          <div class="row">
            <div class="col-md-6 ml-auto mr-auto text-center">
              <h5>상담 가능 시간
                <br/>
                <small><%=td.getT_counsel_hours() %></small>
              </h5>
            </div>
          </div>
          <br><hr><br> 
          <div class="row">
            <div class="col-md-6 ml-auto mr-auto text-center">
              <h5>소속
                <br/>
                <small><a href="<%=request.getContextPath()%>/center/centerDetail.do?cCode=<%=td.getcCode()%>"><%=td.getC_name() %></a></small>
              </h5>
            </div>  
          </div>
          <br><hr><br> 
          <div id="section2" class="container-fluid">
			<div id="image-zone">
              <div id="image-title">
              	<h5><b>사진</b></h5>
              </div>
              <br>
	       <div id="image-sebu">
			<div class="img">
				<div class="col-md-12 ml-auto mr-auto">
					<div id="demo" class="carousel slide" data-ride="carousel">
						<!-- Indicators -->
						<ul class="carousel-indicators">
							<li data-target="#demo" data-slide-to="0" class="active"></li>
							<li data-target="#demo" data-slide-to="1"></li>
							<li data-target="#demo" data-slide-to="2"></li>
						</ul>
	
						<!-- The slideshow -->
						<div class="carousel-inner">
				<%if(td.getT_img()!=null &&!td.getT_img().isEmpty()) { 
					
				%>
							<div class="carousel-item active">
								<img src="<%=request.getContextPath() %>/upload/trainer/<%=td.getT_img().get(0)%>" alt="centerImg1" style="max-width:500px; min-width:500px; min-height: 650px;">
							</div>													
                           	<% if(td.getT_img().size()>1){
                           		for(int i=1;i<td.getT_img().size();i++) { %>
							<div class="carousel-item">
								<img src="<%=request.getContextPath() %>/upload/trainer/<%=td.getT_img().get(i)%>" alt="centerImg" style="max-width:500px; min-width:500px; min-height: 650px;">
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
	                                 	<input type="text" id="content" placeholder="등록된 사진이 없습니다." >
	                                 <% }%>    
	                                 </div>    
	                             </div>
	                         </div>
              <%-- <div class="row">
              <%for(int i=0; i<td.getT_img().size();i++) { %>
                  <div class="col-md-3"><a href="#" class="thumbnail"><img src="<%=request.getContextPath()%>/upload/trainer/<%=td.getT_img() %>" alt="Image" style="max-width:100%;"></a></div>
              <%} %> --%>
              </div>
            </div>
          </div>
          <br><br><br>
          <hr>
          <div class="row">
            <div class="col-md-6 ml-auto mr-auto text-center">
              <h5>소셜미디어
                <br/>
                <%if(td.getSns_instagram()!=null) { %>
                <small><a href="<%=td.getSns_instagram()%>"><img src="<%=request.getContextPath() %>/assets/img/instagramlogo1.png" style="height: 52.5px;">인스타그램</a></small>
				<%}%>
                  <%if(td.getSns_homepage()!=null) { %>
                <small><a href="<%=td.getSns_homepage() %>"><img src="<%=request.getContextPath() %>/assets/img/homebutton1.png" style="height: 52.5px">홈페이지</a></small>
 				<%}%>
                <%if(td.getSns_blog()!=null) { %>
                <small><a href="<%=td.getSns_blog() %>"><img src="<%=request.getContextPath() %>/assets/img/blogicon1.jpg" style="height: 52.5px">블로그</a></small>
                 <%}%>
                <%if(td.getSns_etc()!=null) { %>
                <small><a href="<%=td.getSns_etc() %>"><img src="<%=request.getContextPath() %>/assets/img/othericon1.jpg" style="height: 52.5px">기타</a></small>
                 <%} %> 
               
       
              </h5>
            </div>  
          </div>
          <br/>
          <br/>
           <div class="row">
            <div class="col-md ml-auto mr-auto text-center">
            <hr><div id="review-zone">
              <div id="review-title"><h5>리뷰</h5></div>
                <div class="title-button">
                <div id="review-title" style="text-align: initial"><!-- <h5 style="margin-top:8px">이용후기</h5> --></div>
					<%if(logginMember!=null&&td.isBuy()==true) {%>
								<div id="review-button">
                                        <button class="btn btn-primary enterComment" style="width:100px">후기 쓰기</button>
                                    </div>  
							<%}%>
							</div>
                                <div id="review-content">
                                	<div id="comment-container">
                                		<div class="comment-editor hidden">
	                                		 <%if(logginMember!=null&&td.isBuy()==true) {%>
												<form action="<%=request.getContextPath()%>/trainer/commentInsert.do" method="post" id="comment-form">
													    <div>
													    	<label style="margin:0px">평점</label><br>
        													<input type="number" name="orderScore" id="orderScore" min="1" max="5" required>/5점
    													</div>
													<button type="submit" id="btn-insert" class="btn btn-primary">등록</button>
													<textarea name="commentContent" cols="88" rows="3" required style="width:80%"></textarea>
														<div id="choice1">
															<select id="orderChoice" name="orderChoice" aria-placeholder="결제내역 선택" required>
																<option value="">결제내역 선택</option>
																<%boolean flag=false;
																for(int i=0; i<td.getBuyInfo().size(); i++) {
																	BuyInfo bi = td.getBuyInfo().get(i);
																	if(bi.getScore()==0) {
																	flag = true;%>
																	<option name="orderCode" value="<%=bi.getOrderCode()%>" data-meta="<%=bi.getpCode()%>" data-meta2="<%=bi.getCount()%>"><%=bi.getpName()%>/<%=bi.getCount() %>회</option>

																<%}else {%>
																	
																<%} 
																} System.out.println("flag: "+flag);
																if(flag==false){%>
																	<option value="" disabled>선택 항목 없음</option>
																<%} %>
															</select>
														</div>
													<input type="hidden" name="commentWriter" value="<%=logginMember.getM_CODE()%>">
													<input type="hidden" name="trainerCode" value="<%=tCode%>">
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
														<sub class="comment-writer"><%=c.getmId() %></sub>
														<input type="hidden" name="mCode" value="<%=c.getmCode()%>">
														<sub class="comment-date"><%=c.getCommentDate() %></sub>
														<sub class="program">구매 상품 : <%=c.getpName() %>/<%=c.getCount() %>개월</sub>
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
                                </div>
				            </div>  
						</div>    
					</div>
				 </div> 
      </div>
    </div>
  </div>

  
  <script>
  
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
					"action":"<%=request.getContextPath()%>/trainer/commentInsert.do", "method":"post"
				});
				const textarea = $("<textarea>").attr({"cols":"50","rows":"2","name":"commentContent", "id":"commentContent"});
				const button = $("<input>").attr({"type":"submit","value":"답글", "class":"btn btn-primary", "id":"btn-reply2"});
				const writer = $("<input>").attr({"type":"hidden","name":"commentWriter", "value":"<%=logginMember!=null?logginMember.getM_CODE():""%>"});
				const trainerCode = $("<input>").attr({"type":"hidden","name":"trainerCode", "value":"<%=tCode%>"});
				const level = $("<input>").attr({"type":"hidden","name":"level", "value":"2"});
				const commentRef = $("<input>").attr({"type":"hidden","name":"commentRef", "value":$(this).val()});
				const ordercode =$("<input>").attr({"type":"hidden","name":"orderChoice","value":$(this).parent().prev().find("input[name=orderCode]").val(), "data": $(this).parent().prev().find("input[name=orderCode]").data("meta"), "data": $(this).parent().prev().find("input[name=orderCode]").data("meta2")})
				form.append(textarea).append(button).append(writer).append(trainerCode).append(level).append(commentRef).append(ordercode);
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
	          /* console.log(reg.exec(a)[0]); */
	          $(item).html(a.replace(reg.exec(a)[0],reg.exec(a)[0].replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,")));  
	          //text에 숫자만 받아오기 (여기서 정규표현식으로 comma추가해주기)
	      });
	      
	  })
	  
	  $(function () {  
	            let reg1 = new RegExp(/\d{4,}/);
	           $("#program-price>small").each(function (i,item) {
	        	   let a = $(item).text();
	                console.log(reg1.exec(a)[0]);
	                $(item).html(a.replace(reg1.exec(a)[0], reg1.exec(a)[0].replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,")));
	          		/* console.log($(item).html(a.replace(reg1.exec(a)[0],reg1.exec(a)[0].replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,")))); */

	            })
	          //text에 숫자만 받아오기 (여기서 정규표현식으로 comma추가해주기)
	      })
	  
	  	  $(function () {  
	  	      let reg1 = new RegExp(/\d{4,}/);
	      $("#program-price>del").each(function (i, item) {
              let a = $(item).text();
              /* console.log(reg1.exec(a)[0]); */
	          $(item).html(a.replace(reg1.exec(a)[0],reg1.exec(a)[0].replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,")));  
	          //text에 숫자만 받아오기 (여기서 정규표현식으로 comma추가해주기)
	      })
	  })
	 	
  </script>
  

<%@ include file="/views/common/footer.jsp"%>