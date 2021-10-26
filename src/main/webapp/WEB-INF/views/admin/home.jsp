<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include/headerAdmin.jsp" %>
    <main>
        <div class="container-fluid px-4">
            <h1 class="mt-4">대시보드</h1>
            <ol class="breadcrumb mb-4">
                <li class="breadcrumb-item active">대시보드</li>
            </ol>
            <div class="row">
                <div class="col-xl-3 col-md-6">
                    <div class="card bg-primary text-white mb-4">
                        <div class="card-body">회원 관리</div>
                        <div class="card-footer d-flex align-items-center justify-content-between">
                            <a class="small text-white stretched-link" href="/admin/user">상세보기</a>
                            <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-md-6">
                    <div class="card bg-warning text-white mb-4">
                        <div class="card-body">리뷰 관리</div>
                        <div class="card-footer d-flex align-items-center justify-content-between">
                            <a class="small text-white stretched-link" href="/admin/board">상세보기</a>
                            <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-md-6">
                    <div class="card bg-success text-white mb-4">
                        <div class="card-body">브랜드 관리</div>
                        <div class="card-footer d-flex align-items-center justify-content-between">
                            <a class="small text-white stretched-link" href="/admin/brand">상세보기</a>
                            <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-md-6">
                    <div class="card bg-danger text-white mb-4">
                        <div class="card-body">제품 관리</div>
                        <div class="card-footer d-flex align-items-center justify-content-between">
                            <a class="small text-white stretched-link" href="admin/item">상세보기</a>
                            <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xl-6">
                    <div class="card mb-4">
                        <div class="card-header">
                            <i class="fas fa-chart-area me-1"></i>
                            월별 리뷰수
                        </div>
                        <div class="card-body"><canvas id="myAreaChart" width="100%" height="40"></canvas></div>
                    </div>
                </div>
                <div class="col-xl-6">
                    <div class="card mb-4">
                        <div class="card-header">
                            <i class="fas fa-chart-bar me-1"></i>
                            월별 회원수
                        </div>
                        <div class="card-body"><canvas id="myBarChart" width="100%" height="40"></canvas></div>
                    </div>
                </div>
            </div>
            <div class="card mb-4">
                <div class="card-header">
                    <i class="fas fa-table me-1"></i>
                    회원관리
                </div>
                <div class="card-body">
                    <table id="datatablesSimple">
                        <thead>
                            <tr>
                                <th>이름</th>
                                <th>생년월일</th>
                                <th>성별</th>
                                <th>아이디</th>
                                <th>닉네임</th>
                                <th>피부타입</th>
                                <th>피부고민</th>
                                <th>피부톤</th>
                            </tr>
                        </thead>
                        <tfoot>
                            <tr>
                                <th>이름</th>
                                <th>생년월일</th>
                                <th>성별</th>
                                <th>아이디</th>
                                <th>닉네임</th>
                                <th>피부타입</th>
                                <th>피부고민</th>
                                <th>피부톤</th>
                            </tr>
                        </tfoot>
                        <tbody>
                            <tr>
                                <td>이준기</td>
                                <td>1982/04/17</td>
                                <td>남성</td>
                                <td>39세</td>
                                <td>뼈군인</td>
                                <td>중성</td>
                                <td>해당없음</td>
                                <td>밝은(21호)</td>
                            </tr>
                            <tr>
                                <td>강하늘</td>
                                <td>1990/02/21</td>
                                <td>남성</td>
                                <td>31세</td>
                                <td>기마늘</td>
                                <td>건성</td>
                                <td>여드름</td>
                                <td>중간밝은(22호)</td>
                            </tr>
                            <tr>
                                <td>강호동</td>
                                <td>1970/07/14</td>
                                <td>남성</td>
                                <td>51세</td>
                                <td>저팔계</td>
                                <td>지성</td>
                                <td>혈관</td>
                                <td>매우차분한</td>
                            </tr>
                         
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </main>
 
<%@ include file="include/footerAdmin.jsp" %>