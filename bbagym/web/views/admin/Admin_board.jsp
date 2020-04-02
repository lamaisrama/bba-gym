<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/admin/common/adminheader.jsp"%>
	 <!--게시글 확인-->
                    <div id="board-list">
                        <div style="display: flex; justify-content: space-between; align-items: center;width: 100%;">
                            <h1>게시글 확인</h1>
                            <div>
                            	게시글 유형<select value=""  style=" padding: .3em .5em;"><!-- 게시글 유형에 따라 처리 분기처리 (처음에 서블릿으로 오고 ajax처리가 편할듯?) -->
                                    <option selected>공지사항</option>
                                    <option>Q/A</option>
                                    <option>전체</option>
                                </select>    
                            	페이지수<select value=""  style=" padding: .3em .5em;"><!-- numPerpage -->
                                <option>10</option>
                                <option>20</option>
                                <option>30</option>
                            </select>
                            </div>
                        </div>
                        
                        <table>
                            <thead>
                            <tr>
                                <th>제목</th>
                                <th>글쓴이</th>
                                <th>작성일</th>
                                <th>파일</th>
                            </tr>
                            </thead>
                            
                            <tr><!-- for{ 페이징처리-->
                                <td><a href="#">빠짐 이용수칙</a></td>
                                <td>김범신</td>
                                <td>2020-04-02</td>
                                <td></td>
                            </tr><!-- }-->
                            
                        </table>
                        
                        <div id="pageBar"><!-- 페이지바 JSP구현-->
                            <div id="page"><!--현재 창 페이지는 밑에 스타일 적용 다른게 클릳되면 원래상태로-->
                                <span>처음</span><a href="#" style="color:blue; border: 1px solid rgb(0, 225, 255,0.2);">1</a><a href="#">2</a><a href="#">3</a><a href="#">4</a><a href="#">5</a><span>다음</span>
                            </div>
                            <div id="search">검색<input type="text"></div>
                        </div>
                        
                    </div>

</div> <!-- header에 section-view 아이디 div 닫아줌 -->
</section>
<%@ include file="/views/admin/common/adminfooter.jsp"%>