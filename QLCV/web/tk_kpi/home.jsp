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
                                    <li class="breadcrumb-item"><a href="#">KPI</a>
                                    </li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="content-body">
                    <section id="number-tabs">
                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h4 class="card-title">DANH SÁCH KPI ĐƯỢC ÁP DỤNG TẠI PHÒNG BAN</h4>
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
                                                            <th>Mã KPI</th>
                                                            <th>Mô tả</th>
                                                            <th>Trong số 1</th>
                                                            <th>Trọng số 2</th>
                                                            <th>Trọng số 3</th>
                                                            <th>Trạng thái</th>
                                                            <th>Áp dụng</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <s:iterator value="lstKpiTypeSettings" >
                                                            <tr>
                                                                <!--                                                                    <td>
                                                                <s:property value="createDate" />
                                                            </td>
                                                            <td class="text-center">
                                                                <s:property value="lastUpdateDate" />
                                                            </td>
                                                            <td>
                                                                <span class=""><s:property value="createBy" /></span>
                                                            </td>
                                                            <td>
                                                                <span class=""><s:property value="lastUpdateBy" /></span>
                                                            </td>-->
                                                                <td>
                                                                    <span class=""><s:property value="kpiName" /></span>
                                                                </td>
                                                                <td>
                                                                    <a href="viewKpiDetailAction?id=<s:property value="id" />"><span class=""><s:property value="kpiDesc" /></span></a>
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
                                                                    <span class=""><s:property value="status" /></span>
                                                                </td>
                                                                <td>
                                                                    <span class=""><s:property value="apDung" /></span>
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
