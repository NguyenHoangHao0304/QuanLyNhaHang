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
    <div class="row mt-5">
        <div class="col-lg-4 col-4">
            <strong><label for="filterYear">Chọn năm:</label></strong>
            <select id="filterYear" onchange="applyFilter()">
                <option value="">Tất cả</option>
                <option value="2022">2022</option>
                <option value="2023">2023</option>
                <option value="2024">2024</option>
            </select>
        </div>

        <div class="col-lg-4 col-4">
            <strong><label for="filterQuarter">Chọn quý:</label></strong>
            <select id="filterQuarter" onchange="applyFilter()">
                <option value="">Tất cả</option>
                <option value="1">Quý 1</option>
                <option value="2">Quý 2</option>
                <option value="3">Quý 3</option>
                <option value="4">Quý 4</option>
            </select>
        </div>

        <div class="col-lg-4 col-4">
            <strong><label for="filterMonth">Chọn tháng:</label></strong>
            <select id="filterMonth" onchange="applyFilter()">
                <option value="">Tất cả</option>
                <option value="1">Tháng 1</option>
                <option value="2">Tháng 2</option>
                <option value="3">Tháng 3</option>
                <option value="4">Tháng 4</option>
                <option value="5">Tháng 5</option>
                <option value="6">Tháng 6</option>
                <option value="7">Tháng 7</option>
                <option value="8">Tháng 8</option>
                <option value="9">Tháng 9</option>
                <option value="10">Tháng 10</option>
                <option value="11">Tháng 11</option>
                <option value="12">Tháng 12</option>
            </select>
        </div>
    </div>
    <div class="mt-5" style="height: 500px; width: auto">
        <canvas id="statsRevenueChart"></canvas>
    </div>
    <div >
        <table class="table table-hover mt-3" border="1" id="statsRevenueTable">
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
            <tbody >
                <c:forEach var="row" items="${statsRevenueList}">
                    <tr>
                        <td><c:out value="${row[0]}" /></td>
                        <td><c:out value="${row[1]}" /></td>
                        <td><c:out value="${row[2]}" /></td>
                        <td><c:out value="${row[3]}" /></td>
                        <td><c:out value="${row[4]}" /></td>
                        <td><c:out value="${row[5]}" /></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <script>

        var originalStatsRevenue = [
        <c:forEach items="${statsRevenueList}" var="statsData" varStatus="loop">
            [<c:out value="${statsData[0]}" />,
                    '<c:out value="${statsData[1]}" />',
                    '<c:out value="${statsData[2]}" />',
                    '<c:out value="${statsData[3]}" />',
                    '<c:out value="${statsData[4]}" />',
                    '<c:out value="${statsData[5]}" />'],
        </c:forEach>
        ];

        function applyFilter() {
            var selectedYear = document.getElementById('filterYear').value;
            var selectedQuarter = document.getElementById('filterQuarter').value;
            var selectedMonth = document.getElementById('filterMonth').value;

            var filteredStatsRevenue = originalStatsRevenue.filter(function (row) {
                if (selectedYear && row[2] !== selectedYear) {
                    return false;
                }
                if (selectedQuarter && row[3] !== selectedQuarter) {
                    return false;
                }
                if (selectedMonth && row[4] !== selectedMonth) {
                    return false;
                }
                return true;
            });
            updateChart(filteredStatsRevenue);
        }

        function updateChart(data) {
            var labels = data.map(function (row) {
                return row[1] + ' - Năm ' + row[2] + ' - Quý ' + row[3] + ' - Tháng ' + row[4];
            });

            var Revenue = data.map(function (row) {
                return row[5];
            });

            var ctx = document.getElementById('statsRevenueChart').getContext('2d');

            if (window.myChart) {
                window.myChart.destroy();
            }

            window.myChart = new Chart(ctx, {
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
        }
        applyFilter();
    </script>
</section>
