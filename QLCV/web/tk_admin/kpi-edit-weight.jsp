<%-- 
    Document   : user-profile
    Created on : Feb 26, 2020, 10:30:08 PM
    Author     : sonng
--%>
<%@page import="java.util.Properties"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <title>KPI</title>
    </head>
    <body class="vertical-layout vertical-menu 2-columns   menu-expanded fixed-navbar"
          data-open="click" data-menu="vertical-menu" data-col="2-columns">
        <%@include file="/jsp/nav.jsp" %>
        <!-- ////////////////////////////////////////////////////////////////////////////-->


        <s:if test="actionMessages!=null && actionMessages.size > 0">
            <script type="text/javascript" charset="UTF-8">
                var actionMessages;
                <s:iterator value="actionMessages" >
                actionMessages = '<s:property escape="UTF-8"/>';
                </s:iterator>
                swal('Thông báo...', actionMessages, 'info')
            </script>
        </s:if>



        <div class="app-content content">
            <div class="content-wrapper">
                <div class="content-header row">
                    <div class="content-header-left col-md-6 col-12 mb-2">
                        <h3 class="content-header-title mb-0">Sửa bộ trọng số KPI</h3>
                        <div class="row breadcrumbs-top">
                            <div class="breadcrumb-wrapper col-12">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="<%=session.getAttribute("httpURL")%>tk_admin/home.jsp"><%=properties.getProperty("tk.tko.label.home")%></a>
                                    </li>
                                    <li class="breadcrumb-item active">KPI
                                    </li>
                                </ol>
                            </div>
                        </div>
                    </div>
                    <div class="content-header-right text-md-right col-md-6 col-12">
                    </div>
                </div>
                <div class="content-body">

                    <section id="drag-area">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card-header">
                                    <div class="card-content collapse show">
                                        <div class="card-body">
                                            <div class="repeater-default">
                                                <div class="form-group overflow-hidden" >
                                                    <div class="col-12">
                                                    </div>
                                                </div>
                                                <div>
                                                    <form id="formUoCUserDetail" action="editWeightKpiTypeSetting" method="post" >
                                                        <input hidden="true" name="kpiTypeId" value="<s:property value="kpiTypeSetting.id"/>"/>
                                                        <div>   
                                                            <div class="row">
                                                                <div class="col-md-3">
                                                                    <div class="form-group">
                                                                        <h5>Tên KPI
                                                                            <span class="required">*</span>
                                                                        </h5>
                                                                        <div class="controls">
                                                                            <input required="true" type="text" value="<s:property value="kpiTypeSetting.kpiName"/>" name="tkKpiDetailKpiName" class="form-control" />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-9">
                                                                    <div class="form-group">
                                                                        <h5>Mô tả
                                                                            <span class="required">*</span>
                                                                        </h5>
                                                                        <div class="controls">
                                                                            <input required="true" type="text" value="<s:property value="kpiTypeSetting.kpiDesc"/>" name="tkKpiDetailKpiDesc"class="form-control" />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-md-4">
                                                                    <div class="form-group">
                                                                        <h5>Trong số phòng ban
                                                                            <span class="required">*</span>
                                                                        </h5>
                                                                        <div class="controls">
                                                                            <input required="true" type="number" id="trongSo1" value="<s:property value="kpiTypeSetting.trongSoKpiPhongban"/>" name="trongSoKpiPhongban" class="form-control" />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-4">
                                                                    <div class="form-group">
                                                                        <h5>Trọng số thường xuyên
                                                                            <span class="required">*</span>
                                                                        </h5>
                                                                        <div class="controls">
                                                                            <input required="true" type="number" id="trongSo2" value="<s:property value="kpiTypeSetting.trongSoKpiThuongxuyen"/>" name="trongSoKpiThuongxuyen" class="form-control" />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-4">
                                                                    <div class="form-group">
                                                                        <h5>Trọng số đột xuất
                                                                            <span class="required">*</span>
                                                                        </h5>
                                                                        <div class="controls">
                                                                            <input required="true" type="number" id="trongSo3" value="<s:property value="kpiTypeSetting.trongSoKpiDotxuat"/>" name="trongSoKpiDotxuat" class="form-control" />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="text-right">
                                                                <button onclick="return checkSum()" type="submit" class="btn btn-success"><%=properties.getProperty("tk.tko.label.button.save")%> <i class="la la-thumbs-o-up position-right"></i></button>
                                                            </div>
                                                        </div> 
                                                    </form>
                                                </div>
                                            </div>

                                            <script>
                                                function checkSum() {
                                                    var trongSo1 = Number(document.getElementById('trongSo1').value);
                                                    var trongSo2 = Number(document.getElementById('trongSo2').value);
                                                    var trongSo3 = Number(document.getElementById('trongSo3').value);
                                                    var sum = trongSo1 + trongSo2 + trongSo3;
                                                    if (sum !== 100) {
                                                        swal("<%=properties.getProperty("tk.tko.label.admin.kpi.mess0")%>", "<%=properties.getProperty("tk.tko.label.admin.kpi.mess18")%>", "error");
                                                        return false;
                                                    }
                                                }
                                            </script>
                                            <script>
                                                document.querySelector('#formUoCUserDetail').addEventListener('submit', function (e) {

                                                    var form = this;
                                                    e.preventDefault();
                                                    swal({
                                                        title: "<%=properties.getProperty("tk.tko.label.admin.kpi.mess1")%>",
                                                        text: "<%=properties.getProperty("tk.tko.label.admin.kpi.mess2")%>",
                                                        icon: "warning",
                                                        buttons: [
                                                            '<%=properties.getProperty("tk.tko.label.admin.kpi.mess3")%>',
                                                            '<%=properties.getProperty("tk.tko.label.admin.kpi.mess4")%>'
                                                        ],
                                                        dangerMode: true,
                                                    }).then(function (isConfirm) {
                                                        if (isConfirm) {
                                                            swal({
                                                                title: '<%=properties.getProperty("tk.tko.label.admin.kpi.mess5")%>',
                                                                text: '<%=properties.getProperty("tk.tko.label.admin.kpi.mess6")%>',
                                                                icon: 'success'
                                                            }).then(function () {
                                                                form.submit();
                                                            });
                                                        } else {
                                                            swal("<%=properties.getProperty("tk.tko.label.admin.kpi.mess7")%>", "<%=properties.getProperty("tk.tko.label.admin.kpi.mess8")%>", "error");
                                                        }
                                                    });
                                                });
                                            </script> 
                                        </div>
                                    </div>

                                </div>
                            </div>
                    </section>
                </div>
            </div>
        </div>
        <!-- ////////////////////////////////////////////////////////////////////////////-->
        <%@include file="/jsp/footer.jsp" %>
        <%@include file="/jsp/js.jsp" %>
    </body>
</html>
