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
<%@page import="hust.soict.ca190141.sonnc.entities.base.TkDepartment"%>
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
                        <h3 class="content-header-title mb-0"><%=prop.getProperty("tk.tko.label.home.user-profiles.title")%></h3>
                        <div class="row breadcrumbs-top">
                            <div class="breadcrumb-wrapper col-12">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="<%=session.getAttribute("httpURL")%>tk_admin/home.jsp"><%=prop.getProperty("tk.tko.label.home")%></a>
                                    </li>
                                    <li class="breadcrumb-item active"><%=prop.getProperty("tk.tko.label.home.user-profiles.title")%>
                                    </li>
                                </ol>
                            </div>
                        </div>
                    </div>
                    <div class="content-header-right text-md-right col-md-6 col-12">
                        <div class="btn-group">
                            <a class="btn btn-round btn-info" type="button" href="adminUserCRUDAction?method=prepareEdit&&userId=<s:property value="tkUser.id" />" <i class="ft-edit-2"></i> <%=prop.getProperty("tk.tko.label.home.user-profiles.editinfo")%></a>
                        </div>
                    </div>
                </div>
                <div class="content-body">
                    <form id="formUoCUserDetail" action="adminUserCRUDAction" method="post" enctype = "multipart/form-data" accept-charset="UTF-8">
                        <section id="drag-area">
                            <div class="row">

                                <div class="col-md-12">
                                    <div class="card">
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="card-header">
                                                    <div class="form-group">
                                                        <img id="output" class="card-img img-fluid mb-1" src="<s:url value="%{tkUserDetail.userAvarta}"/>" alt="">
                                                        <div class="controls" id="user-profile-edit">
