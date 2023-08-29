<%-- 
    Document   : foodEdits
    Created on : Aug 6, 2023, 4:48:16 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<h1 class="text-center text-info mt-1">QUẢN LÝ MÓN ĂN</h1>
<c:url value="/foods" var="action" />
<form:form modelAttribute="food" method="post" action="${action}" enctype="multipart/form-data">
    <%--<form:errors path="*" element="div" cssClass="alert alert-danger"/>--%>

    <form:hidden path="id"/>
    <form:hidden path="foodImage"/>
    <div class="form-floating mb-3 mt-3">
        <form:input type="text" class="form-control" path="foodName" id="foodName" 
                    placeholder="Tên món ăn" name="foodName"/>
        <label for="foodName">Tên Món Ăn</label>
        <form:errors path="foodName" element="div" cssClass="text-danger"/>
    </div>
    <div class="form-floating mb-3 mt-3">
        <form:input type="text" class="form-control" path="foodPrice" id="foodPrice" 
                    placeholder="Giá tiền" name="foodPrice"/>
        <label for="foodPrice">Giá tiền</label>
        <form:errors path="foodPrice" element="div" cssClass="text-danger"/>
    </div>
    <div class="form-floating mb-3 mt-3">
        <form:input type="file" class="form-control" path="file" id="file" 
                    placeholder="Ảnh món ăn" />
        <label for="file">Ảnh món ăn</label>
    </div>
    <div class="form-floating mb-3 mt-3">
        <button class="btn btn-info mt-1" type="submit"> 
            <c:choose>
                <c:when test="${food.id != null}">
                    Cập Nhật Món Ăn
                </c:when>
                <c:otherwise>
                    Thêm Món Ăn
                </c:otherwise>
            </c:choose>
        </button>
    </div>
</form:form>
