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
            Date date = new Date();
            SimpleDateFormat formatter = new SimpleDateFormat("MM/yyyy");
            SimpleDateFormat formatter2 = new SimpleDateFormat("yyyy");
            String strDate = formatter.format(date);
            String strDate2 = formatter2.format(date);
            int ywar = Integer.parseInt(strDate2)-1;
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="/jsp/header.jsp" %>
        <%@include file="/jsp/linkCss.jsp" %>
        <title>Khoán và tiền thưởng</title>
    </head>
    <body class="vertical-layout vertical-menu 2-columns   menu-expanded fixed-navbar"
          data-open="click" data-menu="vertical-menu" data-col="2-columns">
        <%@include file="/jsp/nav.jsp" %>



        <div class="app-content content">
            <div class="content-wrapper">
                <div class="content-header row">
                    <div class="content-header-left col-md-6 col-12 mb-2">
                        <h3 class="content-header-title">TIỀN KHOÁN/ THƯỞNG</h3>
                    </div>
                    <div class="content-header-right col-md-6 col-12">  


                    </div>
                </div>
                <div class="content-body">
                    <!-- Zero configuration table -->
                    <section id="configuration">
                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-content collapse show">
                                        <div class="card-body card-dashboard">
                                            <div class="card-content collapse show">
                                                <div class="card-body pt-0">
                                                    <div class="row">
                                                        <div class="col-md-3 col-12 border-right-blue-grey border-right-lighten-5 text-center">
                                                            <h4 class="font-large-2 text-bold-400" id="ccy1" ><s:property value="luongKhoanTotal.totalKhoanCV"/></h4>
                                                            <p class="blue-grey lighten-2 mb-0">KHOÁN CÔNG VIỆC</p>
                                                        </div>
                                                        <div class="col-md-3 col-12 text-center">
                                                            <h4 class="font-large-2 text-bold-400" id="ccy2" ><s:property value="luongKhoanTotal.totalKhoanMilestone"/></h4>
                                                            <p class="blue-grey lighten-2 mb-0">KHOÁN MILESTONES</p>
                                                        </div>
                                                        <div class="col-md-3 col-12 text-center">
                                                            <h4 class="font-large-2 text-bold-400" id="ccy3" ><s:property value="luongKhoanTotal.totalKhoanHQDA"/></h4>
                                                            <p class="blue-grey lighten-2 mb-0">KHOÁN HIỆU QUẢ DỰ ÁN</p>
                                                        </div>
                                                        <div class="col-md-3 col-12 text-center">
                                                            <h4 class="font-large-2 text-bold-400 danger" id="ccy4" ><s:property value="luongKhoanTotal.totalKhoan"/></h4>
                                                            <p class="blue-grey lighten-2 mb-0">TỔNG THU NHẬP</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>

                    <section id="configuration">
                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h4 class="card-title">DỮ LIỆU KHOÁN VÀ TIỀN THƯỞNG DỰ KIẾN <strong style="color: red"><%=strDate%></strong></h4>
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
                                        <div class="card-body card-dashboard">
                                            <div class="card-content collapse show">
                                                <div class="card-body pt-0">
                                                    <div class="row">
                                                        <div class="col-md-3 col-12 border-right-blue-grey border-right-lighten-5 text-center">
                                                            <h4 class="font-large-2 text-bold-400" id="ccy5" ><s:property value="luongKhoanTotal2.totalKhoanCV"/></h4>
                                                            <p class="blue-grey lighten-2 mb-0">KHOÁN CÔNG VIỆC</p>
                                                        </div>
                                                        <div class="col-md-3 col-12 text-center">
                                                            <h4 class="font-large-2 text-bold-400" id="ccy6" ><s:property value="luongKhoanTotal2.totalKhoanMilestone"/></h4>
                                                            <p class="blue-grey lighten-2 mb-0">KHOÁN MILESTONES</p>
                                                        </div>
                                                        <div class="col-md-3 col-12 text-center">
                                                            <h4 class="font-large-2 text-bold-400" id="ccy7" ><s:property value="luongKhoanTotal2.totalKhoanHQDA"/></h4>
                                                            <!--<h4 class="font-large-2 text-bold-400"><s:property value="luongKhoanTotal2.totalKhoanHQDA2"/></h4>-->
                                                            <p class="blue-grey lighten-2 mb-0">KHOÁN HIỆU QUẢ DỰ ÁN</p>
                                                        </div>
                                                        <div class="col-md-3 col-12 text-center">
                                                            <h4 class="font-large-2 text-bold-400 danger" id="ccy8" ><s:property value="luongKhoanTotal2.totalKhoan"/></h4>
                                                            <!--<h4 class="font-large-2 text-bold-400 danger"><s:property value="luongKhoanTotal2.totalKhoan2"/></h4>-->
                                                            <p class="blue-grey lighten-2 mb-0">TỔNG THU NHẬP</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>

                    <section id="chartjs-line-charts">
                        <!-- Line Chart -->
                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h4 class="card-title">Dữ liệu tiền thưởng <strong class="danger"><%=strDate2 %></strong></h4>
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
                                            <canvas id="line-chart" height="500"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>

                    <section id="chartjs-bar-charts">
                        <!-- Bar Chart -->
                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h4 class="card-title">Số tiền thu nhập theo tháng:  <strong style="color:#28D094"> Năm <%=strDate2 %></strong> - <strong style="color:#F98E76"> Năm <%=ywar %></strong></h4>
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
                                        <div class="card-body">
                                            <canvas id="column-chart" height="400"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>


                    <%--
                                        <section id="configuration">
                                            <div class="row">
                                                <div class="col-12">
                                                    <div class="card">
                                                        <div class="card-header">
                                                            <h4 class="card-title">DỮ LIỆU CHÊNH LỆCH GIỮA CHÍNH SÁCH CŨ VÀ CHÍNH SÁCH MỚI <strong style="color: red"><%=strDate%></strong></h4>
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
                                                        <div class="card-content collapse hiden">
                                                            <div class="card-body card-dashboard">
                                                                <div class="card-content collapse show">
                                                                    <div class="card-body pt-0">
                                                                        <div class="row">
                                                                            <div class="col-md-4 col-12 border-right-blue-grey border-right-lighten-5 text-center">
                                                                                <h4 class="font-large-2 text-bold-400" id="ccy9" ><s:property value="luongKhoanTotal2.totalKhoanOld"/></h4>
                                                                                <p class="blue-grey lighten-2 mb-0">LƯƠNG MỀM THEO CHÍNH SÁCH CŨ</p>
                                                                            </div>
                                                                            <div class="col-md-4 col-12 text-center">
                                                                                <h4 class="font-large-2 text-bold-400" id="ccy10" ><s:property value="luongKhoanTotal2.totalKhoanHQDA"/></h4>
                                                                                <p class="blue-grey lighten-2 mb-0">LƯƠNG MỀM THEO CHÍNH SÁCH MỚI</p>
                                                                            </div>
                                                                            <div class="col-md-4 col-12 text-center">
                                                                                <h4 class="font-large-2 text-bold-400" id="ccy11" ><s:property value="luongKhoanTotal2.totalKhoanChange"/></h4>
                                                                                <p class="blue-grey lighten-2 mb-0">MỨC CHÊNH LỆCH</p>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </section>
                    --%>
                    <section id="configuration">
                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h4 class="card-title">TIỀN KHOÁN/ THƯỞNG THEO CÔNG VIỆC</h4>
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
                                    <div class="card-content collapse hiden">
                                        <div class="card-body card-dashboard">
                                            <table class="table table-striped table-bordered zero-configuration hiden">
                                                <thead>
                                                    <tr>
                                                        <th>Tên nhân viên</th>
                                                        <th>Ngày tạo</th>
                                                        <th>Tháng/ kỳ</th>
                                                        <th>Lương khoán</th>
                                                        <th>Người duyệt</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <s:iterator value="lstLuongKhoans" var="test">
                                                        <s:if test="#test.loaiKhoan == 'CV'">
                                                            <tr>
                                                                <td><s:property value="userId.fullName"/></td>
                                                                <td><s:property value="createDate"/></td>
                                                                <td><s:property value="thang"/></td>
                                                                <td><s:property value="luongKhoan"/></td>
                                                                <td><s:property value="pheDuyet.fullName"/></td>
                                                            </tr>
                                                        </s:if>
                                                    </s:iterator>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                    <!--/ Multi-column ordering table -->

                    <section id="configuration">
                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h4 class="card-title">TIỀN KHOÁN/ THƯỞNG THEO MỐC GIAI ĐOẠN</h4>
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
                                    <div class="card-content collapse hiden">
                                        <div class="card-body card-dashboard">
                                            <table class="table table-striped table-bordered zero-configuration hiden">
                                                <thead>
                                                    <tr>
                                                        <th>Tên nhân viên</th>
                                                        <th>Ngày tạo</th>
                                                        <th>Tháng/ kỳ</th>
                                                        <th>Lương khoán</th>
                                                        <th>Người duyệt</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <s:iterator value="lstLuongKhoans" var="test">
                                                        <s:if test="#test.loaiKhoan == 'MT'">
                                                            <tr>
                                                                <td><s:property value="userId.fullName"/></td>
                                                                <td><s:property value="createDate"/></td>
                                                                <td><s:property value="thang"/></td>
                                                                <td><s:property value="luongKhoan"/></td>
                                                                <td><s:property value="pheDuyet.fullName"/></td>
                                                            </tr>
                                                        </s:if>
                                                    </s:iterator>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>

                    <section id="configuration">
                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h4 class="card-title">TIỀN KHOÁN/ THƯỞNG THEO HIỆU QUẢ DỰ ÁN</h4>
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
                                    <div class="card-content collapse hiden">
                                        <div class="card-body card-dashboard">
                                            <table class="table table-striped table-bordered zero-configuration hiden">
                                                <thead>
                                                    <tr>
                                                        <th>Tên nhân viên</th>
                                                        <th>Ngày tạo</th>
                                                        <th>Tháng/ kỳ</th>
                                                        <th>Lương khoán</th>
                                                        <th>Người duyệt</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <s:iterator value="lstLuongKhoans" var="test">
                                                        <s:if test="#test.loaiKhoan == 'HQDA'">
                                                            <tr>
                                                                <td><s:property value="userId.fullName"/></td>
                                                                <td><s:property value="createDate"/></td>
                                                                <td><s:property value="thang"/></td>
                                                                <td><s:property value="luongKhoan"/></td>
                                                                <td><s:property value="pheDuyet.fullName"/></td>
                                                            </tr>
                                                        </s:if>
                                                    </s:iterator>
                                                </tbody>
                                            </table>
                                        </div>
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
                convertNumberToString();
                getBarChars();
            };
            
            function convertNumberToString(){
                for (var i = 1, max = 9; i < max; i++) {
                    var id = 'ccy' + i;
                    var numer = document.getElementById(id).innerHTML;
                    var num = new Number(numer).toLocaleString("vi-VI");
                    document.getElementById(id).innerHTML = num;
                }
            }
        </script>
        

        <%@include file="/jsp/khoan-char1.jsp" %>
        <%@include file="/jsp/khoan-char2.jsp" %>
        <%@include file="/jsp/footer.jsp" %>
        <%@include file="/jsp/js.jsp" %>
    </body>
</html>

