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
        <title><%=properties.getProperty("app.codeset")%></title>
    </head>
    <body class="vertical-layout vertical-menu 2-columns   menu-expanded fixed-navbar"
          data-open="click" data-menu="vertical-menu" data-col="2-columns">
        <%@include file="/jsp/nav.jsp" %>

        <div class="app-content content">
            <div class="content-wrapper">
                <div class="content-header row">
                    <div class="content-header-left col-md-6 col-12 mb-2">
                        <h3 class="content-header-title"><%=properties.getProperty("app.codeset")%></h3>
                    </div>
                    <div class="content-header-right col-md-6 col-12">
                        <div class="btn-group float-md-right" role="group" aria-label="">
                            <a type="button" class="btn btn-info round box-shadow-2 px-2"  id="btnGroupDrop1"
                               href="<%=session.getAttribute("httpURL")%>jsp/codeset-codevalue-create.jsp"><%=properties.getProperty("app.codeset.add.new")%></a>        

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
                                        <h4 class="card-title"><%=properties.getProperty("app.codeset.list")%></h4>
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
                                            <p class="card-text"><%=properties.getProperty("app.codeset.note")%></p>
                                            <table class="table table-striped table-bordered zero-configuration">
                                                <thead>
                                                    <tr>

                                                        <!--<th><%=properties.getProperty("app.id")%></th>-->
                                                        <th><%=properties.getProperty("app.action")%></th>
                                                        <th><%=properties.getProperty("app.value")%></th>
                                                        <th ><%=properties.getProperty("app.status")%></th>
                                                        <th><%=properties.getProperty("app.description")%></th>
                                                        <th><%=properties.getProperty("app.create.date")%></th>
                                                        <th><%=properties.getProperty("app.last.update.date")%></th>
                                                        <th><%=properties.getProperty("app.create.by")%></th>
                                                        <th><%=properties.getProperty("app.last.update.by")%></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <s:iterator value="lstCodeSet" var="test">
                                                        <tr>
                                                            <!--<td><s:property value="id"/></td>-->
                                                            <td>
                                                                <a type="button" class="btn btn-info" href="eventCodeSet?event=view&&id=<s:property value="id"/>"><%=properties.getProperty("app.view")%></a>
                                                                <a type="button" class="btn btn-warning" href="eventCodeSet?event=prepareEdit&&id=<s:property value="id"/>"><%=properties.getProperty("app.edit")%></a>
                                                                <s:if test="%{#test.status == 'ACTIVE'}">
                                                                    <a type="button" class="btn btn-dark" href="eventCodeSet?event=delete&&id=<s:property value="id"/>"><%=properties.getProperty("app.delete")%></a>
                                                                </s:if>
                                                                <s:else>
                                                                    <a type="button" class="btn btn-danger" href="eventCodeSet?event=reactive&&id=<s:property value="id"/>"><%=properties.getProperty("app.reactive")%></a>
                                                                </s:else>

                                                            </td>
                                                            <td><b><s:property value="code"/></b></td>
                                                            <td>
                                                                <s:if test="%{#test.status == 'ACTIVE'}">
                                                                    <span class="badge badge-info"><%=properties.getProperty("app.status.active")%></span>
                                                                </s:if>
                                                                <s:else>
                                                                    <span class="badge badge-danger"><%=properties.getProperty("app.status.inactive")%></span>
                                                                </s:else>
                                                            <td><s:property value="name"/></td>
                                                            <td><s:property value="creationDate"/></td>
                                                            <td><s:property value="lastUpdateDate"/></td>
                                                            <td><s:property value="createBy"/></td>
                                                            <td><s:property value="lastUpdateBy"/></td>
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
