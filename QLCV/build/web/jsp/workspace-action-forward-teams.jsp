<%-- 
    Document   : workspace-action-forward
    Created on : Feb 25, 2021, 2:49:59 PM
    Author     : sonng
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            session.removeAttribute("CssAndJs");
            session.setAttribute("CssAndJs", "workspace-action-forward");
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
                    <div class="content-header-left col-md-6 col-12 mb-2">
                        <h3 class="content-header-title"><%=properties.getProperty("app.forward")%></h3>

                    </div>
                    <div class="content-header-right col-md-6 col-12">

                    </div>
                </div>
                <div class="content-body">
                    <!-- Form wizard with number tabs section start -->
                    <section id="">
                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h4 class="card-title"><%=properties.getProperty("app.forward.message")%></h4>
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
                                    <div class="card-content collapse show">
                                        <div class="card-body">
                                            <form action="workspaceAction" method="post" >
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="form-group">
                                                            <div class="bs-callout-success callout-bordered p-1">
                                                                <strong><%=properties.getProperty("app.finish")%>!</strong>
                                                                <p><%=properties.getProperty("app.workspace.message.create.team")%></p>
                                                            </div>
                                                            <div style="padding-top: 30px; float: right">
                                                                <a type="button" class="btn badge-info" href="workspaceAction?event=viewWorkspace&&id=<s:property value="workspace.id"/>"><%=properties.getProperty("app.conitnue")%> </a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                    <!-- Form wizard with number tabs section end -->
                </div>
            </div>
        </div>


        <%@include file="/jsp/footer.jsp" %>
        <%@include file="/jsp/js.jsp" %>
    </body>
</html>

