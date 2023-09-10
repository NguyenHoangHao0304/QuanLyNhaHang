<%-- 
    Document   : hallprice
    Created on : Aug 29, 2023, 1:23:14 PM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:url value="/halls/hallprices" var="hallpriceAction" />
<section class="container">
    <h1 class="text-center text-primary mt-1"> GIÁ SẢNH </h1>
    <sec:authorize access="hasRole('ROLE_ADMIN')"> 
        <div>
            <a href="<c:url value="/halls"/>" class="btn btn-warning mt-1">Quay lại</a>
            <a href="<c:url value="/admin/halls/hallprices/create"/>" class="btn btn-warning mt-1">Thêm Giá Sảnh</a>
        </div>
    </sec:authorize>
    <c:if test="${counter > 1}">
        <ul class="pagination mt-1">
            <li class="page-item"><a class="page-link" href="${hallpriceAction}">Tất cả</a></li>
                <c:forEach begin="1" end="${counter}" var="i">
                    <c:url value="/halls/hallprices" var="pageHallPriceAction" >
                        <c:param name="page" value="${i}"/>
                    </c:url>
                <li class="page-item"><a class="page-link" href="${pageHallPriceAction}">${i}</a></li>
                </c:forEach>
        </ul>
    </c:if>
    <table class="table table-hover">
        <thead>
            <tr>
                <th>Id</th>
                <th>Buổi</th>
                <th>Từ</th>
                <th>Đến</th>
                <th>Giá</th>
                <th>Sảnh</th>
                <th>Chi Nhánh</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${hallprice}" var="hp">
                <tr>
                    <td>${hp.id}</td>
                    <td>${hp.timePeriod}</td>
                    <td>${hp.timeStart}</td>
                    <td>${hp.timeEnd}</td>
                    <td>${hp.price} VNĐ</td>
                    <td>${hp.hallId.hallName}</td>
                    <td>${hp.hallId.branchId.branchName}</td>
                    <sec:authorize access="hasRole('ROLE_ADMIN')"> 
                        <td>
                            <c:url value="/admin/halls/hallprices/${hp.id}" var="api"/>
                            <c:url value="/api/halls/hallprices/${hp.id}" var="apiDlt"/>
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