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
        <title>KẾT QUẢ</title>
    </head>
    <body class="vertical-layout vertical-menu 2-columns   menu-expanded fixed-navbar"
          data-open="click" data-menu="vertical-menu" data-col="2-columns">
        <%@include file="/jsp/nav.jsp" %>

        <div class="app-content content">
            <div class="content-wrapper">
                <div class="content-header row">
                    <div class="content-header-left col-md-6 col-12 mb-2">
                        <h3 class="content-header-title">Kết quả</h3>
                    </div>
                    <div class="content-header-right col-md-6 col-12">
                        <div class="btn-group float-md-right" role="group" aria-label="">  

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
                                        <h4 class="card-title">CÔNG THỨC TÍNH TOÁN</h4>
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

                                            <div style="padding: 20px">
                                                <div>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <label class="danger">Giá trị tốt nhất cho công ty</label>
                                                            <br>
                                                            <h4><%=session.getAttribute("minAmount")%></h4>
                                                            <br>
                                                            <h5><%=session.getAttribute("formularMin")%></h5>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label class="info">Giá trị tốt nhất cho nhân viên</label>
                                                            <br>
                                                            <h4><%=session.getAttribute("maxAmount")%></h4>
                                                            <br>
                                                            <h5><%=session.getAttribute("formularMax")%></h5>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>

                                            <table class="table table-striped table-bordered zero-configuration">
                                                <thead>
                                                    <tr>
                                                        <th>Công thức</th>
                                                        <th>Giá trị trả về</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <s:iterator value="lstMappingFormulas" var="test">
                                                        <tr>
                                                            <td><b><s:property value="formula"/></b></td>
                                                            <td><s:property value="valueTotal"/></td>
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
                </div>
            </div>
        </div>
        <!-- ////////////////////////////////////////////////////////////////////////////-->

        <%@include file="/jsp/footer.jsp" %>
        <%@include file="/jsp/js.jsp" %>
    </body>
</html>
