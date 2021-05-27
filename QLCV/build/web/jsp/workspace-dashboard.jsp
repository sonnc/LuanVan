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
            session.setAttribute("CssAndJs", "workspace-dashboard");
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="/jsp/header.jsp" %>
        <%@include file="/jsp/linkCss.jsp" %>
        <title><%=properties.getProperty("app.workspace")%></title>
    </head>
    <body class="vertical-layout vertical-menu 2-columns   menu-expanded fixed-navbar"
          data-open="click" data-menu="vertical-menu" data-col="2-columns">
        <%@include file="/jsp/nav.jsp" %>      

        <div class="app-content content">
            <div class="content-wrapper">
                <div class="content-header row">
                </div>
                <div class="content-body">
                    <!-- eCommerce statistic -->
                    <div class="row">

                    </div>
                    <!--/ eCommerce statistic -->
                    <!-- Recent Transactions -->
                    <div class="row">
                        <div id="recent-transactions" class="col-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">Danh sách workspace tham gia</h4>
                                    <a class="heading-elements-toggle"><i class="la la-ellipsis-v font-medium-3"></i></a>
                                    <div class="heading-elements">
                                        <ul class="list-inline mb-0">
                                            <%if ("PM".equals(role.getCode()) || "SPM".equals(role.getCode()) || "GD".equals(role.getCode())) {
                                            %>
                                            <li><a class="btn btn-sm btn-danger box-shadow-2 round btn-min-width pull-right"
                                                   href="workspaceAction?event=prepareCreate"><%=properties.getProperty("app.workspace.add")%></a>
                                            </li>
                                            <%
                                                }
                                            %>
                                        </ul>
                                    </div>
                                </div>
                                <div class="card-content">
                                    <div class="table-responsive">
                                        <table id="recent-orders" class="table table-hover table-xl mb-0">
                                            <thead>
                                                <tr>
                                                    <th class="border-top-0">ID</th>
                                                    <th class="border-top-0">Tên Workspace</th>
                                                    <th class="border-top-0">Quản lý</th>
                                                    <th class="border-top-0">Trạng thái</th>
                                                    <th class="border-top-0">Số thành viên</th>
                                                    <th class="border-top-0">Mốc giai đoạn</th>
                                                    <th class="border-top-0">Công việc</th>
                                                    <th class="border-top-0">CPM</th>
                                                    <th class="border-top-0">EVM</th>
                                                    <th class="border-top-0">TFW</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <s:iterator value="lstWorkspaceDashboards">
                                                    <tr>
                                                        <td class="text-truncate"><s:property value="workspaceId"/></td>
                                                        <td class="text-truncate"><a href="workspaceSumaryAction?id=<s:property value="workspaceId"/>"><s:property value="workspaceName"/></a></td>
                                                        <td class="text-truncate"><s:property value="workspaceQuanLy"/>
                                                        </td>
                                                        <td class="text-truncate p-1">
                                                            <button type="button" class="btn btn-sm btn-danger round"><s:property value="workspaceStatus"/></button>
                                                        </td>
                                                        <td>
                                                            <button type="button" class="btn btn-sm btn-info round"><s:property value="numberUserAndTeams"/></button>
                                                        </td>
                                                        <td>
                                                            <button type="button" class="btn btn-sm btn-yellow round"><s:property value="numberMilestones"/></button>
                                                        </td>
                                                        <td class="text-truncate">
                                                            <button type="button" class="btn btn-sm btn-danger round"><s:property value="task"/></button>
                                                        </td>
                                                        <td class="text-truncate">
                                                            <a class="btn btn-sm btn-success" href="cpmNodeGenData?workspaceId=<s:property value="workspaceId"/>">CPM</a>
                                                        </td>
                                                        <td class="text-truncate">
                                                            <a class="btn btn-sm btn-info" href="evmGenData?workspaceId=<s:property value="workspaceId"/>">EVM</a>
                                                        </td>
                                                        <td class="text-truncate">
                                                            <a class="btn btn-sm btn-danger" href="TfwRunToView?workspaceId=<s:property value="workspaceId"/>">TFW</a>
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
                    <!--/ Recent Transactions -->
                </div>
            </div>
        </div>
        <%@include file="/jsp/footer.jsp" %>
        <%@include file="/jsp/js.jsp" %>
    </body>
</html>
