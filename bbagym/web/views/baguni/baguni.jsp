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
        style="background-image: url('<%=request.getContextPath() %>/assets/img/fabio-mangione.jpg');"></div>
    
    
    <div class="d-flex flex-row title-container ">
        <div class="title p-2 w-10 h-100 text-wrap">
            카트
        </div>
    </div>
    
    <form action="<%=request.getContextPath()%>/mypage/payment.do" method="post">
    <div class="container-fluid" style="border: none;">
        <%if(centerlist==null){ %>
        <!-- 박스 --><%}else {for(Baguni ba : centerlist){ %>
        <div class="baguni d-flex flex-row">
            <div class="checkbox-cont">
                <input type="checkbox" name="checkbox" id="checkbox">
    
            </div>
            <div class="img-container d-flex flex-row">
                <img src="<%=request.getContextPath() %>/upload/center/<%=ba.getCmainimage() %>" alt="">
            </div>
            <div class="detail-container d-flex col">
                <div>
                    <div class="name-container d-flex align-items-start flex-row">
                        <div class="name-container2 flex-row d-flex">
                            <a href="" class="gym-name"><%=ba.getCname() %></a>
                        </div>
                    </div>
                </div>
                <div class="price-container">
                    <table class="table1">
                        <tr>
                            <th colspan="2"> <span class="program"><%=ba.getPname() %></span></th>
                        </tr>
                        <tr>
                            <td class="align-bottom" style="width: 200px;"><span class="months"><%=ba.getMonth() %></span>
                            </td>
                            <td class="align-bottom" colspan="2"><span class="price"><%=ba.getPrice() %></span></td>
                            <td class="align-bottom"><span class="won">원</span></td>
                        </tr>
                    </table>
                    <div>
                        <button type="button" class="btn btn-info delete">삭제</button>
                        <input type="hidden" id="info" name="centerList" value="<%=ba.getPcode()%>/<%=ba.getMonth()%>/">
                    </div>
                </div>
            </div>
        </div>
        <%} }%>
        <!-- 박스 -->
    
        <%if(trainerlist==null){ %>
        <!-- 박스 --><%} else{for(Baguni ba : trainerlist){ %>
        <div class="baguni d-flex flex-row">
            <div class="checkbox-cont">
                <input type="checkbox" name="checkbox" id="checkbox">
    
            </div>
            <div class="img-container d-flex flex-row">
                <img src="<%=request.getContextPath() %>/upload/center/<%=ba.getTmainimage() %>" alt="">
            </div>
            <div class="detail-container d-flex col">
                <div>
                    <div class="name-container d-flex align-items-start flex-row">
                        <div class="name-container2 flex-row d-flex">
                            <a href="" class="gym-name"><%=ba.getMname() %></a>
                        </div>
                    </div>
                </div>
                <div class="price-container">
                    <table class="table1">
                        <tr>
                            <th colspan="2"> <span class="program"><%=ba.getPname() %></span></th>
                        </tr>
                        <tr>
                            <td class="align-bottom" style="width: 200px;"><span class="months"><%=ba.getCount() %></span>
                            </td>
                            <td class="align-bottom" colspan="2"><span class="price"><%=ba.getPrice() %></span></td>
                            <td class="align-bottom"><span class="won">원</span></td>
                        </tr>
                    </table>
                    <div>
                        <button type="button" class="btn btn-info delete">삭제</button>
                        <input type="hidden" id="info" name="trainerList" value="<%=ba.getPcode()%>/<%=ba.getCount()%>">
                    </div>
                </div>
            </div>
        </div>
        <%}} %>
        <!-- 박스 -->
    
        <div class="total-price-container">
            <div class="desc-row">
                <span class="pricetitle" id="pricetitle1">상품 금액</span>
                <span class="total-price" id="total-price" style="float: right;"><%=total+(int)(total*0.1) %>
                    &nbsp;원</span>
            </div>
            <div class="desc-row">
                <span class="pricetitle" id="pricetitle2">다짐 회원 할인</span>
                <span class="sale-price" id="sale-price" style="float: right;"><%=(int)(-total*0.1) %> &nbsp;원</span>
            </div>
            <div class="desc-row">
                <span class="pricetitle" id=" pricetitle3">결제 예정 금액</span>
                <span class="new-price" id="new-price" style="float: right;"><%=total %> &nbsp;원</span>
            </div>
            <div id="button-container" class="d-flex flex-row">
                <button type="button" class="btn-center btn-more btn btn-primary btn-lg" routerlink="">더 돌아보기</button>
                <button type="button" class="btn-center btn-more btn btn-primary btn-lg" id="paymentBtn" routerlink="">결제하기</button>
            </div>
        </div>
    
    </div>
    </form>
    <script>
    //회원가입 시 생성된 가맹점 식별코드를 통해 결제 관련 IMP 변수를 초기화함--페이지 로딩 시 실행 필요
    	var IMP = window.IMP;
    	IMP.init('imp27157799');
    
        $(".month-container").removeClass("month-container-click");

        $(".month-container").on("click", function () {
            $(this).addClass("month-container-click");
            $(this).siblings().removeClass("month-container-click");

        });

        $(".close").on("click", function () {
            $(this).parent().parent().parent().remove();
        })

        $(".delete").on("click", function () {
            var value = $(this).next().val();
            location.replace("<%=request.getContextPath() %>/ShoppingBaguniDeleteServlet.do?value=" + value);
        })
        
        
	//결제버튼 클릭시 결제 API 실행
		$("#paymentBtn").on("click", function(){
			var totalPrice="<%=total%>";
			alert("totalPrice="+totalPrice);
            var userMail = "<%=logginMember.getM_EMAIL() %>";
            var userName = "<%=logginMember.getM_NAME() %>";
            var userTel = "<%=logginMember.getM_PHONE() %>";
            var userAddr = "<%=logginMember.getM_ADDRESS() %>";
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
                    var msg = '결제가 완료되었습니다.';
                    msg += '고유ID : ' + rsp.imp_uid;
                    msg += '상점 거래ID : ' + rsp.merchant_uid;
                    msg += '결제 금액 : ' + rsp.paid_amount;
                    msg += '카드 승인번호 : ' + rsp.apply_num;
                    alert('결제완료 메소드 실행');
    		        //submit();
                } else {
                    var msg = '결제에 실패하였습니다.';
                    msg += '에러내용 : ' + rsp.error_msg;
                }
            });
            
		});


    </script>   

<%@ include file="/views/common/footer.jsp"%>