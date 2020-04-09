<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.bbagym.model.vo.TrainerDetail, com.bbagym.model.vo.TrainerProgram" %>
<%@ include file="/views/common/header.jsp"%>

<%
	TrainerDetail td = (TrainerDetail)request.getAttribute("td");
%>	

 <div class="page-header page-header-xs" data-parallax="true" style="background-image: url('<%=request.getContextPath()%>/assets/img/fabio-mangione.jpg');">
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
          </h4>
          <h6 class="description">manager</h6>
        </div>
      </div>
      <div class="row">
        <div class="col-md-6 ml-auto mr-auto text-center">
          <p>
            	<%=td.getT_intro() %><br><br>
            <strong>전화번호</strong>&nbsp;&nbsp;<%=td.getM_phone_2() %> <br>
            <strong>근무지</strong>&nbsp;&nbsp; <%=td.getC_name() %><br>
            <%=td.getM_address_2() %>
          </p>
          <br />
          <btn class="btn btn-outline-default btn-round">Personal Training</btn>
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
                  <div class="col-md-3"><a href="#" class="thumbnail"><img src="http://placehold.it/200x200" alt="Image" style="max-width:100%;"></a></div>
              <%} %>
                  <!-- <div class="col-md-3"><a href="#" class="thumbnail"><img src="http://placehold.it/200x200" alt="Image" style="max-width:100%;"></a></div>
                  <div class="col-md-3"><a href="#" class="thumbnail"><img src="http://placehold.it/200x200" alt="Image" style="max-width:100%;"></a></div>
                  <div class="col-md-3"><a href="#" class="thumbnail"><img src="http://placehold.it/200x200" alt="Image" style="max-width:100%;"></a></div> -->
              </div>
            </div>
          </div>
          <br><br><br>
          <hr>
          <div class="row">
            <div class="col-md-6 ml-auto mr-auto text-center">
              <h5 style="width:600px;">소셜미디어
                <br/>
                <%if(td.getSns_instagram()!=null) { %>
                <small><a href="https://www.instagram.com"><img src="<%=request.getContextPath() %>/assets/img/instagramlogo1.png" style="height: 52.5px;">인스타그램</a></small>
				<%}else { %>
                <small></small>
                <%} %>
                  <%if(td.getSns_homepage()!=null) { %>
                <small><a href="https://www.instagram.com"><img src="<%=request.getContextPath() %>/assets/img/homebutton1.png" style="height: 52.5px">홈페이지</a></small>
 				<%}else { %>
                <small></small>
                 <%} %>
                <%if(td.getSns_blog()!=null) { %>
                <small><a href="https://www.instagram.com"><img src="<%=request.getContextPath() %>/assets/img/blogicon1.jpg" style="height: 52.5px">블로그</a></small>
                 <%}else { %> 
                 <small></small>
                 <%} %>
                <%if(td.getSns_etc()!=null) { %>
                <small><a href="https://www.instagram.com"><img src="<%=request.getContextPath() %>/assets/img/othericon1.jpg" style="height: 52.5px">기타</a></small>
                 <%}else { %> 
                 <small></small>
                 <%} %> 
              </h5>
            </div>  
          </div>

        </div>  

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