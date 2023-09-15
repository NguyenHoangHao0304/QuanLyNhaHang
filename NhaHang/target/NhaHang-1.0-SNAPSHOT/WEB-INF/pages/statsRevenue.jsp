<%-- 
    Document   : statsRevenue
    Created on : Sep 10, 2023, 11:28:07 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:url value="/admin/statsRevenue" var="statsAction" />
<section class="container">
    <h1 class="text-center text-primary mt-1"> THỐNG KÊ DOANH THU</h1>
    <canvas id="statsRevenueChart" width="400" height="200"></canvas>

    <table class="table table-hover" border="1">
        <thead>
            <tr>
                <th>ID</th>
                <th>Chi Nhánh</th>
                <th>Năm</th>
                <th>Quý</th>
                <th>Tháng</th>
                <th>Doanh Thu</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="row" items="${statsRevenueList}">
                <tr>
                    <td>${row[0]}</td>
                    <td>${row[1]}</td>
                    <td>${row[2]}</td>
                    <td>${row[3]}</td>
                    <td>${row[4]}</td>
                    <td>${row[5]} VNĐ</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <script>
        var StatsRevenue = [
        <c:forEach var="row" items="${statsRevenueList}" varStatus="loop">
        [
                <c:out value="${row[0]}" />,
                '<c:out value="${row[1]}" />',
                '<c:out value="${row[2]}" />',
                '<c:out value="${row[3]}" />',
                '<c:out value="${row[4]}" />',
                '<c:out value="${row[5]}" />',
        ]<c:if test="${!loop.last}">,</c:if>
        </c:forEach>
        ];

        var labels = StatsRevenue.map(function (row) {
            return row[1] + ' - Năm ' + row[2] + ' - Quý ' + row[3] + ' - Tháng' + row[4];
        });

        var Revenue = StatsRevenue.map(function (row) {
            return row[5];
        });

        var ctx = document.getElementById('statsRevenueChart').getContext('2d');

        var chart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: labels,
                datasets: [{
                        label: 'Doanh Thu',
                        backgroundColor: 'rgba(75, 192, 192, 0.2)',
                        borderColor: 'rgba(75, 192, 192, 1)',
                        borderWidth: 1,
                        data: Revenue
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
