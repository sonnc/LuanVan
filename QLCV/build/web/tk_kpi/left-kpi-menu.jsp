<%@page import="java.util.Calendar"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<div class="sidebar-detached sidebar-left">
    <div class="sidebar">
        <div class="project-sidebar-content">
            <!-- Project Users -->
            <div class="card">
                <div class="card-header mb-0">
                    <h4 class="card-title">NHÓM CHỨC NĂNG</h4>
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
                                    <% int year = Calendar.getInstance().get(Calendar.YEAR);%>
                                    <%
                                        String role = (String) session.getAttribute("role");
                                        if (role!=null && ("QL".equals(role)|| "GD".equals(role))) {
                                    %>

                                    <div class="col-12" style="padding: 5px">
                                        <a href="getAllStaffKpiAction?kpiYear=<%= year%>"><input type="button" class="btn btn-blue" value="QUẢN LÝ KPI NHÂN VIÊN" style="width: 100%"/></a>
                                    </div>
                                    <%
                                        }
                                    %>
                                    <div class="col-12" style="padding: 5px">
                                        <a type="button" href="kpiUserAction?userId=0&&kpiYear=<%= year%>&&method=viewMyKpi"class="btn btn-blue" style="width: 100%">KPI CỦA TÔI</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--            
                        
                        
                        
                        <div class="card">
                            <div class="card-header mb-0">
                                <h4 class="card-title">KPI CỦA TÔI</h4>
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
                                            <form action="#">
                                                <div class="position-relative">
                                                    <input type="search" id="myInputSearch1" onkeyup="myFunctionSearch('myInputSearch1', 'myULSearch1')" class="form-control" placeholder="Tìm kiếm KPI ....">
            
                                                    <div class="form-control-position">
                                                        <i class="la la-search text-size-base text-muted"></i>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-content">
                                    <div class="card-body  py-0 px-0">
            
            
                                        <div class="vertical-scroll scroll-example height-600" >
                                            <ul style="padding: 0px" id="myULSearch1">
            <% if (lstTkUserDetails != null && lstTkUserDetails.size() > 0) {
                    for (int ip = 0; ip < lstTkUserDetails.size(); ip++) {
                        MapTkUserDetail tkt = new MapTkUserDetail();
                        tkt = lstTkUserDetails.get(ip);
            %>
            <li>
                <a href="javascript:void(0)" class="list-group-item">
                    <div class="media">
                        <div class="media-left pr-1">
                            <span class="avatar avatar-sm avatar-online rounded-circle">
                                <img src="<%=session.getAttribute("httpURL")%><%= tkt.getUserAvarta() == null ? "assets/images/portrait/small/avatar-s-1.png" : tkt.getUserAvarta()%>" alt="avatar"><i></i></span>
                        </div>
                        <div class="media-body w-100">
                            <h6 class="media-heading mb-0"><%= tkt.getUserName()%> - <%= tkt.getAccount()%></h6>
                            <p class="font-small-2 mb-0 text-muted"><%= tkt.getUserJob()%></p>
                        </div>
                    </div>
                </a>
            </li>
            <%                                   }
                }
            %>
        </ul>
    </div>
</div>
</div>
</div>
</div>-->
            <!--/ Project Users -->
        </div>
    </div>
</div>