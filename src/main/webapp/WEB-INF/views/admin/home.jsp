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
                <div class="col-xl-2 col-md-6">
                    <div class="card bg-primary text-white mb-4">
                        <div class="card-body">회원 관리</div>
                        <div class="card-footer d-flex align-items-center justify-content-between">
                            <a class="small text-white stretched-link" href="/admin/user">상세보기</a>
                            <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-2 col-md-6">
                    <div class="card bg-warning text-white mb-4">
                        <div class="card-body">상품 관리</div>
                        <div class="card-footer d-flex align-items-center justify-content-between">
                            <a class="small text-white stretched-link" href="/admin/product">상세보기</a>
                            <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-2 col-md-6">
                    <div class="card bg-success text-white mb-4">
                        <div class="card-body">게시판 관리</div>
                        <div class="card-footer d-flex align-items-center justify-content-between">
                            <a class="small text-white stretched-link" href="/admin/notice">공지 </a>
                            <a class="small text-white stretched-link" href="/admin/review">리뷰 </a>
                            <a class="small text-white stretched-link" href="/admin/event">이벤트</a>
                            <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-2 col-md-6">
                    <div class="card bg-danger text-white mb-4">
                        <div class="card-body">블로그 관리</div>
                        <div class="card-footer d-flex align-items-center justify-content-between">
                            <a class="small text-white stretched-link" href="/admin/blog">상세보기</a>
                            <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                        </div>
                    </div>
                </div>
                 <div class="col-xl-2 col-md-6">
                    <div class="card bg-secondary text-white mb-4">
                        <div class="card-body">코멘트 관리</div>
                        <div class="card-footer d-flex align-items-center justify-content-between">
                            <a class="small text-white stretched-link" href="/admin/comment">상세보기</a>
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
        </div>
    </main>
 
<%@ include file="include/footerAdmin.jsp" %>