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
            <form id="formAction" action="editTask" method="post" enctype="multipart/form-data">
                <div class="content-wrapper">
                    <div class="content-header row">
                        <div class="content-header-left col-md-6 col-12 mb-2">
                            <h3 class="content-header-title">Chỉnh sửa thông tin công việc</h3>
                        </div>
                        <div class="content-header-right col-md-6 col-12">  
                            <div class="btn-group float-md-right" > 
                                <a type="button" href="workspaceSumaryAction?id=<s:property value="workspace.id"/>" class="btn btn-danger round box-shadow-2 px-2">
                                    <i class="ft-home"></i> Trở về Workspace</a>
                                <a type="button" href="viewAllTask?workspaceId=<s:property value="workspace.id"/>" class="btn btn-warning round box-shadow-2 px-2">
                                    <i class="ft-book"></i> Trở về Task List</a>


                                <button type="submit" class="btn btn-info round box-shadow-2 px-2">
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
                                            <h4 class="card-title" id="file-repeater">Chỉnh sửa công việc</h4>
                                            <a style="margin-top: 10px" class="btn btn-outline-cyan" href="viewTask?workspaceId=<s:property value="workspace.id"/>&&tasklistid=<s:property value="task.tkWsTasklist.id"/>&&taskid=<s:property value="task.id"/>">
                                                                Trở về Task cha
                                                            </a>
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
                                                    <input hidden="true" name="tasklistid" value="<s:property value="tasklist.id"/>" />
                                                </div>
                                                <div class="form-group col-12 mb-2 ">
                                                    <div class="row">

                                                        <div class="col-12"> 
                                                            <h4 class="form-section"><i class="ft-home"></i> THÔNG TIN CHUNG</h4>
                                                            
                                                            <!--<form action="editTask"  method="post" enctype="multipart/form-data">-->
                                                                <input hidden="true" name="event" value="edit" />
                                                                <input hidden="true" name="workspaceId" value="<s:property value="workspace.id"/>" />
                                                                <input hidden="true" name="tasklistid" value="<s:property value="tasklist.id"/>" />
                                                                <input hidden="true" name="taskid" value="<s:property value="task.id"/>" />
                                                                <div class="row">
                                                                    <div class="col-12">
                                                                        <fieldset class="form-group">
                                                                            <label>Tên công việc <span class="danger">*</span></label>
                                                                            <s:textfield requiredLabel="true" type="text" name="task.taskName" value="%{task.taskName}" cssClass="form-control" id="textbox2"/>
                                                                        </fieldset>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-3">
                                                                        <fieldset class="form-group">
                                                                            <label>Tiền khoán</label>
                                                                            <s:textfield  type="number" name="task.nganSach" value="%{task.nganSach}" cssClass="form-control" id="textbox2"/>
                                                                        </fieldset>
                                                                    </div>
                                                                    <div class="col-3">
                                                                        <label>Người thực hiện <span class="danger">*</span></label>
                                                                        <select class="form-control" name="task.assigneeUserId"> 
                                                                            <option value="<s:property value="taskCustoms.assigneeUser.id"/>"><s:property value="taskCustoms.assigneeUser.fullName"/></option>
                                                                            <s:iterator value="listUserRaciR">
                                                                                <option value="<s:property value="id"/>"><s:property value="fullName"/></option>
                                                                            </s:iterator>
                                                                        </select>
                                                                    </div>
                                                                    <div class="col-3">
                                                                        <label>Người kiểm tra <span class="danger">*</span></label>
                                                                        <select class="form-control" name="task.reviewBy"> 
                                                                            <option value="<s:property value="taskCustoms.reviewByUser.id"/>"><s:property value="taskCustoms.reviewByUser.fullName"/></option>
                                                                            <s:iterator value="listUserInWorkspace">
                                                                                <option value="<s:property value="id"/>"><s:property value="fullName"/></option>
                                                                            </s:iterator>
                                                                        </select>
                                                                    </div>
                                                                    <div class="col-3">
                                                                        <label>Task list <span class="danger">*</span></label>
                                                                        <select disabled="true" class="form-control" name="task.tasklistid"> 
                                                                            <s:iterator value="tasklist">
                                                                                <option value="<s:property value="id"/>"><s:property value="taskListTitle"/></option>
                                                                            </s:iterator>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-3">
                                                                        <fieldset class="form-group">
                                                                            <label>Ngày bắt đầu <span class="danger">*</span></label>
                                                                            <input type="date" name="startDate" value="<s:date name="task.startDate" format="yyyy-MM-dd"/>" class="form-control" id="textbox2"/>
                                                                        </fieldset>
                                                                    </div>
                                                                    <div class="col-3">
                                                                        <fieldset class="form-group">
                                                                            <label>Hạn cuối cùng <span class="danger">*</span></label>
                                                                            <input type="date" name="dueDate" value="<s:date name="task.dueDate" format="yyyy-MM-dd"/>" class="form-control" id="textbox2"/>
                                                                        </fieldset>
                                                                    </div>
                                                                    <div class="col-3">
                                                                        <fieldset class="form-group">
                                                                            <label>Mức độ ưu tiên <span class="danger">*</span></label>
                                                                            <s:select  cssClass="form-control"
                                                                                       headerKey="-1" headerValue="Lựa chọn giá trị"
                                                                                       list="#{1:'CAO', 2:'TRUNG BÌNH', 3:'THẤP'}" 
                                                                                       name="task.priority" 
                                                                                       value="task.priority" />
                                                                        </fieldset>
                                                                    </div>
                                                                    <div class="col-3">
                                                                        <fieldset class="form-group">
                                                                            <label>Chi phí kế hoạch <span class="danger">*</span></label>
                                                                            <s:textfield min="0" type="number" name="task.amountPlan" cssClass="form-control" id="textbox2"/>
                                                                        </fieldset>
                                                                    </div>
                                                                </div>

                                                                <div class="row">
                                                                    <div class="col-12">
                                                                        <fieldset class="form-group">
                                                                            <label>Mô tả công việc</label>
                                                                            <s:textarea type="text" name="task.taskDesc" cssClass="form-control" id="textbox2"/>
                                                                        </fieldset> 
                                                                    </div>
                                                                </div>
                                                            <!--</form>-->   
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
<%@include file="/jsp/dialogConfirm.jsp" %>
        <%@include file="/jsp/footer.jsp" %>
        <%@include file="/jsp/js.jsp" %>
    </body>
</html>
