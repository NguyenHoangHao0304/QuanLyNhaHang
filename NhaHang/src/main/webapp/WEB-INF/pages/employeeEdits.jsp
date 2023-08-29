<%-- 
    Document   : employeeEdits
    Created on : Aug 6, 2023, 10:46:10 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<h1 class="text-center text-info mt-1">QUẢN LÝ NHÂN VIÊN</h1>
<c:url value="/admin/employees" var="action" />
<form:form modelAttribute="employee" method="post" action="${action}" enctype="multipart/form-data">
    <%--<form:errors path="*" element="div" cssClass="alert alert-danger"/>--%>

    <form:hidden path="id"/>
    <div class="form-floating mb-3 mt-3">
        <form:input type="text" class="form-control" path="firstName" id="firstName" 
                    placeholder="Họ" name="firstName"/>
        <label for="firstName">Họ</label>
        <form:errors path="firstName" element="div" cssClass="text-danger"/>
    </div>
    <div class="form-floating mb-3 mt-3">
        <form:input type="text" class="form-control" path="lastName" id="lastName" 
                    placeholder="Tên" name="lastName"/>
        <label for="lastName">Tên</label>
        <form:errors path="lastName" element="div" cssClass="text-danger"/>
    </div>
    <div class="form-floating mb-3 mt-3">
        <form:input type="text" class="form-control" path="phone" id="phone" 
                    placeholder="Số điện thoại" name="phone"/>
        <label for="phone">Số Điện Thoại</label>
        <form:errors path="phone" element="div" cssClass="text-danger"/>
    </div>
    <div class="form-floating mb-3 mt-3">
        <form:input type="text" class="form-control" path="email" id="email" 
                    placeholder="Email" name="email"/>
        <label for="email">Email</label>
        <form:errors path="email" element="div" cssClass="text-danger"/>
    </div>
    <div class="form-floating">
        <form:select class="form-select" id="branch" name="branch" path="branchId">
            <c:forEach items="${branchs}" var="b">
                <c:choose>
                    <c:when test="${b.id == employee.branchId.id}">
                        <option value="${b.id}" selected>${b.branchName}</option>
                    </c:when>
                    <c:otherwise>
                        <option> </option>
                        <option value="${b.id}">${b.branchName}</option>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </form:select>
        <label for="branch" class="form-label">Chi Nhánh</label>
        <form:errors path="branchId" element="div" cssClass="text-danger"/>
    </div>
    <div class="form-floating mb-3 mt-3">
        <button class="btn btn-info mt-1" type="submit"> 
            <c:choose>
                <c:when test="${employee.id != null}">
                    Cập Nhật Nhân Viên
                </c:when>
                <c:otherwise>
                    Thêm Nhân Viên
                </c:otherwise>
            </c:choose>
        </button>
    </div>
</form:form>
