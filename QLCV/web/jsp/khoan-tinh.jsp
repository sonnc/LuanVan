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
            String strDate = formatter.format(date);
            SimpleDateFormat formatter2 = new SimpleDateFormat("MM");
            String strDate2 = formatter2.format(date);
            int month = Integer.parseInt(strDate2);
        %>
        <%
            Date dateChar = new Date();
            SimpleDateFormat formattercharpm1 = new SimpleDateFormat("yyyy");
            String strDateCharpm1 = formattercharpm1.format(dateChar);
            int strDateCharpm2 = Integer.parseInt(strDateCharpm1) - 1;
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
                                                <form id="formAction" action="CaculateThemisAction" method="post">
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <p style="padding: 5px">NHẬP GIÁ TRỊ HIỆU QUẢ DỰ ÁN:</p> <span class="danger">*</span>
                                                            <select required="true" name="heSoDuAn" style="padding: 5px" class="form-control" >
                                                                <option value="*0">0</option>
                                                                <option value="*0.8">0.8</option>
                                                                <option value="*0.9">0.9</option>
                                                                <option value="*1.0">1.0</option>
                                                                <option value="*1.1">1.1</option>
                                                                <option value="*1.2">1.2</option>
                                                            </select>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <p style="padding: 5px">LỰA CHỌN CÔNG THỨC</p><span class="danger">*</span>
                                                            <select required="true" name="congthuctinh" style="padding: 5px" class="form-control" >
                                                                <s:iterator value="lstFormula">
                                                                    <option value="<s:property value="id"/>"><s:property value="formulaCaculation"/></option>
                                                                </s:iterator>
                                                            </select>
                                                        </div>
                                                    </div>


                                                    <br>
                                                    <button style="padding: 5px" class="btn btn-info">Tính giá trị</button>
                                                </form>
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
                                        <h4 class="card-title">Dữ liệu chi trả lương thưởng năm <strong class="danger"><%=strDateCharpm1%></strong> và năm  <strong class="cyan"><%=strDateCharpm2%></strong></h4>
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
                                        <h4 class="card-title">Thống kê</h4>
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
                                            <canvas id="bar-chart" height="400"></canvas>
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
                                        <h4 class="card-title">DỮ LIỆU TIỀN KHOÁN/ THƯỞNG THÁNG <strong style="color: red"><%=strDate%></strong></h4>
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
                                                        <th>Mã nhân viên</th>
                                                        <th>Tên nhân viên</th>
                                                        <th>Ngày tạo</th>
                                                        <th>Tháng/ kỳ</th>
                                                        <th>loại khoán</th>
                                                        <th>Lương khoán</th>
                                                        <th>Người duyệt</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <s:set var="monthSet"><%=month%></s:set>
                                                    <s:iterator value="lstLuongKhoans" var="test">
                                                        <s:if test="%{#test.thang == #monthSet}">
                                                            <tr>
                                                                <td><s:property value="userId.loginId"/></td>
                                                                <td><s:property value="userId.fullName"/></td>
                                                                <td><s:property value="createDate"/></td>
                                                                <td><s:property value="thang"/></td>
                                                                <td><s:property value="loaiKhoan"/></td>
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
                                        <h4 class="card-title">TẤT CẢ DỮ LIỆU</h4>
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
                                            <table class="table table-striped table-bordered zero-configuration hiden">
                                                <thead>
                                                    <tr>
                                                        <th>Mã nhân viên</th>
                                                        <th>Tên nhân viên</th>
                                                        <th>Ngày tạo</th>
                                                        <th>Tháng/ kỳ</th>
                                                        <th>Loại khoán</th>
                                                        <th>Lương khoán</th>
                                                        <th>Người duyệt</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <s:iterator value="lstLuongKhoans" var="test">
                                                        <tr>
                                                            <td><s:property value="userId.loginId"/></td>
                                                            <td><s:property value="userId.fullName"/></td>
                                                            <td><s:property value="createDate"/></td>
                                                            <td><s:property value="thang"/></td>
                                                            <td>
                                                                <s:if test="#test.loaiKhoan == 'HQDA'">
                                                                    HIỆU QUẢ DỰ ÁN
                                                                </s:if>
                                                                <s:elseif test="#test.loaiKhoan == 'MT'">
                                                                    MỐC GIAI ĐOẠN
                                                                </s:elseif>
                                                                <s:elseif test="#test.loaiKhoan == 'CV'">
                                                                    CÔNG VIỆC
                                                                </s:elseif>
                                                            </td>
                                                            <td><s:property value="luongKhoan"/></td>
                                                            <td><s:property value="pheDuyet.fullName"/></td>
                                                        </tr>
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
                getBarChars();
            };
        </script>

        <%@include file="/jsp/khoan-pm-char1.jsp" %>
        <%@include file="/jsp/khoan-pm-char2.jsp" %>
        <%@include file="/jsp/footer.jsp" %>
        <%@include file="/jsp/dialogConfirm.jsp" %>
        <%@include file="/jsp/js.jsp" %>
    </body>
</html>

