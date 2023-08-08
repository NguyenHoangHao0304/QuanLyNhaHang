<%-- 
    Document   : header
    Created on : Aug 2, 2023, 3:30:44 PM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:url value="/" var="action" />
<nav class="navbar navbar-expand-lg bg-light navbar-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="${action}"><img
                src="<c:url value="/images/logo1.png"/>"
                alt="Bootstrap" height="70" width="100"></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="collapsibleNavbar">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link" href="${action}">Trang Chủ</a>
                </li>
                <li class="nav-item dropdown">
                    <a
                        class="nav-link dropdown-toggle" href="#" role="button"
                        data-bs-toggle="dropdown" aria-expanded="false"> Chi Nhánh 
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">Chi Nhánh 1</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="#">Chi Nhánh 2</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="#">Chi Nhánh 3</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="#">Chi Nhánh 4</a></li>
                    </ul>
                </li>
                <li class="nav-item dropdown">
                    <a
                        class="nav-link dropdown-toggle" href="#" role="button"
                        data-bs-toggle="dropdown" aria-expanded="false"> Quản lý
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="<c:url value="/branchs"/>">Quản lý chi nhánh</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="<c:url value="/halls"/>"/>Quản lý sảnh cưới</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="<c:url value="/foods"/>">Quản lý thức ăn</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="<c:url value="/services"/>">Quản lý dịch vụ</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="<c:url value="/employees"/>">Quản lý nhân viên</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="<c:url value="/users"/>">Quản lý User</a></li>
                    </ul>
                </li>
                <li class="nav-item dropdown">
                    <a
                        class="nav-link dropdown-toggle" href="#" role="button"
                        data-bs-toggle="dropdown" aria-expanded="false"> Tiệc
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">Thông tin đặt tiệc</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="#">Hóa đơn</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="#">Feedback</a></li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Thống kê</a>
                </li>
                <c:choose>
                    <c:when test="${pageContext.request.userPrincipal.name != null}">
                        <li class="nav-item">
                            <a class="nav-link text-danger" href="<c:url value="/"/>">${pageContext.request.userPrincipal.name}</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-danger" href="<c:url value="/logout"/>">Đăng Xuất</a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="nav-item">
                            <a class="nav-link" href="<c:url value="/login"/>">Đăng Nhập</a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </ul>  
            <c:choose>
                <c:when test="${hall != null}">
                    <c:url value="/halls" var="actionHall" />
                    <form class="d-flex" action="${actionHall}">
                        <input class="form-control me-2" type="text" name="kw" placeholder="Nhập từ khóa ....">
                        <button class="btn btn-warning" type="submit">Tìm</button>
                    </form>
                </c:when> 
                <c:when test="${branch != null}">
                    <c:url value="/branchs" var="actionBranch" />
                    <form class="d-flex" action="${actionBranch}">
                        <input class="form-control me-2" type="text" name="kw" placeholder="Nhập từ khóa ....">
                        <button class="btn btn-warning" type="submit">Tìm</button>
                    </form>
                </c:when>
                <c:when test="${food != null}">
                    <c:url value="/foods" var="actionFood" />
                    <form class="d-flex" action="${actionFood}">
                        <input class="form-control me-2" type="text" name="kw" placeholder="Nhập từ khóa ....">
                        <button class="btn btn-warning" type="submit">Tìm</button>
                    </form>
                </c:when>
                <c:when test="${service != null}">
                    <c:url value="/services" var="actionService" />
                    <form class="d-flex" action="${actionService}">
                        <input class="form-control me-2" type="text" name="kw" placeholder="Nhập từ khóa ....">
                        <button class="btn btn-warning" type="submit">Tìm</button>
                    </form>
                </c:when>
                <c:when test="${employee != null}">
                    <c:url value="/employees" var="actionEmployee" />
                    <form class="d-flex" action="${actionEmployee}">
                        <input class="form-control me-2" type="text" name="kw" placeholder="Nhập từ khóa ....">
                        <button class="btn btn-warning" type="submit">Tìm</button>
                    </form>
                </c:when>
                <c:when test="${user != null}">
                    <c:url value="/users" var="actionUser" />
                    <form class="d-flex" action="${actionUser}">
                        <input class="form-control me-2" type="text" name="kw" placeholder="Nhập từ khóa ....">
                        <button class="btn btn-warning" type="submit">Tìm</button>
                    </form>
                </c:when>
                <c:otherwise>
                    <c:url value="/" var="action" />
                </c:otherwise>
            </c:choose>

        </div>
    </div>
</nav>
