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
            <form id="formAction" action="createTask" method="post" enctype="multipart/form-data">
                <div class="content-wrapper">
                    <s:set name="checkTaskPrent"><s:property value="taskParent.id"/></s:set>
                        <div class="content-header row">
                            <div class="content-header-left col-md-6 col-12 mb-2">
                            <s:if test="#checkTaskPrent > 0">
                                <h3 class="card-title" id="file-repeater">Tạo Sub-task </h3>
                            </s:if>
                            <s:else>
                                <h3 class="content-header-title">Tạo mới công việc</h3>
                            </s:else>
                        </div>
                        <div class="content-header-right col-md-6 col-12">  
                            <div class="btn-group float-md-right" > 
                                <a type="button" href="workspaceSumaryAction?id=<s:property value="workspace.id"/>" class="btn btn-danger round box-shadow-2 px-2">
                                    <i class="ft-home"></i> Trở về Workspace</a>
                                <a type="button" href="viewAllTask?workspaceId=<s:property value="workspace.id"/>" class="btn btn-warning round box-shadow-2 px-2">
                                    <i class="ft-book"></i> Trở về Task List</a>


                                <button type="submit" onclick="countIdCheckList(); countIdUdf();" class="btn btn-info round box-shadow-2 px-2">
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

                                            <s:if test="#checkTaskPrent > 0">
                                                <h4 class="card-title" id="file-repeater">Tạo Sub-task cho công việc: <strong style="color: red"><s:property value="taskParent.taskName"/></strong></h4>
                                                <div style="margin-top: 10px">
                                                    <a class="btn btn-outline-cyan" href="viewTask?workspaceId=<s:property value="workspace.id"/>&&tasklistid=<s:property value="taskParent.tkWsTasklist.id"/>&&taskid=<s:property value="taskParent.id"/>">
                                                        Trở về Task cha
                                                    </a>
                                                </div>

                                            </s:if>
                                            <s:else>
                                                <h4 class="card-title" id="file-repeater">Tạo mới công việc</h4>
                                            </s:else>
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

                                                    <s:if test="#checkTaskPrent > 0">
                                                        <input hidden="true" name="taskid" value="<s:property value="taskParent.id"/>" />
                                                        <input hidden="true" name="subtask" value="true"/>
                                                    </s:if>

                                                </div>
                                                <div class="form-group col-12 mb-2 ">
                                                    <div class="row">

                                                        <div class="col-12"> 
                                                            <h4 class="form-section"><i class="ft-home"></i> THÔNG TIN CHUNG</h4>
                                                            <div class="row">
                                                                <div class="col-12">
                                                                    <fieldset class="form-group">
                                                                        <label>Tên công việc <span class="danger">*</span></label>
                                                                        <s:textfield requiredLabel="true" type="text" name="task.taskName" cssClass="form-control" id="textbox2"/>
                                                                    </fieldset>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-3">
                                                                    <fieldset class="form-group">
                                                                        <label>Tiền khoán</label>
                                                                        <s:textfield value="0" type="number" name="task.nganSach" cssClass="form-control" id="textbox2"/>
                                                                    </fieldset>
                                                                </div>
                                                                <div class="col-3">
                                                                    <label>Người thực hiện <span class="danger">*</span></label>
                                                                    <select class="form-control" name="task.assigneeUserId"> 
                                                                        <s:iterator value="listUserRaciR">
                                                                            <option value="<s:property value="id"/>"><s:property value="fullName"/></option>
                                                                        </s:iterator>
                                                                    </select>
                                                                </div>
                                                                <div class="col-3">
                                                                    <label>Người kiểm tra <span class="danger">*</span></label>
                                                                    <select class="form-control" name="task.reviewBy"> 
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
                                                                        <input required="true" max="<s:date name="workspace.endDate" format="MM-dd-yyyy"/>" type="date" name="startDate" class="form-control" id="textbox2"/>
                                                                    </fieldset>
                                                                </div>
                                                                <div class="col-3">
                                                                    <fieldset class="form-group">
                                                                        <label>Hạn cuối cùng <span class="danger">*</span></label>
                                                                        <input  required="true" type="date" name="dueDate" class="form-control" id="textbox2"/>
                                                                    </fieldset>
                                                                </div>
                                                                <div class="col-3">
                                                                    <fieldset class="form-group">
                                                                        <label>Mức độ ưu tiên <span class="danger">*</span></label>
                                                                        <s:select  cssClass="form-control"
                                                                                   headerKey="-1" headerValue="Lựa chọn giá trị"
                                                                                   list="#{1:'CAO', 2:'TRUNG BÌNH', 3:'THẤP'}" 
                                                                                   name="task.priority" 
                                                                                   value="" />
                                                                    </fieldset>
                                                                </div>
                                                                <div class="col-3">
                                                                    <fieldset class="form-group">
                                                                        <label>Estimate <span class="danger">*</span></label>
                                                                        <s:textfield min="1" type="number" name="task.timeEstimate" cssClass="form-control" id="textbox2"/>
                                                                    </fieldset>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-3">
                                                                    <fieldset class="form-group">
                                                                        <label>Kinh phí theo kế hoạch</label>
                                                                        <s:textfield requiredLabel="true" value="0" type="number" name="task.amountPlan" cssClass="form-control" id="textbox2"/>
                                                                    </fieldset>
                                                                </div>
                                                                <div class="col-3">
                                                                    <label>Theo sau công việc</label><br>
                                                                    <select name="lstFollowTask" class="select2 form-control" multiple="multiple">
                                                                        <s:iterator value="lstWsTaskListCustoms">
                                                                            <optgroup label="<s:property value="taskListTitle"/>">
                                                                                <s:iterator value="lstTaskCustoms">
                                                                                    <option value="<s:property value="task.id"/>"><s:property value="task.taskName"/></option>
                                                                                </s:iterator>
                                                                            </optgroup>
                                                                        </s:iterator>
                                                                    </select>
                                                                </div>
                                                            </div>

                                                            <div class="row">
                                                                <div class="col-12">
                                                                    <fieldset class="form-group">
                                                                        <label>Mô tả công việc</label>
                                                                        <s:textarea type="text" name="task.taskDesc" cssClass="form-control" id="textbox2"></s:textarea>
                                                                        </fieldset> 
                                                                    </div>
                                                                </div>

                                                                <h4 class="form-section"><i class="ft-user"></i> UDF</h4>
                                                                <div class="row">
                                                                    <div class="col-12">
                                                                        <div class="form-group col-12 mb-2 contact-repeater">
                                                                            <div data-repeater-list="listUdfTask">
                                                                                <div class="input-group mb-1" data-repeater-item id="countItemRepeatUDF">
                                                                                    <div class=" col-11">
                                                                                        <div class="row">
                                                                                            <div class="col-6">
                                                                                                <input placeholder="Mô tả UDF" type="text" name="UdfName" class="form-control" id="textbox2"/>
                                                                                            </div>
                                                                                            <div class="col-3">
                                                                                                <select class="form-control" name="UdfType"> 
                                                                                                    <option value="">Lựa chọn loại giá trị</option>
                                                                                                    <option value="DATE">DATE</option>
                                                                                                    <option value="TEXT">TEXT</option>
                                                                                                    <option value="NUMBER">NUMBER</option>
                                                                                                    <option value="EMAIL">EMAIL</option>
                                                                                                </select>
                                                                                            </div>
                                                                                            <div class="col-3">
                                                                                                <input placeholder="Giá trị dữ liệu" type="text" name="UdfValue" class="form-control" id="textbox2"/>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-1" >
                                                                                        <button class="btn btn-danger" type="button" data-repeater-delete><i class="ft-x"></i></button>
                                                                                    </div>

                                                                                </div>
                                                                            </div>
                                                                            <button onclick="return countId()" type="button" data-repeater-create class="btn btn-primary">
                                                                                <i class="ft-plus"></i> <%=properties.getProperty("app.add")%>
                                                                        </button>

                                                                        <script>
                                                                            function countIdUdf() {
                                                                                var s = document.querySelectorAll('[id^=countItemRepeatUDF]').length;
                                                                                document.getElementById('countItemInputUDF').value = s;
                                                                            }
                                                                        </script> 
                                                                    </div>
                                                                </div>
                                                            </div>

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
                                                                        <button onclick="return countId()" type="button" data-repeater-create class="btn btn-primary">
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
                                                            <h4 class="form-section"><i class="ft-check-square"></i> THẢO LUẬN</h4>
                                                            <div class="row">
                                                                <div class="col-12">
                                                                    <s:textarea name="taskComment.comment"  cssClass="form-control" style="min-height: 200px;"></s:textarea>

                                                                    </div>
                                                                </div>
                                                                <h4 class="form-section"><i class="ft-check-square"></i> ĐÍNH KÈM TÀI LIỆU</h4>
                                                                <div class="row">
                                                                    <div class="col-12">
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
