<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/admin/common/adminheader.jsp"%>
	<!--회원 관리-->
                    <div id="member-list">
                        <div style="display: flex; justify-content: space-between; align-items: center;width: 100%;">
                            <h1>회원 관리</h1>
                            <div> 
                            	페이지수<select value="페이지수"  style=" padding: .3em .5em;">
                                <option>10</option>
                                <option>20</option>
                                <option>30</option>
                            </select>
                            </div>
                        </div>
                        <table>
                            <thead>
                                <th>아이디</th>
                                <th>이름</th>
                                <th>이메일</th>
                                <th>연락처</th>
                                <th>주소</th>
                                <th>회원/사업자</th>
                            </thead>
                            <tr><!-- for{ -->
                                <td>chzh859</td>
                                <td>김범신</td>
                                <td>chzh859@naver.com</td>
                                <td>010-3597-0663</td>
                                <td>인천 서구 마전동</td>
                                <td>회원</td>
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