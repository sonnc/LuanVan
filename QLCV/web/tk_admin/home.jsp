<%-- 
    Document   : home
    Created on : Feb 25, 2020, 9:11:06 PM
    Author     : sonng
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            session.removeAttribute("CssAndJs");
            session.setAttribute("CssAndJs", "KPI2");
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="/jsp/header.jsp" %>
        <%@include file="/jsp/linkCss.jsp" %>
        <title>KPI</title>
    </head>
    <body class="vertical-layout vertical-menu 2-columns   menu-expanded fixed-navbar"
          data-open="click" data-menu="vertical-menu" data-col="2-columns">
        <%@include file="/jsp/nav.jsp" %>
        
        <!-- ////////////////////////////////////////////////////////////////////////////-->
        <div class="app-content content">
            <div class="content-wrapper">
                <div class="content-body">
                    <div id="crypto-stats-3" class="row">
                        <div class="col-xl-4 col-12" >
                            <div class="card crypto-card-3 pull-up">
                                <div class="card-content">
                                    <div class="card-body pb-0">
                                        <div class="row">
                                            <div class="col-2">
                                                <h1><i class="icon-user font-large-2"></i></h1>
                                            </div>
                                            <div class="col-10">
                                                <a href="adminUserAction"><h2>QUẢN LÝ NGƯỜI DÙNG</h2></a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-2"></div>
                                        <div class="col-10">
                                            <div  class="height-75">Tổng số bản ghi</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-4 col-12">
                            <div class="card crypto-card-3 pull-up">
                                <div class="card-content">
                                    <div class="card-body pb-0">
                                        <div class="row">
                                            <div class="col-2">
                                                <h1><i class="icon-home font-large-2" title=""></i></h1>
                                            </div>
                                            <div class="col-10 pl-2">
                                                <a href="adminDepartmentAction?method=getAllDepartment"><h2>QUẢN LÝ PHÒNG BAN</h2></a>
                                                <h6 class="text-muted"></h6>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12">
                                            <canvas id="eth-chartjs" class="height-75"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--                        <div class="col-xl-4 col-12">
                                                    <div class="card crypto-card-3 pull-up">
                                                        <div class="card-content">
                                                            <div class="card-body pb-0">
                                                                <div class="row">
                                                                    <div class="col-2">
                                                                        <h1><i class="icon-list font-large-2" title=""></i></h1>
                                                                    </div>
                                                                    <div class="col-10 pl-2">
                                                                        <h2>QUẢN LÝ CÔNG VIỆC</h2>
                                                                        <h6 class="text-muted"></h6>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-12">
                                                                    <canvas id="xrp-chartjs" class="height-75"></canvas>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>-->
                        <div class="col-xl-4 col-12" >
                            <div class="card crypto-card-3 pull-up">
                                <div class="card-content">
                                    <div class="card-body pb-0">
                                        <div class="row">
                                            <div class="col-2">
                                                <h1><i class="icon-badge font-large-2" title=""></i></h1>
                                            </div>
                                            <div class="col-10 pl-2">
                                                <a href="adminKpiAction?method=viewKpi"><h2>QUẢN LÝ KPI</h2></a>
                                                <h6 class="text-muted"></h6>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12">
                                            <canvas id="btc-chartjs" class="height-75"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div id="crypto-stats-3" class="row">

                        <div class="col-xl-4 col-12">
                            <div class="card crypto-card-3 pull-up">
                                <div class="card-content">
                                    <div class="card-body pb-0">
                                        <div class="row">
                                            <div class="col-2">
                                                <h1><i class="icon-emoticon-smile font-large-2" title=""></i></h1>
                                            </div>
                                            <div class="col-10 pl-2">
                                                <a href="adminBaOnlineAction?method=viewBaOnline"><h2>QUẢN LÝ BA-ONLINE</h2></a>
                                                <h6 class="text-muted"></h6>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12">
                                            <canvas id="eth-chartjs" class="height-75"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-4 col-12">
                            <div class="card crypto-card-3 pull-up">
                                <div class="card-content">
                                    <div class="card-body pb-0">
                                        <div class="row">
                                            <div class="col-2">
                                                <h1><i class="icon-link  font-large-2" title=""></i></h1>
                                            </div>
                                            <div class="col-10 pl-2">
                                                <a href="tk/coming-soon.jsp"><h2>QUẢN LÝ DỮ LIỆU NGOÀI</h2></a>
                                                <h6 class="text-muted"></h6>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12">
                                            <canvas id="xrp-chartjs" class="height-75"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-4 col-12">
                            <div class="card crypto-card-3 pull-up">
                                <div class="card-content">
                                    <div class="card-body pb-0">
                                        <div class="row">
                                            <div class="col-2">
                                                <h1 style="size: 200%"><i class="icon-settings font-large-2 " title=""></i></h1>
                                            </div>
                                            <div class="col-10 pl-2">
                                                <a href="tk_admin/setup.jsp"><h2>CẤU HÌNH HỆ THỐNG</h2></a>
                                                <h6 class="text-muted"></h6>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12">
                                            <canvas id="eth-chartjs" class="height-75"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>



                    <div id="crypto-stats-3" class="row">


                        <div class="col-xl-4 col-12">
                            <div class="card crypto-card-3 pull-up">
                                <div class="card-content">
                                    <div class="card-body pb-0">
                                        <div class="row">
                                            <div class="col-2">
                                                <h1><i class="icon-frame font-large-2" title=""></i></h1>
                                            </div>
                                            <div class="col-10 pl-2">
                                                <h2>QUẢN LÝ KHÁC</h2>
                                                <h6 class="text-muted"></h6>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12">
                                            <canvas id="xrp-chartjs" class="height-75"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
       <%@include file="/jsp/footer.jsp" %>
        <%@include file="/jsp/js.jsp" %>
    </body>
</html>

