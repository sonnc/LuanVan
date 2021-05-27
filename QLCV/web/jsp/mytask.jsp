<%-- 
    Document   : mytask-all
    Created on : Mar 9, 2021, 11:11:46 AM
    Author     : sonng
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            session.removeAttribute("CssAndJs");
            session.setAttribute("CssAndJs", "view_task");
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="/jsp/header.jsp" %>
        <%@include file="/jsp/linkCss.jsp" %>
        <title>Công viêc/ nhiệm vụ</title>
    </head>
    <body class="vertical-layout vertical-menu 2-columns   menu-expanded fixed-navbar"
          data-open="click" data-menu="vertical-menu" data-col="2-columns">
        <%@include file="/jsp/nav.jsp" %>

        <div class="app-content content">
            <div class="content-wrapper">
                <div class="content-header row">
                    <div class="content-header-left col-md-6 col-12 mb-2">
                        <h3 class="content-header-title">Công viêc/ nhiệm vụ</h3>
                    </div>
                    <div class="content-header-right col-md-6 col-12">  

                        <div class="btn-group float-md-right" > 
                            <a type="button" href="workspaceSumaryAction?id=<s:property value="workspace.id"/>" class="btn btn-info round box-shadow-2 px-2">
                                <i class="ft-home"></i> Trở về Workspace</a>
                        </div>
                        <div class="btn-group float-md-right">
                            <button class="btn btn-danger round dropdown-toggle dropdown-menu-right box-shadow-2 px-2"
                                    id="btnGroupDrop11" type="button" data-toggle="dropdown" aria-haspopup="true"
                                    aria-expanded="false"><i class="ft-edit icon-left"></i> 
                                <%=properties.getProperty("app.function.qlcv")%>
                            </button>
                            <div class="dropdown-menu" aria-labelledby="btnGroupDrop11">
                                <a class="dropdown-item" href="GetTaskByUser?workspaceId=<s:property value="workspace.id"/>&&status=all">Tất cả</a>
                                <a class="dropdown-item" href="GetTaskByUser?workspaceId=<s:property value="workspace.id"/>&&status=OPEN">Đang mở</a>
                                <a class="dropdown-item" href="GetTaskByUser?workspaceId=<s:property value="workspace.id"/>&&status=INPROCESS">Đang xử lý</a>
                                <a class="dropdown-item" href="GetTaskByUser?workspaceId=<s:property value="workspace.id"/>&&status=COMPLETE">Hoàn thành, chờ đánh giá</a>
                                <a class="dropdown-item" href="GetTaskByUser?workspaceId=<s:property value="workspace.id"/>&&status=CLOSE">Đã đóng</a>
                                <a class="dropdown-item" href="GetTaskByUser?workspaceId=<s:property value="workspace.id"/>&&status=CANCEL">Đã hủy</a>
                                <a class="dropdown-item" href="GetTaskByUser?workspaceId=<s:property value="workspace.id"/>&&status=DELAY">Trễ hạn</a>
                            </div>
                        </div>
                        <div class="btn-group float-md-right">
                            <a href="TaskPendingRating?workspaceId=<s:property value="workspace.id"/>" class="btn btn-outline-twitter round  px-2" type="button" aria-expanded="false"><i class="ft-star icon-left"></i> 
                                Đánh giá công việc thành viên
                            </a>
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
                                        <h4 class="card-title">Danh sách công việc trong Workspace: <s:property value="workspace.workspaceName"/></h4>
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
                                        <div class="card-body card-dashboard">
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
                                                        <th>Nguồn</th>
                                                        <th>Chức năng</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <s:iterator value="lstTaskCustoms" var="test">
                                                        <tr>
                                                            <td><s:property value="task.id"/></td>
                                                    <td>
                                                    <a  href="viewTask?workspaceId=<s:iterator value="workspace"><s:property value="id"/></s:iterator>&&tasklistid=<s:property value="task.tkWsTasklist.id"/>&&taskid=<s:property value="task.id"/>">
                                                        <s:property value="task.taskName"/>
                                                    </a>    
                                                        </td>
                                                    <td><s:property value="assigneeUser.fullName"/></td>
                                                    <td><s:property value="task.startDate"/></td>
                                                    <td><s:property value="task.dueDate"/></td>
                                                    <td>
                                                        <s:if test="%{#test.task.priority = '1'}">
                                                            <span class="la la-flag" style="color: red">Cao</span>
                                                        </s:if>
                                                        <s:elseif test="%{#test.task.priority = '2'}">
                                                            <span class="la la-flag" style="color: #ffc107">Trung bình</span>
                                                        </s:elseif>
                                                        <s:else>
                                                            <span class="la la-flag" style="color: green">Cao</span>
                                                        </s:else>
                                                    </td>
                                                    <td>
                                                        <s:if test="%{#test.task.status == 'OPEN'}">
                                                            <span style="color: green">Mở</span>
                                                        </s:if>
                                                        <s:elseif test="%{#test.task.status == 'INPROCESS'}">
                                                            <span style="color: #ffc107">Đang xử lý</span>
                                                        </s:elseif>
                                                        <s:elseif test="%{#test.task.status == 'COMPLETE'}">
                                                            <span style="color: blue">Hoàn thành, chờ duyệt</span>
                                                        </s:elseif>
                                                        <s:elseif test="%{#test.task.status == 'CLOSE'}">
                                                            <span style="color: darkviolet">Đóng</span>
                                                        </s:elseif>
                                                        <s:elseif test="%{#test.task.status == 'CANCEL'}">
                                                            <span style="color: red">Hủy bỏ</span>
                                                        </s:elseif>
                                                    </td>
                                                    <td><s:property value="task.timeEstimate"/></td>
                                                    <td><s:property value="reviewByUser.fullName"/></td>
                                                    <td><s:property value="task.source"/></td>
                                                    <td>
                                                        <s:if test="%{#test.task.status == 'OPEN'}">
                                                            <a type="button" class="btn btn-facebook" href="updateTask?workspaceId=<s:iterator value="workspace"><s:property value="id"/></s:iterator>&&taskid=<s:property value="task.id"/>&&status=INPROCESS">
                                                                    Xử lý
                                                                </a>
                                                        </s:if>
                                                        <s:elseif test="%{#test.task.status == 'INPROCESS'}">
                                                            <a type="button" class="btn btn-info" href="updateTask?workspaceId=<s:iterator value="workspace"><s:property value="id"/></s:iterator>&&taskid=<s:property value="task.id"/>&&status=COMPLETE">
                                                                    Hoàn thành
                                                                </a>
                                                        </s:elseif>
                                                        <s:elseif test="%{#test.task.status == 'COMPLETE'}">
                                                            <a type="button" class="btn btn-facebook" href="updateTask?workspaceId=<s:iterator value="workspace"><s:property value="id"/></s:iterator>&&taskid=<s:property value="task.id"/>&&status=OPEN">
                                                                    Mở lại
                                                                </a>
                                                                <a type="button" class="btn btn-warning" href="updateTask?workspaceId=<s:iterator value="workspace"><s:property value="id"/></s:iterator>&&taskid=<s:property value="task.id"/>&&status=CLOSE">
                                                                    Đóng
                                                                </a>
                                                        </s:elseif>
                                                        <s:elseif test="%{#test.task.status == 'CANCEL'}">
                                                            <a type="button" class="btn btn-facebook" href="updateTask?workspaceId=<s:iterator value="workspace"><s:property value="id"/></s:iterator>&&taskid=<s:property value="task.id"/>&&status=OPEN">
                                                                    Mở lại
                                                                </a>
                                                        </s:elseif>
                                                        <a type="button" class="btn btn-danger" href="updateTask?workspaceId=<s:iterator value="workspace"><s:property value="id"/></s:iterator>&&taskid=<s:property value="task.id"/>&&status=CANCEL">
                                                                Hủy bỏ
                                                            </a>

                                                        </td>
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
                    <!--/ Multi-column ordering table -->
                </div>
            </div>
        </div>
        <%@include file="/jsp/footer.jsp" %>
        <%@include file="/jsp/js.jsp" %>
    </body>
</html>
