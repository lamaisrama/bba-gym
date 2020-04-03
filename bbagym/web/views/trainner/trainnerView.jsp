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


            <div class="box" id="box-search">
                <div>
                    <div class="input-group">
                        <div class="input-group-prepend">
                        <button type="button" class="btn btn btn-warning dropdown-toggle" data-toggle="dropdown">
                            전체
                        </button>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="#">이름</a>
                            <a class="dropdown-item" href="#">소속</a>
                            <a class="dropdown-item" href="#">종목</a>
                        </div>
                        </div>
                        <input type="text" class="form-control " placeholder="트레이너의 소속,이름,종목을 입력해주세요">
                    </div>
                </div>
            </div>

           
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