<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/views/common/header.jsp"%>

	<!-- fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap" rel="stylesheet">

    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.css" rel="stylesheet">
    <script src="<%=request.getContextPath()%>/core/js/jquery.min.js"></script>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">


    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
        integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

	<!-- CSS -->
	 <link href="<%=request.getContextPath() %>/css/baguni.css" rel="stylesheet" />
	 
<div class="page-header page-header-xs" data-parallax="true" style="background-image: url('<%=request.getContextPath() %>/assets/img/fabio-mangione.jpg');"></div>

 <div class="container-fluid">
        <div class="d-flex flex-row title-container ">
            <div class="title p-2 w-10 h-100 text-wrap">
                카트
            </div>
            <div class="sub-title p-2 text-wrap">회원권선택</div>

            <div class="p-2 count ml-auto">
                (<span class="count-2">2</span>개/최대3개)</div>
        </div>

    </div>
    <div class="container-fluid" style="border: none;">
        <div class="baguni d-flex flex-row">
            <div class="checkbox-cont">
                <input type="checkbox" name="checkbox" id="checkbox">

            </div>
            <div class="img-container d-flex flex-row">
                <img src="https://www.ambatel.com/RES/PRODUCT/201805/FITNESS2PC1216x608_20180504134633.png" alt="">
            </div>
            <div class="detail-container d-flex col">
                <div>
                    <div class="name-container d-flex align-items-start flex-row">
                        <div class="name-container2 flex-row d-flex">
                            <a href="" class="gym-name">선릉 보리스짐</a>
                        </div>
                    </div>
                    <div class="close">
                        <i class="fas fa-times fa-lg"></i>
                    </div>
                </div>
                <div class="price-container">

                    <table class="table1">
                        <tr>
                            <th colspan="2"> <span class="program">헬스 정원제</span></th>

                        </tr>
                        <tr>
                            <td class="align-bottom" style="width: 60px;"><span class="months">3개월</span></td>
                            <td class="align-bottom" colspan="2"><span class="price">150,000</span></td>
                            <td class="align-bottom"><span class="won">원</span></td>
                        </tr>
                    </table>
                    <div class="dropdown">
                        <button class="option-btn btn btn-primary dropdown-toggle" type="button" id="dropdownMenu2"
                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            옵션 변경
                        </button>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenu2" style="width: 200px;">
                            <button class="dropdown-item" type="button">헬스 정원제</button>
                            <button class="dropdown-item" type="button">헬스+G.X.</button>
                            <button class="dropdown-item" type="button">헬스</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="gym-search-container text1" onclick="location.href='https://www.da-gym.co.kr/dagym-list'">
            마음에 드는 운동시설을 더 추가해보세요.

            <span class="text2">함께 다닐수록 할인율이 올라가요!</span>
            <i class="fas fa-chevron-right" id="link-arrow"></i>
        </div>
        <div id="selectmonth-container">
            <h4 id="selectmonth-title">등록기간선택</h4>
            <div id="table-container" class="flex-row d-flex">
                <div class="month1 month-container month-container-click month-container-notclick"
                    style="border-top-left-radius: 5px; border-bottom-left-radius: 5px;">
                    <h4 id="month">1개월</h4>
                </div>
                <div class="month13 month-container month-container-click month-container-notclick ">
                    <h4 id="month3">3개월</h4>
                </div>
                <div class="month6 month-container month-container-click month-container-notclick ">
                    <h4 id="month6">6개월</h4>
                </div>
                <div class="month12 month-container month-container-click month-container-notclick "
                    style="border-top-right-radius: 5px; border-bottom-right-radius: 5px;">
                    <h4 id="month12">12개월</h4>
                </div>
            </div>
        </div>
        <div class="total-price-container">
            <div class="desc-row">
                <span class="pricetitle" id="pricetitle1">상품 금액</span>
                <span class="total-price" id="total-price" style="float: right;">231,000
                    &nbsp;원</span>
            </div>
            <div class="desc-row">
                <span class="pricetitle" id="pricetitle2">다짐 회원 할인</span>
                <span class="sale-price" id="sale-price" style="float: right;">-21,000 &nbsp;원</span>
            </div>
            <div class="desc-row">
                <span class="pricetitle" id=" pricetitle3">결제 예정 금액</span>
                <span class="new-price" id="new-price" style="float: right;">210,000 &nbsp;원</span>
            </div>
        </div>
        <div id="button-container" class="d-flex flex-row">
            <button class="btn-center btn-more btn btn-primary btn-lg" routerlink="">
                더 돌아보기
            </button>
            <button class="btn-center btn-pay btn btn-block btn-primary btn-lg">결제하기</button>
        </div>
    </div>
    
        <script>
        $(".month-container").removeClass("month-container-click");

        $(".month-container").on("click", function () {
            $(this).addClass("month-container-click");
            $(this).siblings().removeClass("month-container-click");

        });

        $(".close").on("click", function () {
            $(this).parent().parent().parent().remove();
        })

    </script>


<%@ include file="/views/common/footer.jsp"%>