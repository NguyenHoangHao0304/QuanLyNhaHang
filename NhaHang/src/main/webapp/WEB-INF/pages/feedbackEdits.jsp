<%-- 
    Document   : feedbackEdits
    Created on : Aug 30, 2023, 2:35:53 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<h1 class="text-center text-info mt-1">ĐÁNH GIÁ</h1>
<c:url value="/feedbacks" var="action" />
<form:form modelAttribute="feedback" method="post" action="${action}" enctype="multipart/form-data">
    <%--<form:errors path="*" element="div" cssClass="alert alert-danger"/>--%>

    <form:hidden path="id"/>
    <form:hidden path="userId" value="${feedback.userId.id}"/>
    <div class="form-floating mb-3 mt-3">
        <form:input type="text" class="form-control" path="feedbackDescription" id="feedbackDescription" 
                    placeholder="Mô Tả" name="feedbackDescription"/>
        <label for="feedbackDescription">Mô Tả</label>
    </div>
    <div class="form-floating mb-3 mt-3">
        <form:select class="form-select" id="branch" name="branch" path="branchId">
            <c:forEach items="${branchs}" var="b">
                <c:choose>
                    <c:when test="${b.id==feedback.branchId.id}">
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
    </div>
    <%--<div class="form-floating mb-3 mt-3">
        <form:select class="form-select" id="user" name="user" path="userId">
            <c:forEach items="${users}" var="u">
                <c:choose>
                    <c:when test="${u.id==booking.userId.id}">
                        <option value="${u.id}" selected>${u.username}</option>
                    </c:when>
                    <c:otherwise>
                        <option></option>
                        <option value="${u.id}">${u.username}</option>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </form:select>
        <label for="branch" class="form-label">User</label>
    </div>--%>
    <div class="form-floating mb-3 mt-3">
        <button class="btn btn-info mt-1" type="submit"> 
            <c:choose>
                <c:when test="${feedback.id != null}">
                    Cập Nhật Đánh Giá
                </c:when>
                <c:otherwise>
                    Thêm Đánh Giá
                </c:otherwise>
            </c:choose>
        </button>
    </div>
</form:form>
