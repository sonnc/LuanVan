<%-- 
    Document   : task-list-create-raci
    Created on : Mar 7, 2021, 1:18:20 PM
    Author     : sonng
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            session.removeAttribute("CssAndJs");
            session.setAttribute("CssAndJs", "tasklist-create-raci");
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="/jsp/header.jsp" %>
        <%@include file="/jsp/linkCss.jsp" %>
        <title>Tạo công thức</title>
    </head>
    <body class="vertical-layout vertical-menu 2-columns   menu-expanded fixed-navbar"
          data-open="click" data-menu="vertical-menu" data-col="2-columns">
        <%@include file="/jsp/nav.jsp" %>

        <div class="app-content content">
            <form id="formAction" action="createFormula" method="post" >
                <div class="content-wrapper">
                    <div class="content-header row">
                        <div class="content-header-left col-md-6 col-12 mb-2">
                            <h3 class="content-header-title">Tạo công thức</h3>
                        </div>
                        <div class="content-header-right col-md-6 col-12">
                            <div class="btn-group float-md-right" role="group" aria-label="">     
                                <button type="submit" onclick="checkIsFoder();return countId();" class="btn btn-info round box-shadow-2 px-2">
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
                                            <h4 class="card-title" id="file-repeater">Tạo công thức</h4>
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
                                                    <div class="form-group col-12">
                                                        <div class="row">
                                                            <div class="form-group col-12">
                                                                <label for="pass">Thiết lập công thức</label> <span class="danger">*</span>
                                                                <br>
                                                                <s:textfield requiredLabel="true" type="text" name="formula.formulaCaculation" cssClass="form-control" />
                                                                
                                                            </div> 
                                                            <div class="form-group col-12">
                                                                <label for="pass">Mô tả</label> <span class="danger">*</span>
                                                                <br>
                                                                <s:textarea requiredLabel="true" type="text" name="formula.description" cssClass="form-control"/>
                                                            </div> 
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="card-content collapse show">
                                            <div class="card-body card-dashboard">
                                                <table class="table table-striped table-bordered zero-configuration">
                                                    <thead>
                                                        <tr>
                                                            <th>Tham số</th>
                                                            <th>Mô tả</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <s:iterator value="lstParameterSetup" var="test">
                                                            <tr>
                                                                <td><b><s:property value="parameterName"/></b></td>
                                                                <td><s:property value="decription"/></td>
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
            </form>                                                
        </div>
        <%@include file="/jsp/dialogConfirm.jsp" %>
        <%@include file="/jsp/footer.jsp" %>
        <%@include file="/jsp/js.jsp" %>
    </body>
</html>
