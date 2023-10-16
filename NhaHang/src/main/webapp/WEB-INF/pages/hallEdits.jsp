<%-- 
    Document   : hallEdits
    Created on : Aug 4, 2023, 10:13:04 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<h1 class="text-center text-info mt-1">QUẢN LÝ SẢNH TIỆC</h1>
<c:url value="/halls" var="action" />
<form:form modelAttribute="hall" method="post" action="${action}" enctype="multipart/form-data">
    <%--<form:errors path="*" element="div" cssClass="alert alert-danger"/>--%>

    <form:hidden path="id"/>
    <form:hidden path="hallImage"/>
    <div class="form-floating mb-3 mt-3">
        <form:input type="text" class="form-control" path="hallName" id="hallName" 
                    placeholder="Tên sảnh" name="hallName"/>
        <label for="name">Tên Sảnh</label>
        <form:errors path="hallName" element="div" cssClass="text-danger"/>
    </div>
    <div class="form-floating mb-3 mt-3">
        <form:input type="text" class="form-control" path="capacity" id="capacity" 
                    placeholder="Sức chứa" name="capacity"/>
        <label for="capacity">Sức Chứa</label>
        <form:errors path="capacity" element="div" cssClass="text-danger"/>
    </div>
    <div class="form-floating">
        <form:select class="form-select" id="branch" name="branch" path="branchId">
            <c:forEach items="${branchs}" var="b">
                <c:choose>
                    <c:when test="${b.id==hall.branchId.id}">
                        <option value="${b.id}" selected>${b.branchName}</option>
                    </c:when>
                    <c:otherwise>
                        <option></option>
                        <option value="${b.id}">${b.branchName}</option>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </form:select>
        <label for="branch" class="form-label">Chi Nhánh</label>
        <form:errors path="branchId" element="div" cssClass="text-danger"/>
    </div>
    <div class="form-floating mb-3 mt-3">
        <form:input type="file" class="form-control" path="file" id="file" 
                    placeholder="Ảnh Sảnh" />
        <label for="file">Ảnh Sảnh</label>
    </div>
    <div class="form-floating mb-3 mt-3">
        <button class="btn btn-info mt-1" type="submit"> 
            <c:choose>
                <c:when test="${hall.id != null}">
                    Cập Nhật Sảnh
                </c:when>
                <c:otherwise>
                    Thêm Sảnh
                </c:otherwise>
            </c:choose>
        </button>
    </div>
</form:form>
