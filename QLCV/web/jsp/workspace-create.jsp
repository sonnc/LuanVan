<%-- 
    Document   : workspace-create
    Created on : Feb 24, 2021, 8:29:24 PM
    Author     : sonng
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            session.removeAttribute("CssAndJs");
            session.setAttribute("CssAndJs", "workspace-create");
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="/jsp/header.jsp" %>
        <%@include file="/jsp/linkCss.jsp" %>
        <title><%=properties.getProperty("app.workspace")%></title>
    </head>
    <body class="vertical-layout vertical-menu 2-columns   menu-expanded fixed-navbar"
          data-open="click" data-menu="vertical-menu" data-col="2-columns">
        <%@include file="/jsp/nav.jsp" %>

        <div class="app-content content">
            <div class="content-wrapper">
                <div class="content-header row">
                    <div class="content-header-left col-md-6 col-12 mb-2">
                        <h3 class="content-header-title"><%=properties.getProperty("app.workspace.add")%></h3>

                    </div>
                    <div class="content-header-right col-md-6 col-12">
                        <div class="btn-group float-md-right" role="group" aria-label="Button group with nested dropdown">

                        </div>
                    </div>
                </div>
                <div class="content-body">
                    <!-- Form wizard with number tabs section start -->
                    <section id="number-tabs">
                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h4 class="card-title"><%=properties.getProperty("app.workspace.add.description")%></h4>
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
                                            <form id="formAction" action="workspaceAction" method="post" class="number-tab-steps wizard-notification">
                                                <input name="event" value="create" hidden="true">
                                                <!-- Step 1 -->
                                                <h6><%=properties.getProperty("app.step.1")%>:<%=properties.getProperty("app.workspace.step.1")%></h6>
                                                <fieldset>
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <div class="form-group">
                                                                <label for="firstName1"><%=properties.getProperty("app.workspace.name")%> :</label>
                                                                <s:textfield required="required" name="workspace.workspaceName" type="text" cssClass="form-control" id="firstName1"/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <div class="form-group">
                                                                <label for="emailAddress1"><%=properties.getProperty("app.workspace.description")%> :</label>
                                                                <s:textarea required="required" name="workspace.description" cssClass="form-control" id="emailAddress1"/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">

                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <label for="lastName1"><%=properties.getProperty("app.workspace.tienkhoan")%> :</label>
                                                                <s:textfield required="required" name="workspace.tienKhoan" type="nummber" cssClass="form-control" id="firstName1"/>
                                                            </div>
                                                        </div>

                                                        <div class="col-md-4">
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <div class="form-group">
                                                                        <label for="firstName1"><%=properties.getProperty("app.workspace.start.date")%> :</label>
                                                                        <input required="true" type="date" name="startDate" class="form-control" id="firstName1"/>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <div class="form-group">
                                                                        <label for="lastName1"><%=properties.getProperty("app.workspace.end.date")%> :</label>
                                                                        <input  required="true" type="date" name="endDate" class="form-control" id="date1"/>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <div class="form-group">
                                                                        <label for="firstName1">Ước lượng kinh phí khi hoàn thành:</label>
                                                                        <s:textfield required="required" name="workspace.etcAmount" type="nummber" cssClass="form-control" id="firstName1"/>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <div class="form-group">
                                                                        <label for="firstName1">Ước lương kết thúc :</label>
                                                                        <input required="true" type="date" name="etcDate" class="form-control" id="firstName1">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </fieldset>
                                                <!-- Step 2 -->
                                                <h6><%=properties.getProperty("app.step.2")%>:<%=properties.getProperty("app.workspace.step.2")%></h6>
                                                <fieldset>
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <table class="table table-striped table-bordered zero-configuration">
                                                                <thead>
                                                                    <tr>
                                                                        <th>Mã nhân viên</th>
                                                                        <th>Tên nhân viên</th>
                                                                        <th>Email</th>
                                                                        <th>Điện thoại</th>
                                                                        <th>Thêm vào workspace</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <s:iterator value="listUserInDepartement" var="test">
                                                                        <tr>
                                                                            <td><s:property value="employeeNo"/></td>
                                                                            <td><s:property value="fullName"/></td>
                                                                            <td><s:property value="email"/></td>
                                                                            <td><s:property value="mobileNumber"/></td>
                                                                            <td>
                                                                                <input  name="checkboxSelect-<s:property value="id"/>" type="checkbox" class="checkbox" style="height: 20px; width: 20px">
                                                                            </td>
                                                                        </tr>
                                                                    </s:iterator>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>'
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <input onclick="checkCheckbox()" type="checkbox" id="myCheckCheckBox" class="checkbox" style="height: 20px; width: 20px">: <%=properties.getProperty("app.workspace.checkbox.check")%>
                                                        </div>
                                                    </div> 
                                                </fieldset>
                                                <div style="float: right; padding-right: 20px; padding-bottom: 10px">
                                                    <script>
                                                        function checkCheckbox() {
                                                            var checkBox = document.getElementById("myCheckCheckBox");
                                                            // Get the output text
                                                            var text = document.getElementById("text");

                                                            // If the checkbox is checked, display the output text
                                                            if (checkBox.checked == true) {
                                                                checkButton.style.display = "block";
                                                            } else {
                                                                checkButton.style.display = "none";
                                                            }
                                                        }
                                                    </script>
                                                    <button style="display:none" id="checkButton" type="submit" class="btn btn-info round box-shadow-2 px-2">
                                                        <i class="ft-save"></i> <%=properties.getProperty("app.save")%></button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                    <!-- Form wizard with number tabs section end -->
                </div>
            </div>
        </div>

        <%@include file="/jsp/dialogConfirm.jsp" %>
        <%@include file="/jsp/footer.jsp" %>
        <%@include file="/jsp/js.jsp" %>
    </body>
</html>
