<%-- 
    Document   : users
    Created on : Aug 8, 2023, 12:44:17 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:url value="/admin/users" var="userAction" />
<section class="container">
    <h1 class="text-center text-primary mt-1">USER</h1>
    <div>
        <a href="<c:url value="/admin/users/create"/>" class="btn btn-warning mt-1">Thêm tài khoản</a>
    </div>
    <c:if test="${counter > 1}">
        <ul class="pagination mt-1">
            <li class="page-item"><a class="page-link" href="${userAction}">Tất cả</a></li>
                <c:forEach begin="1" end="${counter}" var="i">
                    <c:url value="/admin/users" var="pageUserAction" >
                        <c:param name="page" value="${i}"/>
                    </c:url>
                <li class="page-item"><a class="page-link" href="${pageUserAction}">${i}</a></li>
                </c:forEach>
        </ul>
    </c:if>
    <table class="table table-hover">
        <thead>
            <tr>
                <th></th>
                <th>Id</th>
                <th>Họ</th>
                <th>Tên</th>
                <th>Username</th>
                <th>Password</th>
                <th>UserRole</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${user}" var="u">
                <tr>
                    <td>
                        <img src="${u.avatar}" alt="${u.lastName}" width="120" height="80"/>
                    </td>
                    <td>${u.id}</td>
                    <td>${u.firstName}</td>
                    <td>${u.lastName}</td>
                    <td>${u.username}</td>
                    <td>${u.password}</td>
                    <td>${u.userRole}</td>
                    <td>
                        <c:url value="/admin/users/${u.id}" var="api"/>
                        <a href="${api}" class="btn btn-success">Cập Nhật</a>
                        <button class="btn btn-danger" onclick="deleteUser('${api}')">Xóa</button>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</section>
<script src="<c:url value="/js/user.js"/>"></script>
