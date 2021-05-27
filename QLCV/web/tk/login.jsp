<%-- 
    Document   : login
    Created on : Feb 25, 2020, 11:32:31 PM
    Author     : sonng
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html>
<html>
    <%@include file="/tk/head.jsp" %>
    <body>
        <div class="app-content content">
            <div class="content-wrapper">
                <div class="content-header row">
                </div>
                <div class="content-body">
                    <section class="flexbox-container">
                        <div class="col-12 d-flex align-items-center justify-content-center">
                            <div class="col-md-4 col-10 box-shadow-2 p-0">
                                <div class="card border-grey border-lighten-3 m-0">
                                    <div class="card-header border-0">
                                        <div class="card-title text-center">
                                            <div class="p-1">
                                                <img src="<%=session.getAttribute("httpURL")%>assets/images/logo/logo-dark.png" alt="branding logo">
                                            </div>
                                        </div>
                                        <h6 class="card-subtitle line-on-side text-muted text-center font-small-3 pt-2">
                                            <span>Đăng nhập vào hệ thống</span>
                                        </h6>
                                    </div>
                                    <div class="card-content">
                                        <div class="card-body">
                                            <form name="FormLogin" class="form-horizontal form-simple" validate action="loginAction" method="post" >
                                                <s:if test="actionMessages!=null && actionMessages.size > 0">
                                                    <script type="text/javascript" charset="UTF-8">
                                                        var actionMessages;
                                                        <s:iterator value="actionMessages" >
                                                        actionMessages = '<s:property escape="UTF-8"/>';
                                                        </s:iterator>
                                                        swal('Oops...', actionMessages, 'error')
                                                    </script>
                                                </s:if>
                                                <fieldset style="margin: 10px" class="form-group position-relative has-icon-left mb-0">
                                                    <s:textfield name="userName" type="text" cssClass="form-control form-control-lg input-lg" id="user-name" placeholder="Tên đăng nhập" requiredLabel="true" ></s:textfield>
                                                        <div class="form-control-position">
                                                            <i class="ft-user"></i>
                                                        </div>
                                                    </fieldset>
                                                    <fieldset style="margin: 10px" class="form-group position-relative has-icon-left">
                                                    <s:textfield name="userPassword" type="password" cssClass="form-control form-control-lg input-lg" id="user-password" placeholder="Mật khẩu" requiredLabel="true"></s:textfield>
                                                        <div class="form-control-position">
                                                            <i class="la la-key"></i>
                                                        </div>
                                                    </fieldset>
                                                    <div class="form-group row">
                                                        <div class="col-md-6 col-12 text-center text-md-left">
                                                            <fieldset>
                                                                <input type="checkbox" id="remember-me" class="chk-remember">
                                                                <label for="remember-me"> Nhớ đăng nhập</label>
                                                            </fieldset>
                                                        </div>
                                                        <div class="col-md-6 col-12 text-center text-md-right"><a href="recover-password.html" class="card-link">Quên mật khẩu?</a></div>
                                                    </div>
                                                    <button type="submit" class="btn btn-info btn-lg btn-block"><i class="ft-unlock"></i> Đăng nhập</button>
                                                </form>
                                            </div>
                                        </div>
                                        <div class="card-footer">

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </div>
                </div>
            </div>
        <%@include file="/tk/footer.jsp" %>
    </body>
</html>
