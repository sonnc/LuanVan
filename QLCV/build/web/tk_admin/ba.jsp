<%-- 
    Document   : home
    Created on : Feb 25, 2020, 9:11:06 PM
    Author     : sonng
--%>

<%@page import="java.util.Properties"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<%
    Properties prop = (Properties) session.getAttribute("properties");
%>
<html class="loading" lang="en" data-textdirection="ltr">
    <%@include file="/tk/head.jsp" %>
    <body class="vertical-layout vertical-overlay-menu 2-columns   menu-expanded fixed-navbar"
          data-open="click" data-menu="vertical-overlay-menu" data-col="2-columns">
        <s:if test="actionMessages!=null && actionMessages.size > 0">
            <script type="text/javascript" charset="UTF-8">
                var actionMessages;
                <s:iterator value="actionMessages" >
                actionMessages = '<s:property escape="UTF-8"/>';
                </s:iterator>
                swal('Thông báo...', actionMessages, 'info')
            </script>
        </s:if>
        <%@include file="/tk/topheader.jsp" %>
        <%@include file="/tk/leftmenu.jsp" %>
        <div class="app-content content">
            <div class="content-wrapper">
                <div class="content-header row">
                    <div class="content-header-left col-md-6 col-12 mb-2">
                        <h3 class="content-header-title mb-0">BA-ONLINE</h3>
                        <div class="row breadcrumbs-top">
                            <div class="breadcrumb-wrapper col-12">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="tk_admin/home.jsp">Trang chủ</a>
                                    </li>
                                    <li class="breadcrumb-item"><a href="#">BA-ONLINE</a>
                                    </li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>

                <div  class="content-detached content">   
                    <div class="content-body">
                        <section id="demo">
                            <div class="row">
                                <div class="col-12">
                                    <div class="card">
                                        <div class="card-header">
                                            <h4 class="card-title">DANH SÁCH TICKET</h4>
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
                                        <div class="card-content">
                                            <div class="card-body">
                                                <div>
                                                    <a href="adminBaOnlineAction?method=prepareCreateBaOnline" style="float: right; color: white; margin-right: 30px" type="button" class="btn btn-primary">
                                                        <i class="ft-plus"></i> Tạo mới TICKET</a>
                                                </div>
                                                <!-- Task List table -->
                                                <div class="table-responsive">
                                                    <table id="project-bugs-list" class="table table-white-space table-bordered row-grouping display no-wrap icheck table-middle">
                                                        <thead>
                                                            <tr>   
                                                                <th>Dịch vụ</th>
                                                                <th>Mã code</th>
                                                                <th>Tên dịch vụ</th>
                                                                <th>Mô tả</th>
                                                                <th>Trạng thái</th>
                                                                <th>Luồng phê duyệt</th>
                                                                <th>Xóa?</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <s:iterator value="lstBaOnlineTypeSeting" var="test">
                                                                <tr>
                                                                    <td>
                                                                        <span class=""><s:property value="baSerivice" /></span>
                                                                    </td>
                                                                    <td>
                                                                        <span class=""><s:property value="baTypeCode" /></span>
                                                                    </td>
                                                                    <td>
                                                                        <span class=""><s:property value="baTypeName" /></span>
                                                                    </td>
                                                                    <td>
                                                                        <span class=""><s:property value="baTypeDesc" /></span>
                                                                    </td>
                                                                    <td>
                                                                        <s:if test="%{#test.status == 'ACTIVE'}">
                                                                            <span class="badge badge-info"><s:property value="status" /></span>
                                                                        </s:if>
                                                                        <s:elseif test="%{#test.status == 'DELETE'}">
                                                                            <span class="badge badge-danger"><s:property value="status" /></span>
                                                                        </s:elseif>
                                                                        <s:else>
                                                                            <span class="badge badge-light"><s:property value="status" /></span>
                                                                        </s:else>
                                                                    </td>
                                                                    <td>
                                                                        <table id="project-bugs-list" class="table table-white-space table-bordered row-grouping display no-wrap icheck table-middle">
                                                                            <thead>
                                                                                <tr>   
                                                                                    <th>Trình tự</th>
                                                                                    <th>Người phê duyệt</th>
                                                                                    <th>Thời gian xử lý</th>
                                                                                    <th>Bình luận</th>
                                                                                    <th>Trạng thái</th>
                                                                                </tr>
                                                                            </thead>
                                                                            <tbody>
                                                                                <s:iterator value="tkBaFlowSetings" var="var">
                                                                                    <tr>
                                                                                        <td>
                                                                                            <span class=""><s:property value="displayOrder" /></span>
                                                                                        </td>
                                                                                        <td>
                                                                                            <s:iterator value="tkUser">
                                                                                                <s:property value="userName"/> - 
                                                                                                <s:iterator value="tkUserDetails">
                                                                                                    <s:property value="userName"/>
                                                                                                </s:iterator>
                                                                                            </s:iterator>
                                                                                            <span class=""><s:property value="userProcessName" /></span>
                                                                                        </td>
                                                                                        <td>
                                                                                            <span class=""><s:property value="timeProcess" /></span>
                                                                                            <span class=""><s:property value="timeProcessCommon" /></span>
                                                                                        </td>
                                                                                        <td>
                                                                                            <span class=""><s:property value="comment" /></span>
                                                                                        </td>
                                                                                        <td>
                                                                                            <s:if test="%{#var.status == 'ACTIVE'}">
                                                                                                <span class="badge badge-info"><s:property value="status" /></span>
                                                                                            </s:if>
                                                                                            <s:elseif test="%{#var.status == 'DELETE'}">
                                                                                                <span class="badge badge-danger"><s:property value="status" /></span>
                                                                                            </s:elseif>
                                                                                            <s:else>
                                                                                                <span class="badge badge-light"><s:property value="status" /></span>
                                                                                            </s:else>
                                                                                        </td>
                                                                                    </tr>
                                                                                </s:iterator>
                                                                                <%--</s:property>--%>
                                                                            </tbody>

                                                                        </table>
                                                                    </td>
                                                                    <td>
                                                                        <a type="button" href="adminKpiAction?method=deleteBaOnline&&baOnlineId=<s:property value="id" />"type="button" class="btn btn-danger"><i class="ft-delete"></i> Xóa</a>
                                                                        <a type="button" href="adminKpiAction?method=prepareEdit&&baOnlineId=<s:property value="id" />"type="button" class="btn btn-danger"><i class="ft-delete"></i> Sửa</a>
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
                            </div>
                        </section>
                    </div>
                </div>
            </div> 
        </div>
        <%@include file="/tk/footer.jsp" %>
    </body>
</html>
