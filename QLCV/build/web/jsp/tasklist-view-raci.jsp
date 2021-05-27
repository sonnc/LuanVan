<%-- 
    Document   : tasklist_view_raci
    Created on : Mar 9, 2021, 9:43:36 AM
    Author     : sonng
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            session.removeAttribute("CssAndJs");
            session.setAttribute("CssAndJs", "codeset");
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="/jsp/header.jsp" %>
        <%@include file="/jsp/linkCss.jsp" %>
        <title>RACI</title>
    </head>
    <body class="vertical-layout vertical-menu 2-columns   menu-expanded fixed-navbar"
          data-open="click" data-menu="vertical-menu" data-col="2-columns">
        <%@include file="/jsp/nav.jsp" %>

        <div class="app-content content">
            <div class="content-wrapper">
                <div class="content-header row">
                    <div class="content-header-left col-md-6 col-12 mb-2">
                        <h3 class="content-header-title">THÔNG TIN RACI</h3>
                    </div>
                    <div class="content-header-right col-md-6 col-12">  
                        <div class="btn-group float-md-right" > 
                            <a type="button" href="workspaceSumaryAction?id=<s:property value="workspace.id"/>" class="btn btn-danger round box-shadow-2 px-2">
                               <i class="ft-home"></i> Trở về Workspace</a>
                            <a type="button" href="viewAllTask?workspaceId=<s:property value="workspace.id"/>" class="btn btn-warning round box-shadow-2 px-2">
                               <i class="ft-book"></i> Trở về Task List</a>
                        </div>
                    </div>
                </div>
                <div class="content-body">
                    <!-- Zero configuration table -->

                    <section id="configuration">
                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h4 class="card-title">Thông tin RACI cho: <s:property value="tasklist.taskListTitle"/></h4>
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
                                            <table class="table table-striped table-bordered zero-configuration">
                                                <thead>
                                                    <tr>
                                                        <th style="text-align: center;">Mã nhân viên</th>
                                                        <th style="text-align: center;">Tên nhân viên</th>
                                                        <th style="text-align: center;">R - Trách nhiệm thực thi</th>
                                                        <th style="text-align: center;">A - Trách nhiệm giải trình</th>
                                                        <th style="text-align: center;">C- Tham vấn</th>
                                                        <th style="text-align: center;">I - Thông báo</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                <s:iterator value="lstRaciViews" var="test">
                                                    <tr>
                                                        <td><s:property value="userLogin"/></td>
                                                    <td><s:property value="fullName"/></td>
                                                    <td style="text-align: center; color: red"><s:property value="raciR"/></td>
                                                    <td style="text-align: center; color: red"><s:property value="raciA"/></td>
                                                    <td style="text-align: center; color: red"><s:property value="raciC"/></td>
                                                    <td style="text-align: center; color: red"><s:property value="raciI"/></td>
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
                    <!--/ Multi-column ordering table -->
                </div>
            </div>
        </div>
        <!-- ////////////////////////////////////////////////////////////////////////////-->

        <%@include file="/jsp/footer.jsp" %>
        <%@include file="/jsp/js.jsp" %>
    </body>
</html>