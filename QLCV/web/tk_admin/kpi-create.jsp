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
                        <h3 class="content-header-title mb-0">Khởi tạo KPI</h3>
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
                                                    <form id="formUoCUserDetail" action="adminKpiAction" method="post" >
                                                        <input hidden="true" name="method" value="createKpi"/>
                                                        <input hidden="true" id="countItemInput" name="countItemInput" value="" />
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <div class="row">
                                                                    <div class="col-md-2">
                                                                        <div class="form-group">
                                                                            <h5>Mã KPI
                                                                                <span class="required">*</span>
                                                                            </h5>
                                                                            <div class="controls">
                                                                                <input disabled="true" type="text" name="kpiTypeName" value="" class="form-control" />
                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                    <div class="col-md-2">
                                                                        <div class="form-group">
                                                                            <h5>Áp dụng cho Phòng ban
                                                                                <span class="required">*</span>
                                                                            </h5>
                                                                            <div class="controls">
                                                                                <select required="true" id="projectinput5" value="" name="kpiTypeDepartement" class="form-control">
                                                                                    <option value="" selected="" ><%=properties.getProperty("tk.tko.label.select.option.default")%></option>
                                                                                    <s:iterator value="lstTkDepartment" >
                                                                                        <option value="<s:property value="id" />"><s:property value="departmentName" /></option>
                                                                                    </s:iterator>
                                                                                </select>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-2">
                                                                        <div class="form-group">
                                                                            <h5>Áp dụng cho Đối tượng
                                                                                <span class="required">*</span>
                                                                            </h5>
                                                                            <div class="controls">
                                                                                <select required="true" id="projectinput5" value="" name="kpiTypeApDung" class="form-control">
                                                                                    <option value="" selected="" ><%=properties.getProperty("tk.tko.label.select.option.default")%></option>
                                                                                    <option value="NV">Nhân viên</option>
                                                                                    <option value="QL">Quản lý</option>
                                                                                </select>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-6">
                                                                        <div class="form-group">
                                                                            <h5>Tên KPI
                                                                                <span class="required">*</span>
                                                                            </h5>
                                                                            <div class="controls">
                                                                                <input required="true" type="text" name="kpiTypekpiDesc" value="" class="form-control" />
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                            </div>
                                                            <hr/>
                                                            <div class="col-md-12">
                                                                <div class="row">
                                                                    <div class="col-md-4">
                                                                        <div class="form-group">
                                                                            <h5>Trọng số gắn phòng ban
                                                                                <span class="required">*</span>
                                                                            </h5>
                                                                            <div class="controls">
                                                                                <input required="true" id="trongSo1" min="0" max="100" type="number" name="kpiTypeTrongSoKpiPhongban" value="" class="form-control" />
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-4">
                                                                        <div class="form-group">
                                                                            <h5>Trọng số thường xuyên
                                                                                <span class="required">*</span>
                                                                            </h5>
                                                                            <div class="controls">
                                                                                <input required="true" id="trongSo2" min="0" max="100" type="number" name="kpiTypeTrongSoKpiThuongxuyen" value="" class="form-control" />
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-4">
                                                                        <div class="form-group">
                                                                            <h5>Trọng số đột xuất
                                                                                <span class="required">*</span>
                                                                            </h5>
                                                                            <div class="controls">
                                                                                <input required="true" id="trongSo3" min="0" max="100" type="number" name="kpiTypeTrongSoKpiDotxuat" value="" class="form-control" />
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                            </div>
                                                        </div>
                                                        <hr/>
                                                        <hr/>
                                                        <div data-repeater-list="lstKpiDetail">
                                                            <div data-repeater-item id="countItemRepeat">
                                                                <div class="form row">
                                                                    <div class="col-11">
                                                                        <div class="row">
                                                                            <div class="col-12">
                                                                                <div class="row">
                                                                                    <div class="col-md-4">
                                                                                        <div class="form-group">
                                                                                            <h5>Tên KPI
                                                                                                <span class="required">*</span>
                                                                                            </h5>
                                                                                            <div class="controls">
                                                                                                <input required="true" type="text" value="" name="tkKpiDetailKpiName" class="form-control" />
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-md-8">
                                                                                        <div class="form-group">
                                                                                            <h5>Mô tả
                                                                                                <span class="required">*</span>
                                                                                            </h5>
                                                                                            <div class="controls">
                                                                                                <input required="true" type="text" value="" name="tkKpiDetailKpiDesc"class="form-control" />
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-12">
                                                                                <div class="row">
                                                                                    <div class="col-md-3">
                                                                                        <div class="form-group">
                                                                                            <h5>Loại KPI
                                                                                                <span class="required">*</span>
                                                                                            </h5>
                                                                                            <div class="controls">
                                                                                                <select required="true" id="tkKpiDetailKpiType" name="tkKpiDetailKpiType" class="form-control">
                                                                                                    <option value="" selected="" ><%=properties.getProperty("tk.tko.label.select.option.default")%></option>
                                                                                                    <option value="BO_PHAN">KPI gắn với phòng ban</option>
                                                                                                    <option value="THUONG_XUYEN">KPI thường xuyên</option>
                                                                                                    <option value="DOT_XUAT">KPI đột xuất</option>
                                                                                                </select>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-md-3">
                                                                                        <div class="form-group">
                                                                                            <h5>Chỉ tiêu
                                                                                                <span class="required">*</span>
                                                                                            </h5>
                                                                                            <div class="controls">
                                                                                                <input required="true" type="text" name="tkKpiDetailKpiIndex" class="form-control" />
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-md-2">
                                                                                        <div class="form-group">
                                                                                            <h5>Đơn vị tính
                                                                                                <span class="required">*</span>
                                                                                            </h5>
                                                                                            <div class="controls">
                                                                                                <select id="projectinput5" required="true" value="" name="tkKpiDetailKpiUnit" class="form-control">
                                                                                                    <option value="" selected="" ><%=properties.getProperty("tk.tko.label.select.option.default")%></option>
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
                                                                                                <input required="true" type="text" id="tkKpiDetailKpiWeight" name="tkKpiDetailKpiWeight" class="form-control" />
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-md-2">
                                                                                        <div class="form-group">
                                                                                            <h5>Tần suất đánh giá
                                                                                                <span class="required">*</span>
                                                                                            </h5>
                                                                                            <div class="controls">
                                                                                                <select required="true" id="projectinput5" value="" name="tkKpiDetailKpiFrequene" class="form-control">
                                                                                                    <option value="" selected="" ><%=properties.getProperty("tk.tko.label.select.option.default")%></option>
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
                                                        </div>
                                                        <div class="text-right">
                                                            <button onclick="return checkSum()" type="submit" class="btn btn-success"><%=properties.getProperty("tk.tko.label.button.save")%> <i class="la la-thumbs-o-up position-right"></i></button>
                                                            <button type="reset" class="btn btn-danger"><%=properties.getProperty("tk.tko.label.button.reset")%> <i class="la la-refresh position-right"></i></button>
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
                                                    if (sum === 100) {

                                                        var s = document.querySelectorAll('[id^=countItemRepeat]').length;
                                                        document.getElementById('countItemInput').value = s;
                                                        var i;

                                                        var atrongSo1 = Number(0);
                                                        var atrongSo2 = Number(0);
                                                        var atrongSo3 = Number(0);

                                                        for (i = 0; i < s; i++) {
                                                            var Weight = 'lstKpiDetail[' + i + '][tkKpiDetailKpiWeight]';
                                                            var typeName = 'lstKpiDetail[' + i + '][tkKpiDetailKpiType]';
                                                            var giaTri = Number($('input[name="' + Weight + '"]').val());
                                                            var type = $('select[name="' + typeName + '"]').val();
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
