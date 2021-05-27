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
                        <h3 class="content-header-title mb-0">Danh sách </h3>
                        <div class="row breadcrumbs-top">
                            <div class="breadcrumb-wrapper col-12">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="tk_admin/home.jsp">Trang chủ</a>
                                    </li>
                                    <li class="breadcrumb-item"><a href="#">Role</a>
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
                                    <div class="card-header">
                                        <div class="card-body">
                                            <section class="row">
                                                <div class="col-12">
                                                </div>
                                            </section>
                                        </div>
                                    </div>
                                    <div class="card-content">
                                        <div class="card-body">
                                            <div class="table-responsive">
                                                <table id="project-bugs-list" class="table table-white-space table-bordered row-grouping display no-wrap icheck table-middle">
                                                    <thead>
                                                        <tr>
                                                            <th>ID</th>
                                                            <th>Ngày tạo</th>
                                                            <th>Ngày cập nhật</th>
                                                            <th>Người tạo</th>
                                                            <th>Người cập nhật</th>
                                                            <th>Mã code</th>
                                                            <th>Giá trị</th>
                                                            <th>Trạng thái</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <s:iterator value="lstTkRoles" >
                                                            <tr>
                                                                <td>
                                                                    <span class=""><s:property value="id" /></span>
                                                                </td>
                                                                <td>
                                                                    <span class=""><s:property value="createDate" /></span>
                                                                </td>
                                                                <td>
                                                                    <span class=""><s:property value="lastUpdateDate" /></span>
                                                                </td>
                                                                <td>
                                                                    <span class=""><s:property value="createBy" /></span>
                                                                </td>
                                                                <td>
                                                                    <span class=""><s:property value="lastUpdateBy" /> </span>
                                                                </td>
                                                                <td>
                                                                    <span class=""><s:property value="roleCode" /> </span>
                                                                </td>
                                                                <td>
                                                                    <span class=""><s:property value="roleValue" /> </span>
                                                                </td>
                                                                <td>
                                                                    <span class=""><s:property value="roleStatus" /> </span>
                                                                </td>
<!--                                                                <td>
                                                                    <a href="adminUserRoleAction?method=edit&&roleId=<s:property value="id" />" class="dropdown-item"><i class="ft-edit-2"></i> Chỉnh sửa</a>

                                                                </td>-->
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
                    </div>
                </div>
                <%--<%@include file="/tk_task/left-task-menu.jsp" %>--%> 
            </div>
        </div>
        <!-- ////////////////////////////////////////////////////////////////////////////-->
        <%@include file="/tk/footer.jsp" %>
    </body>
</html>
