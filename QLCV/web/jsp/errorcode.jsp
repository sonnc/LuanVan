<%-- 
    Document   : errorcode
    Created on : Feb 25, 2021, 10:46:24 AM
    Author     : sonng
--%>

<%@page import="java.util.Properties"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            session.removeAttribute("CssAndJs");
            session.setAttribute("CssAndJs", "home");
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lý công việc</title>
        <%@include file="/jsp/header.jsp" %>
        <%@include file="/jsp/linkCss.jsp" %>
    </head>
    <body class="vertical-layout vertical-menu content-detached-right-sidebar   menu-expanded fixed-navbar"
          data-open="click" data-menu="vertical-menu" data-col="content-detached-right-sidebar">
        <!-- fixed-top-->
        <%@include file="/jsp/nav.jsp" %>
        <!-- ////////////////////////////////////////////////////////////////////////////-->
        
        <div class="app-content content">
            <div class="content-wrapper">
                <div class="content-header row">
                    <div class="content-header-left col-md-6 col-12 mb-2">
                        <h3 class="content-header-title">LỖI CODE HỆ THỐNG</h3>
                        <div class="row breadcrumbs-top">
                        </div>
                    </div>
                    <div class="content-header-right col-md-6 col-12">
                    </div>
                </div>
                <div class="content-detached">
                    <div class="content-body">
                        <section class="row">
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="card-head">
                                        <div class="card-header">
                                            <h4 class="card-title">Đã xảy ra lỗi code hệ thống, thông tin được mô tả như dưới đây:</h4>
                                            <a class="heading-elements-toggle"><i class="la la-ellipsis-v font-medium-3"></i></a>
                                            
                                        </div>
                                        
                                    </div>
                                    <!-- project-info -->
                                    <div id="project-info" class="card-body row">
                                        <s:property value="errorCode"/>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </div>
                </div>
            </div>
        </div>
        <!-- ////////////////////////////////////////////////////////////////////////////-->
        <%@include file="/jsp/footer.jsp" %>
        <%@include file="/jsp/js.jsp" %>
    </body>
</html>
