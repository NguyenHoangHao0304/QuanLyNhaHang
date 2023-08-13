<%-- 
    Document   : index
    Created on : Aug 2, 2023, 3:14:40 PM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:url value="/" var="indexAction" />
<div class="content-wrapper mt-4">
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h2 class="m-0 text-dark">Trang Chủ</h2>
                </div>
            </div>
        </div>
    </div>
    <div class="row mt-4">
        <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
                <a href="#"><img class="card-img-top" src="<c:url value="/images/chinhanh.png"/>"
                                 alt=""></a>
                <div class="card-body">
                    <h4 class="card-title">
                        <a href="<c:url value="/branchs"/>">Chi Tiết</a>
                    </h4>
                </div>
            </div>
        </div>

        <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
                <a href="#"><img class="card-img-top" src="<c:url value="/images/sanhcuoi.png"/>"
                                 alt=""></a>
                <div class="card-body">
                    <h4 class="card-title">
                        <a href="<c:url value="/halls"/>">Chi Tiết</a>
                    </h4>
                </div>
            </div>
        </div>
        <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
                <a href="#"><img class="card-img-top" src="<c:url value="/images/monan.png"/>"
                                 alt=""></a>
                <div class="card-body">
                    <h4 class="card-title">
                        <a href="<c:url value="/foods"/>">Chi Tiết</a>
                    </h4>
                </div>
            </div>
        </div>
        <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
                <a href="#"><img class="card-img-top" src="<c:url value="/images/dichvu.png"/>"
                                 alt=""></a>
                <div class="card-body">
                    <h4 class="card-title">
                        <a href="<c:url value="/services"/>">Chi Tiết</a>
                    </h4>
                </div>
            </div>
        </div>
        <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
                <a href="#"><img class="card-img-top" src="<c:url value="/images/nhanvien.png"/>"
                                 alt=""></a>
                <div class="card-body">
                    <h4 class="card-title">
                        <a href="<c:url value="/admin/employees"/>">Chi Tiết</a>
                    </h4>
                </div>
            </div>
        </div>
        <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
                <a href="#"><img class="card-img-top" src="<c:url value="/images/taikhoan.png"/>"
                                 alt=""></a>
                <div class="card-body">
                    <h4 class="card-title">
                        <a href="<c:url value="/admin/users"/>">Chi Tiết</a>
                    </h4>
                </div>
            </div>
        </div>
    </div>
</div>
