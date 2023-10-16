<%-- 
    Document   : hall
    Created on : Aug 3, 2023, 4:12:46 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:url value="/halls" var="hallAction" />
<section class="container">
    <h1 class="text-center text-primary mt-1"> SẢNH TIỆC </h1>
    <sec:authorize access="hasRole('ROLE_ADMIN')"> 
        <div>
            <a href="<c:url value="/admin/halls/create"/>" class="btn btn-warning mt-1">Thêm Sảnh Tiệc</a>
            <a href="<c:url value="/halls/hallprices"/>" class="btn btn-warning mt-1">Quản Lý Giá Các Sảnh</a>
        </div>
    </sec:authorize>
    <sec:authorize access="hasRole('ROLE_CUSTOMER')"> 
        <div>
            <a href="<c:url value="/halls/hallprices"/>" class="btn btn-warning mt-1">Chọn Buổi</a>
        </div>
    </sec:authorize>
    <c:if test="${counter > 1}">
        <ul class="pagination mt-1">
            <li class="page-item"><a class="page-link" href="${hallAction}">Tất cả</a></li>
                <c:forEach begin="1" end="${counter}" var="i">
                    <c:url value="/halls" var="pageHallAction" >
                        <c:param name="page" value="${i}"/>
                    </c:url>
                <li class="page-item"><a class="page-link" href="${pageHallAction}">${i}</a></li>
                </c:forEach>
        </ul>
    </c:if>
    <table class="table table-hover">
        <thead>
            <tr>
                <th></th>
                <th>Id</th>
                <th>Tên Sảnh</th>
                <th>Sức chứa</th>
                <th>Buổi</th>
                <th>Từ</th>
                <th>Đến</th>
                <th>Giá</th>
                <th>Chi Nhánh</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${hall}" var="h">
                <tr>
                    <td>
                        <img src="${h.hallImage}" alt="${h.hallName}" width="120" height="80"/>
                    </td>
                    <td>${h.id}</td>
                    <td>${h.hallName}</td>
                    <td>${h.capacity} Người</td>
                    <td> 
                        <ul class="list-group list-group-flush">
                            <c:forEach items="${hallprices}" var="hp">
                                <c:choose>
                                    <c:when test="${hp.hallId.id == h.id}">
                                        <li class="list-group-item" value="${hp.hallId.id}">${hp.timePeriod}</li>
                                        </c:when>
                                        <c:otherwise></c:otherwise>
                                    </c:choose>
                                </c:forEach>
                        </ul>
                    </td>
                    <td> 
                        <ul class="list-group list-group-flush">
                            <c:forEach items="${hallprices}" var="hp">
                                <c:choose>
                                    <c:when test="${hp.hallId.id == h.id}">
                                        <li class="list-group-item" value="${hp.hallId.id}">${hp.timeStart}</li>
                                        </c:when>
                                        <c:otherwise></c:otherwise>
                                    </c:choose>
                                </c:forEach>
                        </ul>
                    </td>
                    <td> 
                        <ul class="list-group list-group-flush">
                            <c:forEach items="${hallprices}" var="hp">
                                <c:choose>
                                    <c:when test="${hp.hallId.id == h.id}">
                                        <li class="list-group-item" value="${hp.hallId.id}">${hp.timeEnd}</li>
                                        </c:when>
                                        <c:otherwise></c:otherwise>
                                    </c:choose>
                                </c:forEach>
                        </ul>
                    </td>
                    <td> 
                        <ul class="list-group list-group-flush">
                            <c:forEach items="${hallprices}" var="hp">
                                <c:choose>
                                    <c:when test="${hp.hallId.id == h.id}">
                                        <li class="list-group-item" value="${hp.hallId.id}">${hp.price} VNĐ</li>
                                        </c:when>
                                        <c:otherwise></c:otherwise>
                                    </c:choose>
                                </c:forEach>
                        </ul>
                    </td>
                    <td>${h.branchId.branchName}</td>
                    <sec:authorize access="hasRole('ROLE_ADMIN')"> 
                        <td>
                            <c:url value="/admin/halls/${h.id}" var="api"/>
                            <c:url value="/api/halls/${h.id}" var="apiDlt"/>
                            <a href="${api}" class="btn btn-success">Cập Nhật</a>
                            <button class="btn btn-danger" onclick="Delete('${apiDlt}')">Xóa</button>
                        </td>
                    </sec:authorize>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</section>
<script src="<c:url value="/js/delete.js"/>"></script>