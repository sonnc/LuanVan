<%-- 
    Document   : khoan-char1
    Created on : Mar 24, 2021, 10:36:24 AM
    Author     : sonng
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script>
    function getLineChars() {

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
                            labelString: 'Tháng'
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
                text: 'EMV DATA'
            }
        };

        // Chart Data
        var chartData = {
            labels: <%=session.getAttribute("labels")%>,
            datasets: [{
                    label: "PV",
                    data: <%=session.getAttribute("pv")%>,
                    fill: false,
                    borderColor: "blue",
                    pointBorderColor: "#9C27B0",
                    pointBackgroundColor: "#FFF",
                    pointBorderWidth: 2,
                    pointHoverBorderWidth: 2,
                }, {
                    label: "EV",
                    data: <%=session.getAttribute("ev")%>,
                    fill: false,
                    borderColor: "green",
                    pointBorderColor: "#00A5A8",
                    pointBackgroundColor: "#FFF",
                }, {
                    label: "AV",
                    data: <%=session.getAttribute("av")%>,
                    lineTension: 0,
                    fill: false,
                    borderColor: "red",
                    pointBorderColor: "#FF7D4D",
                    pointBackgroundColor: "#FFF",
                    pointBorderWidth: 2,
                    pointHoverBorderWidth: 2,
                }, {
                    label: "Est",
                    data: <%=session.getAttribute("etc")%>,
                    lineTension: 0,
                    fill: false,
                    borderDash: [5, 5],
                    borderColor: "black",
                    pointBorderColor: "#FF7D4D",
                    pointBackgroundColor: "#FFF",
                    pointBorderWidth: 2,
                    pointHoverBorderWidth: 2,
                }]
        };

        var config = {
            type: 'line',

            // Chart Options
            options: chartOptions,

            data: chartData
        };

        // Create the chart
        var lineChart = new Chart(ctx, config);
    }
    ;
</script>