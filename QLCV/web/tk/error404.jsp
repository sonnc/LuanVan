<%-- 
    Document   : coming-soon
    Created on : Jul 11, 2020, 3:53:20 PM
    Author     : sonng
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html class="loading" lang="en" data-textdirection="ltr">
    <%@include file="/tk/head.jsp" %>
    <body class="vertical-layout vertical-overlay-menu 2-columns   menu-expanded fixed-navbar"
          data-open="click" data-menu="vertical-overlay-menu" data-col="2-columns">
        <%@include file="/tk/topheader.jsp" %>
        <div class="app-content content">
            <div class="content-wrapper">
                <div class="content-header row">
                </div>
                <div class="content-body">
                    <section class="flexbox-container">
                        <div class="col-12 d-flex align-items-center justify-content-center">
                            <div class="col-md-12 col-12 p-0">
                                <div class="card-header bg-transparent border-0">
                                    <p class="error-code text-center "style="font-size: 100px">LỖI 500</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 d-flex align-items-center justify-content-center">
                            <div class="col-md-4 col-10 p-0">
                                <div class="card-content">
                                    <fieldset class="row py-2">
                                        <div class="input-group col-12">
                                            <input type="text" class="form-control form-control-xl input-xl border-grey border-lighten-1 "
                                                   placeholder="Search..." aria-describedby="button-addon2">
                                            <span class="input-group-append" id="button-addon2">
                                                <button class="btn btn-lg btn-secondary border-grey border-lighten-1" type="button"><i class="ft-search"></i></button>
                                            </span>
                                        </div>
                                    </fieldset>
                                    <div class="row py-2">
                                        <div class="col-12 col-sm-6 col-md-6">
                                            <%                                                String role = (String) session.getAttribute("role");
                                                if ("AD".equals(role)) {
                                            %>
                                            <a href="tk_admin/home.jsp" class="btn btn-primary btn-block"><i class="ft-home"></i> Back to Home</a>
                                            <%
                                            } else {%>
                                            <a href="tk/home.jsp" class="btn btn-primary btn-block"><i class="ft-home"></i> Back to Home</a>
                                            <%
                                                    }%>


                                        </div>
                                        <div class="col-12 col-sm-6 col-md-6">
                                            <a href="search-website.html" class="btn btn-danger btn-block"><i class="ft-search"></i>  Advanced search</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-footer bg-transparent">
                                    <div class="row">                 
                                        <div class="col-12 text-center">
                                            <a href="#" class="btn btn-social-icon mr-1 mb-1 btn-outline-facebook">
                                                <span class="la la-facebook"></span>
                                            </a>
                                            <a href="#" class="btn btn-social-icon mr-1 mb-1 btn-outline-twitter">
                                                <span class="la la-twitter"></span>
                                            </a>
                                            <a href="#" class="btn btn-social-icon mr-1 mb-1 btn-outline-linkedin">
                                                <span class="la la-linkedin font-medium-4"></span>
                                            </a>
                                            <a href="#" class="btn btn-social-icon mr-1 mb-1 btn-outline-github">
                                                <span class="la la-github font-medium-4"></span>
                                            </a>
                                        </div>
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
