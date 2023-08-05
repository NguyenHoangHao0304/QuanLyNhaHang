<%-- 
    Document   : hallEdits
    Created on : Aug 4, 2023, 10:13:04 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<h1 class="text-center text-info mt-1">EDIT SẢNH CƯỚI</h1>
<c:url value="/halls" var="action" />
<form:form modelAttribute="hall" method="post" action="${action}" enctype="multipart/form-data">
    <%--<form:errors path="*" element="div" cssClass="alert alert-danger"/>--%>

    <form:hidden path="id"/>
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
    <div class="form-floating mb-3 mt-3">
        <form:input type="text" class="form-control" path="priceMorning" id="priceMorning" 
                    placeholder="Giá buổi sáng" name="priceMorning"/>
        <label for="priceMorning">Giá Buổi Sáng</label>
        <form:errors path="priceMorning" element="div" cssClass="text-danger"/>
    </div>
    <div class="form-floating mb-3 mt-3">
        <form:input type="text" class="form-control" path="priceAfternoon" id="priceAfternoon" 
                    placeholder="Giá buổi trưa" name="priceAfternoon"/>
        <label for="priceAfternoon">Giá Buổi Trưa</label>
        <form:errors path="priceAfternoon" element="div" cssClass="text-danger"/>
    </div>
    <div class="form-floating mb-3 mt-3">
        <form:input type="text" class="form-control" path="priceEvening" id="priceEvening" 
                    placeholder="Giá buổi Tối" name="priceEvening"/>
        <label for="priceEvening">Giá Buổi Tối</label>
        <form:errors path="priceEvening" element="div" cssClass="text-danger"/>
    </div>
    <div class="form-floating mb-3 mt-3">
        <form:input type="text" class="form-control" path="priceWeekend" id="priceWeekend" 
                    placeholder="Giá cuối tuần" name="priceWeekend"/>
        <label for="priceWeekend">Giá Cuối Tuần</label>
        <form:errors path="priceWeekend" element="div" cssClass="text-danger"/>
    </div>
    <div class="form-floating">
        <form:select class="form-select" id="branch" name="branch" path="branchId">
            <c:forEach items="${branchs}" var="b">
                <c:choose>
                    <c:when test="${b.id==hall.branchId.id}">
                        <option value="${b.id}" selected>${b.branchName}</option>
                    </c:when>
                    <c:otherwise>
                        <option value="${b.id}">${b.branchName}</option>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </form:select>
        <label for="branch" class="form-label">Chi Nhánh</label>
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
