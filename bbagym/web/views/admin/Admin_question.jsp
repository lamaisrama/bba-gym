<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/admin/common/adminheader.jsp"%>
	 <!--문의 확인-->
                    <div id="question-list">
                        <div style="display: flex; justify-content: space-between; align-items: center;width: 100%;">
                            <h1>문의 확인</h1>
                            <div> 
                            	페이지수<select value="페이지수"  style=" padding: .3em .5em;"><!-- numPerpage -->
                                <option>10</option>
                                <option>20</option>
                                <option>30</option>
                            </select>
                            </div>
                        </div><!-- 상단 -->
                        
                        
                        <table>
                            <thead>
                            <tr>
                                <th>제목</th>
                                <th>글쓴이</th>
                                <th>작성일</th>
                                <th>답변여부</th>
                            </tr>
                            </thead>
                            
                            <tr><!-- for{ 페이징처리-->
                                <td><a href="#">제목이 안보여요</a></td>
                                <td>김범신</td>
                                <td>2020-04-02</td>
                                <td>N</td>
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