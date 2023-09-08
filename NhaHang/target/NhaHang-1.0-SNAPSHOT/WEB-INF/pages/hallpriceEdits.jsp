<%-- 
    Document   : hallpriceEdits
    Created on : Aug 29, 2023, 2:02:48 PM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<h1 class="text-center text-info mt-1">QUẢN LÝ SẢNH CƯỚI</h1>
<c:url value="/halls/hallprices" var="action" />
<form:form modelAttribute="hallprice" method="post" action="${action}" enctype="multipart/form-data">
    <%--<form:errors path="*" element="div" cssClass="alert alert-danger"/>--%>

    <form:hidden path="id"/>
    <div class="form-floating mb-3 mt-3">
        <form:input type="text" class="form-control" path="timePeriod" id="timePeriod" 
                    placeholder="Buổi" name="timePeriod"/>
        <label for="timePeriod">Buổi</label>
    </div>
    <div class="form-floating mb-3 mt-3">
        <form:input type="text" class="form-control" path="timeStart" id="timeStart" 
                    placeholder="Từ" name="timeStart"/>
        <label for="timeStart">Từ</label>
    </div>
    <div class="form-floating mb-3 mt-3">
        <form:input type="text" class="form-control" path="timeEnd" id="timeEnd" 
                    placeholder="Đến" name="timeEnd"/>
        <label for="timeEnd">Đến</label>
    </div>
    <div class="form-floating mb-3 mt-3">
        <form:input type="text" class="form-control" path="price" id="price" 
                    placeholder="Giá" name="price"/>
        <label for="price">Giá</label>
    </div>
    <div class="form-floating">
        <form:select class="form-select" id="hall" name="hall" path="hallId">
            <c:forEach items="${halls}" var="h">
                <c:choose>
                    <c:when test="${h.id==hallprice.hallId.id}">
                        <option value="${h.id}" selected>${h.hallName}, ${h.branchId.branchName}</option>
                    </c:when>
                    <c:otherwise>
                        <option></option>
                        <option value="${h.id}">${h.hallName}, ${h.branchId.branchName}</option>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </form:select>
        <label for="hall" class="form-label">Sảnh</label>
    </div>
    <div class="form-floating mb-3 mt-3">
        <button class="btn btn-info mt-1" type="submit"> 
            <c:choose>
                <c:when test="${hallprice.id != null}">
                    Cập Nhật Giá 
                </c:when>
                <c:otherwise>
                    Thêm Giá
                </c:otherwise>
            </c:choose>
        </button>
    </div>
</form:form>
