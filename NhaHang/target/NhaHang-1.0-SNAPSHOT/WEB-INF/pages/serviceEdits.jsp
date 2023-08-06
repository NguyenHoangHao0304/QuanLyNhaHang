<%-- 
    Document   : serviceEdits
    Created on : Aug 6, 2023, 9:35:06 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<h1 class="text-center text-info mt-1">EDIT CHI NHÁNH</h1>
<c:url value="/services" var="action" />
<form:form modelAttribute="service" method="post" action="${action}" enctype="multipart/form-data">
    <%--<form:errors path="*" element="div" cssClass="alert alert-danger"/>--%>

    <form:hidden path="id"/>
    <form:hidden path="serviceImage"/>
    <div class="form-floating mb-3 mt-3">
        <form:input type="text" class="form-control" path="serviceName" id="serviceName" 
                    placeholder="Tên dịch vụ" name="serviceName"/>
        <label for="serviceName">Tên Dịch Vụ</label>
        <form:errors path="serviceName" element="div" cssClass="text-danger"/>
    </div>
    <div class="form-floating mb-3 mt-3">
        <form:input type="text" class="form-control" path="servicePrice" id="servicePrice" 
                    placeholder="Giá tiền" name="servicePrice"/>
        <label for="servicePrice">Giá tiền</label>
        <form:errors path="servicePrice" element="div" cssClass="text-danger"/>
    </div>
        <div class="form-floating mb-3 mt-3">
        <form:input type="text" class="form-control" path="serviceDescription" id="serviceDescription" 
                    placeholder="Mô tả" name="serviceDescription"/>
        <label for="serviceDescription">Mô tả</label>
        <form:errors path="serviceDescription" element="div" cssClass="text-danger"/>
    </div>
    <div class="form-floating mb-3 mt-3">
        <form:input type="file" class="form-control" path="file" id="file" 
                    placeholder="Ảnh món ăn" />
        <label for="file">Ảnh món ăn</label>
    </div>
    <div class="form-floating mb-3 mt-3">
        <button class="btn btn-info mt-1" type="submit"> 
            <c:choose>
                <c:when test="${service.id != null}">
                    Cập Nhật Dịch Vụ
                </c:when>
                <c:otherwise>
                    Thêm Dịch Vụ
                </c:otherwise>
            </c:choose>
        </button>
    </div>
</form:form>
