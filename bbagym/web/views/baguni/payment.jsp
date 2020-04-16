<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<!-- 아임포트(결제)라이브러리 -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>

<table>
	<tr>
		<th>
			프로그램명<input type="text" id="program">
			가격 <input type="text" id="totalPrice">
			이메일 <input type="text" id="email">
			
		</th>
		<th></th>
	</tr>
</table>
<div id="totalamount">2000000</div>
<button>구매</button>

<script>

	//회원가입 시 생성된 가맹점 식별코드를 통해 IMP 변수를 초기화함
	var IMP = window.IMP;
	IMP.init('imp27157799'); 

	$("button").on("click",function(){
		var totalPrice = $("#totalPrice").val();
		var userMail = $("#email").val();
		var userName= $("#userName").val();
		var userTel=$("#userTel").val();
		var userAddr=$("#userAddr").val();
		IMP.request_pay({
	    pg : 'html5_inicis', // version 1.1.0부터 지원.
	    pay_method : 'card',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : userMail,
	    amount : totalPrice,
	    buyer_email : userMail,
	    buyer_name : '구매자이름',
	    buyer_tel : '010-1234-5678',
	    buyer_addr : '서울특별시 강남구 삼성동',
		}, function(rsp) { //callback 함수
		    if ( rsp.success ) {
		        var msg = '결제가 완료되었습니다.';
		        msg += '고유ID : ' + rsp.imp_uid;
		        msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
				msg += '카드 승인번호 : ' + rsp.apply_num;
				alert('결제완료 메소드 실행');

		        
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		    }
		    alert(msg);
		});
	})

	function insertPaymentResult(){
		alert('이쪽으로 넘어옴');
	//C_OERDER_HISTORY
		//order_code - sequence로 생성
		//orderday - sysdate
		//order_expire_date systdate+month
		// *month - 넘겨받아야 함
		// *p_code - 넘겨받아야 함
		// *m_name - logginMember.getMcode();
		// score = 0
	//T_ORDER_HISTORY
		//order_code - sequence로 생성
		//order day - systdaye
		// *p_ code - 넘겨받아야
		// *m_ code - loggimMember.getMcode();
		// *count  - 넘겨받아야
	}
	
</script>


<%@ include file="/views/common/footer.jsp"%>