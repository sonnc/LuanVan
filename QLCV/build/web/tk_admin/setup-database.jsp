<%-- 
    Document   : project-task
    Created on : Feb 27, 2020, 11:16:06 PM
    Author     : sonng
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html class="loading" lang="en" data-textdirection="ltr">
    <%@include file="/tk/head.jsp" %>

    <body class="vertical-layout vertical-overlay-menu 2-columns   menu-expanded fixed-navbar"
          data-open="click" data-menu="vertical-overlay-menu" data-col="2-columns">
        <%@include file="/tk/topheader.jsp" %>
        <%@include file="/tk/leftmenu.jsp" %>
        <!-- ////////////////////////////////////////////////////////////////////////////-->
        <s:if test="actionMessages!=null && actionMessages.size > 0">
            <script type="text/javascript" charset="UTF-8">
                var actionMessages;
                <s:iterator value="actionMessages" >
                actionMessages = '<s:property escape="UTF-8"/>';
                </s:iterator>
                swal('Thông báo...', actionMessages, 'info')
            </script>
        </s:if>
        <!-- ////////////////////////////////////////////////////////////////////////////-->
        <div class="app-content content">
            <div class="content-wrapper">
                <div class="content-header row">
                    <div class="content-header-left col-md-6 col-12 mb-2">
                        <h3 class="content-header-title mb-0">CẤU HÌNH HỆ THỐNG </h3>
                        <div class="row breadcrumbs-top">
                            <div class="breadcrumb-wrapper col-12">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="tk_admin/home.jsp">Trang chủ</a>
                                    </li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="content-detached">
                    <div class="content-body">
                        <section class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-content">
                                        <div class="card-body">
                                            <form action="setupSystem" method="post">
                                                <>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </div>
                </div>
                <%--<%@include file="/tk_task/left-task-menu.jsp" %>--%> 
            </div>
        </div>
        <!-- ////////////////////////////////////////////////////////////////////////////-->
        <%@include file="/tk/footer.jsp" %>
    </body>
</html>
