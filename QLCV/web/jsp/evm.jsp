<%-- 
    Document   : khoan
    Created on : Mar 10, 2021, 8:44:35 PM
    Author     : sonng
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            session.removeAttribute("CssAndJs");
            session.setAttribute("CssAndJs", "khoan");
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="/jsp/header.jsp" %>
        <%@include file="/jsp/linkCss.jsp" %>
        <title>EVM</title>
    </head>
    <body class="vertical-layout vertical-menu 2-columns   menu-expanded fixed-navbar"
          data-open="click" data-menu="vertical-menu" data-col="2-columns">
        <%@include file="/jsp/nav.jsp" %>



        <div class="app-content content">
            <div class="content-wrapper">
                <div class="content-header row">
                    <div class="content-header-left col-md-6 col-12 mb-2">
                        <h3 class="content-header-title">EVM</h3>
                    </div>
                    <div class="content-header-right col-md-6 col-12">  
                        <div class="btn-group float-md-right" role="group" aria-label="">
                            <a type="button" class="btn btn-info round box-shadow-2 px-2"  id="btnGroupDrop1"
                               href="getAllTaskInWorkspaceForEVM?workspaceId=<s:property value="workspaceId"/>">Giá trị thực tế</a>      
                        </div>
                    </div>
                </div>
                <div class="content-body">


                    <section id="chartjs-line-charts">
                        <!-- Line Chart -->
                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h4 class="card-title">Dữ liệu EVM</h4>
                                        <a class="heading-elements-toggle"><i class="la la-ellipsis-v font-medium-3"></i></a>
                                        <div class="heading-elements">
                                            <ul class="list-inline mb-0">
                                                <li><a data-action="collapse"><i class="ft-minus"></i></a></li>
                                                <li><a data-action="reload"><i class="ft-rotate-cw"></i></a></li>
                                                <li><a data-action="expand"><i class="ft-maximize"></i></a></li>
                                                <li><a data-action="close"><i class="ft-x"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="card-content collapse show">
                                        <div class="card-body chartjs">
                                            <canvas id="line-chart" height="1000"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                    <section>
                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h4 class="card-title">THÔNG TIN BỔ XUNG</h4>
                                        <a class="heading-elements-toggle"><i class="la la-ellipsis-v font-medium-3"></i></a>
                                        <div class="heading-elements">
                                            <ul class="list-inline mb-0">
                                                <li><a data-action="collapse"><i class="ft-minus"></i></a></li>
                                                <li><a data-action="reload"><i class="ft-rotate-cw"></i></a></li>
                                                <li><a data-action="expand"><i class="ft-maximize"></i></a></li>
                                                <li><a data-action="close"><i class="ft-x"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="card-content collapse show">
                                        <table class="table table-striped table-bordered zero-configuration">
                                            <thead>
                                                <tr>
                                                    <th>Chỉ số</th>
                                                    <th>Giá trị</th>
                                                    <th>Thông tin</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <s:iterator value="lstEvms" var="test">
                                                    <tr>
                                                        <td><s:property value="daiLuong"/></td>
                                                        <td><s:property value="giaTri"/></td>
                                                        <td><s:property value="thongTin"/></td>
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
        <script>
            window.onload = function () {
                getLineChars();
            };
        </script>
        <%@include file="/jsp/evm-chart.jsp" %>
        <%@include file="/jsp/footer.jsp" %>
        <%@include file="/jsp/js.jsp" %>
    </body>
</html>

