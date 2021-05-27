<%-- 
    Document   : home
    Created on : Feb 18, 2021, 2:43:15 PM
    Author     : sonng
--%>

<%@page import="java.util.Properties"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            session.removeAttribute("CssAndJs");
            session.setAttribute("CssAndJs", "home-dashboard");
            String dataOld = (String) session.getAttribute("dataOld");
            String dataNew = (String) session.getAttribute("dataNew");
            String dataSuccess1 = (String) session.getAttribute("dataSuccess1");
            String dataSuccess2 = (String) session.getAttribute("dataSuccess2");
            String dataTreHan1 = (String) session.getAttribute("dataTreHan1");
            String dataTreHan2 = (String) session.getAttribute("dataTreHan2");
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lý công việc</title>
        <%@include file="/jsp/header.jsp" %>
        <%@include file="/jsp/linkCss.jsp" %>
    </head>
    <body class="vertical-layout vertical-menu content-detached-right-sidebar   menu-expanded fixed-navbar"
          data-open="click" data-menu="vertical-menu" data-col="content-detached-right-sidebar">
        <!-- fixed-top-->
        <%@include file="/jsp/nav.jsp" %>
        <!-- ////////////////////////////////////////////////////////////////////////////-->

        <div class="app-content content">
            <div class="content-wrapper">
                  <%@include file="/jsp/displayWarring.jsp" %>
                <div class="content-header row">
                </div>
                <div class="content-body">
                    <!-- Revenue, Hit Rate & Deals -->
                    <div class="row">
                        <div class="col-xl-6 col-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">Dữ liệu thực hiện 2 tuần</h4>
                                    <a class="heading-elements-toggle"><i class="la la-ellipsis-v font-medium-3"></i></a>
                                    <div class="heading-elements">
                                        <ul class="list-inline mb-0">
                                            <li><a data-action="reload"><i class="ft-rotate-cw"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="card-content collapse show">
                                    <div class="card-body pt-0" >
                                        <div class="chartjs">
                                            <canvas  id="thisYearRevenue" width="400px" style="position: absolute; max-height: 250px; !important;"></canvas>
                                            <canvas id="lastYearRevenue" width="400px"  style="position: absolute; max-height: 250px; !important;"></canvas> 
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-6 col-12">
                            <div class="row">
                                <div class="col-lg-6 col-12">
                                    <div class="card pull-up">
                                        <div class="card-header bg-hexagons">
                                            <h4 class="card-title">Tỷ lệ hoàn thành công việc

                                            </h4>
                                            <a class="heading-elements-toggle"><i class="la la-ellipsis-v font-medium-3"></i></a>
                                            <div class="heading-elements">
                                                <ul class="list-inline mb-0">
                                                    <li><a data-action="reload"><i class="ft-rotate-cw"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="card-content collapse show bg-hexagons">
                                            <div class="card-body pt-0">
                                                <div class="chartjs">
                                                    <canvas id="hit-rate-doughnut"  height="230"></canvas>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-12">
                                    <div class="card pull-up">
                                        <div class="card-content collapse show bg-gradient-directional-danger ">
                                            <div class="card-body bg-hexagons-danger">
                                                <h4 class="card-title white">Tỷ lệ trễ hạn
                                                </h4>
                                                <div class="chartjs">
                                                    <canvas id="deals-doughnut" height="230"></canvas>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--                            <div class="row">
                                                            <div class="col-lg-6 col-12">
                                                                <div class="card pull-up">
                                                                    <div class="card-content">
                                                                        <div class="card-body">
                                                                            <div class="media d-flex">
                                                                                <div class="media-body text-left">
                                                                                    <h6 class="text-muted">Tổng thu nhập khoán tháng này </h6>
                                                                                    <h3>$ 88,568</h3>
                                                                                </div>
                                                                                <div class="align-self-center">
                                                                                    <i class="icon-trophy warning font-large-2 float-right"></i>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-6 col-12">
                                                                <div class="card pull-up">
                                                                    <div class="card-content">
                                                                        <div class="card-body">
                                                                            <div class="media d-flex">
                                                                                <div class="media-body text-left">
                                                                                    <h6 class="text-muted">Chỉ số KPI</h6>
                                                                                    <h3>3,568</h3>
                                                                                </div>
                                                                                <div class="align-self-center">
                                                                                    <i class="icon-star danger font-large-2 float-right"></i>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>-->
                        </div>
                    </div>
                    <div class="row">
                        <div id="recent-sales" class="col-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">Danh sách công việc, nhiệm vụ mới</h4>
                                    <a class="heading-elements-toggle"><i class="la la-ellipsis-v font-medium-3"></i></a>
                                    <div class="heading-elements">
                                        <ul class="list-inline mb-0">

                                        </ul>
                                    </div>
                                </div>
                                <div class="card-content mt-1">
                                    <div class="table-responsive">
                                        <table class="table table-striped table-bordered zero-configuration hiden">
                                            <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Tên công việc</th>
                                                    <th>Người thực hiện</th>
                                                    <th>Ngày bắt đầu</th>
                                                    <th>Hạn kết thúc</th>
                                                    <th>Mức độ</th>
                                                    <th>Trạng thái</th>
                                                    <th>Estimate</th>
                                                    <th>Kiểm tra</th>
                                                    <th>Chức năng</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <s:iterator value="lstTaskCustoms" var="test">
                                                    <tr>
                                                        <td><s:property value="task.id"/></td>
                                                        <td><s:property value="task.taskName"/></td>
                                                        <td><s:property value="assigneeUser.fullName"/></td>
                                                        <td><s:property value="task.startDate"/></td>
                                                        <td><s:property value="task.dueDate"/></td>
                                                        <td>
                                                            <s:if test="%{#test.task.priority = '1'}">
                                                                <span class="la la-flag" style="color: red">Cao</span>
                                                            </s:if>
                                                            <s:elseif test="%{#test.task.priority = '2'}">
                                                                <span class="la la-flag" style="color: #ffc107">Trung bình</span>
                                                            </s:elseif>
                                                            <s:else>
                                                                <span class="la la-flag" style="color: green">Cao</span>
                                                            </s:else>
                                                        </td>
                                                        <td>
                                                            <s:if test="%{#test.task.status == 'OPEN'}">
                                                                <span style="color: green">Mở</span>
                                                            </s:if>
                                                            <s:elseif test="%{#test.task.status == 'INPROCESS'}">
                                                                <span style="color: #ffc107">Đang xử lý</span>
                                                            </s:elseif>
                                                            <s:elseif test="%{#test.task.status == 'COMPLETE'}">
                                                                <span style="color: blue">Hoàn thành, chờ duyệt</span>
                                                            </s:elseif>
                                                            <s:elseif test="%{#test.task.status == 'CLOSE'}">
                                                                <span style="color: darkviolet">Đóng</span>
                                                            </s:elseif>
                                                            <s:elseif test="%{#test.task.status == 'CANCEL'}">
                                                                <span style="color: red">Hủy bỏ</span>
                                                            </s:elseif>
                                                        </td>
                                                        <td><s:property value="task.timeEstimate"/></td>
                                                        <td><s:property value="reviewByUser.fullName"/></td>
                                                        <td>
                                                            <%--  <s:if test="%{#test.task.status == 'OPEN'}">
                                                                 <a type="button" class="btn btn-facebook" href="updateTask?workspaceId=<s:iterator value="workspace"><s:property value="id"/></s:iterator>&&taskid=<s:property value="task.id"/>&&status=INPROCESS">
                                                                         Xử lý
                                                                     </a>
                                                             </s:if>
                                                             <s:elseif test="%{#test.task.status == 'INPROCESS'}">
                                                                 <a type="button" class="btn btn-info" href="updateTask?workspaceId=<s:iterator value="workspace"><s:property value="id"/></s:iterator>&&taskid=<s:property value="task.id"/>&&status=COMPLETE">
                                                                         Hoàn thành
                                                                     </a>
                                                             </s:elseif>
                                                             <s:elseif test="%{#test.task.status == 'COMPLETE'}">
                                                                 <a type="button" class="btn btn-facebook" href="updateTask?workspaceId=<s:iterator value="workspace"><s:property value="id"/></s:iterator>&&taskid=<s:property value="task.id"/>&&status=OPEN">
                                                                         Mở lại
                                                                     </a>
                                                                     <a type="button" class="btn btn-warning" href="updateTask?workspaceId=<s:iterator value="workspace"><s:property value="id"/></s:iterator>&&taskid=<s:property value="task.id"/>&&status=CLOSE">
                                                                         Đóng
                                                                     </a>
                                                             </s:elseif>
                                                             <s:elseif test="%{#test.task.status == 'CANCEL'}">
                                                                 <a type="button" class="btn btn-facebook" href="updateTask?workspaceId=<s:iterator value="workspace"><s:property value="id"/></s:iterator>&&taskid=<s:property value="task.id"/>&&status=OPEN">
                                                                         Mở lại
                                                                     </a>
                                                             </s:elseif>
                                                             <a type="button" class="btn btn-danger" href="updateTask?workspaceId=<s:iterator value="workspace"><s:property value="id"/></s:iterator>&&taskid=<s:property value="task.id"/>&&status=CANCEL">
                                                                     Hủy bỏ
                                                                 </a>

                                                            </td>--%>
                                                    </tr> 
                                                </s:iterator>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script>
            window.onload = function () {
                Chart.defaults.derivedLine = Chart.defaults.line;
                var draw = Chart.controllers.line.prototype.draw;
                var custom = Chart.controllers.line.extend({
                    draw: function () {
                        draw.apply(this, arguments);
                        var ctx = this.chart.chart.ctx;
                        var _stroke = ctx.stroke;
                        ctx.stroke = function () {
                            ctx.save();
                            ctx.shadowColor = '#ffb6c0';
                            ctx.shadowBlur = 30;
                            ctx.shadowOffsetX = 0;
                            ctx.shadowOffsetY = 20;
                            _stroke.apply(this, arguments)
                            ctx.restore();
                        }
                    }
                });
                Chart.controllers.derivedLine = custom;
                var ctx = document.querySelector("#thisYearRevenue").getContext('2d');
                var thisYearRevenueChart = new Chart(ctx, {
                    type: 'derivedLine',
                    data: {
                        labels: ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun", "Mon"],
                        datasets: [{
                                data: <%=dataNew%>,
                                borderWidth: 4,
                                borderColor: '#FF4961',
                                pointBackgroundColor: "#FFF",
                                pointBorderColor: "#FF4961",
                                pointHoverBackgroundColor: "#FFF",
                                pointHoverBorderColor: "#FF4961",
                                pointRadius: 0,
                                pointHoverRadius: 6,
                                fill: false,
                            }]
                    },
                    options: {
                        responsive: true,
                        tooltips: {
                            displayColors: false,
                            callbacks: {
                                label: function (e, d) {
                                    // return '${e.xLabel} : ${e.yLabel}'
                                },
                                title: function () {
                                    return;
                                }
                            }
                        },
                        legend: {
                            display: false
                        },
                        scales: {
                            xAxes: [{
                                    gridLines: {
                                        display: false,
                                    },
                                }],
                            yAxes: [{
                                    ticks: {
                                        padding: 10,
                                        stepSize: 2,
                                        max: 20,
                                        min: 0,
                                    },
                                    gridLines: {
                                        display: true,
                                        drawBorder: false,
                                        lineWidth: 1,
                                        zeroLineColor: '#e5e5e5',
                                    }
                                }]
                        }
                    }
                });

                var ctx2 = document.querySelector("#lastYearRevenue").getContext('2d');
                var lastYearRevenueChart = new Chart(ctx2, {
                    type: 'line',
                    data: {
                        labels: ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun", "Mon"],
                        datasets: [{
                                data: <%=dataOld%>,
                                borderWidth: 4,
                                borderDash: [8, 4],
                                borderColor: '#c3c3c3',
                                pointBackgroundColor: "#FFF",
                                pointBorderColor: "#c3c3c3",
                                pointHoverBackgroundColor: "#FFF",
                                pointHoverBorderColor: "#c3c3c3",
                                pointRadius: 0,
                                pointHoverRadius: 6,
                                fill: false,
                            }]
                    },
                    options: {
                        responsive: true,
                        tooltips: {
                            displayColors: false,
                            callbacks: {
                                label: function (e, d) {
                                    // return '${e.xLabel} : ${e.yLabel}'
                                },
                                title: function () {
                                    return;
                                }
                            }
                        },
                        legend: {
                            display: false
                        },
                        scales: {
                            xAxes: [{
                                    gridLines: {
                                        display: false,
                                    },
                                }],
                            yAxes: [{
                                    ticks: {
                                        padding: 10,
                                        stepSize: 2,
                                        max: 20,
                                        min: 0,
                                    },
                                    gridLines: {
                                        display: true,
                                        drawBorder: false,
                                        zeroLineColor: '#e5e5e5',
                                    }
                                }]
                        }
                    }
                });

                // Hit Rate Chart - CharJS Doughnut
                Chart.defaults.hitRateDoughnut = Chart.defaults.doughnut;
                var draw = Chart.controllers.doughnut.prototype.draw;
                var customDoughnut = Chart.controllers.doughnut.extend({
                    draw: function () {
                        draw.apply(this, arguments);
                        var ctx = this.chart.chart.ctx;
                        var _fill = ctx.fill;
                        var width = this.chart.width,
                                height = this.chart.height;

                        var fontSize = (height / 114).toFixed(2);
                        this.chart.ctx.font = fontSize + "em Verdana";
                        this.chart.ctx.textBaseline = "middle";

                        var text = "<%=dataSuccess1%>%",
                                textX = Math.round((width - this.chart.ctx.measureText(text).width) / 2),
                                textY = height / 2;

                        this.chart.ctx.fillText(text, textX, textY);

                        ctx.fill = function () {
                            ctx.save();
                            ctx.shadowColor = '#bbbbbb';
                            ctx.shadowBlur = 30;
                            ctx.shadowOffsetX = 0;
                            ctx.shadowOffsetY = 12;
                            _fill.apply(this, arguments)
                            ctx.restore();
                        }
                    }
                });

                Chart.controllers.hitRateDoughnut = customDoughnut;
                var ctx = document.getElementById("hit-rate-doughnut");
                var myDoughnutChart = new Chart(ctx, {
                    type: 'hitRateDoughnut',
                    data: {
                        labels: ["Chưa hoàn thành", "Hoàn thành"],
                        datasets: [{
                                label: "Favourite",
                                backgroundColor: ["#FF4961", "#28D094"],
                                data: [<%=dataSuccess1%>,<%=dataSuccess2%> ],
                            }]
                    },
                    options: {
                        responsive: true,
                        title: {
                            display: false
                        },
                        legend: {
                            display: true
                        },
                        layout: {
                            padding: {
                                left: 16,
                                right: 16,
                                top: 16,
                                bottom: 16
                            }
                        },
                        cutoutPercentage: 92,
                        animation: {
                            animateScale: false,
                            duration: 2500
                        }
                    }
                });

                // Deals Chart - CharJS Doughnut
                Chart.defaults.dealsDoughnut = Chart.defaults.doughnut;
                var draw = Chart.controllers.doughnut.prototype.draw;
                var customDealDoughnut = Chart.controllers.doughnut.extend({
                    draw: function () {
                        draw.apply(this, arguments);
                        var ctx = this.chart.chart.ctx;
                        var _fill = ctx.fill;
                        var width = this.chart.width,
                                height = this.chart.height;

                        var fontSize = (height / 114).toFixed(2);
                        this.chart.ctx.font = fontSize + "em Verdana";
                        this.chart.ctx.textBaseline = "middle";

                        var text = "<%=dataTreHan1%>%",
                                textX = Math.round((width - this.chart.ctx.measureText(text).width) / 2),
                                textY = height / 2;

                        this.chart.ctx.fillText(text, textX, textY);

                        ctx.fill = function () {
                            ctx.save();
                            ctx.shadowColor = '#FF4961';
                            ctx.shadowBlur = 30;
                            ctx.shadowOffsetX = 0;
                            ctx.shadowOffsetY = 12;
                            _fill.apply(this, arguments)
                            ctx.restore();
                        }
                    }
                });

                Chart.controllers.dealsDoughnut = customDealDoughnut;
                var ctx = document.getElementById("deals-doughnut");
                var myDoughnutChart = new Chart(ctx, {
                    type: 'dealsDoughnut',
                    data: {
                        labels: ["Trễ hạn", "Hoàn thành"],
                        datasets: [{
                                label: "Favourite",
                                borderWidth: 0,
                                backgroundColor: ["#ff7b8c", "#FFF"],
                                data: [<%=dataTreHan1%>, <%=dataTreHan2%>],
                            }]
                    },
                    options: {
                        responsive: true,
                        title: {
                            display: false
                        },
                        legend: {
                            display: false
                        },
                        layout: {
                            padding: {
                                left: 16,
                                right: 16,
                                top: 16,
                                bottom: 16
                            }
                        },
                        cutoutPercentage: 94,
                        animation: {
                            animateScale: false,
                            duration: 5000
                        }
                    }
                });
            };
        </script>
        <script>

        </script>
        <!-- ////////////////////////////////////////////////////////////////////////////-->
        <%@include file="/jsp/footer.jsp" %>
        <%@include file="/jsp/js.jsp" %>
    </body>
</html>
