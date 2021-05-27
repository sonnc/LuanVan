<%-- 
    Document   : so-tien-chi
    Created on : Apr 21, 2021, 2:50:33 PM
    Author     : sonng
--%>

<%-- 
    Document   : codeset
    Created on : Feb 21, 2021, 5:15:13 PM
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
        <title>Thông tin dữ liệu chi phí</title>
    </head>
    <body class="vertical-layout vertical-menu 2-columns   menu-expanded fixed-navbar"
          data-open="click" data-menu="vertical-menu" data-col="2-columns">
        <%@include file="/jsp/nav.jsp" %>
        <form action="saveAmount" method="post">
            <input value="<s:property value="workspaceId"/>" name="workspaceId" hidden="true">
        <div class="app-content content">
            <div class="content-wrapper">
                <div class="content-header row">
                    <div class="content-header-left col-md-6 col-12 mb-2">
                        <h3 class="content-header-title">Dữ liệu chi thực chi</h3>
                    </div>
                    <div class="content-header-right col-md-6 col-12">
                        <div class="btn-group float-md-right" role="group" aria-label="">
                            <a type="button" href="evmGenData?workspaceId=<s:property value="workspaceId"/>" class="btn btn-danger round box-shadow-2 px-2">
                                    EVM </a>     
                            <button type="submit" class="btn btn-info round box-shadow-2 px-2">
                                    <i class="ft-save"></i> <%=properties.getProperty("app.save")%></button>     

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
                                        <h4 class="card-title">Nhập liệu thực chi</h4>
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

                                            <form>
                                                <table class="table table-striped table-bordered zero-configuration">
                                                    <thead>
                                                        <tr>
                                                            <th>ID</th>
                                                            <th>Công việc</th>
                                                            <th>Số tiền kế hoạch</th>
                                                            <th>Số tiền thực chi</th>
                                                            <th>Tỷ lệ hoàn thành</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <s:iterator value="lstTask" var="test">
                                                            <tr>
                                                                <td><s:property value="id"/></td>
                                                                <td><s:property value="taskName"/></td>
                                                                <td><s:property value="amountPlan"/></td>
                                                                <td> <s:if test="#test.percentCoplete==100">
                                                                        <s:property value="amountSpent"/>
                                                                    </s:if>
                                                                    <s:else>
                                                                        <input name="soTienChi-<s:property value="id"/>" value="<s:property value="amountSpent"/>"/>
                                                                    </s:else>
                                                                </td>
                                                                <td>
                                                                    <s:if test="#test.percentCoplete==100">
                                                                        <s:property value="percentCoplete"/>
                                                                    </s:if>
                                                                    <s:else>
                                                                        <input name="phanTramHoanThanh-<s:property value="id"/>" value="<s:property value="percentCoplete"/>"/>
                                                                    </s:else>
                                                                </td>
                                                            </tr>
                                                        </s:iterator>
                                                    </tbody>
                                                </table>
                                            </form>
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
        </form>
        <%@include file="/jsp/footer.jsp" %>
        <%@include file="/jsp/js.jsp" %>
    </body>
</html>

