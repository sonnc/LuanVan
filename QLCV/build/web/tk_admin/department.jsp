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
                                    <li class="breadcrumb-item"><a href="#">Phòng ban</a>
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
                                                    <div class="heading-elements" style="float: right">
                                                        <a href="tk_admin/department-create.jsp" type="button" class="btn btn-primary btn-sm"><i class="ft-plus white"></i> Thêm mới phòng ban</a>
                                                    </div>
                                                </div>
                                            </section>
                                        </div>
                                    </div>
                                    <div class="card-content">
                                        <div class="card-body">
                                            <div class="table-responsive">
                                                <table id="project-bugs-list" class="table table-bordered row-grouping display">
                                                    <thead>
                                                        <tr>
                                                            <th>ID</th>
                                                            <th>Mã phòng ban</th>
                                                            <th>Tên phòng ban</th>
                                                            <th>Mô tả</th>
                                                            <th>Trạng thái</th>
                                                            <th>Hành động</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <s:iterator value="lstTkDepartment" >
                                                            <tr>
                                                                <td>
                                                                    <span class=""><s:property value="id" /></span>
                                                                </td>
                                                                <td>
                                                                    <span class="badge badge-info"><s:property value="departmentCode" /></span>
                                                                </td>
                                                                <td>
                                                                    <span class="badge badge-info"><s:property value="departmentName" /></span>
                                                                </td>
                                                                <td>
                                                                    <span><s:property escapeHtml="false" value="departmentDetail" /></span>
                                                                    
                                                                </td>
                                                                <td>
                                                                    <span class=""> <s:property value="departmentStatus" /></span>
                                                                </td>
                                                                <td>
                                                                    <span class="dropdown">
                                                                        <button id="btnSearchDrop2" type="button" data-toggle="dropdown" aria-haspopup="true"
                                                                                aria-expanded="false" class="btn btn-info dropdown-toggle"><i class="la la-cog"></i></button>
                                                                        <span aria-labelledby="btnSearchDrop2" class="dropdown-menu mt-1 dropdown-menu-right">
                                                                            <a href="adminDepartmentAction?method=prepareEdit&&departmentId=<s:property value="id" />" class="dropdown-item"><i class="ft-edit-2"></i> Chỉnh sửa</a>
                                                                            <a href="adminDepartmentAction?method=delete&&departmentId=<s:property value="id" />" class="dropdown-item"><i class="ft-delete"></i> Xóa</a>
                                                                        </span>
                                                                    </span>
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
