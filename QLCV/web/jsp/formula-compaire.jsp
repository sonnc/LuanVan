<%-- 
    Document   : codeset
    Created on : Feb 21, 2021, 5:15:13 PM
    Author     : sonng
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            session.removeAttribute("CssAndJs");
            session.setAttribute("CssAndJs", "codeset");
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="/jsp/header.jsp" %>
        <%@include file="/jsp/linkCss.jsp" %>
        <title>SO SÁNH CÔNG THỨC TÍNH</title>
    </head>
    <body class="vertical-layout vertical-menu 2-columns   menu-expanded fixed-navbar"
          data-open="click" data-menu="vertical-menu" data-col="2-columns">
        <%@include file="/jsp/nav.jsp" %>
        
            <div class="app-content content">
                <div class="content-wrapper">
                    <form method="post" action="prepareCompaireFormula">
                    <div class="content-header row">
                        <div class="content-header-left col-md-6 col-12 mb-2">
                            <h3 class="content-header-title">So sánh công thức</h3>
                        </div>
                        <div class="content-header-right col-md-6 col-12">
                            <div class="btn-group float-md-right" role="group" aria-label="">
                                <button type="submit" onclick="checkIsFoder();return countId();" class="btn btn-info round box-shadow-2 px-2">
                                    <i class="ft-save"></i> So sánh</button>      

                            </div>
                        </div>
                    </div>
                    <div class="content-body">
                        <!-- Zero configuration table -->

                        <section id="configuration">
                            <div class="row">
                                <div class="col-12">
                                    <div class="card">
                                        <div class="card-header">
                                            <h4 class="card-title">LỰA CHỌN CÁC CÔNG THỨC CẦN SO SÁNH</h4>
                                            <a class="heading-elements-toggle"><i class="la la-ellipsis-v font-medium-3"></i></a>
                                            <div class="heading-elements">
                                                <ul class="list-inline mb-0">
                                                    <li><a data-action="collapse"><i class="ft-minus"></i></a></li>
                                                    <li><a data-action="reload"><i class="ft-rotate-cw"></i></a></li>
                                                    <li><a data-action="expand"><i class="ft-maximize"></i></a></li>
                                                    <li><a data-action="close"><i class="ft-x"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="card-content collapse show">
                                            <div class="card-body card-dashboard">
                                                <table class="table table-striped table-bordered zero-configuration">
                                                    <thead>
                                                        <tr>
                                                            <th>Công thức</th>
                                                            <th>Mô tả</th>
                                                            <th>Trạng thái</th>
                                                            <th>lựa chọn</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <s:iterator value="lstFormula" var="test">
                                                            <tr>
                                                                <td><b><s:property value="formulaCaculation"/></b></td>
                                                                <td><s:property value="description"/></td>
                                                                <td><s:property value="status"/></td>
                                                                <td><input class="form-control" type="checkbox" name="selectCompaire" value="<s:property value="id"/>"></td>
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
                        <!--/ Multi-column ordering table -->
                    </form>
                    </div>
                </div>
            </div>
        
        <!-- ////////////////////////////////////////////////////////////////////////////-->

        <%@include file="/jsp/footer.jsp" %>
        <%@include file="/jsp/js.jsp" %>
    </body>
</html>
