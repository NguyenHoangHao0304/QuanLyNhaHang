<%-- 
    Document   : hall
    Created on : Aug 3, 2023, 4:12:46 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:url value="/halls" var="hallAction" />
<section class="container">
    <h1 class="text-center text-primary mt-1">QUẢN LÝ SẢNH CƯỚI</h1>
    <div>
        <a href="<c:url value="/hallEdits"/>" class="btn btn-warning mt-1">Thêm sản phẩm</a>
    </div>
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
                <th>Id</th>
                <th>Tên Sảnh</th>
                <th>Sức chứa</th>
                <th>Giá Sáng</th>
                <th>Giá Trưa</th>
                <th>Giá Tối</th>
                <th>Giá Cuối Tuần</th>
                <th>Chi Nhánh</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${hall}" var="h">
                <tr>
                    <td>${h.id}</td>
                    <td>${h.hallName}</td>
                    <td>${h.capacity} Người</td>
                    <td>${h.priceMorning} VNĐ</td>
                    <td>${h.priceAfternoon} VNĐ</td>
                    <td>${h.priceEvening} VNĐ</td>
                    <td>${h.priceWeekend} VNĐ</td>
                    <td>${h.branchId.branchName}</td>
                    <td>
                        <c:url value="/hallEdits/${h.id}" var="api"/>
                        <a href="${api}" class="btn btn-success">Cập Nhật</a>
                        <button class="btn btn-danger" onclick="deleteProduct('${api}')">Xóa</button>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</section>