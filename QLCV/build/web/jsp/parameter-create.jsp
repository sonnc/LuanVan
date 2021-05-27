<%-- 
    Document   : createCodeSetAndCodeValue
    Created on : Feb 21, 2021, 10:01:30 PM
    Author     : sonng
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            session.removeAttribute("CssAndJs");
            session.setAttribute("CssAndJs", "codesetaddnew");
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="/jsp/header.jsp" %>
        <%@include file="/jsp/linkCss.jsp" %>
        <title><%=properties.getProperty("app.codeset")%></title>
    </head>
    <body class="vertical-layout vertical-menu 2-columns   menu-expanded fixed-navbar"
          data-open="click" data-menu="vertical-menu" data-col="2-columns">
        <%@include file="/jsp/nav.jsp" %>

        <div class="app-content content">
            <form id="formAction" action="createNewParameter" method="post" >
                <div class="content-wrapper">
                    <div class="content-header row">
                        <div class="content-header-left col-md-6 col-12 mb-2">
                            <h3 class="content-header-title">KHỞI TẠO THAM SỐ TÍNH TOÁN</h3>
                        </div>
                        <div class="content-header-right col-md-6 col-12">
                            <div class="btn-group float-md-right" role="group" aria-label="">     
                                <button onclick="return countId()"  type="submit" class="btn btn-info round box-shadow-2 px-2">
                                    <i class="ft-save"></i> <%=properties.getProperty("app.save")%></button>
                            </div>
                        </div>
                    </div>
                    <div class="content-body">
                        <!-- Zero configuration table -->
                        <section id="form-control-repeater">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="card">
                                        <div class="card-header">
                                            <h4 class="card-title" id="file-repeater">Tạo tham số</h4>
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
                                        <div class="card-content collapse show">
                                            <div class="card-body">
                                                <div class="row">
                                                    <input hidden="true" id="countItemInput" name="countItemInput" value="" />
                                                </div>
                                                <div class="form-group col-12 mb-2 contact-repeater">
                                                    <div data-repeater-list="createListParameter">
                                                        <div class="input-group mb-1" data-repeater-item id="countItemRepeat">
                                                            <div class="form-group mb-1 col-sm-12 col-md-2">
                                                                <label for="pass">Mã tham số</label> <span class="danger">*</span>
                                                                <br>
                                                                <s:textfield requiredLabel="true" type="text" name="parameterSetup.parameterName" cssClass="form-control" id="example-tel-input"/>
                                                            </div>
                                                            <div class="form-group mb-1 col-sm-12 col-md-3">
                                                                <label for="bio" class="cursor-pointer">Mô tả tham số</label>
                                                                <br>
                                                                <s:textfield type="text" name="parameterSetup.decription" cssClass="form-control" id="example-tel-input"/>
                                                            </div>
                                                            <div class="form-group mb-1 col-sm-12 col-md-6">
                                                                <label for="tel-input">Mã nguồn SQL</label><span class="danger">*</span>
                                                                <br>
                                                                <s:textfield requiredLabel="true" type="text" name="parameterSetup.queryContent" cssClass="form-control" id="example-tel-input"/>
                                                            </div>
                                                            <div class="form-group mb-1 col-sm-12 col-md-1" >
                                                                <label for="tel-input"></label>
                                                                <br>
                                                                <button class="btn btn-danger" type="button" data-repeater-delete><i class="ft-x"></i></button>
                                                            </div>

                                                        </div>
                                                    </div>
                                                    <button onclick="return countId()" type="button" data-repeater-create class="btn btn-primary">
                                                        <i class="ft-plus"></i> <%=properties.getProperty("app.add")%>
                                                    </button>

                                                    <script>
                                                        function countId() {
                                                            var s = document.querySelectorAll('[id^=countItemRepeat]').length;
                                                            document.getElementById('countItemInput').value = s;
                                                        }
                                                    </script> 
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </div>
                </div>
            </form>                                                
        </div>
        <%@include file="/jsp/dialogConfirm.jsp" %>
        <%@include file="/jsp/footer.jsp" %>
        <%@include file="/jsp/js.jsp" %>
    </body>
</html>
