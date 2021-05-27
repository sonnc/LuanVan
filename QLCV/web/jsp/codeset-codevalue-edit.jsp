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
            <form id="formAction" action="eventCodeSet" method="post">
                <div class="content-wrapper">
                    <div class="content-header row">
                        <div class="content-header-left col-md-6 col-12 mb-2">
                            <h3 class="content-header-title"><%=properties.getProperty("app.codeset")%></h3>
                        </div>
                        <div class="content-header-right col-md-6 col-12">
                            <div class="btn-group float-md-right" role="group" aria-label="">    
                                <button onclick="return countId()" type="submit" class="btn btn-info round box-shadow-2 px-2">
                                    <i class="ft-save"></i> <%=properties.getProperty("app.codevalue.update")%></button>

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
                                            <h4 class="card-title" id="file-repeater"><%=properties.getProperty("app.codeset.add.new")%></h4>
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
                                                    <input hidden="true" name="event" value="edit"/>
                                                    <input hidden="true" name="id" value="<s:property value="sysCodeSet.id"/>"/>
                                                    <input hidden="true" id="countItemInput" name="countItemInput" value="" />
                                                    <div class="form-group mb-2  col-sm-12 col-md-2">
                                                        <label for="email-addr"><%=properties.getProperty("app.codeset.code")%></label>
                                                        <br>
                                                        <s:textfield disabled="true" type="text" cssClass="form-control" name="sysCodeSet.code"/>
                                                    </div>
                                                    <div class="form-group col-sm-12 col-md-9">
                                                        <label for="email-addr"><%=properties.getProperty("app.codeset.name")%></label>
                                                        <br>
                                                        <s:textfield disabled="true" type="text" cssClass="form-control" name="sysCodeSet.name"/>
                                                    </div>
                                                </div>
                                                <div class="form-group col-12 mb-2 contact-repeater">
                                                    <div data-repeater-list="createListCodeValue">
                                                        <s:iterator value="lstCodeValues">
                                                            <div class="input-group mb-1" data-repeater-item id="countItemRepeat">
                                                                <input hidden="true" name="idCV" value="<s:property value="id"/>"/>
                                                                <div class="form-group mb-1 col-sm-12 col-md-1">
                                                                    <label for="email-addr"><%=properties.getProperty("app.codeset.display.order")%></label>
                                                                    <br>
                                                                    <s:textfield type="number" name="displayOrder" cssClass="form-control" id="example-tel-input"/>
                                                                </div>
                                                                <div class="form-group mb-1 col-sm-12 col-md-3">
                                                                    <label for="pass"><%=properties.getProperty("app.codevalue.code")%></label>
                                                                    <br>
                                                                    <s:textfield type="text" name="code" cssClass="form-control" id="example-tel-input"/>
                                                                </div>
                                                                <div class="form-group mb-1 col-sm-12 col-md-3">
                                                                    <label for="bio" class="cursor-pointer"><%=properties.getProperty("app.codevalue.code.value")%></label>
                                                                    <br>
                                                                    <s:textfield type="text" name="codeValue" cssClass="form-control" id="example-tel-input"/>
                                                                </div>
                                                                <div class="form-group mb-1 col-sm-12 col-md-3">
                                                                    <label for="tel-input"><%=properties.getProperty("app.codevalue.local.code.value")%></label>
                                                                    <br>
                                                                    <s:textfield type="text" name="localCodeValue" cssClass="form-control" id="example-tel-input"/>
                                                                </div>
                                                                <div class="form-group mb-1 col-sm-12 col-md-2" >
                                                                    <label for="tel-input"></label>
                                                                    <br>
                                                                    <button class="btn btn-danger" type="button" data-repeater-delete><i class="ft-x"></i></button>
                                                                </div>

                                                            </div>

                                                        </s:iterator>
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
