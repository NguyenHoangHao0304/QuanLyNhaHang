<%-- 
    Document   : header
    Created on : Aug 2, 2023, 3:30:44 PM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:url value="/" var="action" />
<nav class="navbar navbar-expand-lg bg-light navbar-light">
    <div class="container">
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
                        data-bs-toggle="dropdown" aria-expanded="false"> Nhà Hàng
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="<c:url value="/branchs"/>">Chi Nhánh</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="<c:url value="/halls"/>">Sảnh Tiệc</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="<c:url value="/foods"/>">Thức Ăn</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="<c:url value="/services"/>">Dịch Vụ</a></li>
                            <sec:authorize access="hasRole('ROLE_ADMIN')"> 
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="<c:url value="/admin/employees"/>">Nhân Viên</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="<c:url value="/admin/users"/>">User</a></li>
                            </sec:authorize>
                    </ul>
                </li>
                <li class="nav-item dropdown">
                    <sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_CUSTOMER','ROLE_EMPLOYEE')"> 
                        <a
                            class="nav-link dropdown-toggle" href="#" role="button"
                            data-bs-toggle="dropdown" aria-expanded="false"> Tiệc
                        </a>
                    </sec:authorize>
                    <ul class="dropdown-menu">
                        <sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_EMPLOYEE')"> 
                            <li><a class="dropdown-item" href="<c:url value="/admin/bookings"/>">Thông tin đặt tiệc</a></li>
                            </sec:authorize>
                            <sec:authorize access="hasRole('ROLE_CUSTOMER')"> 
                            <li><a class="dropdown-item" href="<c:url value="/user/bookings"/>">Quản lý đặt tiệc</a></li>
                            </sec:authorize>
                            <sec:authorize access="hasRole('ROLE_ADMIN')"> 
                            <li><a class="dropdown-item" href="<c:url value="/feedbacks"/>">Feedback</a></li>
                            </sec:authorize>
                    </ul>
                </li>
                <li class="nav-item dropdown">
                    <sec:authorize access="hasRole('ROLE_ADMIN')"> 
                        <a
                            class="nav-link dropdown-toggle" href="#" role="button"
                            data-bs-toggle="dropdown" aria-expanded="false"> Thống Kê
                        </a>
                    </sec:authorize>
                    <ul class="dropdown-menu">
                        <sec:authorize access="hasRole('ROLE_ADMIN')"> 
                            <li><a class="dropdown-item" href="<c:url value="/admin/statsRevenue"/>">Thống kê doanh thu</a></li>
                            <li><a class="dropdown-item" href="<c:url value="/admin/countBookingByBranch"/>">Thống kê mật độ tiệc</a></li>
                            <li><a class="dropdown-item" href="<c:url value="/admin/countHallStats"/>">Thống kê mật độ sử dụng sảnh tiệc</a></li>
                            </sec:authorize> 

                    </ul>
                </li>
                <sec:authorize access="hasRole('ROLE_CUSTOMER')"> 
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value="/user/bookings/create"/>">Đặt Tiệc</a>
                    </li>   
                </sec:authorize>
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
                        <li class="nav-item">
                            <a class="nav-link" href="<c:url value="/register"/>">Đăng Ký</a>
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
                    <c:url value="/admin/employees" var="actionEmployee" />
                    <form class="d-flex" action="${actionEmployee}">
                        <input class="form-control me-2" type="text" name="kw" placeholder="Nhập từ khóa ....">
                        <button class="btn btn-warning" type="submit">Tìm</button>
                    </form>
                </c:when>
                <c:when test="${user != null}">
                    <c:url value="/admin/users" var="actionUser" />
                    <form class="d-flex" action="${actionUser}">
                        <input class="form-control me-2" type="text" name="kw" placeholder="Nhập từ khóa ....">
                        <button class="btn btn-warning" type="submit">Tìm</button>
                    </form>
                </c:when>
                <c:when test="${booking != null}">
                    <c:url value="/admin/bookings" var="actionBooking" />
                    <form class="d-flex" action="${actionBooking}">
                        <input class="form-control me-2" type="text" name="kw" placeholder="Nhập từ khóa ....">
                        <button class="btn btn-warning" type="submit">Tìm</button>
                    </form>
                </c:when>
                <c:when test="${hallprice != null}">
                    <c:url value="/halls/hallprices" var="actionHallPrice" />
                    <form class="d-flex" action="${actionHallPrice}">
                        <input class="form-control me-2" type="text" name="hallName" placeholder="Nhập tên sảnh ....">
                        <button class="btn btn-warning" type="submit">Tìm</button>
                    </form>
                </c:when>
                <c:when test="${userbooking != null}">
                    <c:url value="/user/bookings" var="actionBooking" />
                    <form class="d-flex" action="${actionBooking}">
                        <input class="form-control me-2" type="text" name="kw" placeholder="Nhập từ khóa ....">
                        <button class="btn btn-warning" type="submit">Tìm</button>
                    </form>
                </c:when>
                <c:when test="${userfeedback != null}">
                    <c:url value="/user/feedbacks" var="actionFeedback" />
                    <form class="d-flex" action="${actionBooking}">
                        <input class="form-control me-2" type="text" name="username" placeholder="Nhập từ khóa ....">
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
