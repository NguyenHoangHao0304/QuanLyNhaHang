<%-- 
    Document   : userEdits
    Created on : Aug 8, 2023, 2:07:07 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<h1 class="text-center text-info mt-1">EDIT USER</h1>
<c:url value="/users" var="action" />
<form:form modelAttribute="user" method="post" action="${action}" enctype="multipart/form-data">
    <%--<form:errors path="*" element="div" cssClass="alert alert-danger"/>--%>

    <form:hidden path="id"/>
    <form:hidden path="avatar"/>
    <div class="form-floating mb-3 mt-3">
        <form:input type="text" class="form-control" path="firstName" id="firstName" 
                    placeholder="Họ" name="firstName"/>
        <label for="firstName">Họ</label>
        <%--<form:errors path="serviceName" element="div" cssClass="text-danger"/>--%>
    </div>
    <div class="form-floating mb-3 mt-3">
        <form:input type="text" class="form-control" path="lastName" id="lastName" 
                    placeholder="Tên" name="lastName"/>
        <label for="lastName">Tên</label>
        <%--<form:errors path="servicePrice" element="div" cssClass="text-danger"/>--%>
    </div>
    <div class="form-floating mb-3 mt-3">
        <form:input type="text" class="form-control" path="username" id="username" 
                    placeholder="username" name="username"/>
        <label for="username">Username</label>
        <%--<form:errors path="serviceDescription" element="div" cssClass="text-danger"/>--%>
    </div>
    <div class="form-floating mb-3 mt-3">
        <form:input type="text" class="form-control" path="password" id="password" 
                    placeholder="password" name="password"/>
        <label for="password">Password</label>
        <%--<form:errors path="serviceDescription" element="div" cssClass="text-danger"/>--%>
    </div>
    <div class="form-floating mb-3 mt-3">
        <form:input type="text" class="form-control" path="userRole" id="userRole" 
                    placeholder="userRole" name="userRole"/>
        <label for="userRole">UserRole</label>
        <%--<form:errors path="serviceDescription" element="div" cssClass="text-danger"/>--%>
    </div>
    <div class="form-floating mb-3 mt-3">
        <form:input type="file" class="form-control" path="file" id="file" 
                    placeholder="avatar" />
        <label for="file">Avatar</label>
    </div>
    <div class="form-floating mb-3 mt-3">
        <button class="btn btn-info mt-1" type="submit"> 
            <c:choose>
                <c:when test="${user.id != null}">
                    Cập Nhật User
                </c:when>
                <c:otherwise>
                    Thêm User
                </c:otherwise>
            </c:choose>
        </button>
    </div>
</form:form>
