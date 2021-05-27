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
        <title>Báo cáo</title>
    </head>
    <body class="vertical-layout vertical-menu 2-columns   menu-expanded fixed-navbar"
          data-open="click" data-menu="vertical-menu" data-col="2-columns">
        <%@include file="/jsp/nav.jsp" %>

        <div class="app-content content">
            <div class="content-wrapper">
                <div class="content-header row">
                    <div class="content-header-left col-md-6 col-12 mb-2">
                        <h3 class="content-header-title">Trang tạo báo cáo</h3>
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
                                        <h4 class="card-title">Dự báo</h4>
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
                                        <form action="DownloadAction" method="post">
                                            <div class="card-body">
                                                <div class="col-md-12">
                                                    <div class="row">
                                                        <div class="col-md-9">
                                                            <div class="form-group">
                                                                <label for="lastName1">Mẫu báo cáo :</label>
                                                                <s:select  cssClass="form-control"
                                                                           headerKey="-1" headerValue="Lựa chọn giá trị"
                                                                           list="#{'baocao':'Báo cáo lương thưởng cá nhân'
                                                                                   , 'QT':'Báo cáo lương thưởng dự án'}" 
                                                                           name="objectFile.nameTemplate" 
                                                                           value="" />
                                                            </div>
                                                        </div>
                                                        <div class="col-md-3">
                                                            <div class="form-group">
                                                                <label for="lastName1">Loại file :</label>
                                                                <s:select  cssClass="form-control"
                                                                           headerKey="-1" headerValue="Lựa chọn giá trị"
                                                                           list="#{'PDF':'PDF', 'DOCX':'DOCX', 'XLXS':'XLXS'}" 
                                                                           name="objectFile.fileType" 
                                                                           value="" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-md-12">
                                                    <div class="row">
                                                        <div class="col-md-2">
                                                            <div class="form-group">
                                                                <label for="firstName1">Tham số 1</label>
                                                                <s:textfield  required="true" min="0" type="number" name="objectFile.ip1" cssClass="form-control" />
                                                            </div>
                                                        </div>
                                                        <div class="col-md-2">
                                                            <div class="form-group">
                                                                <label for="firstName1">Tham số 2</label>
                                                                <s:textfield required="true" min="0" type="number" name="objectFile.ip2" cssClass="form-control" />
                                                            </div>
                                                        </div>
                                                        <div class="col-md-2">
                                                            <div class="form-group">
                                                                <label for="firstName1">Tham số 3</label>
                                                                <s:textfield required="true" min="0" type="number" name="objectFile.ip3" cssClass="form-control" />
                                                            </div>
                                                        </div>
                                                        <div class="col-md-2">
                                                            <div class="form-group">
                                                                <label for="firstName1">Tham số 4</label>
                                                                <s:textfield required="true" type="text" name="objectFile.sp1" cssClass="form-control" />
                                                            </div>
                                                        </div>
                                                        <div class="col-md-2">
                                                            <div class="form-group">
                                                                <label for="firstName1">Tham số 5</label>
                                                                <s:textfield required="true" type="text" name="objectFile.sp2" cssClass="form-control" />
                                                            </div>
                                                        </div>
                                                        <div class="col-md-2">
                                                            <div class="form-group">
                                                                <label for="firstName1">Tham số 6</label>
                                                                <s:textfield required="true" type="text" name="objectFile.sp3" cssClass="form-control" />
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>
                                                <button style="float: right; margin-bottom: 20px" type="submit" class="btn btn-info round box-shadow-2 px-2"> Tạo báo cáo</button>
                                            </div>

                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                    <section id="configuration">
                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-header">
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
                                        <a target="_blank" href="<s:property value="filePath"/>"><s:property value="filePath"/></a>
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
