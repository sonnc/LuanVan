<%-- 
    Document   : home
    Created on : Feb 25, 2020, 9:11:06 PM
    Author     : sonng
--%>

<%@page import="java.util.Properties"%>
<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<%
    
    int year2 = Calendar.getInstance().get(Calendar.YEAR);
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
                                            <h4 class="card-title">THÔNG TIN KPI NHÂN VIÊN</h4>
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
                                                <!-- Task List table -->
                                                <div class="table-responsive">
                                                    <table id="project-bugs-list" class="table table-white-space table-bordered row-grouping display no-wrap icheck table-middle">
                                                        <thead>
                                                            <tr>   
                                                                <th>STT</th>
                                                                <th>KPI</th>
                                                                <th>Chỉ số</th>
                                                                <th>ĐVT</th>
                                                                <th>Tần suất</th>
                                                                <th>Trọng số</th>
                                                                <th>Kết quả thực hiện</th>
                                                                <th>Tỷ lệ thực hiện</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <s:iterator value="lstTkKpiItemDetailPhongBan" var="var">

                                                                <tr <s:if test="%{#var.kpiName == 'BO_PHAN'}" >style="background-color: lightgray;font-size: 1rem;color: red;font-weight: 1000;" </s:if>>
                                                                        <td>
                                                                            <span class=""><s:if test="%{#var.kpiName == 'BO_PHAN'}" >A</s:if></span>
                                                                        </td>
                                                                        <td>
                                                                            <span class="">
                                                                            <s:if test="%{#var.kpiName == 'BO_PHAN'}" >
                                                                                KPI GẮN LIỀN VỚI BỘ PHẬN
                                                                            </s:if>
                                                                            <s:else>
                                                                                <s:property value="kpiName" />
                                                                            </s:else>
                                                                        </span>
                                                                    </td>
                                                                    <td>
                                                                        <span class=""><s:property value="item" /></span>
                                                                    </td>  
                                                                    <td>
                                                                        <span class=""><s:property value="donViTinh" /></span>
                                                                    </td>
                                                                    <td>
                                                                        <span class=""><s:property value="tanSuatDanhGia" /></span>
                                                                    </td>
                                                                    <td>
                                                                        <span class=""><s:property value="trongSo" /></span>
                                                                    </td>
                                                                    <td>
                                                                        <span class=""><s:property value="ketQuaThucHien" /></span>
                                                                    </td>
                                                                    <td>
                                                                        <span class=""><s:property value="tyLeThucHien" /></span>
                                                                    </td>
                                                                </tr>
                                                            </s:iterator>
                                                            <s:iterator value="lstTkKpiItemDetailThuongXuyen" var="var">
                                                                <tr <s:if test="%{#var.kpiName == 'THUONG_XUYEN'}" >style="background-color: lightgray;font-size: 1rem;color: red;font-weight: 1000;" </s:if>>
                                                                        <td>
                                                                            <span class=""><s:if test="%{#var.kpiName == 'THUONG_XUYEN'}" >B</s:if></span>
                                                                        </td>
                                                                        <td>
                                                                            <span class="">
                                                                            <s:if test="%{#var.kpiName == 'THUONG_XUYEN'}" >
                                                                                KPI THƯỜNG XUYEN VÀ THÁI ĐỘ
                                                                            </s:if>
                                                                            <s:else>
                                                                                <s:property value="kpiName" />
                                                                            </s:else>
                                                                        </span>
                                                                    </td>
                                                                    <td>
                                                                        <span class=""><s:property value="item" /></span>
                                                                    </td>  
                                                                    <td>
                                                                        <span class=""><s:property value="donViTinh" /></span>
                                                                    </td>
                                                                    <td>
                                                                        <span class=""><s:property value="tanSuatDanhGia" /></span>
                                                                    </td>
                                                                    <td>
                                                                        <span class=""><s:property value="trongSo" /></span>
                                                                    </td>
                                                                    <td>
                                                                        <span class=""><s:property value="ketQuaThucHien" /></span>
                                                                    </td>
                                                                    <td>
                                                                        <span class=""><s:property value="tyLeThucHien" /></span>
                                                                    </td>
                                                                </tr>
                                                            </s:iterator>
                                                            <s:iterator value="lstTkKpiItemDetailDotXuat" var="var">
                                                                <tr <s:if test="%{#var.kpiName == 'DOT_XUAT'}" >style="background-color: lightgray;font-size: 1rem;color: red;font-weight: 1000;" </s:if>>
                                                                        <td>
                                                                            <span class=""><s:if test="%{#var.kpiName == 'DOT_XUAT'}" >C</s:if></span>
                                                                        </td>
                                                                        <td>
                                                                            <span class="">
                                                                            <s:if test="%{#var.kpiName == 'DOT_XUAT'}" >
                                                                                KPI CÔNG VIỆC ĐỘT XUẤT
                                                                            </s:if>
                                                                            <s:else>
                                                                                <s:property value="kpiName" />
                                                                            </s:else>
                                                                        </span>
                                                                    </td>
                                                                    <td>
                                                                        <span class=""><s:property value="item" /></span>
                                                                    </td>  
                                                                    <td>
                                                                        <span class=""><s:property value="donViTinh" /></span>
                                                                    </td>
                                                                    <td>
                                                                        <span class=""><s:property value="tanSuatDanhGia" /></span>
                                                                    </td>
                                                                    <td>
                                                                        <span class=""><s:property value="trongSo" /></span>
                                                                    </td>
                                                                    <td>
                                                                        <span class=""><s:property value="ketQuaThucHien" /></span>
                                                                    </td>
                                                                    <td>
                                                                        <span class=""><s:property value="tyLeThucHien" /></span>
                                                                    </td>
                                                                </tr>
                                                            </s:iterator>

                                                            <!--TÍNH TỔNG CÁC TRỌNG SỐ-->
                                                            <s:iterator value="lstTkKpiItemDetailTOTAL" var="var">
                                                            <tr style="background-color: lightpink; font-size: 1rem;color: #000077;font-weight: 1000;">
                                                                <td>
                                                                    <span class=""></span>
                                                                </td>
                                                                <td>
                                                                    <span >KẾT QUẢ THỰC HIỆN KPI <%=year2%></span>
                                                                </td>
                                                                <td>
                                                                    <span class=""><s:property value="item" /></span>
                                                                </td>  
                                                                <td>
                                                                    <span class=""><s:property value="donViTinh" /></span>
                                                                </td>
                                                                <td>
                                                                    <span class=""><s:property value="tanSuatDanhGia" /></span>
                                                                </td>
                                                                <td>
                                                                    <span class=""><s:property value="trongSo" /></span>
                                                                </td>
                                                                <td>
                                                                    <span class=""><s:property value="ketQuaThucHien" /></span>
                                                                </td>
                                                                <td>
                                                                    <span class=""><s:property value="tyLeThucHien" /></span>
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
