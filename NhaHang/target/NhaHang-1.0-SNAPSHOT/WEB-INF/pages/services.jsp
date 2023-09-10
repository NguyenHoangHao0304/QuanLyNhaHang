<%-- 
    Document   : services
    Created on : Aug 6, 2023, 9:23:45 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:url value="/services" var="serviceAction" />
<section class="container">
    <h1 class="text-center text-primary mt-1"> DỊCH VỤ</h1>
    <sec:authorize access="hasRole('ROLE_ADMIN')"> 
        <div>
            <a href="<c:url value="/admin/services/create"/>" class="btn btn-warning mt-1">Thêm dịch vụ</a>
        </div>
    </sec:authorize>

    <c:if test="${counter > 1}">
        <ul class="pagination mt-1">
            <li class="page-item"><a class="page-link" href="${serviceAction}">Tất cả</a></li>
                <c:forEach begin="1" end="${counter}" var="i">
                    <c:url value="/services" var="pageServiceAction" >
                        <c:param name="page" value="${i}"/>
                    </c:url>
                <li class="page-item"><a class="page-link" href="${pageServiceAction}">${i}</a></li>
                </c:forEach>
        </ul>
    </c:if>
    <table class="table table-hover">
        <thead>
            <tr>
                <th></th>
                <th>Id</th>
                <th>Tên dịch vụ</th>
                <th>Giá tiền</th>
                <th>Mô tả</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${service}" var="s">
                <tr>
                    <td>
                        <img src="${s.serviceImage}" alt="${s.serviceName}" width="120" height="80"/>
                    </td>
                    <td>${s.id}</td>
                    <td>${s.serviceName}</td>
                    <td>${s.servicePrice} VNĐ</td>
                    <td>${s.serviceDescription}</td>
                    <sec:authorize access="hasRole('ROLE_ADMIN')"> 
                        <td>
                            <c:url value="/admin/services/${s.id}" var="api"/>
                            <c:url value="/api/services/${s.id}" var="apiDlt"/>
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
