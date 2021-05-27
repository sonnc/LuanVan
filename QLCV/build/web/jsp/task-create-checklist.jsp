<%-- 
    Document   : task-create
    Created on : Feb 28, 2021, 9:50:35 PM
    Author     : sonng
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            session.removeAttribute("CssAndJs");
            session.setAttribute("CssAndJs", "task-create");
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="/jsp/header.jsp" %>
        <%@include file="/jsp/linkCss.jsp" %>
        <title><%=properties.getProperty("app.workspace.summary")%></title>
    </head>
    <body class="vertical-layout vertical-menu 2-columns   menu-expanded fixed-navbar"
          data-open="click" data-menu="vertical-menu" data-col="2-columns">
        <%@include file="/jsp/nav.jsp" %>

        <div class="app-content content">
            <form  id="formAction"  action="createCheckList" method="post" enctype="multipart/form-data">
                <div class="content-wrapper">
                    <div class="content-header row">
                        <div class="content-header-left col-md-6 col-12 mb-2">
                            <h3 class="content-header-title">Tạo mới bộ kiểm tra</h3>
                        </div>
                        <div class="content-header-right col-md-6 col-12">  
                            <div class="btn-group float-md-right" > 
                                <a type="button" href="workspaceSumaryAction?id=<s:property value="workspace.id"/>" class="btn btn-danger round box-shadow-2 px-2">
                                    <i class="ft-home"></i> Trở về Workspace</a>
                                <a type="button" href="viewAllTask?workspaceId=<s:property value="workspace.id"/>" class="btn btn-warning round box-shadow-2 px-2">
                                    <i class="ft-book"></i> Trở về Task List</a>


                                <button type="submit" onclick=" countIdCheckList();" class="btn btn-info round box-shadow-2 px-2">
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
                                            <a class="btn btn-outline-cyan" href="viewTask?workspaceId=<s:property value="workspace.id"/>&&tasklistid=<s:property value="task.tkWsTasklist.id"/>&&taskid=<s:property value="task.id"/>">
                                                Trở về Task cha
                                            </a>
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
                                                    <input hidden="true" id="countItemInputCheckList" name="countItemInputCheckList" value="" />
                                                    <input hidden="true" id="countItemInputUDF" name="countItemInputUDF" value="" />
                                                    <input hidden="true" name="workspaceId" value="<s:property value="workspace.id"/>" />
                                                    <input hidden="true" name="tasklistid" value="<s:property value="task.tkWsTasklist.id"/>" />
                                                    <input hidden="true" name="taskid" value="<s:property value="task.id"/>" />
                                                </div>
                                                <div class="form-group col-12 mb-2 ">
                                                    <div class="row">
                                                        <div class="col-12"> 
                                                            <h4 class="form-section"><i class="ft-check-square"></i> ĐẦU MỤC KIỂM TRA</h4>
                                                            <div class="row">
                                                                <div class="col-12">
                                                                    <div class="form-group col-12 mb-2 contact-repeater">
                                                                        <div data-repeater-list="lstCheckList">
                                                                            <div class="input-group mb-1" data-repeater-item id="countItemRepeatCheckList">
                                                                                <div class="form-group col-11">
                                                                                    <div >
                                                                                        <s:textfield type="text" name="checkListTitle" cssClass="form-control" id="textbox2"/>
                                                                                        <ul>
                                                                                            <li><s:textfield label="Đầu mục kiểm tra 1" type="text" name="checkListItem1" cssClass="form-control" id="textbox2"/></li>
                                                                                            <li><s:textfield label="Đầu mục kiểm tra 2"  type="text" name="checkListItem2" cssClass="form-control" id="textbox2"/></li>
                                                                                        </ul>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="form-group col-1" >
                                                                                    <button class="btn btn-danger" type="button" data-repeater-delete><i class="ft-x"></i></button>
                                                                                </div>

                                                                            </div>
                                                                        </div>
                                                                        <button onclick="return countIdCheckList()" type="button" data-repeater-create class="btn btn-primary">
                                                                            <i class="ft-plus"></i> <%=properties.getProperty("app.add")%>
                                                                        </button>

                                                                        <script>
                                                                            function countIdCheckList() {
                                                                                var s = document.querySelectorAll('[id^=countItemRepeatCheckList]').length;
                                                                                document.getElementById('countItemInputCheckList').value = s;
                                                                            }
                                                                        </script> 
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
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

        <%@include file="/jsp/footer.jsp" %>
        <%@include file="/jsp/dialogConfirm.jsp" %>
        <%@include file="/jsp/js.jsp" %>
    </body>
</html>
