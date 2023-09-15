<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:url value="/admin/countHallStats" var="statsAction" />
<section class="container">
    <h1 class="text-center text-primary mt-1"> THỐNG KÊ MẬT ĐỘ SỬ DỤNG SẢNH</h1>
    <canvas id="hallStatsChart" width="400" height="200"></canvas>

    <table class="table table-hover" border="1">
        <tr>
            <th>ID</th>
            <th>Sảnh</th>
            <th>Chi Nhánh</th>
            <th>Năm</th>
            <th>Quý</th>
            <th>Tháng</th>
            <th>Booking</th>
        </tr>
        <c:forEach var="row" items="${countHallStatsList}">
            <tr>
                <td><c:out value="${row[0]}" /></td>
                <td><c:out value="${row[1]}" /></td>
                <td><c:out value="${row[2]}" /></td>
                <td><c:out value="${row[3]}" /></td>
                <td><c:out value="${row[4]}" /></td>
                <td><c:out value="${row[5]}" /></td>
                <td><c:out value="${row[6]}" /></td>
            </tr>
        </c:forEach>
    </table>

    <script>
        var countHallStats = [
        <c:forEach var="row" items="${countHallStatsList}" varStatus="loop">
        [
            <c:out value="${row[0]}" />,
                '<c:out value="${row[1]}" />',
                '<c:out value="${row[2]}" />',
                '<c:out value="${row[3]}" />',
                '<c:out value="${row[4]}" />',
                '<c:out value="${row[5]}" />',
                '<c:out value="${row[6]}" />'
        ]<c:if test="${!loop.last}">,</c:if>
        </c:forEach>
        ];

        var labels = countHallStats.map(function (row) {
            return row[1] + ' - Năm ' + row[3] + ' - Quý ' + row[4] + ' - Tháng ' + row[5];
        });

        var bookingCounts = countHallStats.map(function (row) {
            return row[6];
        });

        var ctx = document.getElementById('hallStatsChart').getContext('2d');

        var chart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: labels,
                datasets: [{
                        label: 'Số lượng đặt sảnh',
                        backgroundColor: 'rgba(75, 192, 192, 0.2)',
                        borderColor: 'rgba(75, 192, 192, 1)',
                        borderWidth: 1,
                        data: bookingCounts
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
