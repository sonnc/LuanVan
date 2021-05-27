<%-- 
    Document   : workspace-dashboard
    Created on : Feb 24, 2021, 8:35:57 PM
    Author     : sonng
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            session.removeAttribute("CssAndJs");
            session.setAttribute("CssAndJs", "workspace-summary");
            String data = (String) session.getAttribute("bieudoTask");
            String data2 = (String) session.getAttribute("bieudoTask2");
            String data3 = (String) session.getAttribute("bieudoTask3");
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="/jsp/header.jsp" %>
        <%@include file="/jsp/linkCss.jsp" %>
        <title><%=properties.getProperty("app.workspace.summary")%></title>
    </head>
    <body class="vertical-layout vertical-menu 2-columns   menu-expanded fixed-navbar"
          data-open="click" data-menu="vertical-menu" data-col="2-columns">
        <%@include file="/jsp/nav.jsp" %>
        <div class="app-content content">
            <div class="content-wrapper">
                <div class="content-header row">
                    <div class="content-header-left col-md-6 col-12 mb-2">
                        <h3 class="content-header-title"><%=properties.getProperty("app.workspace.summary")%></h3>

                    </div>
                    <div class="content-header-right col-md-6 col-12">
                        <div class="btn-group float-md-right" role="group" aria-label="Button group with nested dropdown">
                            <div style="margin-right: 10px">
                                <a href="TaskPendingRating?workspaceId=<s:property value="workspace.id"/>" class="btn btn-outline-twitter round  px-2" type="button" aria-expanded="false"><i class="ft-star icon-left"></i> 
                                    Đánh giá công việc thành viên
                                </a>
                                <button class="btn btn-danger round dropdown-toggle dropdown-menu-right box-shadow-2 px-2"
                                        id="btnGroupDrop11" type="button" data-toggle="dropdown" aria-haspopup="true"
                                        aria-expanded="false"><i class="ft-edit icon-left"></i> 
                                    <%=properties.getProperty("app.function.qlcv")%>
                                </button>
                                <div class="dropdown-menu" aria-labelledby="btnGroupDrop11">
                                    <a class="dropdown-item" href="GetTaskByUser?workspaceId=<s:property value="workspace.id"/>&&status=all">Tất cả</a>
                                    <a class="dropdown-item" href="GetTaskByUser?workspaceId=<s:property value="workspace.id"/>&&status=OPEN">Đang mở</a>
                                    <a class="dropdown-item" href="GetTaskByUser?workspaceId=<s:property value="workspace.id"/>&&status=INPROCESS">Đang xử lý</a>
                                    <a class="dropdown-item" href="GetTaskByUser?workspaceId=<s:property value="workspace.id"/>&&status=COMPLETE">Hoàn thành, chờ đánh giá</a>
                                    <a class="dropdown-item" href="GetTaskByUser?workspaceId=<s:property value="workspace.id"/>&&status=CLOSE">Đã đóng</a>
                                    <a class="dropdown-item" href="GetTaskByUser?workspaceId=<s:property value="workspace.id"/>&&status=CANCEL">Đã hủy</a>
                                    <a class="dropdown-item" href="GetTaskByUser?workspaceId=<s:property value="workspace.id"/>&&status=DELAY">Trễ hạn</a>
                                </div>
                            </div>

                            <%if ("PM".equals(role.getCode()) || "SPM".equals(role.getCode()) || "GD".equals(role.getCode())) {
                            %>
                            <div>
                                <button class="btn btn-info round dropdown-toggle dropdown-menu-right box-shadow-2 px-2"
                                        id="btnGroupDrop1" type="button" data-toggle="dropdown" aria-haspopup="true"
                                        aria-expanded="false"><i class="ft-settings icon-left"></i> 
                                    <%=properties.getProperty("app.function")%>
                                </button>
                                <div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
                                    <a class="dropdown-item" href="workspaceAction?event=prepareViewWorkspace&&workspaceId=<s:property value="workspace.id"/>"><%=properties.getProperty("app.edit")%></a>
                                    <a class="dropdown-item" href="workspaceAction?event=edit&&id=<s:property value="workspace.id"/>"><%=properties.getProperty("app.close")%></a>
                                    <a class="dropdown-item" href="workspaceAction?event=edit&&id=<s:property value="workspace.id"/>">Quản lý nhóm</a>

                                    <a class="dropdown-item" href="taskListAction?event=prepareCreateTaskList&&workspaceId=<s:property value="workspace.id"/>"><%=properties.getProperty("app.workspace.summary.task.list.add")%></a>
                                    <!--neu chua tao task list thi khong hien thi-->

                                    <s:set name="checkTotalTaskList" value="workspaceSummary.totalTaskList"/>
                                    <s:if test="#checkTotalTaskList==0">
                                    </s:if>
                                    <s:else>
                                        <a class="dropdown-item" href="createRaciForTaskList?workspaceId=<s:property value="workspace.id"/>">Khởi tạo RACI</a>
                                        <a class="dropdown-item" href="viewAllTask?workspaceId=<s:property value="workspace.id"/>">Quản lý công việc</a>
                                    </s:else>

                                </div>
                            </div>
                            <%}%>
                        </div>
                    </div>
                </div>
                <div class="content-detached ">
                    <div class="content-body">
                        <section class="row">
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="card-head">
                                        <div class="card-header">
                                            <h4 class="card-title"><s:property value="workspace.workspaceName"/></h4>
                                        </div>
                                        <div class="px-1">

                                            <ul class="list-inline list-inline-pipe text-center p-1 border-bottom-grey border-bottom-lighten-3">
                                                <li><%=properties.getProperty("app.workspace.summary.owner")%>:
                                                    <span class="text-muted"><s:property value="workspace.owner"/></span>
                                                </li>
                                                <li><%=properties.getProperty("app.workspace.summary.start.date")%>:
                                                    <span class="text-muted"><s:property value="workspace.startDate"/></span>
                                                </li>
                                                <li><%=properties.getProperty("app.workspace.summary.end.date")%>:
                                                    <span class="text-muted"><s:property value="workspace.endDate"/></span>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!-- project-info -->
                                    <div id="project-info" class="card-body row">
                                        <div class="project-info-count col-lg-2 col-md-12">
                                            <div class="project-info-icon">
                                                <h2><s:property value="workspaceSummary.totalMember"/></h2>
                                                <div class="project-info-sub-icon">
                                                    <span class="la la-user"></span>
                                                </div>
                                            </div>
                                            <div class="project-info-text pt-1">
                                                <h5><%=properties.getProperty("app.workspace.summary.member")%></h5>
                                            </div>
                                        </div>
                                        <div class="project-info-count col-lg-2 col-md-12">
                                            <div class="project-info-icon">
                                                <h2><s:property value="workspaceSummary.totalTeams"/></h2>
                                                <div class="project-info-sub-icon">
                                                    <span class="la la-calendar-check-o"></span>
                                                </div>
                                            </div>
                                            <div class="project-info-text pt-1">
                                                <h5><%=properties.getProperty("app.workspace.team")%></h5>
                                            </div>
                                        </div>
                                        <div class="project-info-count col-lg-2 col-md-12">
                                            <div class="project-info-icon">
                                                <h2><s:property value="workspaceSummary.totalMilestones"/></h2>
                                                <div class="project-info-sub-icon">
                                                    <span class="la la-bug"></span>
                                                </div>
                                            </div>
                                            <div class="project-info-text pt-1">
                                                <h5><%=properties.getProperty("app.workspace.summary.milestones")%></h5>
                                            </div>
                                        </div>
                                        <div class="project-info-count col-lg-2 col-md-12">
                                            <div class="project-info-icon">
                                                <h2><s:property value="workspaceSummary.totalTaskList"/></h2>
                                                <div class="project-info-sub-icon">
                                                    <span class="la la-bug"></span>
                                                </div>
                                            </div>
                                            <div class="project-info-text pt-1">
                                                <h5><%=properties.getProperty("app.workspace.summary.task.list")%></h5>
                                            </div>
                                        </div>
                                        <div class="project-info-count col-lg-2 col-md-12">
                                            <div class="project-info-icon">
                                                <h2><s:property value="workspaceSummary.totalTask"/></h2>
                                                <div class="project-info-sub-icon">
                                                    <span class="la la-bug"></span>
                                                </div>
                                            </div>
                                            <div class="project-info-text pt-1">
                                                <h5><%=properties.getProperty("app.workspace.summary.task")%></h5>
                                            </div>
                                        </div>
                                        <div class="project-info-count col-lg-2 col-md-12">
                                            <div class="project-info-icon">
                                                <h2><s:property value="workspace.tienKhoan"/></h2>
                                                <div class="project-info-sub-icon">
                                                    <span class="la la-bug"></span>
                                                </div>
                                            </div>
                                            <div class="project-info-text pt-1">
                                                <h5><%=properties.getProperty("app.workspace.summary.amount")%> (Tr.VND)</h5>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- project-info -->
                                </div>
                            </div>
                        </section>
                        <!-- Task Progress -->
                        <section class="row">
                            <div class="col-xl-4 col-lg-12 col-md-12">
                                <div class="card">
                                    <div class="card-head">
                                        <div class="card-header">
                                            <h4 class="card-title">Thống kê task</h4>
                                            <a class="heading-elements-toggle"><i class="la la-ellipsis-v font-medium-3"></i></a>
                                            <div class="heading-elements">
                                                <ul class="list-inline mb-0">
                                                    <li><a data-action="reload"><i class="ft-rotate-cw"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-content">
                                        <div class="card-body">
                                            <div id="task-pie-chart" class="height-400 echart-container"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-xl-4 col-lg-12 col-md-12">
                                <div class="card">
                                    <div class="card-head">
                                        <div class="card-header">
                                            <h4 class="card-title">Tỷ lệ hoàn thành workspace</h4>
                                            <a class="heading-elements-toggle"><i class="la la-ellipsis-v font-medium-3"></i></a>
                                            <div class="heading-elements">
                                                <ul class="list-inline mb-0">
                                                    <li><a data-action="reload"><i class="ft-rotate-cw"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-content">
                                        <div class="card-body">
                                            <div id="bug-pie-chart" class="height-400 echart-container"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--/ Task Progress -->
                            <!-- Bug Progress -->
                            <div class="col-xl-4 col-lg-12 col-md-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h4 class="card-title">Phân bổ số tiền</h4>
                                        <a class="heading-elements-toggle"><i class="la la-ellipsis-v font-medium-3"></i></a>
                                        <div class="heading-elements">
                                            <ul class="list-inline mb-0">
                                                <li><a data-action="reload"><i class="ft-rotate-cw"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="card-content">
                                        <div class="card-body">
                                            <div id="amount-pie-chart" class="height-400 echart-container"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--/ Bug Progress -->
                        </section>

                        <section class="row">
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h4 class="card-title">Bảng thông tin chi tiết từng thành viên</h4>
                                    </div>
                                    <div class="card-content">
                                        <div class="card-body">
                                            <table class="table table-striped table-bordered zero-configuration">
                                                <thead>
                                                    <tr>
                                                        <th>Mã nhân viên</th>
                                                        <th>Tên nhân viên</th>
                                                        <th>Email</th>
                                                        <th>Điện thoại</th>
                                                        <th>Tổng số</th>
                                                        <th>Mở</th>
                                                        <th>Đang xử lý</th>
                                                        <th>Đóng</th>
                                                        <th>Hủy</th>
                                                        <th>Trễ hạn</th>
                                                        <th>Tổng tiền khoán/ thưởng</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <s:iterator value="lstMemberInfoWorkspaceSummarys" var="test">
                                                        <tr>
                                                            <td><s:property value="maNhanVien"/></td>
                                                            <td><s:property value="tenNhanVien"/></td>
                                                            <td><s:property value="email"/></td>
                                                            <td><s:property value="dienThoai"/></td>
                                                            <td><s:property value="tongSoTask"/></td>
                                                            <td><s:property value="taskOpen"/></td>
                                                            <td><s:property value="taskInprocess"/></td>
                                                            <td><s:property value="taskClose"/></td>
                                                            <td><s:property value="taskCancel"/></td>
                                                            <td><s:property value="taskDelay"/></td>
                                                            <% if ("PM".equals(role.getCode()) || "SPM".equals(role.getCode()) || "GD".equals(role.getCode())) {
                                                            %>
                                                            <td><s:property value="amount"/></td>
                                                            <%}else{
                                                            %>
                                                            <s:set var="useremployee"><%=userLoginSys.getEmployeeNo()%></s:set>
                                                            <s:if test="#test.maNhanVien == #useremployee">
                                                                <td><s:property value="amount"/></td>
                                                            </s:if>
                                                            <s:else>
                                                                <td>********</td>
                                                            </s:else>
                                                            <%
                                                                     }%>
                                                        </tr>
                                                    </s:iterator>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </div>
                </div>
            </div>
        </div>
        <script>
            window.onload = function () {
                func1();
                func2();
                func3();
            };

            function func1() {
                // Set paths
                // ------------------------------

                require.config({
                    paths: {
                        echarts: '<%=session.getAttribute("httpURL")%>/app-assets/vendors/js/charts/echarts'
                    }
                });


                // Configuration
                // ------------------------------

                require(
                        [
                            'echarts',
                            'echarts/chart/pie',
                            'echarts/chart/funnel'
                        ],
                        // Charts setup
                                function (ec) {
                                    // Initialize chart
                                    // ------------------------------
                                    var myChart = ec.init(document.getElementById('task-pie-chart'));

                                    // Chart Options
                                    // ------------------------------
                                    chartOptions = {

                                        // Add title
                                        title: {
                                            text: 'Thông tin Công việc',
                                            subtext: 'Dữ liệu xử lý',
                                            x: 'center'
                                        },

                                        // Add tooltip
                                        tooltip: {
                                            trigger: 'item',
                                            formatter: "{a} <br/>{b}: {c} ({d}%)"
                                        },

                                        // Add legend
                                        legend: {
                                            orient: 'vertical',
                                            x: 'left',
                                            data: ['Open', 'Closed', 'Cancel', 'In-Process', 'Complete']
                                        },

                                        // Add custom colors
                                        color: ['#FCB900', '#ABB8C3', '#EB144C', '#008B02', '#BA68C8'],

                                        // Display toolbox
                                        toolbox: {
                                            show: true,
                                            orient: 'horizontal',
                                            //Enable if you need
                                            feature: {
                                                magicType: {
                                                    show: true,
                                                    title: {
                                                        pie: 'Switch to pies',
                                                        funnel: 'Switch to funnel',
                                                    },
                                                    type: ['pie', 'funnel'],
                                                    option: {
                                                        funnel: {
                                                            x: '25%',
                                                            y: '20%',
                                                            width: '50%',
                                                            height: '70%',
                                                            funnelAlign: 'left',
                                                            max: 1548
                                                        }
                                                    }
                                                },
                                                restore: {
                                                    show: true,
                                                    title: 'Restore'
                                                },
                                                saveAsImage: {
                                                    show: true,
                                                    title: 'Same as image',
                                                    lang: ['Save']
                                                }
                                            }
                                        },

                                        // Enable drag recalculate
                                        calculable: true,

                                        // Add series
                                        series: [{
                                                name: 'Browsers',
                                                type: 'pie',
                                                radius: '70%',
                                                center: ['50%', '57.5%'],
                                                data: [
            <%=data%>
                                                ]
                                            }]
                                    };

                                    // Apply options
                                    // ------------------------------

                                    myChart.setOption(chartOptions);


                                    // Resize chart
                                    // ------------------------------

                                    $(function () {

                                        // Resize chart on menu width change and window resize
                                        $(window).on('resize', resize);
                                        $(".menu-toggle").on('click', resize);

                                        // Resize function
                                        function resize() {
                                            setTimeout(function () {

                                                // Resize chart
                                                myChart.resize();
                                            }, 200);
                                        }
                                    });
                                }
                        );
                    }
            function func2() {
                // Set paths
                // ------------------------------

                require.config({
                    paths: {
                        echarts: '../app-assets/vendors/js/charts/echarts'
                    }
                });


                // Configuration
                // ------------------------------

                require(
                        [
                            'echarts',
                            'echarts/chart/pie',
                            'echarts/chart/funnel'
                        ],
                        // Charts setup
                                function (ec) {
                                    // Initialize chart
                                    // ------------------------------
                                    var myChart = ec.init(document.getElementById('bug-pie-chart'));

                                    // Chart Options
                                    // ------------------------------
                                    chartOptions = {

                                        // Add title
                                        title: {
                                            text: 'Tỷ lệ hoàn thành',
                                            subtext: '(trong workspace)',
                                            x: 'center'
                                        },

                                        // Add tooltip
                                        tooltip: {
                                            trigger: 'item',
                                            formatter: "{a} <br/>{b}: {c} ({d}%)"
                                        },

                                        // Add legend
                                        legend: {
                                            orient: 'vertical',
                                            x: 'left',
                                            data: ['Finished', 'Unfinished']
                                        },

                                        // Add custom colors
                                        color: ['#7BDCB5', '#EB144C'],

                                        // Display toolbox
                                        toolbox: {
                                            show: true,
                                            orient: 'horizontal',
                                            //Enable if you need
                                            feature: {
                                                magicType: {
                                                    show: true,
                                                    title: {
                                                        pie: 'Switch to pies',
                                                        funnel: 'Switch to funnel',
                                                    },
                                                    type: ['pie', 'funnel'],
                                                    option: {
                                                        funnel: {
                                                            x: '25%',
                                                            y: '20%',
                                                            width: '50%',
                                                            height: '70%',
                                                            funnelAlign: 'left',
                                                            max: 1548
                                                        }
                                                    }
                                                },
                                                restore: {
                                                    show: true,
                                                    title: 'Restore'
                                                },
                                                saveAsImage: {
                                                    show: true,
                                                    title: 'Same as image',
                                                    lang: ['Save']
                                                }
                                            }
                                        },

                                        // Enable drag recalculate
                                        calculable: true,

                                        // Add series
                                        series: [{
                                                name: 'Browsers',
                                                type: 'pie',
                                                radius: '70%',
                                                center: ['50%', '57.5%'],
                                                data: [
            <%=data2%>
                                                ]
                                            }]
                                    };

                                    // Apply options
                                    // ------------------------------

                                    myChart.setOption(chartOptions);


                                    // Resize chart
                                    // ------------------------------

                                    $(function () {

                                        // Resize chart on menu width change and window resize
                                        $(window).on('resize', resize);
                                        $(".menu-toggle").on('click', resize);

                                        // Resize function
                                        function resize() {
                                            setTimeout(function () {

                                                // Resize chart
                                                myChart.resize();
                                            }, 200);
                                        }
                                    });
                                }
                        );
                    }
            function func3() {
                // Set paths
                // ------------------------------

                require.config({
                    paths: {
                        echarts: '../app-assets/vendors/js/charts/echarts'
                    }
                });


                // Configuration
                // ------------------------------

                require(
                        [
                            'echarts',
                            'echarts/chart/pie',
                            'echarts/chart/funnel'
                        ],
                        // Charts setup
                                function (ec) {
                                    // Initialize chart
                                    // ------------------------------
                                    var myChart = ec.init(document.getElementById('amount-pie-chart'));

                                    // Chart Options
                                    // ------------------------------
                                    chartOptions = {

                                        // Add title
                                        title: {
                                            text: 'Phân bổ công việc',
                                            subtext: 'Theo Miletones, folder, khác',
                                            x: 'center'
                                        },

                                        // Add tooltip
                                        tooltip: {
                                            trigger: 'item',
                                            formatter: "{a} <br/>{b}: {c} ({d}%)"
                                        },

                                        // Add legend
                                        legend: {
                                            orient: 'vertical',
                                            x: 'left',
                                            data: ['Miles-tone', 'Folder', 'Others']
                                        },

                                        // Add custom colors
                                        color: ['#FECEA8', '#FF847C', '#759773'],

                                        // Display toolbox
                                        toolbox: {
                                            show: true,
                                            orient: 'horizontal',
                                            //Enable if you need
                                            feature: {
                                                magicType: {
                                                    show: true,
                                                    title: {
                                                        pie: 'Switch to pies',
                                                        funnel: 'Switch to funnel',
                                                    },
                                                    type: ['pie', 'funnel'],
                                                    option: {
                                                        funnel: {
                                                            x: '25%',
                                                            y: '20%',
                                                            width: '50%',
                                                            height: '70%',
                                                            funnelAlign: 'left',
                                                            max: 1548
                                                        }
                                                    }
                                                },
                                                restore: {
                                                    show: true,
                                                    title: 'Restore'
                                                },
                                                saveAsImage: {
                                                    show: true,
                                                    title: 'Same as image',
                                                    lang: ['Save']
                                                }
                                            }
                                        },

                                        // Enable drag recalculate
                                        calculable: true,

                                        // Add series
                                        series: [{
                                                name: 'Browsers',
                                                type: 'pie',
                                                radius: '70%',
                                                center: ['50%', '57.5%'],
                                                data: [
            <%=data3%>
                                                ]
                                            }]
                                    };

                                    // Apply options
                                    // ------------------------------

                                    myChart.setOption(chartOptions);


                                    // Resize chart
                                    // ------------------------------

                                    $(function () {

                                        // Resize chart on menu width change and window resize
                                        $(window).on('resize', resize);
                                        $(".menu-toggle").on('click', resize);

                                        // Resize function
                                        function resize() {
                                            setTimeout(function () {

                                                // Resize chart
                                                myChart.resize();
                                            }, 200);
                                        }
                                    });
                                }
                        );
                    }
        </script>
        <%@include file="/jsp/footer.jsp" %>
        <%@include file="/jsp/js.jsp" %>
    </body>
</html>