<!--                                                            <h5><%=prop.getProperty("tk.tko.label.home.user-profiles.avarta")%>
                                                            </h5>-->
                                                            <input name="myFile" type="file" accept="image/*" onchange="loadFile(event)"/>
                                                            <script>
                                                                var loadFile = function (event) {
                                                                    var reader = new FileReader();
                                                                    reader.onload = function () {
                                                                        var output = document.getElementById('output');
                                                                        output.src = reader.result;
                                                                    };
                                                                    reader.readAsDataURL(event.target.files[0]);
                                                                };
                                                            </script>
                                                            <div class="help-block">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <h5><%=prop.getProperty("tk.tko.label.home.user-profiles.account")%>
                                                            <span class="required">*</span>
                                                        </h5>
                                                        <div class="controls">
                                                            <input disabled="true" type="text" name="userName" value="<s:property value="tkUser.userName"/>" class="form-control" required ="Trường này là bắt buộc"/>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <h5><%=prop.getProperty("tk.tko.label.home.user-profiles.email")%>
                                                            <span class="required">*</span>
                                                        </h5>
                                                        <div class="controls">
                                                            <input disabled="true" value="<s:property value="tkUser.userEmail"/>" type="email" name="userEmail" class="form-control" required="This field is required"/>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <h5><%=prop.getProperty("tk.tko.label.home.user-profiles.role")%>
                                                            <span class="required">*</span>
                                                        </h5>
                                                        <div class="controls">
                                                            <input disabled="true" value="<s:iterator value="tkUser"><s:iterator value="tkRole"><s:property value="roleValue"/></s:iterator> </s:iterator> " type="text" name="userRole" class="form-control" required="This field is required"/>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <h5><%=prop.getProperty("tk.tko.label.home.user-profiles.department")%>
                                                            <span class="required">*</span>
                                                        </h5>
                                                        <div class="controls">
                                                            <input disabled="true" value="<s:iterator value="tkUser"><s:iterator value="tkDepartment"><s:property value="departmentName"/></s:iterator></s:iterator> " type="text" name="userDepartment" class="form-control" required="This field is required"/>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-8">
                                                <div class="card-header">
                                                    <div class="card-content collapse show">
                                                        <div class="card-body">
                                                            <div class="row">
                                                                <div class="col-md-12">
                                                                    <div class="form-group">
                                                                        <h5><%=prop.getProperty("tk.tko.label.home.user-profiles.username")%>
                                                                            <span class="required">*</span>
                                                                        </h5>
                                                                        <div class="controls">
                                                                            <s:textfield type="text" name="tkUserDetail.userName" value="%{tkUserDetail.userName}" cssClass="form-control" />
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <div class="row">
                                                                            <div class="col-md-6">
                                                                                <h5><%=prop.getProperty("tk.tko.label.home.user-profiles.dateofbirth")%>
                                                                                    <span class="required">*</span>
                                                                                </h5>
                                                                                <div class="controls">
                                                                                    <s:textfield type="date" name="userDateOfBirth" value="%{tkUserDetail.userDateOfBirth}"  cssClass="form-control" />
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-md-6">
                                                                                <h5><%=prop.getProperty("tk.tko.label.home.user-profiles.sex")%>
                                                                                    <span class="required">*</span>
                                                                                </h5>
                                                                                <div class="controls">
                                                                                    <select id="projectinput5" value="" name="tkUserDetail.userGender" class="form-control">
                                                                                        <option value="" selected="" ><%=prop.getProperty("tk.tko.label.select.option.default")%></option>
                                                                                        <option value="true">Nam</option>
                                                                                        <option value="false">Nữ</option>
                                                                                    </select>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <h5><%=prop.getProperty("tk.tko.label.home.user-profiles.phone")%>
                                                                            <span class="required">*</span>
                                                                        </h5>
                                                                        <div class="controls">
                                                                            <s:textfield type="text" name="tkUserDetail.userPhone" value="%{tkUserDetail.userPhone}" cssClass="form-control" />
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <h5><%=prop.getProperty("tk.tko.label.home.user-profiles.address")%>
                                                                            <span class="required">*</span>
                                                                        </h5>
                                                                        <div class="controls">
                                                                            <s:textfield type="text" name="tkUserDetail.userAddress" value="%{tkUserDetail.userAddress}" cssClass="form-control" />
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <h5><%=prop.getProperty("tk.tko.label.home.user-profiles.degree")%>
                                                                            <span class="required">*</span>
                                                                        </h5>
                                                                        <div class="controls">
                                                                            <s:textfield type="text" name="tkUserDetail.userDegree" value="%{tkUserDetail.userDegree}" cssClass="form-control" />
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <h5><%=prop.getProperty("tk.tko.label.home.user-profiles.job")%>
                                                                            <span class="required">*</span>
                                                                        </h5>
                                                                        <div class="controls">
                                                                            <s:textfield type="text" name="tkUserDetail.userJob" value="%{tkUserDetail.userJob}" cssClass="form-control" />
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <h5><%=prop.getProperty("tk.tko.label.home.user-profiles.others")%>
                                                                            <span class="required">*</span>
                                                                        </h5>
                                                                        <div class="controls">
                                                                            <s:textarea rows="10" cssClass="form-control" name="tkUserDetail.userOthers" value="%{tkUserDetail.userOthers}" placeholder="Thông tin khác"></s:textarea>    
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="text-right">
                                                            <button type="submit" class="btn btn-success"><%=prop.getProperty("tk.tko.label.button.save")%> <i class="la la-thumbs-o-up position-right"></i></button>
                                                            <button type="reset" class="btn btn-danger"><%=prop.getProperty("tk.tko.label.button.reset")%> <i class="la la-refresh position-right"></i></button>
                                                        </div>
                                                        <script>
                                                            document.querySelector('#formUoCUserDetail').addEventListener('submit', function (e) {
                                                                var form = this;
                                                                e.preventDefault();
                                                                swal({
                                                                    title: "<%=prop.getProperty("tk.tko.label.home.user-profiles.mess1")%>",
                                                                    text: "<%=prop.getProperty("tk.tko.label.home.user-profiles.mess2")%>",
                                                                    icon: "warning",
                                                                    buttons: [
                                                                        '<%=prop.getProperty("tk.tko.label.home.user-profiles.mess3")%>',
                                                                        '<%=prop.getProperty("tk.tko.label.home.user-profiles.mess4")%>'
                                                                    ],
                                                                    dangerMode: true,
                                                                }).then(function (isConfirm) {
                                                                    if (isConfirm) {
                                                                        swal({
                                                                            title: '<%=prop.getProperty("tk.tko.label.home.user-profiles.mess5")%>',
                                                                            text: '<%=prop.getProperty("tk.tko.label.home.user-profiles.mess6")%>',
                                                                            icon: 'success'
                                                                        }).then(function () {
                                                                            form.submit();
                                                                        });
                                                                    } else {
                                                                        swal("<%=prop.getProperty("tk.tko.label.home.user-profiles.mess7")%>", "<%=prop.getProperty("tk.tko.label.home.user-profiles.mess8")%>", "error");
                                                                    }
                                                                });
                                                            });
                                                        </script> 
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                        </section>
                    </form>
                </div>
            </div>
        </div>
        <!-- ////////////////////////////////////////////////////////////////////////////-->
        <%@include file="/tk/footer.jsp" %>
    </body>
</html>