<%-- 
    Document   : kpi_create_kpi_staff
    Created on : Jun 18, 2020, 1:50:00 PM
    Author     : sonng
--%>

<%@page import="java.util.Calendar"%>
<%@page import="java.util.Properties"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<%
    int year1 = Calendar.getInstance().get(Calendar.YEAR);
%>
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

        <div class="app-content content">
            <div class="content-wrapper">
                <div class="content-header row">
                    <div class="content-header-left col-md-6 col-12 mb-2">
                        <h3 class="content-header-title mb-0">KPI</h3>
                        <div class="row breadcrumbs-top">
                            <div class="breadcrumb-wrapper col-12">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="tk/home.jsp">Trang chủ</a>
                                    </li>
                                    <li class="breadcrumb-item"><a href="#">Khởi tạo KPI</a>
                                    </li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="content-body">
                    <section id="demo">
                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h4 class="card-title">KHỞI TẠO KPI CHO NHÂN VIÊN</h4>
                                        <a class="heading-elements-toggle"><i class="la la-ellipsis-h font-medium-3"></i></a>
                                        <div class="heading-elements">
                                            <ul class="list-inline mb-0">
                                                <li><a href="" type="button" class="btn btn-primary btn-red"><i class="ft-eye white"></i> KPI <%=year1%></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <hr/>
                                    <div class="card-content collapse show">
                                        <div class="card-body">
                                            <div class="table-responsive">
                                                <form id="formCreateNew" action="kpiUserAction" method="post">
                                                    <section id="drag-area">
                                                        <div class="row" style="margin: 0px">
                                                            <div class="col-md-9">
                                                                <div class="card">
                                                                    <h5>Mã nhân viên
                                                                        <span class="required">*</span>
                                                                    </h5>
                                                                    <div class="controls">
                                                                        <input hidden="true" name="method" value="create"/>
                                                                        <s:textfield hidden="true" type="text" name="userId" value="%{tkUser.id}" cssClass="form-control" />
                                                                        <s:textfield disabled="true" type="text" name="tkUser.fullName" value="%{tkUser.fullName}" cssClass="form-control" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-3">
                                                                <div class="card">
                                                                    <h5>Năm
                                                                        <span class="required">*</span>
                                                                    </h5>
                                                                    <div class="controls">
                                                                        <input value="<%=year1%>" class="form-control"/>
                                                                        <input hidden="true" name="kpiYear" value="<%=year1%>" class="form-control"/>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </section>
                                                    <section id="drag-area">
                                                        <div class="row" style="margin: 0px">
                                                            <div class="table-responsive">
                                                                <style>
                                                                    .table th, .table td  {
                                                                        padding: 5px;
                                                                    }
                                                                    .table th{
                                                                        text-align: center;
                                                                    }
                                                                    table.dataTable td.reorder{
                                                                        text-align: left;
                                                                    }
                                                                </style>
                                                                <table id="project-bugs-list" class="table table-white-space table-bordered row-grouping display no-wrap icheck table-middle">
                                                                    <thead>
                                                                        <tr>
                                                                            <th>Mã KPI</th>
                                                                            <th>Tên KPI</th>
                                                                            <th>T.S 1</th>
                                                                            <th>T.S 2</th>
                                                                            <th>T.S 3</th>
                                                                            <th>Áp dụng</th>
                                                                            <th>Chi tiết bộ KPI</th>
                                                                            <th>Lựa chọn?</th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                        <s:iterator value="lstKpiTypeSettings" var="varKpiType">
                                                                            <tr>
                                                                                <td>
                                                                                    <span class="" style="text-align: left"><s:property value="kpiName" /></span>
                                                                                </td>
                                                                                <td>
                                                                                    <span class=""><s:property value="kpiDesc" /></span>
                                                                                </td>
                                                                                <td>
                                                                                    <span class=""><s:property value="trongSoKpiPhongban" /></span>
                                                                                </td>
                                                                                <td>
                                                                                    <span class=""><s:property value="trongSoKpiThuongxuyen" /></span>
                                                                                </td>
                                                                                <td>
                                                                                    <span class=""><s:property value="trongSoKpiDotxuat" /></span>
                                                                                </td>
                                                                                <td>
                                                                                    <span class=""><s:property value="apDung" /></span>
                                                                                </td>
                                                                                <td>
                                                                                    <table id="project-bugs-list" class="table table-white-space table-bordered row-grouping display no-wrap icheck table-middle">
                                                                                        <thead>
                                                                                            <tr>
                                                                                                <th>Mã KPI</th>
                                                                                                <th>Chỉ số</th>
                                                                                                <th>DVT</th>
                                                                                                <th>T.S</th>
                                                                                                <th>Tần suất</th>
                                                                                            </tr>
                                                                                        </thead>
                                                                                        <tbody>
                                                                                            <s:iterator value="tkKpiItemSettings" var="varKpiItem">
                                                                                                <tr>
                                                                                                    <td>
                                                                                                        <span class=""><s:property value="kpiName" /></span>
                                                                                                    </td>
                                                                                                    <td>
                                                                                                        <span class=""><s:property value="item" /></span>
                                                                                                    </td>
                                                                                                    <td>
                                                                                                        <span class=""><s:property value="donViTinh" /></span>
                                                                                                    </td>
                                                                                                    <td>
                                                                                                        <span class=""><s:property value="trongSo" /></span>
                                                                                                    </td>
                                                                                                    <td>
                                                                                                        <span class=""><s:property value="tanSuatDanhGia" /></span>
                                                                                                    </td>
                                                                                                </tr>  
                                                                                            </s:iterator>
                                                                                        </tbody>
                                                                                    </table>
                                                                                </td>
                                                                                <td>
                                                                                    <input id="chooseKpiForStaff" name="chooseKpiForStaff" value="<s:property value="id" />" type="checkbox" class="checkbox"/>
                                                                                </td>

                                                                            </tr>  
                                                                        </s:iterator>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
                                                    </section>
                                                    <button type="submit" class="btn btn-info btn-lg btn-block"><i class="ft-unlock"></i> KHỞI TẠO</button>
                                                </form>
                                            </div>
                                        </div>
                                        <script>
                                            document.querySelector('#formCreateNew').addEventListener('submit', function (e) {
                                                var form = this;
                                                e.preventDefault();
                                                swal({
                                                    title: "<%=properties.getProperty("tk.tko.label.kpi.create.mess1")%>",
                                                    text: "<%=properties.getProperty("tk.tko.label.kpi.create.mess2")%>",
                                                    icon: "warning",
                                                    buttons: [
                                                        '<%=properties.getProperty("tk.tko.label.kpi.create.mess3")%>',
                                                        '<%=properties.getProperty("tk.tko.label.kpi.create.mess4")%>'
                                                    ],
                                                    dangerMode: true,
                                                }).then(function (isConfirm) {
                                                    if (isConfirm) {
                                                        swal({
                                                            title: '<%=properties.getProperty("tk.tko.label.kpi.create.mess5")%>',
                                                            text: '<%=properties.getProperty("tk.tko.label.kpi.create.mess6")%>',
                                                            icon: 'success'
                                                        }).then(function () {
                                                            form.submit();
                                                        });
                                                    } else {
                                                        swal("<%=properties.getProperty("tk.tko.label.kpi.create.mess7")%>", "<%=properties.getProperty("tk.tko.label.kpi.create.mess8")%>", "error");
                                                    }
                                                });
                                            });
                                        </script>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </div> 
        </div>
        <script>
            function checkOnclick() {
                var s = document.querySelectorAll('[id^=chooseKpiForStaff]').length;
                if (s > 1) {
                    swal('Oops...', "Không thể chọn nhiều hơn 1 bộ KPI", 'error');
                    return false;
                }
            }
        </script>
        <%@include file="/jsp/footer.jsp" %>
        <%@include file="/jsp/js.jsp" %>
    </body>
</html>
