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
            session.setAttribute("CssAndJs", "tasklist-create");
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="/jsp/header.jsp" %>
        <%@include file="/jsp/linkCss.jsp" %>
        <title><%=properties.getProperty("app.workspace.tasklist.h4")%></title>
    </head>
    <body class="vertical-layout vertical-menu 2-columns   menu-expanded fixed-navbar"
          data-open="click" data-menu="vertical-menu" data-col="2-columns">
        <%@include file="/jsp/nav.jsp" %>

        <div class="app-content content">
            <form id="formAction" action="taskListAction" method="post" >
                <div class="content-wrapper">
                    <div class="content-header row">
                        <div class="content-header-left col-md-6 col-12 mb-2">
                            <h3 class="content-header-title"><%=properties.getProperty("app.workspace.tasklist.h4")%></h3>
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
                                            <h4 class="card-title" id="file-repeater"><%=properties.getProperty("app.workspace.tasklist.h4")%></h4>
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
                                                    <input hidden="true" name="event" value="createTaskList"/>
                                                    <input hidden="true" name="workspaceId" value="<s:property value="workspace.id"/>"/>
                                                    <input hidden="true" id="countItemInput" name="countItemInput" value="" />

                                                    <div class="form-group col-12">
                                                        <div class="row">
                                                            <div class="form-group col-4">
                                                                <label for="email-addr"><%=properties.getProperty("app.workspace.tasklist.folder.name")%></label>
                                                                <br>
                                                                <s:textfield type="text" cssClass="form-control" id="folderName" name="tkWsFolder.folderName"/>
                                                            </div>
                                                            <div class="form-group col-6">
                                                                <label for="email-addr"><%=properties.getProperty("app.workspace.tasklist.folder.description")%></label>
                                                                <br>
                                                                <s:textfield type="text" cssClass="form-control"  id="folderDesc" name="tkWsFolder.folderDesc"/>
                                                            </div>
                                                            <div class="form-group col-2">
                                                                <label for="email-addr"><%=properties.getProperty("app.workspace.tasklist.folder.checkbox")%></label>
                                                                <br>
                                                                <input id="isFolderCheckbox" class="form-control" style="height: 25px; width: 25px" type="checkbox" name="isFolderCheckbox"/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group col-12">
                                                        <div class="row">
                                                            <div class="form-group col-4">
                                                                <label for="email-addr"><%=properties.getProperty("app.workspace.tasklist.milestones.tienkhoan")%></label>
                                                                <br>
                                                                <s:textfield type="number" value="0" id="folderTienKhoan" cssClass="form-control" name="tkWsFolder.milestonesTienkhoan"/>
                                                            </div>
                                                            <div class="form-group col-3">
                                                                <label for="email-addr"><%=properties.getProperty("app.workspace.tasklist.milestones.startdate")%></label>
                                                                <br>
                                                                <input type="date" class="form-control"  id="folderStartDate" name="milestonesStartDate"/>
                                                            </div>
                                                            <div class="form-group col-3">
                                                                <label for="email-addr"><%=properties.getProperty("app.workspace.tasklist.milestones.enddate")%></label>
                                                                <br>
                                                                <input type="date" class="form-control"  id="folderEndDate" name="milestonesEndDate"/>
                                                            </div>
                                                            <div class="form-group col-2">
                                                                <label for="email-addr"><%=properties.getProperty("app.workspace.tasklist.milestones.checkbox")%></label>
                                                                <br>
                                                                <input id="isMilestones" type="checkbox" style="height: 25px; width: 25px" cssClass="form-control" name="isMilestones"/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="form-group col-12 mb-2 contact-repeater">
                                                    <h4 class="card-title" id="file-repeater"><%=properties.getProperty("app.workspace.tasklist.h4")%></h4>
                                                    <div data-repeater-list="createTaskList">
                                                        <div class="input-group mb-1" data-repeater-item id="countItemRepeat">
                                                            <div class="form-group mb-1 col-sm-12 col-md-11">
                                                                <div class="row">
                                                                    <div class="form-group mb-1 col-sm-12 col-md-3">
                                                                        <label for="email-addr"><%=properties.getProperty("app.workspace.tasklist.title")%></label>
                                                                        <br>
                                                                        <s:textfield type="text" name="tasklist.taskListTitle" cssClass="form-control" id="example-tel-input"/>
                                                                    </div>
                                                                    <div class="form-group mb-1 col-sm-12 col-md-3">
                                                                        <label for="email-addr"><%=properties.getProperty("app.workspace.tasklist.estimate")%></label>
                                                                        <br>
                                                                        <s:textfield type="number" name="tasklist.timeEstimate" cssClass="form-control" id="example-tel-input"/>
                                                                    </div>
                                                                    <div class="form-group mb-1 col-sm-12 col-md-3">
                                                                        <label for="email-addr"><%=properties.getProperty("app.workspace.tasklist.due.date")%></label>
                                                                        <br>
                                                                        <input type="date" name="tasklist.due.date" class="form-control" id="example-tel-input"/>
                                                                    </div>
                                                                    <div class="form-group mb-1 col-sm-12 col-md-3">
                                                                        <label for="email-addr"><%=properties.getProperty("app.workspace.tasklist.priority")%></label>
                                                                        <br>
                                                                        <s:select  cssClass="form-control"
                                                                                   headerKey="-1" headerValue="Lựa chọn giá trị"
                                                                                   list="#{'H':'CAO', 'M':'TRUNG BÌNH', 'L':'THẤP'}" 
                                                                                   name="tasklist.priority" 
                                                                                   value="" />
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="form-group mb-1 col-12">
                                                                        <label for="email-addr"><%=properties.getProperty("app.workspace.tasklist.desc")%></label>
                                                                        <br>
                                                                        <s:textarea type="text" name="tasklist.taskListDesc" cssClass="form-control" id="example-tel-input"/>
                                                                    </div>
                                                                </div>
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

                                                        function checkIsFoder() {
                                                            var isFolderCheckbox = document.getElementById('isFolderCheckbox').value;
                                                            alert(isFolderCheckbox);
                                                            var isMilestones = document.getElementById('isMilestones').value;
                                                            var folderName = document.getElementById('folderName').value;
                                                            var folderDesc = document.getElementById('folderDesc').value;
                                                            var folderTienKhoan = document.getElementById('folderTienKhoan').value;
                                                            var folderStartDate = document.getElementById('folderStartDate').value;
                                                            var folderEndDate = document.getElementById('folderEndDate').value;
                                                            if (isFolderCheckbox != null) {
                                                                if (folderName === null || folderDesc === null) {
                                                                    alert("Thông tin thư mục không được để trống");
                                                                }
                                                            }
                                                            if (isMilestones != null) {
                                                                if (isFolderCheckbox != null) {
                                                                    if (folderName === null || folderDesc === null) {
                                                                        alert("Thông tin thư mục không được để trống");
                                                                    }
                                                                } else {
                                                                    alert("Thông tin thư mục không được để trống");
                                                                }
                                                                if (folderTienKhoan === null || folderStartDate === null || folderEndDate === null) {
                                                                    alert("Thông tin Mốc giai đoạn không được để trống");
                                                                }
                                                            }

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
