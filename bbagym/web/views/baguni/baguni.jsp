<%@page import="com.bbagym.model.vo.Baguni"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/views/common/header.jsp"%>
<!-- 아임포트(결제)라이브러리 -->

<%

	List<Baguni> centerlist = (List)request.getAttribute("centerlist");
	List<Baguni> trainerlist = (List)request.getAttribute("trainerlist");
	int total=0;
	if(centerlist!=null&&!centerlist.isEmpty()){
		for(Baguni ba : centerlist){
			total += ba.getPrice();
		}
	}
	if(trainerlist!=null&&!trainerlist.isEmpty()){
		for(Baguni ba : trainerlist){
			total += ba.getPrice();
		}
	}
	
%>


<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
    integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

<!-- CSS -->
<link href="<%=request.getContextPath() %>/css/baguni.css" rel="stylesheet" />
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>    

    <div class="page-header page-header-xs" data-parallax="true"
        style="background-image: url('<%=request.getContextPath() %>/assets/img/baguni.jpg');"></div>
    
    
    <div id="title">
        <h1>장바구니</h1>
    </div>
    
    <div id="pay">
	    <form action="<%=request.getContextPath()%>/mypage/payment.do" method="post" id="baguniForm">
			<div class="baguni">
			<table>
					<tr>
						<!-- <th><input type="checkbox" value="0" name="check" id="check_all" style="margin-left:20px;"></th> --><th colspan="2" style="text-align: center;">상품정보</th><th>상품금액</th>
					<tr>
	        <%if(centerlist==null){ %>
	        <!-- 박스 --><%}else {for(Baguni ba : centerlist){ %>
	        				<%-- <td>
	        					<input type="checkbox" name="check" class="select_subject" value="<%=ba.getPrice() %>"  style="margin-left:20px;">
	        				</td> --%>
							<td id="good-info" >
								<img class="img-container" src="<%=request.getContextPath() %>/upload/center/<%=ba.getCmainimage() %>" alt="">
							</td>
							<td>	
								<div class="content-container">
									<h6><%=ba.getCname() %></h6>
									<h3 ><%=ba.getPname() %></h3>
									<div>
										<h6><%=ba.getPrice() %>원</h6>
										<h6 style="text-decoration:line-through;color:blue;margin-left:5px;"><%=ba.getPrice()+(int)(ba.getPrice()*0.1)%></h6>										
									</div>
									<span class="months">이용 달수 : <%=ba.getMonth() %>달</span>
									<button type="button" class="btn btn-outline-light text-dark delete">x</button>
									<input type="hidden" id="info"  value="c/<%=ba.getPcode()%>/<%=ba.getMonth()%>">
	                        		<input type="hidden" id="info" name="centerList" value="<%=ba.getPcode()%>/<%=ba.getMonth()%>/">
								</div>
							</td>
							<td>
								<h6><%=ba.getPrice() %>원</h6>
							</td>
						<tr>
					</tr>
				
				

	        <%} }%>
	        
	        
	        <%if(trainerlist==null){ %>
	        <!-- 박스 --><%}else {for(Baguni ba : trainerlist){ %>
	        				<%-- <td>
	        					<input type="checkbox" name="check" class="select_subject" value="<%=ba.getPrice() %>" style="margin-left:20px;">
	        				</td> --%>
							<td id="good-info" >
								<img class="img-container" src="<%=request.getContextPath() %>/upload/center/<%=ba.getTmainimage() %>" alt="">
							</td>
							<td>	
								<div class="content-container">
									<h6><%=ba.getMname() %></h6>
									<h3 ><%=ba.getPname() %></h3>
									<div>
										<h6><%=ba.getPrice() %>원</h6>
										<h6 style="text-decoration:line-through;color:blue;margin-left:5px;"><%=ba.getPrice()+(int)(ba.getPrice()*0.1) %></h6>										
									</div>
									<span class="months">횟수 : <%=ba.getCount() %>회</span>
									<button type="button" class="btn btn-outline-light text-dark delete">x</button>
	                        		<input type="hidden" id="info"  value="t/<%=ba.getPcode()%>/<%=ba.getCount()%>">
	                        	<input type="hidden" id="info" name="trainerList" value="<%=ba.getPcode()%>/<%=ba.getCount()%>/">
								</div>
							</td>
							<td>
								<h6><%=ba.getPrice() %>원</h6>
							</td>
						<tr>
					</tr>
	        <%} }%>

	               </table>
			</div>

	    </form>
       
    </div>
    
    <!-- 버튼  -->
    	<br><br>
     	<div id="container">
            <div>
                <h6 id="oriprice">기본가 : <%=(int)(total*0.1+total) %>원  + </h6>
            </div>
            <div >
                <h6 style="color:blue" id="saleprice">할인가 : <%=(int)(total*0.1) %>원 = </h6>
            </div>
            <div>
                <h6 id="totalprice"><%=total %></h6>
                <input type="hidden" value="<%=total %>" id="totalprice2">
            </div>
   		 </div>
   		 
   		 <div id="button-container" class="d-flex flex-row">
                <button type="button" class="btn btn-dark" id="paymentBtn">결제하기</button>
         	</div>
    
    <%@ include file="/views/common/footer.jsp"%>
    
    <script>
    //회원가입 시 생성된 가맹점 식별코드를 통해 결제 관련 IMP 변수를 초기화함--페이지 로딩 시 실행 필요
    	var IMP = window.IMP;
    	var test=0;
    	IMP.init('imp27157799');
    	var check = document.getElementsByName("check");
    	
        $(".delete").on("click", function () {
            var value = $(this).next().val();
            location.replace("<%=request.getContextPath() %>/ShoppingBaguniDeleteServlet.do?value=" + value);
        })
        
     	  /*  $("#check_all").click(function(){
	        var chk = $(this).is(":checked");//.attr('checked');
	        if(chk){ $(".select_subject").prop('checked', true);
		        
		        $("input[name=check]:checked").each(function() {
	
					test += parseInt($(this).val());
	
				});
		        $("#oriprice").html("기본가 : "+(test+test*0.1)+"원 + ")
		        $("#saleprice").html("할인가 : -"+test*0.1+"원= ")
		        $("#totalprice").html(test+"원");
	        	$("#totalprice2").attr("value",test);
	        } else { $(".select_subject").prop('checked', false)
	        	$("#oriprice").html("기본가 : 0원 + ")
		        $("#saleprice").html("할인가 : -0원= ")
	        	 $("#totalprice").html(" 0원");
	        	$("#totalprice2").attr("value",0);
	        	test=0;
	        };
	        
	       
	    });
        
        $(".select_subject").on("click",function(){
        	
        	test=0;
	        
	        $("input[name=check]:checked").each(function() {

				test += parseInt($(this).val());

			});
	        
	        $("#oriprice").html("기본가 : "+(test+test*0.1)+"원 + ")
	        $("#saleprice").html("할인가 : -"+test*0.1+"원= ")
	        $("#totalprice").html(test+"원");
	        $("#totalprice2").attr("value",test);
        });
    	 */


        	
        	//결제버튼 클릭시 결제 API 실행
    		$("#paymentBtn").on("click", function(){
			var totalPrice=$("#totalprice2").val();
			alert("totalPrice="+totalPrice);
            var userMail = "<%=logginMember.getM_EMAIL() %>";
            var userName = "<%=logginMember.getM_NAME() %>";
            var userTel = "<%=logginMember.getM_PHONE() %>";
            var userAddr = "<%=logginMember.getM_ADDRESS() %>";
              /* $("#baguniForm").submit();   */
               IMP.request_pay({
                pg: 'html5_inicis', // version 1.1.0부터 지원.
                pay_method: 'card',
                merchant_uid: 'merchant_' + new Date().getTime(),
                name: '빠짐:회원권 결제',
                amount: totalPrice,
                buyer_email: userMail,
                buyer_name: userName,
                buyer_tel: userTel,
                buyer_addr: userAddr
            }, function (rsp) { //callback 함수
                if (rsp.success) {
                    $("#baguniForm").submit();
                } else {
                    var msg = '결제에 실패하였습니다.';
                    msg += '에러내용 : ' + rsp.error_msg;
                    alert(msg);
                } 
             });   
            
		});
    	 
 		$(function () {
            let reg = new RegExp(/\d{4,}/);

            $(".content-container>div>h6").each(function (i, item) {
                let a = $(item).text();
                console.log(reg.exec(a)[0]);
                $(item).html(a.replace(reg.exec(a)[0],reg.exec(a)[0].replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,")));  
                //text에 숫자만 받아오기 (여기서 정규표현식으로 comma추가해주기)
            })
        })
        
        $(function () {
            let reg = new RegExp(/\d{4,}/);

            $("table>tbody>tr>td>h6").each(function (i, item) {
                let a = $(item).text();
                console.log(reg.exec(a)[0]);
                $(item).html(a.replace(reg.exec(a)[0],reg.exec(a)[0].replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,")));  
                //text에 숫자만 받아오기 (여기서 정규표현식으로 comma추가해주기)
            })
        })
        
        $(function () {
            let reg = new RegExp(/\d{4,}/);
            $("#container>div>h6").each(function (i, item) {
                let a = $(item).text();
                $(item).html(a.replace(reg.exec(a)[0],reg.exec(a)[0].replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,")));  
            })
        })


    </script>   

