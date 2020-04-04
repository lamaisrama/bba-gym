<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/sectionTrainer.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">


<div class="page-header page-header-xs" data-parallax="true" style="background-image: url('<%=request.getContextPath()%>/assets/img/fabio-mangione.jpg');"></div>
<section>   


            <div id="box-search-outline">
                <div>
                 	<label for="search">Search</label>
				    <div id="box-search-inline">
				        <select class="custom-select" id="search-type">
				            <option value="total" selected>전체</option>
				            <option value="userId">이름</option>
				            <option value="center">소속</option>
				            <option value="category">종목</option>
				        </select>
				        <input type="text" class="form-control" id="searchKeyword" placeholder="트레이너의 소속,이름,종목을 입력해주세요">
				    </div>
                </div>
            </div>
            <!--  -->
            <script>
            	$("#searchKeyword").keydown(function(key){
            		if(key.keyCode==13){
            		var type=$("#search-type").find(":selected").val()
            		var searchKeyword=$("#searchKeyword").val()
				
            		location.replace("<%=request.getContextPath() %>/trainer/trainerFind.do?type="+type+"&searchKeyword="+searchKeyword);
            		
            		}
            	});
            </script>
           
            <div id="box-board">
                <!-- for(List a : list){-->
                <!-- if(num%3=0){-->
                <div class="box" style="padding-bottom: 40px;">
                <!-- }-->

                    <div class="content-box-outer" >
                        <div class="content-box-inner" style="background-image: url('https://i.ytimg.com/vi/RMeXxJ3Y2KI/maxresdefault.jpg');"><!-- 이미지처리-->
                            <div class="bar"></div>
                            <div class="content-box-cotent">
                                <table >
                                    <tr>
                                        <td>이름 : 김범신</td>
                                    </tr>
                                    <tr>
                                        <td>소속 : KH정보교육</td>
                                   </tr>
                                    <tr>
                                        <td>주소 : 강남구</td>
                                    </tr>
                                    <tr>
                                        <td><span class="badge badge-info">헬스</span>&nbsp;&nbsp;<span class="badge badge-info">G.X</span></td>
                                    </tr>
                                </table>
                            </div>
                        </div>  
                    </div> <!-- content-box-outer-->


                    <div class="content-box-outer">
                        <div class="content-box-inner">
                            <div class="bar"></div>
                            <div class="content-box-cotent">
                                <table >
                                    <tr>
                                        <td>이름 : 김범신</td>
                                    </tr>
                                    <tr>
                                        <td>소속 : KH정보교육</td>
                                    </tr>
                                    <tr>
                                        <td>주소 : 강남구</td>
                                    </tr>
                                    <tr>
                                        <td><span class="badge badge-info">헬스</span>&nbsp;&nbsp;<span class="badge badge-info">G.X</span></td>
                                    </tr>
                                </table>
                            </div>
                        </div>  
                    </div> <!-- content-box-outer-->


                    <div class="content-box-outer">
                        <div class="content-box-inner">
                            <div class="bar"></div>
                            <div class="content-box-cotent">
                                <table >
                                    <tr>
                                        <td>이름 : 김범신</td>
                                    </tr>
                                    <tr>
                                        <td>소속 : KH정보교육</td>
                                    </tr>
                                    <tr>
                                        <td>주소 : 강남구</td>
                                    </tr>
                                    <tr>
                                        <td><span class="badge badge-info">헬스</span>&nbsp;&nbsp;<span class="badge badge-info">G.X</span></td>
                                    </tr>
                                </table>
                            </div>
                        </div>  
                    </div> <!-- content-box-outer-->
                
                <!-- if(num%3=0){-->    
                </div><!-- container -->
                <!-- }-->
                <!-- }-->
                
        </div>

        
        <div id="pageBar"><!-- 페이지바 JSP구현-->
            <div >
                <ul class="pagination">
                    <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">Next</a></li>
                  </ul>
            </div>
        </div>

</section>

<%@ include file="/views/common/footer.jsp"%>