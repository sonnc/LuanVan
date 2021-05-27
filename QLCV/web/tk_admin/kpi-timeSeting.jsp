<%-- 
    Document   : home
    Created on : Feb 25, 2020, 9:11:06 PM
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
                                            <h4 class="card-title">DANH SÁCH THỜI GIAN</h4>
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
                                                    <form id="formUoCUserDetail" action="adminKpiAction" method="post" >
                                                        <input hidden="true" name="method" value="createTimeRating"/>
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <div class="row">
                                                                    <div class="col-md-6">
                                                                        <div class="form-group">
                                                                            <h5>Ngày bắt đầu của tháng
                                                                                <span class="required">*</span>
                                                                            </h5>
                                                                            <div class="controls">
                                                                                <s:textfield type="number" name="tkRatingDateSetup.ratingStart" cssClass="form-control" />
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-6">
                                                                        <div class="form-group">
                                                                            <h5>Ngày kết thúc của tháng
                                                                                <span class="required">*</span>
                                                                            </h5>
                                                                            <div class="controls">
                                                                                <s:textfield type="number" name="tkRatingDateSetup.ratingEnd" cssClass="form-control" />
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="text-right">
                                                            <button type="submit" class="btn btn-success"><%=properties.getProperty("tk.tko.label.button.save")%> <i class="la la-thumbs-o-up position-right"></i></button>
                                                            <button type="reset" class="btn btn-danger"><%=properties.getProperty("tk.tko.label.button.reset")%> <i class="la la-refresh position-right"></i></button>
                                                        </div>
                                                    </form>
                                                </div>
                                                <!-- Task List table -->
                                                <div class="table-responsive">
                                                    <table id="project-bugs-list" class="table table-white-space table-bordered row-grouping display no-wrap icheck table-middle">
                                                        <thead>
                                                            <tr>   
                                                                <th>ID</th>
                                                                <th>Ngày tạo</th>
                                                                <th>Ngày cập nhật</th>
                                                                <th>Người tạo</th>
                                                                <th>Người cập nhật</th>
                                                                <th>Ngày bắt đầu</th>
                                                                <th>Ngày kết thúc</th>
                                                                <th>Trạng thái</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <s:iterator value="lstTkRatingDateSetup" var="test">
                                                                <tr>
                                                                    <td>
                                                                        <span class=""><s:property value="id" /></span>
                                                                    </td>
                                                                    <td>
                                                                        <span class=""><s:property value="createDate" /></span></a>
                                                                    </td>
                                                                    <td>
                                                                        <span class=""><s:iterator value="lastUpdateDate" /></span>
                                                                    </td>
                                                                    <td>
                                                                        <span class=""><s:property value="createBy" /></span>
                                                                    </td>  
                                                                    <td>
                                                                        <span class=""><s:property value="lastUpdateBy" /></span>
                                                                    </td>
                                                                    <td>
                                                                        <span class=""><s:property value="ratingStart" /></span>
                                                                    </td>
                                                                    <td>
                                                                        <span class=""><s:property value="ratingEnd" /></span>
                                                                    </td>
                                                                    <td>
                                                                        <span class=""><s:property value="status" /></span>
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

