<%-- 
    Document   : employees
    Created on : Aug 6, 2023, 10:45:33 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:url value="/admin/employees" var="employeeAction" />
<section class="container">
    <h1 class="text-center text-primary mt-1">NHÂN VIÊN</h1>
    <div>
        <a href="<c:url value="/admin/employees/create"/>" class="btn btn-warning mt-1">Thêm Nhân Viên</a>
    </div>
    <c:if test="${counter > 1}">
        <ul class="pagination mt-1">
            <li class="page-item"><a class="page-link" href="${employeeAction}">Tất cả</a></li>
                <c:forEach begin="1" end="${counter}" var="i">
                    <c:url value="/admin/employees" var="pageEmployeeAction" >
                        <c:param name="page" value="${i}"/>
                    </c:url>
                <li class="page-item"><a class="page-link" href="${pageEmployeeAction}">${i}</a></li>
                </c:forEach>
        </ul>
    </c:if>
    <table class="table table-hover">
        <thead>
            <tr>
                <th>Id</th>
                <th>Họ</th>
                <th>Tên</th>
                <th>Số điện thoại</th>
                <th>Email</th>
                <th>Chi nhánh</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${employee}" var="e">
                <tr>
                    <td>${e.id}</td>
                    <td>${e.firstName}</td>
                    <td>${e.lastName}</td>
                    <td>${e.phone}</td>
                    <td>${e.email}</td>
                    <td>${e.branchId.branchName}</td>
                    <td>
                        <c:url value="/admin/employees/${e.id}" var="api"/>
                        <c:url value="/api/employees/${e.id}" var="apiDlt"/>
                        <a href="${api}" class="btn btn-success">Cập Nhật</a>
                        <button class="btn btn-danger" onclick="Delete('${apiDlt}')">Xóa</button>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</section>
<script src="<c:url value="/js/delete.js"/>"></script>