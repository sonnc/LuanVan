<%-- 
    Document   : home
    Created on : Feb 25, 2020, 9:11:06 PM
    Author     : sonng
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
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
                                    <li class="breadcrumb-item"><a href="tk_admin/home.jsp">Trang chủ</a>
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
                                            <h4 class="card-title">DANH SÁCH KPI</h4>
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
                                                    <a href="adminKpiAction?method=prepareCreateKpi" style="float: right; color: white; margin-right: 30px" type="button" class="btn btn-primary"><i class="ft-plus"></i> Tạo mới bộ KPI</a>
                                                </div>
                                                <div>
                                                    <a href="adminKpiAction?method=prepareCreateTimeRating" style="float: right; color: white; margin-right: 30px" type="button" class="btn btn-primary"><i class="ft-clock"></i>Cài đặt thời gian rating</a>
                                                </div>
                                                <!-- Task List table -->
                                                <div class="table-responsive">
                                                    <table id="project-bugs-list" class="table table-white-space table-bordered row-grouping display no-wrap icheck table-middle">
                                                        <thead>
                                                            <tr>   
                                                                <th>Mã KPI</th>
                                                                <th>Mô tả</th>
                                                                <th>Phòng ban</th>
                                                                <th>Trong số 1</th>
                                                                <th>Trọng số 2</th>
                                                                <th>Trọng số 3</th>
                                                                <th>Trạng thái</th>
                                                                <th>Áp dụng</th>
                                                                <th>Xóa?</th>
                                                                <th>Sửa trọng số</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <s:iterator value="lstKpiTypeSettings" var="test">
                                                                <tr>
                                                                    <!--                                                                    <td>
                                                                    <s:property value="createDate" />
                                                                </td>
                                                                <td class="text-center">
                                                                    <s:property value="lastUpdateDate" />
                                                                </td>
                                                                <td>
                                                                    <span class=""><s:property value="createBy" /></span>
                                                                </td>
                                                                <td>
                                                                    <span class=""><s:property value="lastUpdateBy" /></span>
                                                                </td>-->
                                                                    <td>
                                                                        <span class=""><s:property value="kpiName" /></span>
                                                                    </td>
                                                                    <td>
                                                                        <a href="adminKpiAction?method=viewKpiDetail&&kpiId=<s:property value="id" />"><span class=""><s:property value="kpiDesc" /></span></a>
                                                                    </td>
                                                                    <td>
                                                                        <span class=""><s:iterator value="phongBan" ><s:property value="departmentName"/></s:iterator></span>
                                                                        </td>
                                                                        <td>
                                                                            <span class=""><s:property value="trongSoKpiPhongban" /></span>
                                                                    </td>  
                                                                    <td>
                                                                        <span class=""><s:property value="trongSoKpiThuongxuyen" /></span>
                                                                    </td>
                                                                    <td>
                                                                        <span class=""><s:property value="trongSoKpiDotxuat" /></span>
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
                                                                        <span class=""><s:property value="apDung" /></span>
                                                                    </td>
                                                                    <td>
                                                                        <a  href="adminKpiAction?method=deleteKpi&&kpiId=<s:property value="id" />" type="button" class="btn btn-danger"><i class="la la-trash"></i></a>
                                                                    </td>
                                                                    <td>
                                                                        <a  href="prepareEditEditWeightKpiTypeSetting?kpiId=<s:property value="id" />" type="button" class="btn btn-info"><i class="la la-edit"></i></a>
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
        <%@include file="/jsp/footer.jsp" %>
        <%@include file="/jsp/js.jsp" %>
    </body>
</html>
