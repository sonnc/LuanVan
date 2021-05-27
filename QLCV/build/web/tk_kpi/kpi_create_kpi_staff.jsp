<%-- 
    Document   : kpi_create_kpi_staff
    Created on : Jun 18, 2020, 1:50:00 PM
    Author     : sonng
--%>

<%@page import="java.util.Calendar"%>
<%@page import="java.util.Properties"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<%
    int year1 = Calendar.getInstance().get(Calendar.YEAR);
%>
<html>
    <head>
        <%
            session.removeAttribute("CssAndJs");
            session.setAttribute("CssAndJs", "KPI2");
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="/jsp/header.jsp" %>
        <%@include file="/jsp/linkCss.jsp" %>
        <title>KPI</title>
    </head>
    <body class="vertical-layout vertical-menu 2-columns   menu-expanded fixed-navbar"
          data-open="click" data-menu="vertical-menu" data-col="2-columns">
        <s:if test="actionMessages!=null && actionMessages.size > 0">
            <script type="text/javascript" charset="UTF-8">
                var actionMessages;
                <s:iterator value="actionMessages" >
                actionMessages = '<s:property escape="UTF-8"/>';
                </s:iterator>
                swal('Thông báo...', actionMessages, 'info')
            </script>
        </s:if>
        <%@include file="/jsp/nav.jsp" %>
        <div class="app-content content">
            <div class="content-wrapper">
                <div class="content-header row">
                    <div class="content-header-left col-md-6 col-12 mb-2">
                        <h3 class="content-header-title mb-0">KPI</h3>
                        <div class="row breadcrumbs-top">
                            <div class="breadcrumb-wrapper col-12">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="tk/home.jsp">Trang chủ</a>
                                    </li>
                                    <li class="breadcrumb-item"><a href="#">KPI</a>
                                    </li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="content-body">
                    <section id="demo">
                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h4 class="card-title">QUẢN LÝ KPI</h4>
                                        <a class="heading-elements-toggle"><i class="la la-ellipsis-h font-medium-3"></i></a>
                                        <div class="heading-elements">
                                            <ul class="list-inline mb-0">
                                                <li><a href="" type="button" class="btn btn-primary btn-red"><i class="ft-eye white"></i> KPI <%=year1%></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="card-content collapse show">
                                        <div class="card-body">
                                            <div class="table-responsive">
                                                <table id="project-bugs-list" class="table table-white-space table-bordered row-grouping display no-wrap icheck table-middle">
                                                    <thead>
                                                        <tr>
                                                            <th>STT</th>
                                                            <th>Năm</th>
                                                            <th>Mã nhân viên</th>
                                                            <th>Tên nhân viên</th>
                                                            <th>Trạng thái</th>
                                                            <th>Hành động</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <s:iterator value="lstUserKpiMappers" var="var">
                                                            <tr>
                                                                <td>
                                                                    <span class=""><s:property value="stt" /></span>
                                                                </td>
                                                                <td>
                                                                    <span class=""><s:property value="kpiYear" /></span>
                                                                </td>
                                                                <td>
                                                                    <span class=""><s:property value="account" /></span>
                                                                </td>
                                                                <td>
                                                                    <span class=""><s:property value="userName" /></span>
                                                                </td>
                                                                <td>
                                                                    <s:if test="%{#var.kpiStatus  == 'not_create'}" > 
                                                                        <span class="badge badge-dark" >CHƯA KHỞI TẠO</span>
                                                                    </s:if>
                                                                    <s:elseif test="%{#var.kpiStatus  == 'ACTIVE'}" > 
                                                                        <span class="badge badge-info" >HOẠT ĐỘNG</span>
                                                                    </s:elseif>
                                                                    <s:elseif test="%{#var.kpiStatus  == 'APPROVE'}" > 
                                                                        <span class="badge badge-glow" >ĐÃ ĐÁNH GIÁ</span>
                                                                    </s:elseif>
                                                                    <s:elseif test="%{#var.kpiStatus  == 'PENDING_APPROVE'}" > 
                                                                        <span class="badge badge-primary" >CHỜ ĐÁNH GIÁ</span>
                                                                    </s:elseif>
                                                                    <s:elseif test="%{#var.kpiStatus  == 'DELETE'}" > 
                                                                        <span class="badge badge-danger" >ĐÃ XÓA</span>
                                                                    </s:elseif>
                                                                    <s:else>
                                                                        <span class="badge badge-light" ><s:property value="kpiStatus" /></span>
                                                                    </s:else>
                                                                    <s:if test="%{#var.kpiPendingAproved  != 0}" >
                                                                        <span class="badge badge-danger" >Có Kpi chờ phê duyệt</span>
                                                                    </s:if>

                                                                </td>
                                                                <td>
                                                                    <span class="dropdown">
                                                                        <s:if test="%{#var.kpiYear != 0}" >    
                                                                            <a href="kpiUserAction?userId=<s:property value="userId"/>&&kpiYear=<s:property value="kpiYear"/>&&method=view" class="dropdown-item"><i class="ft-edit-2"></i> Xem</a>
                                                                            <a href="kpiUserAction?userId=<s:property value="userId"/>&&kpiYear=<s:property value="kpiYear"/>&&method=edit" class="dropdown-item"><i class="ft-check"></i> Chỉnh sửa</a>
                                                                            <a href="kpiUserAction?userId=<s:property value="userId"/>&&kpiYear=<s:property value="kpiYear"/>&&method=prepareApprovedRating" class="dropdown-item"><i class="ft-star"></i> Xếp hạng</a>
                                                                        </s:if>
                                                                        <s:else>
                                                                            <a href="kpiUserAction?userId=<s:property value="userId" />&&kpiYear=<%=year1%>&&method=prepareCreate" class="dropdown-item"><i class="ft-check"></i> Khởi tạo</a>
                                                                        </s:else>
                                                                    </span>
                                                                </td>
                                                            </tr>  
                                                        </s:iterator>
                                                    </tbody>
                                                    <tfoot>
                                                        <tr>
                                                            <th>STT</th>
                                                            <th>Năm</th>
                                                            <th>Mã nhân viên</th>
                                                            <th>Tên nhân viên</th>
                                                            <th>Trạng thái</th>
                                                            <th>Hành động</th>
                                                        </tr>
                                                    </tfoot>
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
        <%@include file="/jsp/footer.jsp" %>
        <%@include file="/jsp/js.jsp" %>
    </body>
</html>