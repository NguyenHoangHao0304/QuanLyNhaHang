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
    <c:if test="${counter > 1}">
        <ul class="pagination mt-1">
            <li class="page-item"><a class="page-link" href="${bookingAction}">Tất cả</a></li>
                <c:forEach begin="1" end="${counter}" var="i">
                    <c:url value="/user/bookings" var="pageBookingAction" >
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
                    <sec:authorize access="hasRole('ROLE_CUSTOMER')"> 
                        <td>
                            <c:url value="/api/bookings/${usbk.id}" var="apiDlt"/>
                            <c:url value="/user/bookings/${usbk.id}" var="api"/>
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
