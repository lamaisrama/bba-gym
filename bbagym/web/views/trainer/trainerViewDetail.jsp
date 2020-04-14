<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.bbagym.model.vo.TrainerDetail, com.bbagym.model.vo.TrainerProgram" %>
<%@ include file="/views/common/header.jsp"%>

<%
	TrainerDetail td = (TrainerDetail)request.getAttribute("td");
%>	

 <div class="page-header page-header-xs" data-parallax="true" style="background-image: url('<%=request.getContextPath()%>/upload/trainer/<%=td.getProf_img()%>');">
    <div class="filter"></div>
  </div>
  <div class="section profile-content">
    <div class="container">
      <div class="owner">
        <div class="avatar">
          <img src="<%=request.getContextPath()%>/assets/img/faces/joe-gardner-2.jpg" alt="Circle Image" class="img-circle img-no-padding img-responsive">
        </div>
        <div class="name">
          <h4 class="title"><%=td.getT_name() %>
            <br />
          </h4><%for(String s : td.gettProgramNames()){  %>
        	<h6><%=s %></h6>
          <%} %>
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
           <select class="custom-select" style="width:500px;">
         		<%for(TrainerProgram s : td.getTrainerPrograms()){  %>
	           		<option value="<%=s.getPcode() %>">프로그램명 : <%=s.getpName() %> 가격 : <%=s.getPrice() %>원 횟수: <%=s.getCount() %>회</option>
	            <%} %> 
		 </select>
		 <button type="submit" class="btn btn-info" style="margin-top:20px" >장바구니에 담기</button>
        </div>
      </div>
      <br/><br>
      <div class="nav-tabs-navigation">
        <div class="nav-tabs-wrapper">
          <ul class="nav nav-tabs" role="tablist">
            <li class="nav-item">
              <a class="nav-link active" data-toggle="tab" href="#follows" role="tab">트레이너정보</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" data-toggle="tab" href="#following" role="tab">상담하기</a>
            </li>
          </ul>
        </div>
      </div>
      <!-- Tab panes -->
      <div class="tab-content following">
        <div class="tab-pane active" id="follows" role="tabpanel">
          <div class="row">
          <% String preName=(td.getTrainerPrograms().get(0)).getpName();%>
            <div class="col-md-6 ml-auto mr-auto text-center">
              <%for(int i=0; i<td.getTrainerPrograms().size(); i++){
            	  TrainerProgram tp=td.getTrainerPrograms().get(i);
              	if(i==0||!preName.equals(tp.getpName())){
              		preName=tp.getpName();
              	%>
              		<h5><%=tp.getpName() %>
                	<br/>
                <small>
                <% 
                	for(int j=0;j<td.getTrainerPrograms().size();j++){
                		TrainerProgram tp2=td.getTrainerPrograms().get(j);
                		if(preName.equals(tp2.getpName())){%>
                		<del>정상가 <%=tp2.getCount()%>회 <%=(int)(tp2.getPrice()+(tp2.getPrice()*0.1))%>원</del><br>
                 	 빠짐회원가  <%=tp2.getCount()%>회  <%=tp2.getPrice() %>원<br><br>
                  	<%}
                	}%>
                </small>
              </h5>
              	<% }%>
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
                <small><a href="#"><%=td.getC_name() %></a></small>
              </h5>
            </div>  
          </div>
          <br><hr><br> 
          <div class="row">
            <div class="col-md-12 ml-auto mr-auto text-center">
              <h5>사진</h5>
              <br>
              <div class="row">
              <%for(int i=0; i<td.getT_img().size();i++) { %>
                  <div class="col-md-3"><a href="#" class="thumbnail"><img src="<%=request.getContextPath()%>/upload/trainer/<%=td.getT_img() %>" alt="Image" style="max-width:100%;"></a></div>
              <%} %>
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
          <hr>
         <%--  <div class="row">
            <div class="col-md-6 ml-auto mr-auto text-center">
              <h5>리뷰
                <br/>
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
													<textarea name="commentContent" cols="88" rows="3"></textarea>
														<div id="choice1">
															<select id="orderChoice" name="orderChoice" aria-placeholder="결제내역 선택" required>
																<option value="">결제내역 선택</option>
																<%for(int i=0; i<cd.getBuyInfo().size(); i++) {
																	BuyInfo bi = cd.getBuyInfo().get(i);{
																	if(bi.getScore()==0) {%>
																	<option name="orderCode" value="<%=bi.getOrderCode()%>" data-meta="<%=bi.getpCode()%>" data-meta2="<%=bi.getMonth()%>"><%=bi.getpName()%>/<%=bi.getMonth() %>개월</option>

																<%}else {%>
																	<option value="" disabled>선택 항목 없음</option>
																<%} break;
																	} 
																}%>
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
						                             	 if(score-c.getOrderScore()<0.5){%>
						                            		<i class="fa fa-star-half"></i>
						                            	<%} score=1;%>
						                            	<%=c.getOrderScore()==0 ?  "0" : c.getOrderScore() %>
						                        </div>
														<sub class="comment-writer"><%=c.getmId() %></sub>
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
	                                    <input type="text" id="content" placeholder="아직 작성된 후기가 없어요. 첫번째 후기를 남겨주세요." >
	                                    	<%} %>
									</div>
                                </div>
              </h5> --%>
          <!--   </div>  
          </div>

        </div>   -->

        <div class="tab-pane text-center" id="following" role="tabpanel">
          <h3 class="text-muted">트레이너상담연결뭐몰라ㅣ</h3>
          <button class="btn btn-warning btn-round">1:1 상담하기</button>
        </div>

      </div>
    </div>
  </div>
  

  <footer class="footer">
    <div class="container">
      <div class="row">
        <div class="credits ml-auto">
          <span class="copyright">
            ©
            <script>
              document.write(new Date().getFullYear())
            </script>, made with <i class="fa fa-heart heart"></i> by Creative 빠GYM
          </span>
        </div>
      </div>
    </div>
  </footer>

<%@ include file="/views/common/footer.jsp"%>