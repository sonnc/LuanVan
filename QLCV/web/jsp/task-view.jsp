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
            <form action="uploadFile" method="post" enctype="multipart/form-data">
                <div class="content-wrapper">
                    <div class="content-header row">
                        <div class="content-header-left col-md-6 col-12 mb-2">
                            <h3 class="content-header-title">Xem chi tiết công việc</h3>
                        </div>
                        <div class="content-header-right col-md-6 col-12">  
                            <div class="btn-group float-md-right" > 
                                <a type="button" href="workspaceSumaryAction?id=<s:property value="workspace.id"/>" class="btn btn-danger round box-shadow-2 px-2">
                                    <i class="ft-home"></i> Trở về Workspace</a>
                                <a type="button" href="viewAllTask?workspaceId=<s:property value="workspace.id"/>" class="btn btn-warning round box-shadow-2 px-2">
                                    <i class="ft-book"></i> Trở về Task List</a>


                                <!--                                <button type="submit" onclick="countIdCheckList(); countIdUdf();" class="btn btn-info round box-shadow-2 px-2">
                                                                    <i class="ft-save"></i> <%=properties.getProperty("app.save")%></button>-->

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
                                            <s:set name="taskSub"><s:property value="task.isSubTask"/></s:set>
                                            <s:set name="taskparentid"><s:property value="task.parentTaskId"/></s:set>


                                            <s:if test="#taskSub.equalsIgnoreCase('Y')">
                                                <a class="btn btn-outline-cyan" href="viewTask?workspaceId=<s:property value="workspace.id"/>&&tasklistid=<s:property value="task.tkWsTasklist.id"/>&&taskid=<s:property value="taskparentid"/>">
                                                    Trở về Task cha
                                                </a>
                                            </s:if>
                                            <s:else>
                                                <h4 class="card-title" id="file-repeater">Công việc</h4>
                                            </s:else>

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

                                                <div class="form-body">
                                                    <div class="row">
                                                        <div class="col-11">
                                                            <h4 class="form-section"><i class="ft-user"></i> THÔNG TIN CHUNG</h4>
                                                        </div>
                                                        <div class="col-1"><a href="prepareEditTask?workspaceId=<s:property value="workspace.id"/>&&tasklistid=<s:property value="task.tkWsTasklist.id"/>&&taskid=<s:property value="task.id"/>" type="button"  class="btn btn-outline-danger">Chỉnh sửa</a></div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-6">
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="projectinput1">Tên công việc/ nhiệm vụ</label>
                                                                <div class="col-md-9">
                                                                    <s:textfield disabled="true" cssClass="form-control" name="task.taskName"/>
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="projectinput1">Tiền khoán</label>
                                                                <div class="col-md-9">
                                                                    <s:textfield disabled="true" cssClass="form-control" name="task.nganSach"/>
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="projectinput1">Người thực hiện</label>
                                                                <div class="col-md-9">
                                                                    <s:textfield disabled="true" cssClass="form-control" name="taskCustom.assigneeUser.fullName"/>
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="projectinput1">Người kiểm tra</label>
                                                                <div class="col-md-9">
                                                                    <s:textfield disabled="true" cssClass="form-control" name="taskCustom.reviewByUser.fullName"/>
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="projectinput1">Mô tả</label>
                                                                <div class="col-md-9">
                                                                    <s:textarea disabled="true" cssClass="form-control" name="task.taskDesc"/>
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="projectinput1">Chi phí kế hoạch</label>
                                                                <div class="col-md-9">
                                                                    <s:textfield disabled="true" cssClass="form-control" name="task.amountPlan"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-6">
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="projectinput1">Ngày bắt đầu</label>
                                                                <div class="col-md-9">
                                                                    <s:textfield disabled="true" cssClass="form-control" name="task.startDate"/>
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="projectinput1">Hạn cuối cùng</label>
                                                                <div class="col-md-9">
                                                                    <s:textfield disabled="true" cssClass="form-control" name="task.dueDate"/>
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="projectinput1">Mức độ ưu tiên</label>
                                                                <div class="col-md-9">
                                                                    <s:set name="taskPorirty"><s:property value="task.priority"/></s:set>
                                                                    <s:if test="#taskPorirty==1">
                                                                        <s:textfield disabled="true" cssClass="form-control" name="task.priority" value="CAO"/>
                                                                    </s:if>
                                                                    <s:if test="#taskPorirty==2">
                                                                        <s:textfield disabled="true" cssClass="form-control" name="task.priority" value="TRUNG BÌNH"/>
                                                                    </s:if>
                                                                    <s:if test="#taskPorirty==3">
                                                                        <s:textfield disabled="true" cssClass="form-control" name="task.priority" value="THẤP"/>
                                                                    </s:if>

                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="projectinput1">Estimate</label>
                                                                <div class="col-md-9">
                                                                    <s:textfield disabled="true" cssClass="form-control" name="task.timeEstimate"/>
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="projectinput1">Task list</label>
                                                                <div class="col-md-9">
                                                                    <s:textfield disabled="true" cssClass="form-control" name="task.tkWsTasklist.taskListTitle"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                                
                                                                
                                                 <!--Cong viec theo sau-->
                                                 <div class="row">
                                                    <div class="col-11">
                                                        <h4 class="form-section"><i class="ft-server"></i> Theo sau các công việc</h4>
                                                    </div>
                                                    <div class="col-1"><a href="prepareCreateTaskFollow?workspaceId=<s:property value="workspace.id"/>&&tasklistid=<s:property value="task.tkWsTasklist.id"/>&&taskid=<s:property value="task.id"/>" type="button"  class="btn btn-outline-danger">Tạo mới</a></div>
                                                </div>

                                                <div class="row">
                                                    <table class="table table-striped table-bordered zero-configuration hiden">
                                                        <thead>
                                                            <tr>
                                                                <th>ID</th>
                                                                <th>Tên công việc</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <s:iterator value="lstTasksFollows" var="test">
                                                                <tr>
                                                                    <td><s:property value="id"/></td>
                                                                    <td><s:property value="taskName"/></td>
                                                                </tr>
                                                            </s:iterator>
                                                        </tbody>
                                                    </table>
                                                </div>
                                                                
                                                                
                                                                
                                                <s:set name="taskSub"><s:property value="task.isSubTask"/></s:set>
                                                <s:if test="#taskSub.equalsIgnoreCase('N')">
                                                    <div class="row">
                                                        <div class="col-11">
                                                            <h4 class="form-section"><i class="ft-folder"></i> SUB - TASK</h4>
                                                        </div>
                                                        <div class="col-1">
                                                            <a class="btn btn-outline-danger" type="button" href="prepareCreateTask?workspaceId=<s:iterator value="workspace"><s:property value="id"/></s:iterator>&&tasklistid=<s:property value="task.tkWsTasklist.id"/>&&parentTaskId=<s:property value="task.id"/>">Tạo mới</a>
                                                            </div>
                                                        </div>

                                                        <div class="row">
                                                            <table class="table table-striped table-bordered zero-configuration hiden">
                                                                <thead>
                                                                    <tr>
                                                                        <th>ID</th>
                                                                        <th>Tên công việc</th>
                                                                        <th>Người thực hiện</th>
                                                                        <th>Ngày bắt đầu</th>
                                                                        <th>Hạn kết thúc</th>
                                                                        <th>Mức độ</th>
                                                                        <th>Trạng thái</th>
                                                                        <th>Estimate</th>
                                                                        <th>Kiểm tra</th>
                                                                        <th>Chức năng</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                <s:iterator value="lstTaskCustoms" var="lstTask">
                                                                    <tr>
                                                                        <td><s:property value="task.id"/></td>
                                                                        <td><s:property value="task.taskName"/></td>
                                                                        <td><s:property value="assigneeUser.fullName"/></td>
                                                                        <td><s:property value="task.startDate"/></td>
                                                                        <td><s:property value="task.dueDate"/></td>
                                                                        <td><s:property value="task.priority"/></td>
                                                                        <td><s:property value="task.status"/></td>
                                                                        <td><s:property value="task.timeEstimate"/></td>
                                                                        <td><s:property value="reviewByUser.fullName"/></td>
                                                                        <td>
                                                                            <a type="button" class="btn btn-facebook" href="viewTask?workspaceId=<s:property value="workspace.id"/>&&tasklistid=<s:property value="task.tkWsTasklist.id"/>&&taskid=<s:property value="task.id"/>">
                                                                                Xem
                                                                            </a>
                                                                            <a type="button" class="btn btn-danger" href="deleteTask?workspaceId=<s:property value="workspace.id"/>&&tasklistid=<s:property value="task.tkWsTasklist.id"/>&&taskid=<s:property value="task.id"/>&&issubtask=true&&parenttask=<s:property value="task.parentTaskId"/>">
                                                                                    Xóa
                                                                                </a>
                                                                            </td>
                                                                        </tr>
                                                                </s:iterator>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </s:if> 
                                                <div class="row">
                                                    <div class="col-11">
                                                        <h4 class="form-section"><i class="ft-server"></i> UDF</h4>
                                                    </div>
                                                    <div class="col-1"><a href="prepareCreateUdf?workspaceId=<s:property value="workspace.id"/>&&tasklistid=<s:property value="task.tkWsTasklist.id"/>&&taskid=<s:property value="task.id"/>" type="button"  class="btn btn-outline-danger">Tạo mới</a></div>
                                                </div>

                                                <div class="row">
                                                    <table class="table table-striped table-bordered zero-configuration hiden">
                                                        <thead>
                                                            <tr>
                                                                <th>ID</th>
                                                                <th>Mô tả UDF</th>
                                                                <th>Loại giá trị</th>
                                                                <th>Giá trị UDF</th>
                                                                <th>Hành động</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <s:iterator value="lstUdf" var="test">
                                                                <tr>
                                                                    <td><s:property value="id"/></td>
                                                                    <td><s:property value="refKey"/></td>
                                                                    <td><s:property value="extValue1"/></td>
                                                                    <td><s:property value="fieldValue"/></td>
                                                                    <td>
                                                                        <a type="button" class="btn btn-danger" href="deleteUdf?workspaceId=<s:property value="workspace.id"/>&&tasklistid=<s:property value="task.tkWsTasklist.id"/>&&taskid=<s:property value="task.id"/>&&udfid=<s:property value="id"/>">
                                                                            Xóa
                                                                        </a>
                                                                    </td>
                                                                </tr>
                                                            </s:iterator>
                                                        </tbody>
                                                    </table>
                                                </div>

                                                <div class="row">
                                                    <div class="col-11">
                                                        <h4 class="form-section"><i class="ft-check-square"></i> ĐẦU MỤC KIỂM TRA</h4>
                                                    </div>
                                                    <div class="col-1"><a href="prepareCreateCheckList?workspaceId=<s:property value="workspace.id"/>&&tasklistid=<s:property value="task.tkWsTasklist.id"/>&&taskid=<s:property value="task.id"/>" type="button"  class="btn btn-outline-danger">Tạo mới</a></div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-12">
                                                        <s:iterator value="lstChecklists" var="checklist">
                                                            <div class="row">
                                                                <div class="col-11">
                                                                    <div class="col-12"><s:property value="checkListName"/> 
                                                                    </div>
                                                                    <div class="col-12">
                                                                        <s:iterator value="lstChecklistItems" var="checklistitem">
                                                                            <s:if test="#checklist.id == #checklistitem.tkWsTaskChecklist.id">
                                                                                <li><s:property value="itemName"/></li>
                                                                                </s:if>
                                                                            </s:iterator>
                                                                    </div>
                                                                </div>
                                                                <div class="col-1">
                                                                    <a type="button" class="la la-trash" href="deleteCheckList?workspaceId=<s:property value="workspace.id"/>&&tasklistid=<s:property value="task.tkWsTasklist.id"/>&&taskid=<s:property value="task.id"/>&&checklistid=<s:property value="id"/>">
                                                                        Xóa
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </s:iterator>
                                                    </div>
                                                </div>
                                                <!--<form action="uploadFile" method="post" enctype="multipart/form-data">-->
                                                <div class="row">
                                                    <div class="col-11">
                                                        <h4 class="form-section"><i class="ft-file"></i> TỆP ĐÍNH KÈM</h4>
                                                    </div>
                                                    <div class="col-1"><button  type="submit" style="color: #FF4961" class="btn btn-outline-danger">Đẩy tệp</button></div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-6">
                                                        <div class="form-group" style="margin-left: 30px">
                                                            <ul>
                                                                <s:iterator value="lstAttachmentses">
                                                                    <li><a href="<s:property value="fileLink"/>"><s:property value="fileName"/> - Ngày tạo: <s:property value="createDate"/> </a> 
                                                                        <a href="deleteAttachment?workspaceId=<s:property value="workspace.id"/>&&tasklistid=<s:property value="task.tkWsTasklist.id"/>&&taskid=<s:property value="task.id"/>&&attachmentid=<s:property value="id"/>"><i class="la la-trash danger"></i></a></li>
                                                                        </s:iterator>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    <div class="col-6">
                                                        <div id="attachFile" >
                                                            <fieldset class="form-group form-group-style">
                                                                <p>Tối đa 5MB/file</p>
                                                                <input type="file" class="form-control" name="myFile" id="file" multiple="" onchange="updateList()">
                                                                <div id="fileList"></div>
                                                            </fieldset>
                                                            <script>
                                                                function updateList() {
                                                                    var input = document.getElementById('file');
                                                                    var output = document.getElementById('fileList');
                                                                    var children = "";
                                                                    for (var i = 0; i < input.files.length; ++i) {
                                                                        children += '<li>' + input.files.item(i).name + '</li>';
                                                                    }
                                                                    output.innerHTML = '<ul>' + children + '</ul>';
                                                                }
                                                            </script>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!--</form>-->

                                                <div class="row">
                                                    <div class="col-11">
                                                        <h4 class="form-section"><i class="ft-smartphone"></i> THẢO LUẬN</h4>
                                                    </div>
                                                    <div class="col-1"><a href="#" type="button"  class="btn btn-outline-danger">Chỉnh sửa</a></div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-12">
                                                        <div class="form-group row">
                                                            <div class="col-md-12">
                                                                <s:iterator value="lstComments">
                                                                    <div class="row">
                                                                        <div class="col-2">Vào lúc: <s:property value="createDate"/>, <strong><s:property value="userLogin"/></strong> đã viết: </div>
                                                                        <div class="col-10"><s:property value="comment"/></div>
                                                                    </div>
                                                                    
                                                                </s:iterator>
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
        <%@include file="/jsp/js.jsp" %>
    </body>
</html>
