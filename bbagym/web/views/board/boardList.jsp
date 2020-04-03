<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>

<style>
    section#board-container{
    	margin:30px auto; text-align:center;
    }
</style>
    <div class="page-header page-header-xs" data-parallax="true" style="background-image: url('<%=request.getContextPath() %>/assets/img/fabio-mangione.jpg');"></div>
    <section id="board-container">
        <div class="container">

            <h1 class="display-4" style="text-align: center;">Q&A Board</h1>
            <br>
            <br>
            <!-- 검색 -->
            <div align="right">
                <label for="">SearchType:</label>
                <select id="">
                    <option>Category</option>
                    <option value="">Tip</option>
                    <option value="">Talk</option>
                </select>
                <input type="text" name="" id="">
                <button type="button" class="btn btn-sm btn-outline-secondary">search</button>
            </div>

            <!-- 게시판테이블 start -->
            <table class="table table-hover">
                <thead class="thead-light">
                    <tr>
                        <th scope="col">No</th>
                        <th scope="col">Category</th>
                        <th scope="col">Title</th>
                        <th scope="col">Writer</th>
                        <th scope="col">Date</th>
                        <th scope="col">rCount</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th scope="row">1</th>
                        <td>Tip</td>
                        <td>TitleTitleTitleTitleTitleTitle</td>
                        <td>Otto</td>
                        <td>31-03-20</td>
                        <td>0</td>
                    </tr>
                    <tr>
                        <th scope="row">2</th>
                        <td>Review</td>
                        <td>TitleTitleTitleTitleTitleTitleTitleTitle</td>
                        <td>Thornton</td>
                        <td>310320</td>
                        <td>0</td>
                    </tr>
                    <tr>
                        <th scope="row">3</th>
                        <td>Talk</td>
                        <td>TitleTitleTitleTitleTitleTitle</td>
                        <td>the Bird</td>
                        <td>310320</td>
                        <td>0</td>
                    </tr>
                    <tr>
                        <th scope="row">4</th>
                        <td>Tip</td>
                        <td>TitleTitleTitleTitleTitleTitleTitleTitle</td>
                        <td>the Bird</td>
                        <td>310320</td>
                        <td>0</td>
                    </tr>
                    <tr>
                        <th scope="row">5</th>
                        <td>Tip</td>
                        <td>TitleTitleTitleTitleTitleTitle</td>
                        <td>Otto</td>
                        <td>31-03-20</td>
                        <td>0</td>
                    </tr>
                </tbody>
            </table>
            <!-- 게시판테이블 end -->
            <!-- 글쓰기버튼 -->
            <div align="right"><button type="button" class="btn btn-sm btn-outline-secondary">Write</button></div>
            <br>
            <!-- 페이징 start -->
            <nav aria-label="Page navigation example">
                <ul class="pagination justify-content-center">
                <li class="page-item">
                    <a class="page-link" href="#" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item">
                    <a class="page-link" href="#" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
                </ul>
            </nav>
            <!-- 페이징 end -->
        </div>    
	</section>

<%@ include file="/views/common/footer.jsp"%>