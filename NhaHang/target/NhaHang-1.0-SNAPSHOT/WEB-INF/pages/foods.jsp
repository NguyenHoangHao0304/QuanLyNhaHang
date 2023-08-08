<%-- 
    Document   : foods
    Created on : Aug 6, 2023, 4:18:00 PM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:url value="/foods" var="foodAction" />
<section class="container">
    <h1 class="text-center text-primary mt-1">MENU</h1>
    <div>
        <a href="<c:url value="/foods/create"/>" class="btn btn-warning mt-1">Thêm món ăn</a>
    </div>
    <c:if test="${counter > 1}">
        <ul class="pagination mt-1">
            <li class="page-item"><a class="page-link" href="${foodAction}">Tất cả</a></li>
                <c:forEach begin="1" end="${counter}" var="i">
                    <c:url value="/foods" var="pageFoodAction" >
                        <c:param name="page" value="${i}"/>
                    </c:url>
                <li class="page-item"><a class="page-link" href="${pageFoodAction}">${i}</a></li>
                </c:forEach>
        </ul>
    </c:if>
    <table class="table table-hover">
        <thead>
            <tr>
                <th></th>
                <th>Id</th>
                <th>Tên món ăn</th>
                <th>Giá tiền</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${food}" var="f">
                <tr>
                    <td>
                        <img src="${f.foodImage}" alt="${f.foodName}" width="120" height="80"/>
                    </td>
                    <td>${f.id}</td>
                    <td>${f.foodName}</td>
                    <td>${f.foodPrice} VNĐ</td>
                    <td>
                        <c:url value="/foods/${f.id}" var="api"/>
                        <a href="${api}" class="btn btn-success">Cập Nhật</a>
                        <button class="btn btn-danger" onclick="deleteFood('${api}')">Xóa</button>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</section>
<script src="<c:url value="/js/food.js"/>"></script>
