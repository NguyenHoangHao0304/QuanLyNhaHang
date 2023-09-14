<%-- 
    Document   : statsBookingByBranch
    Created on : Sep 10, 2023, 11:28:24 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:url value="/countBookingByBranch" var="statsAction" />
<section class="container">
    <h1 class="text-center text-primary mt-1"> THỐNG KÊ</h1>
   <table>
        <tr>
            <th>Branch ID</th>
            <th>Branch Name</th>
            <th>Booking Count</th>
        </tr>
        <c:forEach items="${countBookingByBranchList}" var="row">
            <tr>
                <td>${row[0]}</td>
                <td>${row[1]}</td>
                <td>${row[2]}</td>
            </tr>
        </c:forEach>
    </table>
</section>
