<%-- 
    Document   : home
    Created on : Feb 25, 2020, 9:11:06 PM
    Author     : sonng
--%>

<%@page import="hust.soict.ca190141.sonnc.entities.base.TkKpiItem"%>
<%@page import="hust.soict.ca190141.sonnc.entities.base.TkKpiTypeSetting"%>
<%@page import="hust.soict.ca190141.sonnc.entities.base.TkProject"%>
<%@page import="hust.soict.ca190141.sonnc.tko.controller.UserController"%>
<%@page import="java.util.Properties"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>

<%
    Properties prop = (Properties) session.getAttribute("properties");
    int task1 = 0;
    int task2 = 0;
    int kpi1 = 0;
    int kpi2 = 0;
    int ba1 = 0;
    int ba2 = 0;

    UserController userController = new UserController();
    task1 = userController.getAllProject();
    task2 = userController.getAllTask();
    kpi1 = userController.getKpiTypeSetting();
    kpi2 = userController.getKpiItem();
    ba1 = userController.getAllService();
    ba2 = userController.getAllTicket();
%>

<html class="loading" lang="en" data-textdirection="ltr">
    <%@include file="/tk/head.jsp" %>

    <body class="vertical-layout vertical-overlay-menu 2-columns   menu-expanded fixed-navbar"
          data-open="click" data-menu="vertical-overlay-menu" data-col="2-columns">
        <%@include file="/tk/topheader.jsp" %>
        <!-- ////////////////////////////////////////////////////////////////////////////-->
        <div class="app-content content">
            <div class="content-wrapper">

                <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                    </ol>
                    <div class="carousel-inner" role="listbox">
                        <!-- Slide One - Set the background image for this slide in the line below -->
                        <div class="carousel-item active" style="background-image: url('<%=session.getAttribute("httpURL")%>assets/images/tko/pic1.png')">
                            <div class="carousel-caption d-none d-md-block">
                                <!--                                <h2 class="display-4">First Slide</h2>
                                                                <p class="lead">This is a description for the first slide.</p>-->
                            </div>
                        </div>
                        <!-- Slide Two - Set the background image for this slide in the line below -->
                        <div class="carousel-item" style="background-image: url('<%=session.getAttribute("httpURL")%>assets/images/tko/pic2.png')">
                            <div class="carousel-caption d-none d-md-block">
                                <!--                                <h2 class="display-4">Second Slide</h2>
                                                                <p class="lead">This is a description for the second slide.</p>-->
                            </div>
                        </div>
                        <!-- Slide Three - Set the background image for this slide in the line below -->
                        <div class="carousel-item" style="background-image: url('<%=session.getAttribute("httpURL")%>assets/images/tko/pic3.png')">
                            <div class="carousel-caption d-none d-md-block">
                                <!--                                <h2 class="display-4">Third Slide</h2>
                                                                <p class="lead">This is a description for the third slide.</p>-->
                            </div>
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>


                <hr>
                <h3 style="text-align: center;"><strong><%=prop.getProperty("tk.tko.label.home.title")%></strong></h3>
                <hr>
                <div class="content-body">
                    <div id="crypto-stats-3" class="row">
                        <div class="col-xl-4 col-12" >
                            <div class="card crypto-card-3 pull-up">
                                <div class="card-content">
                                    <div class="card-body pb-0">
                                        <div class="row">
                                            <div class="col-2">
                                                <h1><i class="la la-tasks warning font-large-2" title="TASK"></i></h1>
                                            </div>
                                            <div class="col-10 pl-2">
                                                <a href="viewTkTaskAction"><h2><%=prop.getProperty("tk.tko.label.home.task.title")%></h2></a>
                                                <h6 class="text-muted"><%=prop.getProperty("tk.tko.label.home.task.desc")%></h6>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row" style="height: auto">
                                        <div class="card-body pb-0">
                                            <div class="row">
                                                <div class="col-1"></div>
                                                <div class="col-5">
                                                    <p><span style="font-size: xx-large; color: orange"><%=task1%></span> dự án</p> 
                                                </div>
                                                <div class="col-5">
                                                    <p><span style="font-size: xx-large; color: orange"><%=task2%></span> T/CV</p> 
                                                </div>
                                                <div class="col-1"></div>
                                            </div>
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
                                                <h1><i class="la la-star blue-grey lighten-1 font-large-2" title="KPI"></i></h1>
                                            </div>
                                            <div class="col-10 pl-2">
                                                <a href="viewKpiOfDepartementAction"><h2><%=prop.getProperty("tk.tko.label.home.kpi.title")%></h2></a>
                                                <h6 class="text-muted"><%=prop.getProperty("tk.tko.label.home.kpi.desc")%></h6>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row" style="height: auto">
                                        <div class="card-body pb-0">
                                            <div class="row">
                                                <div class="col-1"></div>
                                                <div class="col-5">
                                                    <p><span style="font-size: xx-large; color: blue"><%=kpi1%></span> bộ KPI</p> 
                                                </div>
                                                <div class="col-5">
                                                    <p><span style="font-size: xx-large; color: blue"><%=kpi2%></span> KPI đã tạo</p> 
                                                </div>
                                                <div class="col-1"></div>
                                            </div>
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
                                                <h1><i class="la la-support info font-large-2" title="BA-ONLINE"></i></h1>
                                            </div>
                                            <div class="col-10 pl-2">
                                                <a href="viewAllServiceBaOnline"><h2><%=prop.getProperty("tk.tko.label.home.baonline.title")%></h2></a>
                                                <h6 class="text-muted"><%=prop.getProperty("tk.tko.label.home.baonline.desc")%></h6>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row" style="height: auto">
                                        <div class="card-body pb-0">
                                            <div class="row">
                                                <div class="col-1"></div>
                                                <div class="col-5">
                                                    <p><span style="font-size: xx-large; color: green"><%=ba1%></span> dịch vụ</p> 
                                                </div>
                                                <div class="col-5">
                                                    <p><span style="font-size: xx-large; color: green"><%=ba2%></span> tiket đã tạo</p> 
                                                </div>
                                                <div class="col-1"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- ////////////////////////////////////////////////////////////////////////////-->
        <%@include file="/tk/footer.jsp" %>
    </body>
</html>
