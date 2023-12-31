<%-- 
    Document   : bookings
    Created on : Aug 19, 2023, 4:06:18 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:url value="/admin/bookings" var="bookingAction" />
<section class="container">
    <h1 class="text-center text-primary mt-1"> Tiệc </h1>
    <sec:authorize access="hasRole('ROLE_CUSTOMER')"> 
        <div>
            <a href="<c:url value="/user/bookings/create"/>" class="btn btn-warning mt-1">Đặt Tiệc</a>
        </div>
    </sec:authorize>
    <sec:authorize access="hasAnyRole('ROLE_CUSTOMER','ROLE_ADMIN','ROLE_EMPLOYEE')"> 
        <div class="mt-1">
            <c:url value="/admin/bookings" var="actionBooking" />
            <form class="d-flex" action="${actionBooking}">
                <input class="form-control me-2" type="text" name="hallName" placeholder="Nhập sảnh ....">
                <form>
                    <form class="d-flex" action="${actionBooking}">
                        <input class="form-control me-2" type="date" name="bookingDate" placeholder="Nhập Ngày ....">
                        <form>
                            <button class="btn btn-warning" type="submit">Tìm</button>
                            </div>
                        </sec:authorize>
                        <c:if test="${counter > 1}">
                            <ul class="pagination mt-1">
                                <li class="page-item"><a class="page-link" href="${bookingAction}">Tất cả</a></li>
                                    <c:forEach begin="1" end="${counter}" var="i">
                                        <c:url value="/admin/bookings" var="pageBookingAction" >
                                            <c:param name="page" value="${i}"/>
                                        </c:url>
                                    <li class="page-item"><a class="page-link" href="${pageBookingAction}">${i}</a></li>
                                    </c:forEach>
                            </ul>
                        </c:if>
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>Ngày</th>
                                    <th>Thời Gian</th>
                                    <th>Số Lượng Bàn</th>
                                    <th>Tên</th>
                                    <th>Sảnh Cưới</th>
                                    <th>User</th>
                                    <th>Tổng tiền</th>
                                    <th>Trạng Thái</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${booking}" var="bk">
                                    <tr>
                                        <td>${bk.id}</td>
                                        <td>${bk.bookingDate}</td>
                                        <td>${bk.startTime}</td>
                                        <td>${bk.tableNumber}</td>
                                        <td>${bk.bookingName}</td>
                                        <td>${bk.hallId.hallName} - ${bk.hallId.branchId.branchName}</td>
                                        <td>${bk.userId.username}</td>
                                        <td>${bk.total}</td>
                                        <td>${bk.status}</td>
                                        <sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_EMPLOYEE')"> 
                                            <td>
                                                <c:url value="/api/bookings/${bk.id}" var="apiDlt"/>
                                                <c:url value="/bookings/${bk.id}" var="api"/>
                                                <a href="${api}" class="btn btn-success">Cập Nhật</a>
<!--                                                <button class="btn btn-danger" onclick="Delete('${apiDlt}')">Xóa</button>-->
                                            </td>
                                        </sec:authorize>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        </section>
                        <script src="<c:url value="/js/delete.js"/>"></script>