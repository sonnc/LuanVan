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
<%@page import="hust.soict.ca190141.sonnc.entities.base.TkCodeValue"%>
<%@page import="hust.soict.ca190141.sonnc.entities.base.TkUser"%>
<%@page import="hust.soict.ca190141.sonnc.entities.base.TkRole"%>
<%@page import="hust.soict.ca190141.sonnc.entities.base.TkKpi"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="loading" lang="en" data-textdirection="ltr">
    <%
        Properties prop = (Properties) session.getAttribute("properties");
    %>
    <%@include file="/tk/head.jsp" %>

    <body class="vertical-layout vertical-overlay-menu 2-columns   menu-expanded fixed-navbar"
          data-open="click" data-menu="vertical-overlay-menu" data-col="2-columns">
        <%@include file="/tk/topheader.jsp" %>
        <%@include file="/tk/leftmenu.jsp" %>
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
                        <h3 class="content-header-title mb-0">Khởi tạo TICKET</h3>
                        <div class="row breadcrumbs-top">
                            <div class="breadcrumb-wrapper col-12">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="<%=session.getAttribute("httpURL")%>tk_admin/home.jsp"><%=prop.getProperty("tk.tko.label.home")%></a>
                                    </li>
                                    <li class="breadcrumb-item active">TICKET
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
                                                            <i class="ft-plus"></i> Thêm luồng phê duyệt
                                                        </button>
                                                    </div>
                                                </div>
                                                <div>
                                                    <form id="formUoCUserDetail" action="adminBaOnlineAction" method="post" >
                                                        <input hidden="true" name="method" value="createBaOnline"/>
                                                        <input hidden="true" id="countItemInput" name="countItemInput" value="" />
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <div class="row">
                                                                    <div class="col-md-2">
                                                                        <div class="form-group">
                                                                            <h5>Mã TIKET
                                                                                <span class="required">*</span>
                                                                            </h5>
                                                                            <div class="controls">
                                                                                <input disabled="true" type="text" name="" value="" class="form-control" />
                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                    <div class="col-md-2">
                                                                        <div class="form-group">
                                                                            <h5>Loại dịch vụ
                                                                                <span class="required">*</span>
                                                                            </h5>
                                                                            <div class="controls">
                                                                                <select required="true" id="projectinput5" value="" name="baService" class="form-control">
                                                                                    <option value="" selected="" ><%=prop.getProperty("tk.tko.label.select.option.default")%></option>
                                                                                    <option value="ADMIN-SERVICE">ADMIN-SERVICE</option>
                                                                                    <option value="IT-SERVICE">IT-SERVICE</option>
                                                                                    <option value="HR-SERVICE">HR-SERVICE</option>
                                                                                    <option value="OTHER-SERVICE">OTHER-SERVICE</option>
                                                                                </select>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-3">
                                                                        <div class="form-group">
                                                                            <h5>Tên dịch vụ
                                                                                <span class="required">*</span>
                                                                            </h5>
                                                                            <div class="controls">
                                                                                <input required="true" type="text" name="baTypeName" value="" class="form-control" />
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-5">
                                                                        <div class="form-group">
                                                                            <h5>Mô tả
                                                                                <span class="required">*</span>
                                                                            </h5>
                                                                            <div class="controls">
                                                                                <input required="true" type="text" name="baTypeDesc" value="" class="form-control" />
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <hr/>
                                                        <div data-repeater-list="lstFlowProcess">
                                                            <div data-repeater-item id="countItemRepeat">
                                                                <div class="form row">
                                                                    <div class="col-11">
                                                                        <div class="row">
                                                                            <div class="col-12">
                                                                                <div class="row">
                                                                                    <div class="col-md-3">
                                                                                        <div class="form-group">
                                                                                            <h5>Người xử lý
                                                                                                <span class="required">*</span>
                                                                                            </h5>
                                                                                            <div class="controls">
                                                                                                <select required="true" id="projectinput5" value="" name="baUserProcess" class="form-control">
                                                                                                    <option value="" selected="" ><%=prop.getProperty("tk.tko.label.select.option.default")%></option>
                                                                                                    <s:iterator value="lstUsers" >
                                                                                                        <option value="<s:property value="id" />">
                                                                                                            <s:property value="userName"/> - 
                                                                                                            <s:iterator value="tkUserDetails">
                                                                                                                <s:property value="userName"/>
                                                                                                            </s:iterator> - 
                                                                                                            <s:iterator value="tkRole">
                                                                                                                <s:property value="roleValue"/>
                                                                                                            </s:iterator>
                                                                                                        </option>
                                                                                                    </s:iterator>
                                                                                                </select>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-md-3">
                                                                                        <div class="form-group">
                                                                                            <h5>Thời gian xử lý
                                                                                                <span class="required">*</span>
                                                                                            </h5>
                                                                                            <div class="controls">
                                                                                                <div class="row">
                                                                                                    <div class="col-4">
                                                                                                        <input required="true" type="number" value="" name="baTimeProcess"class="form-control" />
                                                                                                    </div>
                                                                                                    <div class="col-8">
                                                                                                        <select required="true" id="projectinput5" value="" name="baTimeProcessCommon" class="form-control">
                                                                                                            <option value="" selected="" ><%=prop.getProperty("tk.tko.label.select.option.default")%></option>
                                                                                                            
                                                                                                            <option value="HOUR">Giờ</option>
                                                                                                            <option value="DAY">Ngày</option>
                                                                                                            <option value="WEEK">Tuần</option>
                                                                                                        </select>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-md-6">
                                                                                        <div class="form-group">
                                                                                            <h5>Mô tả/ bình luận
                                                                                                <span class="required">*</span>
                                                                                            </h5>
                                                                                            <div class="controls">
                                                                                                <input required="true" type="text" value="" name="baFlowCommon" class="form-control" />
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
                                                            <button onclick="return checkSum()" type="submit" class="btn btn-success"><%=prop.getProperty("tk.tko.label.button.save")%> <i class="la la-thumbs-o-up position-right"></i></button>
                                                            <button type="reset" class="btn btn-danger"><%=prop.getProperty("tk.tko.label.button.reset")%> <i class="la la-refresh position-right"></i></button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>

                                            <script>
                                                function checkSum() {
                                                    var s = document.querySelectorAll('[id^=countItemRepeat]').length;
                                                    document.getElementById('countItemInput').value = s;
                                                }
                                            </script>
                                            <script>
                                                document.querySelector('#formUoCUserDetail').addEventListener('submit', function (e) {

                                                    var form = this;
                                                    e.preventDefault();
                                                    swal({
                                                        title: "<%=prop.getProperty("tk.tko.label.admin.ba.mess1")%>",
                                                        text: "<%=prop.getProperty("tk.tko.label.admin.ba.mess2")%>",
                                                        icon: "warning",
                                                        buttons: [
                                                            '<%=prop.getProperty("tk.tko.label.admin.ba.mess3")%>',
                                                            '<%=prop.getProperty("tk.tko.label.admin.ba.mess4")%>'
                                                        ],
                                                        dangerMode: true,
                                                    }).then(function (isConfirm) {
                                                        if (isConfirm) {
                                                            swal({
                                                                title: '<%=prop.getProperty("tk.tko.label.admin.ba.mess5")%>',
                                                                text: '<%=prop.getProperty("tk.tko.label.admin.ba.mess6")%>',
                                                                icon: 'success'
                                                            }).then(function () {
                                                                form.submit();
                                                            });
                                                        } else {
                                                            swal("<%=prop.getProperty("tk.tko.label.admin.ba.mess7")%>", "<%=prop.getProperty("tk.tko.label.admin.ba.mess8")%>", "error");
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
        <%@include file="/tk/footer.jsp" %>
    </body>
</html>