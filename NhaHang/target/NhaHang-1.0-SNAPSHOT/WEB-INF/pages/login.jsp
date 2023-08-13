<%-- 
    Document   : login
    Created on : Aug 8, 2023, 5:17:16 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<h1 class="text-center text-danger">ĐĂNG NHẬP</h1>

<c:if test="${param.error != null}">
    <div class="alert alert-danger">
        Da co loi xay ra!
    </div>
</c:if>
<c:if test="${param.accessDenied != null}">
    <div class="alert alert-danger">
        Ban khong co quyen truy cap!!!
    </div>
</c:if>

<c:url value="/login" var="action"/>
<form method="post" action="${action}">
    <div class="form-floating mb-3 mt-3">
        <input type="text" class="form-control" id="username" placeholder="Nhập username ...." name="username">
        <label for="username">Username</label>
    </div>

    <div class="form-floating mt-3 mb-3">
        <input type="password" class="form-control" id="password" placeholder="Nhập mật khẩu ...." name="password">
        <label for="password">Password</label>
    </div>
    <div class="form-floating mt-3 mb-3">
        <input type="submit" value="Đăng Nhập" class="btn btn-warning"/>
    </div>
</form>
