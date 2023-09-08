<%-- 
    Document   : bookingform
    Created on : Aug 19, 2023, 6:49:49 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<h1 class="text-center text-info mt-1">ĐẶT TIỆC</h1>
<c:url value="/bookings" var="action" />
<form:form modelAttribute="booking" method="post" action="${action}" enctype="multipart/form-data">
    <%--<form:errors path="*" element="div" cssClass="alert alert-danger"/>--%>

    <form:hidden path="id"/>
    <form:hidden path="userId" value="${booking.userId.id}"/>
    <div class="form-floating mb-3 mt-3">
        <form:input type="date" class="form-control" path="bookingDate" id="bookingDate" 
                    placeholder="Ngày Cưới" name="bookingDate"/>
        <label for="bookingDate">Ngày Cưới</label>
    </div>
    <div class="form-floating mb-3 mt-3">
        <form:input type="text" class="form-control" path="startTime" id="startTime" 
                    placeholder="Giờ" name="startTime"/>
        <label for="startTime">Giờ</label>
    </div>
    <div class="form-floating mb-3 mt-3">
        <form:input type="text" class="form-control" path="bookingName" id="bookingName" 
                    placeholder="Tên" name="bookingName"/>
        <label for="bookingName">Tên</label>
    </div>

    <div class="form-floating mb-3 mt-3">
        <form:select class="form-select" id="hall" name="hall" path="hallId">
            <c:forEach items="${halls}" var="h">
                <c:choose>
                    <c:when test="${h.id==booking.hallId.id}">
                        <option value="${h.id}" selected>${h.hallName}</option>
                    </c:when>
                    <c:otherwise>
                        <option></option>
                        <option value="${h.id}">${h.hallName}</option>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </form:select>
        <label for="branch" class="form-label">Sảnh Cưới</label>
    </div>
    <%--<div class="form-floating mb-3 mt-3">
        <form:select class="form-select" id="user" name="user" path="userId">
            <c:forEach items="${users}" var="u">
                <c:choose>
                    <c:when test="${u.id==booking.userId.id}">
                        <option value="${u.id}" selected>${u.username}</option>
                    </c:when>
                    <c:otherwise>
                        <option></option>
                        <option value="${u.id}">${u.username}</option>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </form:select>
        <label for="branch" class="form-label">User</label>
    </div>--%>
    <div class="form-floating mb-3 mt-3">
        <button class="btn btn-info mt-1" type="submit"> 
            <c:choose>
                <c:when test="${booking.id != null}">
                    Cập Nhật Tiệc
                </c:when>
                <c:otherwise>
                    Đặt tiệc
                </c:otherwise>
            </c:choose>
        </button>
    </div>
</form:form>