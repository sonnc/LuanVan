<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="sidebar-detached sidebar-left">
    <div class="sidebar">
        <div class="project-sidebar-content">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">Danh sách dự án</h4>
                    <a class="heading-elements-toggle"><i class="la la-ellipsis-v font-medium-3"></i></a>
                    <div class="heading-elements">
                        <ul class="list-inline mb-0">
                            <li><a data-action="collapse"><i class="ft-minus"></i></a></li>
                        </ul>
                    </div>
                </div>
                <div class="card-content">
                    <div class="card-body border-top-blue-grey border-top-lighten-5">
                        <div class="project-search">
                            <div class="project-search-content">
                                <div class="row">

                                    <div class="col-12" style="padding: 5px">
                                        <a type="button" href="adminUserAction"class="btn btn-blue" style="width: 100%">QUẢN LÝ TÀI KHOẢN</a>
                                    </div>
                                    <div class="col-12" style="padding: 5px">
                                        <a type="button" href="adminDepartementAction"class="btn btn-blue" style="width: 100%">QUẢN LÝ PHÒNG BAN</a>
                                    </div>
                                    <div class="col-12" style="padding: 5px">
                                        <a type="button" href="adminTaskAction"class="btn btn-blue" style="width: 100%">QUẢN LÝ CÔNG VIỆC</a>
                                    </div>
                                    <div class="col-12" style="padding: 5px">
                                        <a type="button" href="adminKpiAction"class="btn btn-blue" style="width: 100%">QUẢN LÝ KPI</a>
                                    </div>
                                    <div class="col-12" style="padding: 5px">
                                        <a type="button" href="adminBaonlineAction"class="btn btn-blue" style="width: 100%">QUẢN LÝ BA-ONLINE</a>
                                    </div>
                                    <div class="col-12" style="padding: 5px">
                                        <a type="button" href="adminSqlAction"class="btn btn-blue" style="width: 100%">QUẢN LÝ KHÁC</a>
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