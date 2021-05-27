<%-- 
    Document   : user-profile
    Created on : Feb 26, 2020, 10:30:08 PM
    Author     : sonng
--%>
<%@page import="java.util.Properties"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="hust.soict.ca190141.sonnc.entities.base.TkCodeValue"%>
<%@page import="hust.soict.ca190141.sonnc.entities.base.TkUser"%>
<%@page import="hust.soict.ca190141.sonnc.entities.base.TkRole"%>
<%@page import="hust.soict.ca190141.sonnc.entities.base.TkDepartment"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="loading" lang="en" data-textdirection="ltr">
    <%
        Properties prop = (Properties) session.getAttribute("properties");
    %>
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



        <div class="app-content content">
            <div class="content-wrapper">
                <div class="content-header row">
                    <div class="content-header-left col-md-6 col-12 mb-2">
                        <h3 class="content-header-title mb-0"><%=prop.getProperty("tk.tko.label.home.user-profiles.title")%></h3>
                        <div class="row breadcrumbs-top">
                            <div class="breadcrumb-wrapper col-12">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="<%=session.getAttribute("httpURL")%>tk_admin/home.jsp"><%=prop.getProperty("tk.tko.label.home")%></a>
                                    </li>
                                    <li class="breadcrumb-item active">Phòng ban
                                    </li>
                                </ol>
                            </div>
                        </div>
                    </div>
                    <div class="content-header-right text-md-right col-md-6 col-12">
                    </div>
                </div>
                <div class="content-body">

                    <section id="drag-area">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card-header">
                                    <div class="card-content collapse show">
                                        <div class="card-body">
                                            <form id="formUoCUserDetail" action="adminDepartmentAction" method="post" enctype = "multipart/form-data" accept-charset="UTF-8">
                                                <input hidden="true" name="departmentId" value="<s:property value="tkDepartment.id"/>"/>
                                                <input hidden="true" name="method" value="edit"/>
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <h5><%=prop.getProperty("tk.tko.label.home.department.label1")%>
                                                                        <span class="required">*</span>
                                                                    </h5>
                                                                    <div class="controls">
                                                                        <s:textfield type="text" name="tkDepartment.departmentName" value="%{tkDepartment.departmentName}" cssClass="form-control" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <h5><%=prop.getProperty("tk.tko.label.home.department.label2")%>
                                                                        <span class="required">*</span>
                                                                    </h5>
                                                                    <div class="controls">
                                                                        <s:textfield type="text" name="tkDepartment.departmentCode" value="%{tkDepartment.departmentCode}" cssClass="form-control" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>
                                                    <div class="col-md-12">
                                                        <div class="form-group">
                                                            <h5><%=prop.getProperty("tk.tko.label.home.department.label3")%>
                                                                <span class="required">*</span>
                                                            </h5>
                                                            <div class="controls">
                                                                <s:textarea cssStyle="height: 200px;" cssClass="summernote" type="text" name="tkDepartment.departmentDetail" value="%{tkDepartment.departmentDetail}"/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="text-right">
                                                    <button type="submit" class="btn btn-success"><%=prop.getProperty("tk.tko.label.button.save")%> <i class="la la-thumbs-o-up position-right"></i></button>
                                                    <button type="reset" class="btn btn-danger"><%=prop.getProperty("tk.tko.label.button.reset")%> <i class="la la-refresh position-right"></i></button>
                                                </div>
                                            </form>
                                            <script>
                                                document.querySelector('#formUoCUserDetail').addEventListener('submit', function (e) {
                                                    var form = this;
                                                    e.preventDefault();
                                                    swal({
                                                        title: "<%=prop.getProperty("tk.tko.label.home.department.mess11")%>",
                                                        text: "<%=prop.getProperty("tk.tko.label.home.department.mess12")%>",
                                                        icon: "warning",
                                                        buttons: [
                                                            '<%=prop.getProperty("tk.tko.label.home.department.mess13")%>',
                                                            '<%=prop.getProperty("tk.tko.label.home.department.mess14")%>'
                                                        ],
                                                        dangerMode: true,
                                                    }).then(function (isConfirm) {
                                                        if (isConfirm) {
                                                            swal({
                                                                title: '<%=prop.getProperty("tk.tko.label.home.department.mess15")%>',
                                                                text: '<%=prop.getProperty("tk.tko.label.home.department.mess16")%>',
                                                                icon: 'success'
                                                            }).then(function () {
                                                                form.submit();
                                                            });
                                                        } else {
                                                            swal("<%=prop.getProperty("tk.tko.label.home.department.mess17")%>", "<%=prop.getProperty("tk.tko.label.home.department.mess18")%>", "error");
                                                        }
                                                    });
                                                });
                                            </script> 
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
<!--                                                                                <a href="adminUserCRUDAction?method=prepareEdit&&userId=<s:property value="id" />" class="dropdown-item"><i class="ft-edit-2"></i> Chỉnh sửa</a>
                                                                            <a href="adminUserCRUDAction?method=delete&&userId=<s:property value="id" />" class="dropdown-item"><i class="ft-delete"></i> Xóa</a>-->
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
        </div>
        <!-- ////////////////////////////////////////////////////////////////////////////-->
        <%@include file="/tk/footer.jsp" %>
    </body>
</html>