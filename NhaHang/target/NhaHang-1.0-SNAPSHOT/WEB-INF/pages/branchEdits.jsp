<%-- 
    Document   : branchEdits
    Created on : Aug 5, 2023, 5:30:41 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<h1 class="text-center text-info mt-1">QUẢN LÝ CHI NHÁNH</h1>
<c:url value="/branchs" var="action" />
<form:form modelAttribute="branch" method="post" action="${action}" enctype="multipart/form-data">
    <%--<form:errors path="*" element="div" cssClass="alert alert-danger"/>--%>

    <form:hidden path="id"/>
    <div class="form-floating mb-3 mt-3">
        <form:input type="text" class="form-control" path="branchName" id="branchName" 
                    placeholder="Tên chi nhánh" name="branchName"/>
        <label for="branchName">Tên Chi Nhánh</label>
        <form:errors path="branchName" element="div" cssClass="text-danger"/>
    </div>
    <div class="form-floating mb-3 mt-3">
        <form:input type="text" class="form-control" path="branchAddress" id="branchAddress" 
                    placeholder="Địa Chỉ" name="branchAddress"/>
        <label for="branchAddress">Địa Chỉ</label>
        <form:errors path="branchAddress" element="div" cssClass="text-danger"/>
    </div>
    <div class="form-floating mb-3 mt-3">
        <button class="btn btn-info mt-1" type="submit"> 
            <c:choose>
                <c:when test="${branch.id != null}">
                    Cập Nhật Chi Nhánh
                </c:when>
                <c:otherwise>
                    Thêm Chi Nhánh
                </c:otherwise>
            </c:choose>
        </button>
    </div>
</form:form>
