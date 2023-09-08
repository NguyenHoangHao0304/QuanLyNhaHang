<%-- 
    Document   : manage-feedbacks
    Created on : Sep 4, 2023, 12:36:55 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:url value="/user/feedbacks" var="feedbackAction" />
<section class="container">
    <h1 class="text-center text-primary mt-1"> ĐÁNH GIÁ </h1>
    <%--<sec:authorize access="hasRole('ROLE_CUSTOMER')"> 
        <div>
            <a href="<c:url value="/user/feedbacks/create"/>" class="btn btn-warning mt-1">Đánh Giá</a>
        </div>
    </sec:authorize>--%>
    <sec:authorize access="hasRole('ROLE_CUSTOMER')"> 
        <div>
            <a href="<c:url value="/branchs"/>" class="btn btn-warning mt-1">Quay Lại</a>
        </div>
    </sec:authorize>
    <c:if test="${counter > 1}">
        <ul class="pagination mt-1">
            <li class="page-item"><a class="page-link" href="${feedbackAction}">Tất cả</a></li>
                <c:forEach begin="1" end="${counter}" var="i">
                    <c:url value="/user/feedbacks" var="pageFeedbackAction" >
                        <c:param name="page" value="${i}"/>
                    </c:url>
                <li class="page-item"><a class="page-link" href="${pageFeedbackAction}">${i}</a></li>
                </c:forEach>
        </ul>
    </c:if>
    <table class="table table-hover">
        <thead>
            <tr>
                <th>Id</th>
                <th>Mô tả</th>
                <th>Chi Nhánh</th>
                <th>Tài Khoản</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${userfeedback}" var="usf">
                <tr>
                    <td>${usf.id}</td>
                    <td>${usf.feedbackDescription}</td>
                    <td>${usf.branchId.branchName}</td>
                    <td>${usf.userId.username}</td>
                    <sec:authorize access="hasRole('ROLE_CUSTOMER')"> 
                        <td>
                            <c:url value="/user/feedbacks/${usf.id}" var="api"/>
                            <c:url value="/api/user/feedbacks/${usf.id}" var="apiDlt"/>
                            <a href="${api}" class="btn btn-success">Cập Nhật</a>
                            <button class="btn btn-danger" onclick="Delete('${apiDlt}')">Xóa</button>
                        </td>
                    </sec:authorize>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</section>
<script src="<c:url value="/js/delete.js"/>"></script>
