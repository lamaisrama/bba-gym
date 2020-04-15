<%@page import="com.bbagym.model.vo.Baguni"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/views/common/header.jsp"%>

<%

	List<Baguni> centerlist = (List)request.getAttribute("centerlist");
	List<Baguni> trainerlist = (List)request.getAttribute("trainerlist");
	int total=0;
	if(!centerlist.isEmpty()){
		for(Baguni ba : centerlist){
			total += ba.getPrice();
		}
	}
	if(!centerlist.isEmpty()){
		for(Baguni ba : trainerlist){
			total += ba.getPrice();
		}
	}
	
%>


    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
        integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

	<!-- CSS -->
	 <link href="<%=request.getContextPath() %>/css/baguni.css" rel="stylesheet" />
	 
<div class="page-header page-header-xs" data-parallax="true" style="background-image: url('<%=request.getContextPath() %>/assets/img/fabio-mangione.jpg');"></div>


        <div class="d-flex flex-row title-container ">	
            <div class="title p-2 w-10 h-100 text-wrap">
             	   카트
            </div>
    </div>

    
    <div class="container-fluid" style="border: none;">
    		<%if(centerlist==null){ %>
    <!-- 박스 --><%}else {for(Baguni ba : centerlist){ %>
        <div class="baguni d-flex flex-row">
            <div class="checkbox-cont">
                <input type="checkbox" name="checkbox" id="checkbox">

            </div>
            <div class="img-container d-flex flex-row" >
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
                            <td class="align-bottom" style="width: 200px;"><span class="months"><%=ba.getMonth() %></span></td>
                            <td class="align-bottom" colspan="2"><span class="price"><%=ba.getPrice() %></span></td>
                            <td class="align-bottom"><span class="won">원</span></td>
                        </tr>
                    </table>
                    <div>
                    	<button type="button" class="btn btn-info delete" >삭제</button>
                    	<input type="hidden" id="info" value="c/<%=ba.getPcode()%>/<%=ba.getMonth()%>">
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
            <div class="img-container d-flex flex-row" >
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
                            <td class="align-bottom" style="width: 200px;"><span class="months"><%=ba.getCount() %></span></td>
                            <td class="align-bottom" colspan="2"><span class="price"><%=ba.getPrice() %></span></td>
                            <td class="align-bottom"><span class="won">원</span></td>
                        </tr>
                    </table>
                    <div>
                    	<button type="button" class="btn btn-info delete">삭제</button>
                       	<input type="hidden" id="info" value="t/<%=ba.getPcode()%>/<%=ba.getCount()%>">
                    </div>
                </div>
            </div>
        </div>
		<%}} %>
	    <!-- 박스 -->
       
	        <div class="total-price-container">
	            <div class="desc-row">
	                <span class="pricetitle" id="pricetitle1">상품 금액</span>
	                <span class="total-price" id="total-price" style="float: right;"><%=total+total*0.1 %>
	                    &nbsp;원</span>
	            </div>
	            <div class="desc-row">
	                <span class="pricetitle" id="pricetitle2">다짐 회원 할인</span>
	                <span class="sale-price" id="sale-price" style="float: right;"><%=-total*0.1 %> &nbsp;원</span>
	            </div>
	            <div class="desc-row">
	                <span class="pricetitle" id=" pricetitle3">결제 예정 금액</span>
	                <span class="new-price" id="new-price" style="float: right;"><%=total %> &nbsp;원</span>
	            </div>
		        <div id="button-container" class="d-flex flex-row">
		            <button class="btn-center btn-more btn btn-primary btn-lg" routerlink="">더 돌아보기</button>
		            <button class="btn-center btn-pay btn btn-block btn-primary btn-lg">결제하기</button>
		        </div>
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
        
       $(".delete").on("click",function(){
    	   var value = $(this).next().val();
    	   location.replace("<%=request.getContextPath() %>/ShoppingBaguniDeleteServlet.do?value="+value);
       })
       

    </script>

<%@ include file="/views/common/footer.jsp"%>