<%-- 
    Document   : khoan-pm-char1
    Created on : Mar 24, 2021, 3:11:22 PM
    Author     : sonng
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script>
   function getLineChars () {

    //Get the context of the Chart canvas element we want to select
    var ctx = $("#line-chart");

    // Chart Options
    var chartOptions = {
        responsive: true,
        maintainAspectRatio: false,
        legend: {
            position: 'bottom',
        },
        hover: {
            mode: 'label'
        },
        scales: {
            xAxes: [{
                display: true,
                gridLines: {
                    color: "#f3f3f3",
                    drawTicks: false,
                },
                scaleLabel: {
                    display: true,
                    labelString: 'THÁNG'
                }
            }],
            yAxes: [{
                display: true,
                gridLines: {
                    color: "#f3f3f3",
                    drawTicks: false,
                },
                scaleLabel: {
                    display: true,
                    labelString: 'Số tiền'
                }
            }]
        },
        title: {
            display: true,
            text: 'Biểu đồ dữ liệu chi trả tiền thưởng theo tháng '
        }
    };

    // Chart Data
    var chartData = {
        labels: ["Tháng 1", "Tháng 2", " Tháng 3", "Tháng 4", "Tháng 5", "Tháng 6", "Tháng 7", "Tháng 8", "Tháng 9", "Tháng 10", "Tháng 11", "Tháng 12"],
        datasets: [{
            label: "Năm <%=strDateCharpm1%>",
            data: [<%=session.getAttribute("PMKhoanTotalCharForAll") %> ],
            fill: false,
            borderDash: [5, 5],
            borderColor: "#9C27B0",
            pointBorderColor: "#9C27B0",
            pointBackgroundColor: "#FFF",
            pointBorderWidth: 2,
            pointHoverBorderWidth: 2,
            pointRadius: 4,
        }, {
            label: "Năm <%=strDateCharpm2%>",
            data: [<%=session.getAttribute("PMKhoanTotalCharForAllYearPeve") %>],
            fill: false,
            borderDash: [5, 5],
            borderColor: "#00A5A8",
            pointBorderColor: "#00A5A8",
            pointBackgroundColor: "#FFF",
            pointBorderWidth: 2,
            pointHoverBorderWidth: 2,
            pointRadius: 4,
        }]
    };

    var config = {
        type: 'line',

        // Chart Options
        options : chartOptions,

        data : chartData
    };

    // Create the chart
    var lineChart = new Chart(ctx, config);
};
</script>