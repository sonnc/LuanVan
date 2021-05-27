<%-- 
    Document   : khoan-char1
    Created on : Mar 24, 2021, 10:36:24 AM
    Author     : sonng
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Date dateChar = new Date();
    SimpleDateFormat formatterchar = new SimpleDateFormat("yyyy");
    String strDateChar = formatterchar.format(dateChar);
    int varYearperiod = Integer.parseInt(strDateChar)-1;
%>
<script>
    function getBarChars() {

        //Get the context of the Chart canvas element we want to select
        var ctx = $("#column-chart");

        // Chart Options
        var chartOptions = {
            // Elements options apply to all of the options unless overridden in a dataset
            // In this case, we are setting the border of each bar to be 2px wide and green
            elements: {
                rectangle: {
                    borderWidth: 2,
                    borderColor: 'rgb(0, 255, 0)',
                    borderSkipped: 'bottom'
                }
            },
            responsive: true,
            maintainAspectRatio: false,
            responsiveAnimationDuration: 500,
            legend: {
                position: 'top',
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
                        }
                    }]
            },
            title: {
                display: true,
                text: 'Thống kê tổng thưởng theo tháng'
            }
        };

        // Chart Data
        var chartData = {
            labels: ["Tháng 1", "Tháng 2", " Tháng 3", "Tháng 4", "Tháng 5", "Tháng 6", "Tháng 7", "Tháng 8", "Tháng 9", "Tháng 10", "Tháng 11", "Tháng 12"],
            datasets: [{
                    label: "Năm <%=varYearperiod%>",
                    data: [<%=session.getAttribute("KhoanTotalCharPerve")%>],
                    backgroundColor: "#F98E76",
                    hoverBackgroundColor: "rgba(249,142,118,.9)",
                    borderColor: "transparent"
                },{
                    label: "Năm <%=strDateChar%>",
                    data: [<%=session.getAttribute("KhoanTotalChar")%>],
                    backgroundColor: "#28D094",
                    hoverBackgroundColor: "rgba(22,211,154,.9)",
                    borderColor: "transparent"
                },  {
                    label: "Trung bình phòng ban/ đơn vị",
                    data: [<%=session.getAttribute("KhoanTotalCharTB")%>],
                    backgroundColor: "#FF4961",
                    hoverBackgroundColor: "#FF4964",
                    borderColor: "transparent"
                }]
        };

        var config = {
            type: 'bar',

            // Chart Options
            options: chartOptions,

            data: chartData
        };

        // Create the chart
        var lineChart = new Chart(ctx, config);
    }
    ;
</script>