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
                                    <li class="breadcrumb-item"><a href="#">Người dùng</a>
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
                                                        <a href="adminUserAction?method=prepareCreateUser" type="button" class="btn btn-primary btn-sm"><i class="ft-plus white"></i> Thêm người dùng</a>
                                                        <a href="adminUserRoleAction?method=roleManagement" type="button" class="btn btn-primary btn-sm"><i class="ft-user-check white"></i> Quản lý role</a>
                                                    </div>
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
                                                            <th>Mã nhân viên</th>
                                                            <th>Tên nhân viên</th>
                                                            <th>Phòng ban</th>
                                                            <th>Email</th>
                                                            <th>Quyền</th>
                                                            <th>Trạng thái</th>
                                                            <th>Hành động</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <s:iterator value="lstUsers" >
                                                            <tr>
                                                                <td>
                                                                    <span class=""><s:property value="id" /></span>
                                                                </td>
                                                                <td>
                                                                    <span class="badge badge-info"><s:property value="userName" /></span>
                                                                </td>
                                                                <td>
                                                                    <span class="badge badge-danger">
                                                                        <s:iterator value="tkUserDetails" var="c">
                                                                                 <s:property value="userName" /> 
                                                                        </s:iterator> 
                                                                    </span>
                                                                </td>
                                                                <td>
                                                                    <span class=""><s:iterator value="tkDepartment"> <s:property value="departmentName" /> </s:iterator> </span>
                                                                    </td>
                                                                    <td>
                                                                        <span class=""><s:property value="userEmail" /> </span>
                                                                </td>
                                                                <td>
                                                                    <span class=""><s:iterator value="tkRole"> <s:property value="roleValue" /> </s:iterator> </span>
                                                                    </td>
                                                                    <td>
                                                                        <span class="badge badge-light"><s:property value="userStatus" /></span>
                                                                </td>
                                                                <td>
                                                                    <span class="dropdown">
                                                                        <button id="btnSearchDrop2" type="button" data-toggle="dropdown" aria-haspopup="true"
                                                                                aria-expanded="false" class="btn btn-info dropdown-toggle"><i class="la la-cog"></i></button>
                                                                        <span aria-labelledby="btnSearchDrop2" class="dropdown-menu mt-1 dropdown-menu-right">
                                                                            <a href="adminUserCRUDAction?method=view&&userId=<s:property value="id" />" class="dropdown-item"><i class="ft-eye"></i> Xem</a>
                                                                            <a href="adminUserCRUDAction?method=prepareEdit&&userId=<s:property value="id" />" class="dropdown-item"><i class="ft-edit-2"></i> Chỉnh sửa</a>
                                                                            <a href="adminUserCRUDAction?method=delete&&userId=<s:property value="id" />" class="dropdown-item"><i class="ft-delete"></i> Xóa</a>
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
