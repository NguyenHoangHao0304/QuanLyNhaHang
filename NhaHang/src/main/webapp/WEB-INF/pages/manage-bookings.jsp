<%-- 
    Document   : manage-bookings
    Created on : Sep 3, 2023, 3:50:05 PM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:url value="/user/bookings" var="bookingAction" />
<section class="container">
    <h1 class="text-center text-primary mt-1"> Tiệc </h1>
    <sec:authorize access="hasRole('ROLE_CUSTOMER')"> 
        <div>
            <a href="<c:url value="/user/bookings/create"/>" class="btn btn-warning mt-1">Đặt Tiệc</a>
        </div>
    </sec:authorize>
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
                <th>Tổng Tiền</th>
                <th>Trạng Thái</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${userBookings}" var="usbk">
                <tr>
                    <td>${usbk.id}</td>
                    <td>${usbk.bookingDate}</td>
                    <td>${usbk.startTime}</td>
                    <td>${usbk.tableNumber}</td>
                    <td>${usbk.bookingName}</td>
                    <td>${usbk.hallId.hallName}</td>
                    <td>${usbk.userId.username}</td>
                    <td>${usbk.total}</td>
                    <td>${usbk.status}</td>
                    <sec:authorize access="hasRole('ROLE_CUSTOMER')"> 
                        <td>
                            <c:url value="/api/bookings/${usbk.id}" var="apiDlt"/>
                            <c:url value="/bookings/${usbk.id}" var="api"/>
                            <a href="${api}" class="btn btn-success">Cập Nhật</a>
                            <button class="btn btn-danger" onclick="Delete('${apiDlt}')">Xóa</button>
                        </td>
                    </sec:authorize>
                    <sec:authorize access="hasRole('ROLE_ADMIN')"> 
                        <td>
                            <c:url value="/api/bookings/${usbk.id}" var="apiDlt"/>
                            <button class="btn btn-danger" onclick="Delete('${apiDlt}')">Xóa</button>
                        </td>
                    </sec:authorize>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</section>
<script src="<c:url value="/js/delete.js"/>"></script>
