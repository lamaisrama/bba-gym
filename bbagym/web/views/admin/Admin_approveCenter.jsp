<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/admin/common/adminheader.jsp"%>
	<!-- 시설 등록 승인-->
                    <div id="center-approve">
                        <div style="display: flex; justify-content: space-between; align-items: center;width: 100%;">
                            <h1>시설 등록 승인</h1>
                            <div> 
                            	페이지수<select value="페이지수" style=" padding: .3em .5em;">
                                <option>10</option>
                                <option>20</option>
                                <option>30</option>
                            </select>
                            </div>
                        </div>
                        <table>
                            <thead>
                                <th>시설 이름</th>
                                <th>시설 주소</th>
                                <th>관리자</th>
                                <th>연락처</th>
                                <th>사업자승인</th>
                                <th></th>
                            </thead>
                            <tr><!-- for{ -->
                                <td>티키티키헬스 클럽</td>
                                <td>인천 서구 마전동 완정로 34길 46-82</td>
                                <td>김범신</td>
                                <td>010-3597-0663</td>
                                <td>Y</td>
                                <td> 
                                    <button onclick="">승인</button>
                                    <button onclick="">거절</button>
                                </td>
                                <!-- 분기처리
                                    1. NULL 상태 시 승인,거절 버튼 보여줌 
                                    2. 승인 상태 시 승인 
                                    3. 거절상태는 화면에 보이지않게한다
                                -->
                            </tr><!-- }-->
                        </table>
                        
                        <div id="pageBar"><!-- 페이지바 JSP구현-->
                            <div id="page"><!--현재 창 페이지는 밑에 스타일 적용 다른게 클릳되면 원래상태로-->
                                <span>처음</span><a href="#" style="color:blue; border: 1px solid rgb(0, 225, 255,0.2);">1</a><a href="#">2</a><a href="#">3</a><a href="#">4</a><a href="#">5</a><span>다음</span>
                            </div>
                            <div id="search">검색<input type="text"></div>
                        </div>
                    </div>
</section>
</div> <!-- header에 section-view 아이디 div 닫아줌 -->
<%@ include file="/views/admin/common/adminfooter.jsp"%>