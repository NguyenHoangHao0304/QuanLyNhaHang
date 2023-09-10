<%-- 
    Document   : branchs
    Created on : Aug 5, 2023, 1:08:35 PM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:url value="/branchs" var="branchAction" />
<section class="container">
    <h1 class="text-center text-primary mt-1"> CHI NHÁNH</h1>
    <sec:authorize access="hasRole('ROLE_ADMIN')"> 
        <div>
            <a href="<c:url value="/admin/branchs/create"/>" class="btn btn-warning mt-1">Thêm chi nhánh</a>
        </div>
    </sec:authorize>
    <sec:authorize access="hasRole('ROLE_CUSTOMER')"> 
        <div>
        <td>
            <a href="<c:url value="/user/feedbacks/create"/>" class="btn btn-success">Thêm Đánh Giá</a>
        </td
        <td>
            <a href="<c:url value="/user/feedbacks"/>" class="btn btn-success">Quản Lý Đánh Giá Của Bạn</a>
        </td
        </div>
    </sec:authorize>
    <c:if test="${counter > 1}">
        <ul class="pagination mt-1">
            <li class="page-item"><a class="page-link" href="${branchAction}">Tất cả</a></li>
                <c:forEach begin="1" end="${counter}" var="i">
                    <c:url value="/branchs" var="pageBranchAction" >
                        <c:param name="page" value="${i}"/>
                    </c:url>
                <li class="page-item"><a class="page-link" href="${pageBranchAction}">${i}</a></li>
                </c:forEach>
        </ul>
    </c:if>
    <table class="table table-hover">
        <thead>
            <tr>
                <th>Id</th>
                <th>Tên Chi Nhánh</th>
                <th>Địa Chỉ</th>
                <th>Sảnh</th>
                    <sec:authorize access="hasRole('ROLE_ADMIN')"> 
                    <th>Nhân Viên</th>
                    </sec:authorize>
                <th>Đánh Giá</th>
                <th></th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${branch}" var="b">
                <tr>
                    <td>${b.id}</td>
                    <td>${b.branchName}</td>
                    <td>${b.branchAddress}</td>
                    <td>
                        <%--<select class="form-select">
                            <c:forEach items="${halls}" var="h">
                                <c:choose>
                                    <c:when test="${h.branchId.id == b.id}">
                                        <option value="${h.branchId.id}">${h.hallName}</option>
                                    </c:when>
                                    <c:otherwise></c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </select>--%>
                        <ul class="list-group list-group-flush">
                            <c:forEach items="${halls}" var="h">
                                <c:choose>
                                    <c:when test="${h.branchId.id == b.id}">
                                        <li class="list-group-item" value="${h.branchId.id}">${h.hallName}</li>
                                        </c:when>
                                        <c:otherwise></c:otherwise>
                                    </c:choose>
                                </c:forEach>
                        </ul>
                    </td>
                    <sec:authorize access="hasRole('ROLE_ADMIN')"> 
                        <td>
                            <ul class="list-group list-group-flush">
                                <c:forEach items="${employees}" var="e">
                                    <c:choose>
                                        <c:when test="${e.branchId.id == b.id}">
                                            <li class="list-group-item" value="${e.branchId.id}">${e.firstName} ${e.lastName}</li>
                                            </c:when>
                                            <c:otherwise></c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                            </ul>
                        </td>
                    </sec:authorize>
                    <td>
                        <ul class="list-group list-group-flush">
                            <c:forEach items="${feedbacks}" var="f">
                                <c:choose>
                                    <c:when test="${f.branchId.id == b.id}">
                                        <li class="list-group-item" value="${f.branchId.id}">${f.feedbackDescription} ---------- By: ${f.userId.username}</li>
                                        </c:when>
                                        <c:otherwise></c:otherwise>
                                    </c:choose>
                                </c:forEach>
                        </ul>
                    </td>

                    <sec:authorize access="hasRole('ROLE_ADMIN')"> 
                        <td>
                            <c:url value="/admin/branchs/${b.id}" var="api"/>
                            <c:url value="/api/branchs/${b.id}" var="apiDlt"/>
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