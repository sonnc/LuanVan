<%-- 
    Document   : home
    Created on : Feb 25, 2020, 9:11:06 PM
    Author     : sonng
--%>

<%@page import="java.util.Properties"%>
<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<%
    int year2 = Calendar.getInstance().get(Calendar.YEAR);
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

        <s:if test="actionMessages!=null && actionMessages.size > 0">
            <script type="text/javascript" charset="UTF-8">
                var actionMessages;
                <s:iterator value="actionMessages" >
                actionMessages = '<s:property escape="UTF-8"/>';
                </s:iterator>
                swal('Thông báo...', actionMessages, 'info')
            </script>
        </s:if>
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
                                    <li class="breadcrumb-item"><a href="#">KPI</a>
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
                                        <h4 class="card-title">DANH SÁCH KPI CẦN ĐÁNH GIÁ</h4>
                                        <a class="heading-elements-toggle"><i class="la la-ellipsis-h font-medium-3"></i></a>
                                        <div class="heading-elements">
                                            <ul class="list-inline mb-0">
                                                <li><a data-action="collapse"><i class="ft-minus"></i></a></li>
                                                <li><a data-action="reload"><i class="ft-rotate-cw"></i></a></li>
                                                <li><a data-action="expand"><i class="ft-maximize"></i></a></li>
                                                <li><a data-action="close"><i class="ft-x"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <form id="formRating" action="kpiUserAction" method="post">
                                        <input hidden="true" name="kpiYear" value="<%=year2%>"/>
                                        <input hidden="true" name="userId" value="0"/>
                                        <input hidden="true" name="method" value="sendRatingKpi"/>
                                        <div class="card-content">
                                            <div class="card-body">
                                                <!-- Task List table -->
                                                <div class="table-responsive">
                                                    <table id="project-bugs-list" class="table table-white-space table-bordered row-grouping display no-wrap icheck table-middle">
                                                        <thead>
                                                            <tr>   
                                                                <th>KPI</th>
                                                                <th>Chỉ số</th>
                                                                <th>ĐVT</th>
                                                                <th>Tần suất</th>
                                                                <th>Trọng số</th>
                                                                <th>Kết quả thực hiện</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <s:iterator value="lstTkKpiItemRating" var="var">

                                                                <tr>
                                                                    <td style="text-align: left">
                                                                        <span class="" style="text-align: left">
                                                                            <s:property value="kpiName" />
                                                                        </span>
                                                                    </td>
                                                                    <td>
                                                                        <span class=""><s:property value="item" /></span>
                                                                    </td>  
                                                                    <td>
                                                                        <span class=""><s:property value="donViTinh" /></span>
                                                                    </td>
                                                                    <td>
                                                                        <span class=""><s:property value="tanSuatDanhGia" /></span>
                                                                    </td>
                                                                    <td>
                                                                        <span class=""><s:property value="trongSo" /></span>
                                                                    </td>
                                                                    <td>
                                                                        <div class="controls">
                                                                            <input type="number" step="0.1" name="ratingKpiInput<s:property value="id" />" value="" class="form-control"/>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                            </s:iterator>

                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                        <s:if test="%{lstTkKpiItemRating.size > 0}">
                                            <div  class="card-content" style="margin-right: 50px; margin-bottom: 50px; justify-content: center;display: flex;  align-items: center;">
                                                <button style="margin-bottom: 50px;width: auto; " type="submit" class="btn btn-info"><i class="ft-fast-forward"></i> GỬI BẢN ĐÁNH GIÁ</button>
                                            </div>
                                        </s:if>
                                    </form>
                                    <script>
                                        document.querySelector('#formRating').addEventListener('submit', function (e) {
                                            var form = this;
                                            e.preventDefault();
                                            swal({
                                                title: "<%=properties.getProperty("tk.tko.label.kpi.rating.mess1")%>",
                                                text: "<%=properties.getProperty("tk.tko.label.kpi.rating.mess2")%>",
                                                icon: "warning",
                                                buttons: [
                                                    '<%=properties.getProperty("tk.tko.label.kpi.rating.mess3")%>',
                                                    '<%=properties.getProperty("tk.tko.label.kpi.rating.mess4")%>'
                                                ],
                                                dangerMode: true,
                                            }).then(function (isConfirm) {
                                                if (isConfirm) {
                                                    swal({
                                                        title: '<%=properties.getProperty("tk.tko.label.kpi.rating.mess5")%>',
                                                        text: '<%=properties.getProperty("tk.tko.label.kpi.rating.mess6")%>',
                                                        icon: 'success'
                                                    }).then(function () {
                                                        form.submit();
                                                    });
                                                } else {
                                                    swal("<%=properties.getProperty("tk.tko.label.kpi.rating.mess7")%>", "<%=properties.getProperty("tk.tko.label.kpi.rating.mess8")%>", "error");
                                                }
                                            });
                                        });
                                    </script>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
                <div class="content-body">
                    <section id="demo">
                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h4 class="card-title">DANH SÁCH KPI ĐÃ KHỞI TẠO</h4>
                                        <a class="heading-elements-toggle"><i class="la la-ellipsis-h font-medium-3"></i></a>
                                        <div class="heading-elements">
                                            <ul class="list-inline mb-0">
                                                <li><a data-action="collapse"><i class="ft-minus"></i></a></li>
                                                <li><a data-action="reload"><i class="ft-rotate-cw"></i></a></li>
                                                <li><a data-action="expand"><i class="ft-maximize"></i></a></li>
                                                <li><a data-action="close"><i class="ft-x"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="card-content">
                                        <div class="card-body">
                                            <!-- Task List table -->
                                            <div class="table-responsive">
                                                <table id="project-bugs-list" class="table table-white-space table-bordered row-grouping display no-wrap icheck table-middle">
                                                    <thead>
                                                        <tr>   
                                                            <th>KPI</th>
                                                            <th>Chỉ tiêu</th>
                                                            <th>Trọng số</th>
                                                            <th>Kết quả thực hiện</th>
                                                            <th>Tỷ lệ thực hiện</th>
                                                            <th>Trạng thái</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <s:iterator value="lstTkKpiItemDetailRatings" var="var">

                                                            <tr>
                                                                <td>
                                                                    <span class=""><s:property value="kpiDetailRatingName" /></span>
                                                                </td>
                                                                <td>
                                                                    <span class=""><s:property value="kpiItem" /></span>
                                                                </td>
                                                                <td>
                                                                    <span class=""><s:property value="trongSo" /></span>
                                                                </td>
                                                                <td>
                                                                    <span class=""><s:property value="ketQuaThucHien" /></span>
                                                                </td>
                                                                <td>
                                                                    <span class=""><s:property value="tyLeThucHien" /></span>
                                                                </td>
                                                                <td>
                                                                    <span class=""><s:property value="status" /></span>
                                                                </td>
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
                    </section>
                </div>



            </div> 
        </div>
        <%@include file="/jsp/footer.jsp" %>
        <%@include file="/jsp/js.jsp" %>
    </body>
</html>