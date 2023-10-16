<%-- 
    Document   : statsBookingByBranch
    Created on : Sep 10, 2023, 11:28:24 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:url value="/admin/countBookingByBranch" var="statsAction" />

<section class="container">
    <h1 class="text-center text-primary mt-1"> THỐNG KÊ MẬT ĐỘ TIỆC</h1>
    <canvas id="bookingByBranchStatsChart" width="400" height="200"></canvas>
   <table class="table table-hover mt-5" border="1">
        <tr>
            <th>ID</th>
            <th>Branch Name</th>
            <th>Booking </th>
        </tr>
        <c:forEach items="${countBookingByBranchList}" var="row">
            <tr>
                <td>${row[0]}</td>
                <td>${row[1]}</td>
                <td>${row[2]}</td>
            </tr>
        </c:forEach>
    </table>
    <script>
        var BookingByBranchStats = [
        <c:forEach var="row" items="${countBookingByBranchList}" varStatus="loop">
        [
            <c:out value="${row[0]}" />,
                '<c:out value="${row[1]}" />',
                '<c:out value="${row[2]}" />',
                
        ]<c:if test="${!loop.last}">,</c:if>
        </c:forEach>
        ];

        var labels = BookingByBranchStats.map(function (stat) {
            return stat[1];
        });

        var bookingCounts = BookingByBranchStats.map(function (stat) {
            return stat[2];
        });

        var ctx = document.getElementById('bookingByBranchStatsChart').getContext('2d');

        var chart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: labels,
                datasets: [{
                        label: 'Mật độ tiệc',
                        backgroundColor: 'rgba(75, 192, 192, 0.2)',
                        borderColor: 'rgba(75, 192, 192, 1)',
                        borderWidth: 1,
                        data: bookingCounts,
                    }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    </script>
</section>
