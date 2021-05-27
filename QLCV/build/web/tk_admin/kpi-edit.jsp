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
                        <h3 class="content-header-title mb-0">Chỉnh sửa KPI</h3>
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
                                                        <button data-repeater-create class="btn btn-primary" style="float: right">
                                                            <i class="ft-plus"></i> Thêm chi tiết KPI
                                                        </button>
                                                    </div>
                                                </div>
                                                <div>
                                                    <form id="formUoCUserDetail" action="editKpiSetting" method="post" >
                                                        <input hidden="true" name="kpiTypeId" value="<s:property value="kpiTypeId"/>"/>
                                                        <input hidden="true" id="countItemInput" name="countItemInput" value="" />
                                                        <input hidden="true" name="type" value="<s:iterator begin="0" end="0" value="lsKpiItemSettings"><s:property value="type"/></s:iterator>" />

                                                        <div data-repeater-list="lstKpiDetail">
                                                            <s:iterator value="lsKpiItemSettings">
                                                                <div data-repeater-item id="countItemRepeat">
                                                                    <div class="form row">
                                                                        <div class="col-1">
                                                                            <span class="text-bold-400 btn btn-outline-blue" ><s:property value="id"/></span>
                                                                        </div>
                                                                        <div class="col-10">
                                                                            <div class="row">
                                                                                <div class="col-12">
                                                                                    <div class="row">
                                                                                        <input hidden="true" value="<s:property value="type"/>" name="tkKpiDetailKpiType">
                                                                                        <input hidden="true" value="<s:property value="id"/>" name="kpiItemId">
                                                                                        <div class="col-md-2">
                                                                                            <div class="form-group">
                                                                                                <h5>Tên KPI
                                                                                                    <span class="required">*</span>
                                                                                                </h5>
                                                                                                <div class="controls">
                                                                                                    <input required="true" type="text" value="<s:property value="kpiName"/>" name="tkKpiDetailKpiName" class="form-control" />
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="col-md-2">
                                                                                            <div class="form-group">
                                                                                                <h5>Mô tả
                                                                                                    <span class="required">*</span>
                                                                                                </h5>
                                                                                                <div class="controls">
                                                                                                    <input required="true" type="text" value="<s:property value="kpiDesc"/>" name="tkKpiDetailKpiDesc"class="form-control" />
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="col-md-2">
                                                                                            <div class="form-group">
                                                                                                <h5>Chỉ tiêu
                                                                                                    <span class="required">*</span>
                                                                                                </h5>
                                                                                                <div class="controls">
                                                                                                    <input required="true" type="text" value="<s:property value="item"/>" name="tkKpiDetailKpiIndex" class="form-control" />
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="col-md-2">
                                                                                            <div class="form-group">
                                                                                                <h5>Đơn vị
                                                                                                    <span class="required">*</span>
                                                                                                </h5>
                                                                                                <div class="controls">
                                                                                                    <select id="projectinput5" required="true" value="" name="tkKpiDetailKpiUnit" class="form-control">
                                                                                                        <option value="<s:property value="donViTinh"/>" selected="" ><s:property value="donViTinh"/></option>
                                                                                                        <option disabled="true" style="background-color: #d5d5d5" value="">Ngày tháng</option>
                                                                                                        <option value="YEAR">Năm</option>
                                                                                                        <option value="QUATER">Quý</option>
                                                                                                        <option value="MONTH">Tháng</option>
                                                                                                        <option disabled="true" style="background-color: #d5d5d5" value="">Tiền tệ</option>
                                                                                                        <option value="VND">VND</option>
                                                                                                        <option value="USD">USD</option>
                                                                                                        <option disabled="true" style="background-color: #d5d5d5" value="">Khác</option>  
                                                                                                        <option value="PEOPLE">PEOPLE</option>
                                                                                                        <option value="%">%</option>
                                                                                                        <option value="NUMBER">NUMBER</option>

                                                                                                    </select>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="col-md-2">
                                                                                            <div class="form-group">
                                                                                                <h5>Trọng số
                                                                                                    <span class="required">*</span>
                                                                                                </h5>
                                                                                                <div class="controls">
                                                                                                    <input required="true" type="number" id="tkKpiDetailKpiWeight" value="<s:property value="trongSo"/>" name="tkKpiDetailKpiWeight" class="form-control" />
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="col-md-2">
                                                                                            <div class="form-group">
                                                                                                <h5>Tần suất
                                                                                                    <span class="required">*</span>
                                                                                                </h5>
                                                                                                <div class="controls">
                                                                                                    <select required="true" id="projectinput5"  name="tkKpiDetailKpiFrequene" class="form-control">
                                                                                                        <option value="<s:property value="tanSuatDanhGia"/>" selected="" ><s:property value="tanSuatDanhGia"/></option>
                                                                                                        <option value="YEAR">Năm</option>
                                                                                                        <option value="MONTH">Tháng</option>
                                                                                                        <option value="QUATER">Quý</option>
                                                                                                    </select>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-1">
                                                                            <button type="button" class="btn btn-danger" data-repeater-delete> <i class="ft-x"></i> Delete</button>
                                                                        </div>
                                                                    </div>
                                                                    <hr>
                                                                </div>
                                                            </s:iterator>
                                                        </div>
                                                        <div class="text-right">
                                                            <button onclick="return checkSum()" type="submit" class="btn btn-success"><%=properties.getProperty("tk.tko.label.button.save")%> <i class="la la-thumbs-o-up position-right"></i></button>
                                                       </div>
                                                    </form>
                                                </div>
                                            </div>

                                            <script>
                                                function checkSum() {
                                                    var trongSo1 = Number(10);
                                                    ;
                                                    var trongSo2 = Number(10);
                                                    ;
                                                    var trongSo3 = Number(10);
                                                    ;
                                                    var sum = 100;
                                                    if (sum === 100) {

                                                        var s = document.querySelectorAll('[id^=countItemRepeat]').length;
                                                        document.getElementById('countItemInput').value = s;
                                                        var i;

                                                        var atrongSo1 = Number(0);
                                                        var atrongSo2 = Number(0);
                                                        var atrongSo3 = Number(0);

                                                        var typeName = 'lstKpiDetail[0][tkKpiDetailKpiType]';
                                                        var type = $('input[name="' + typeName + '"]').val();
                                                        
                                                        

                                                        for (i = 0; i < s; i++) {
                                                            var Weight = 'lstKpiDetail[' + i + '][tkKpiDetailKpiWeight]';
                                                            var giaTri = Number($('input[name="' + Weight + '"]').val());
                                                            if ('BO_PHAN' == type) {
                                                                atrongSo1 = atrongSo1 + giaTri;
                                                            }
                                                            if ('THUONG_XUYEN' == type) {
                                                                atrongSo2 = atrongSo2 + giaTri;
                                                            }
                                                            if ('DOT_XUAT' == type) {
                                                                atrongSo3 = atrongSo3 + giaTri;
                                                            }
                                                        }
                                                        if ('BO_PHAN' == type) {
                                                            if (trongSo1 > 0 && atrongSo1 < 1) {
                                                                swal("<%=properties.getProperty("tk.tko.label.admin.kpi.mess0")%>", "<%=properties.getProperty("tk.tko.label.admin.kpi.mess12")%>", "error");
                                                                return false;
                                                            } else {
                                                                if (atrongSo1 === 100) {
                                                                } else {
                                                                    swal("<%=properties.getProperty("tk.tko.label.admin.kpi.mess0")%>", "<%=properties.getProperty("tk.tko.label.admin.kpi.mess13")%>", "error");
                                                                    return false;
                                                                }
                                                            }
                                                        }
                                                        if ('THUONG_XUYEN' == type) {
                                                            if (trongSo2 > 0 && atrongSo2 <= 0) {
                                                                swal("<%=properties.getProperty("tk.tko.label.admin.kpi.mess0")%>", "<%=properties.getProperty("tk.tko.label.admin.kpi.mess14")%>", "error");
                                                                return false;
                                                            } else {
                                                                if (atrongSo2 === 100) {
                                                                } else {
                                                                    swal("<%=properties.getProperty("tk.tko.label.admin.kpi.mess0")%>", "<%=properties.getProperty("tk.tko.label.admin.kpi.mess15")%>", "error");
                                                                    return false;
                                                                }
                                                            }
                                                        }
                                                        if ('DOT_XUAT' == type) {
                                                            if (trongSo3 > 0 && atrongSo3 <= 0) {
                                                                swal("<%=properties.getProperty("tk.tko.label.admin.kpi.mess0")%>", "<%=properties.getProperty("tk.tko.label.admin.kpi.mess16")%>", "error");
                                                                return false;
                                                            } else {
                                                                if (atrongSo3 === 100) {
                                                                } else {
                                                                    swal("<%=properties.getProperty("tk.tko.label.admin.kpi.mess0")%>", "<%=properties.getProperty("tk.tko.label.admin.kpi.mess17")%>", "error");
                                                                    return false;
                                                                }
                                                            }
                                                        }
                                                        return true;
                                                    } else {
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
