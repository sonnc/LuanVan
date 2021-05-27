<%-- 
    Document   : js
    Created on : Feb 14, 2021, 5:38:13 PM
    Author     : sonng
--%>

<%
    if ("login".equals((String) session.getAttribute("CssAndJs"))) {
%>
<!-- BEGIN VENDOR JS-->
<script src="<%=session.getAttribute("httpURL")%>app-assets/vendors/js/vendors.min.js" type="text/javascript"></script>
<!-- BEGIN VENDOR JS-->
<!-- BEGIN PAGE VENDOR JS-->
<script src="<%=session.getAttribute("httpURL")%>app-assets/vendors/js/forms/icheck/icheck.min.js" type="text/javascript"></script>
<script src="<%=session.getAttribute("httpURL")%>app-assets/vendors/js/forms/validation/jqBootstrapValidation.js"
type="text/javascript"></script>
<!-- END PAGE VENDOR JS-->
<!-- BEGIN MODERN JS-->
<script src="<%=session.getAttribute("httpURL")%>app-assets/js/core/app-menu.js" type="text/javascript"></script>
<script src="<%=session.getAttribute("httpURL")%>app-assets/js/core/app.js" type="text/javascript"></script>
<!-- END MODERN JS-->
<!-- BEGIN PAGE LEVEL JS-->
<script src="<%=session.getAttribute("httpURL")%>app-assets/js/scripts/forms/form-login-register.js" type="text/javascript"></script>
<!-- END PAGE LEVEL JS-->
<%}%>


<%
    if ("home".equals((String) session.getAttribute("CssAndJs"))) {
%>
<!-- BEGIN VENDOR JS-->
<script src="<%=session.getAttribute("httpURL")%>app-assets/vendors/js/vendors.min.js" type="text/javascript"></script>
<!-- BEGIN VENDOR JS-->
<!-- BEGIN PAGE VENDOR JS-->
<script src="<%=session.getAttribute("httpURL")%>app-assets/vendors/js/charts/echarts/echarts.js" type="text/javascript"></script>
<!-- END PAGE VENDOR JS-->
<!-- BEGIN MODERN JS-->
<script src="<%=session.getAttribute("httpURL")%>app-assets/js/core/app-menu.js" type="text/javascript"></script>
<script src="<%=session.getAttribute("httpURL")%>app-assets/js/core/app.js" type="text/javascript"></script>
<script src="<%=session.getAttribute("httpURL")%>app-assets/js/scripts/customizer.js" type="text/javascript"></script>
<!-- END MODERN JS-->
<!-- BEGIN PAGE LEVEL JS-->
<script src="<%=session.getAttribute("httpURL")%>app-assets/js/scripts/pages/project-summary-task.js" type="text/javascript"></script>
<script src="<%=session.getAttribute("httpURL")%>app-assets/js/scripts/pages/project-summary-bug.js" type="text/javascript"></script>
<!-- END PAGE LEVEL JS-->

<%}%>

<%
    if ("codeset".equals((String) session.getAttribute("CssAndJs"))) {
%>
<!-- BEGIN VENDOR JS-->
<script src="<%=session.getAttribute("httpURL")%>app-assets/vendors/js/vendors.min.js" type="text/javascript"></script>
<!-- BEGIN VENDOR JS-->
<!-- BEGIN PAGE VENDOR JS-->
<script src="<%=session.getAttribute("httpURL")%>app-assets/vendors/js/tables/datatable/datatables.min.js" type="text/javascript"></script>
<!-- END PAGE VENDOR JS-->
<!-- BEGIN MODERN JS-->
<script src="<%=session.getAttribute("httpURL")%>app-assets/js/core/app-menu.js" type="text/javascript"></script>
<script src="<%=session.getAttribute("httpURL")%>app-assets/js/core/app.js" type="text/javascript"></script>
<script src="<%=session.getAttribute("httpURL")%>app-assets/js/scripts/customizer.js" type="text/javascript"></script>
<!-- END MODERN JS-->
<!-- BEGIN PAGE LEVEL JS-->
<script src="<%=session.getAttribute("httpURL")%>app-assets/js/scripts/tables/datatables/datatable-basic.js"
type="text/javascript"></script>
<!-- END PAGE LEVEL JS-->
<%}%>        

<%
    if ("codesetaddnew".equals((String) session.getAttribute("CssAndJs"))) {
%>
<!-- BEGIN VENDOR JS-->
<script src="<%=session.getAttribute("httpURL")%>app-assets/vendors/js/vendors.min.js" type="text/javascript"></script>
<!-- BEGIN VENDOR JS-->
<!-- BEGIN PAGE VENDOR JS-->
<script src="<%=session.getAttribute("httpURL")%>app-assets/vendors/js/forms/repeater/jquery.repeater.min.js"
type="text/javascript"></script>
<!-- END PAGE VENDOR JS-->
<!-- BEGIN MODERN JS-->
<script src="<%=session.getAttribute("httpURL")%>app-assets/js/core/app-menu.js" type="text/javascript"></script>
<script src="<%=session.getAttribute("httpURL")%>app-assets/js/core/app.js" type="text/javascript"></script>
<script src="<%=session.getAttribute("httpURL")%>app-assets/js/scripts/customizer.js" type="text/javascript"></script>
<!-- END MODERN JS-->
<!-- BEGIN PAGE LEVEL JS-->
<script src="<%=session.getAttribute("httpURL")%>app-assets/js/scripts/forms/form-repeater.js" type="text/javascript"></script>
<!-- END PAGE LEVEL JS-->
<%}%>  

<%
    if ("workspace-create".equals((String) session.getAttribute("CssAndJs"))) {
%>
<!-- BEGIN VENDOR JS-->
<script src="<%=session.getAttribute("httpURL")%>app-assets/vendors/js/vendors.min.js" type="text/javascript"></script>
<!-- BEGIN VENDOR JS-->
<!-- BEGIN PAGE VENDOR JS-->
<script src="<%=session.getAttribute("httpURL")%>app-assets/vendors/js/extensions/jquery.steps.min.js" type="text/javascript"></script>
<script src="<%=session.getAttribute("httpURL")%>app-assets/vendors/js/pickers/dateTime/moment-with-locales.min.js"
type="text/javascript"></script>
<script src="<%=session.getAttribute("httpURL")%>app-assets/vendors/js/pickers/daterange/daterangepicker.js"
type="text/javascript"></script>
<script src="<%=session.getAttribute("httpURL")%>app-assets/vendors/js/forms/validation/jquery.validate.min.js"
type="text/javascript"></script>
<!-- END PAGE VENDOR JS-->
<!-- BEGIN MODERN JS-->
<script src="<%=session.getAttribute("httpURL")%>app-assets/js/core/app-menu.js" type="text/javascript"></script>
<script src="<%=session.getAttribute("httpURL")%>app-assets/js/core/app.js" type="text/javascript"></script>
<script src="<%=session.getAttribute("httpURL")%>app-assets/js/scripts/customizer.js" type="text/javascript"></script>
<!-- END MODERN JS-->
<!-- BEGIN PAGE LEVEL JS-->
<script src="<%=session.getAttribute("httpURL")%>app-assets/js/scripts/forms/wizard-steps.js" type="text/javascript"></script>
<!-- END PAGE LEVEL JS-->
<%}%> 


<%
    if ("workspace-action-forward".equals((String) session.getAttribute("CssAndJs"))) {
%>
<!-- BEGIN VENDOR JS-->
<script src="<%=session.getAttribute("httpURL")%>app-assets/vendors/js/vendors.min.js" type="text/javascript"></script>
<!-- BEGIN VENDOR JS-->
<!-- BEGIN PAGE VENDOR JS-->
<script src="<%=session.getAttribute("httpURL")%>app-assets/vendors/js/animation/jquery.appear.js" type="text/javascript"></script>
<!-- END PAGE VENDOR JS-->
<!-- BEGIN MODERN JS-->
<script src="<%=session.getAttribute("httpURL")%>app-assets/js/core/app-menu.js" type="text/javascript"></script>
<script src="<%=session.getAttribute("httpURL")%>app-assets/js/core/app.js" type="text/javascript"></script>
<script src="<%=session.getAttribute("httpURL")%>app-assets/js/scripts/customizer.js" type="text/javascript"></script>
<!-- END MODERN JS-->
<!-- BEGIN PAGE LEVEL JS-->
<script src="<%=session.getAttribute("httpURL")%>app-assets/js/scripts/animation/animation.js" type="text/javascript"></script>
<!-- END PAGE LEVEL JS-->
<%}%> 

<%
    if ("workspace-summary".equals((String) session.getAttribute("CssAndJs"))) {
%>
<!-- BEGIN VENDOR JS-->
<script src="<%=session.getAttribute("httpURL")%>app-assets/vendors/js/vendors.min.js" type="text/javascript"></script>
<!-- BEGIN VENDOR JS-->
<!-- BEGIN PAGE VENDOR JS-->
<script src="<%=session.getAttribute("httpURL")%>app-assets/vendors/js/charts/echarts/echarts.js" type="text/javascript"></script>
<!-- END PAGE VENDOR JS-->
<!-- BEGIN MODERN JS-->
<script src="<%=session.getAttribute("httpURL")%>app-assets/js/core/app-menu.js" type="text/javascript"></script>
<script src="<%=session.getAttribute("httpURL")%>app-assets/js/core/app.js" type="text/javascript"></script>
<script src="<%=session.getAttribute("httpURL")%>app-assets/js/scripts/customizer.js" type="text/javascript"></script>
<!-- END MODERN JS-->
<!-- BEGIN PAGE LEVEL JS-->
<!--<script src="<%=session.getAttribute("httpURL")%>app-assets/js/scripts/pages/project-summary-task.js" type="text/javascript"></script>-->
<!--<script src="<%=session.getAttribute("httpURL")%>app-assets/js/scripts/pages/project-summary-bug.js" type="text/javascript"></script>-->
<!-- END PAGE LEVEL JS-->
<%}%> 

<%
    if ("workspace-dashboard".equals((String) session.getAttribute("CssAndJs"))) {
%>
<!-- BEGIN VENDOR JS-->
<script src="<%=session.getAttribute("httpURL")%>app-assets/vendors/js/vendors.min.js" type="text/javascript"></script>
<!-- BEGIN VENDOR JS-->
<!-- BEGIN PAGE VENDOR JS-->
<script src="<%=session.getAttribute("httpURL")%>app-assets/vendors/js/charts/chartist.min.js" type="text/javascript"></script>
<script src="<%=session.getAttribute("httpURL")%>app-assets/vendors/js/charts/chartist-plugin-tooltip.min.js"
type="text/javascript"></script>
<script src="<%=session.getAttribute("httpURL")%>app-assets/vendors/js/charts/raphael-min.js" type="text/javascript"></script>
<script src="<%=session.getAttribute("httpURL")%>app-assets/vendors/js/charts/morris.min.js" type="text/javascript"></script>
<script src="<%=session.getAttribute("httpURL")%>app-assets/vendors/js/timeline/horizontal-timeline.js" type="text/javascript"></script>
<!-- END PAGE VENDOR JS-->
<!-- BEGIN MODERN JS-->
<script src="<%=session.getAttribute("httpURL")%>app-assets/js/core/app-menu.js" type="text/javascript"></script>
<script src="<%=session.getAttribute("httpURL")%>app-assets/js/core/app.js" type="text/javascript"></script>
<script src="<%=session.getAttribute("httpURL")%>app-assets/js/scripts/customizer.js" type="text/javascript"></script>
<!-- END MODERN JS-->
<!-- BEGIN PAGE LEVEL JS-->
<script src="<%=session.getAttribute("httpURL")%>app-assets/js/scripts/pages/dashboard-ecommerce.js" type="text/javascript"></script>
<!-- END PAGE LEVEL JS-->
<%}%> 


<%
    if ("KPI2".equals((String) session.getAttribute("CssAndJs"))) {
%>
<!-- BEGIN VENDOR JS-->
<script src="<%=session.getAttribute("httpURL")%>app-assets/vendors/js/vendors.min.js" type="text/javascript"></script>
<!-- BEGIN VENDOR JS-->
<!-- BEGIN PAGE VENDOR JS-->
<script src="<%=session.getAttribute("httpURL")%>app-assets/vendors/js/charts/chartist.min.js" type="text/javascript"></script>
<script src="<%=session.getAttribute("httpURL")%>app-assets/vendors/js/charts/chartist-plugin-tooltip.min.js"
type="text/javascript"></script>
<script src="<%=session.getAttribute("httpURL")%>app-assets/vendors/js/charts/raphael-min.js" type="text/javascript"></script>
<script src="<%=session.getAttribute("httpURL")%>app-assets/vendors/js/charts/morris.min.js" type="text/javascript"></script>
<script src="<%=session.getAttribute("httpURL")%>app-assets/vendors/js/timeline/horizontal-timeline.js" type="text/javascript"></script>
<!-- END PAGE VENDOR JS-->
<!-- BEGIN MODERN JS-->
<script src="<%=session.getAttribute("httpURL")%>app-assets/js/core/app-menu.js" type="text/javascript"></script>
<script src="<%=session.getAttribute("httpURL")%>app-assets/js/core/app.js" type="text/javascript"></script>
<script src="<%=session.getAttribute("httpURL")%>app-assets/js/scripts/customizer.js" type="text/javascript"></script>
<!-- END MODERN JS-->
<!-- BEGIN PAGE LEVEL JS-->
<script src="<%=session.getAttribute("httpURL")%>app-assets/js/scripts/pages/dashboard-ecommerce.js" type="text/javascript"></script>
<!-- END PAGE LEVEL JS-->
<%}%> 


<%
    if ("tasklist-create".equals((String) session.getAttribute("CssAndJs"))) {
%>
<!-- BEGIN VENDOR JS-->
<script src="<%=session.getAttribute("httpURL")%>app-assets/vendors/js/vendors.min.js" type="text/javascript"></script>
<!-- BEGIN VENDOR JS-->
<!-- BEGIN PAGE VENDOR JS-->
<script src="<%=session.getAttribute("httpURL")%>app-assets/vendors/js/forms/repeater/jquery.repeater.min.js"
type="text/javascript"></script>
<!-- END PAGE VENDOR JS-->
<!-- BEGIN MODERN JS-->
<script src="<%=session.getAttribute("httpURL")%>app-assets/js/core/app-menu.js" type="text/javascript"></script>
<script src="<%=session.getAttribute("httpURL")%>app-assets/js/core/app.js" type="text/javascript"></script>
<script src="<%=session.getAttribute("httpURL")%>app-assets/js/scripts/customizer.js" type="text/javascript"></script>
<!-- END MODERN JS-->
<!-- BEGIN PAGE LEVEL JS-->
<script src="<%=session.getAttribute("httpURL")%>app-assets/js/scripts/forms/form-repeater.js" type="text/javascript"></script>
<!-- END PAGE LEVEL JS-->
<%}%> 


<%
    if ("tasklist-create-raci".equals((String) session.getAttribute("CssAndJs"))) {
%>
<!-- BEGIN VENDOR JS-->
<script src="<%=session.getAttribute("httpURL")%>app-assets/vendors/js/vendors.min.js" type="text/javascript"></script>
<!-- BEGIN VENDOR JS-->
<!-- BEGIN PAGE VENDOR JS-->
<script src="<%=session.getAttribute("httpURL")%>app-assets/vendors/js/forms/select/selectivity-full.min.js"
type="text/javascript"></script>
<!-- END PAGE VENDOR JS-->
<!-- BEGIN MODERN JS-->
<script src="<%=session.getAttribute("httpURL")%>app-assets/js/core/app-menu.js" type="text/javascript"></script>
<script src="<%=session.getAttribute("httpURL")%>app-assets/js/core/app.js" type="text/javascript"></script>
<script src="<%=session.getAttribute("httpURL")%>app-assets/js/scripts/customizer.js" type="text/javascript"></script>
<!-- END MODERN JS-->
<!-- BEGIN PAGE LEVEL JS-->
<script src="<%=session.getAttribute("httpURL")%>app-assets/js/scripts/forms/select/form-selectivity.js" type="text/javascript"></script>
<!-- END PAGE LEVEL JS-->
<%}%> 


<%
    if ("view_task".equals((String) session.getAttribute("CssAndJs"))) {
%>
<!-- BEGIN VENDOR JS-->
<script src="<%=session.getAttribute("httpURL")%>app-assets/vendors/js/vendors.min.js" type="text/javascript"></script>
<!-- BEGIN VENDOR JS-->
<!-- BEGIN PAGE VENDOR JS-->
<script src="<%=session.getAttribute("httpURL")%>app-assets/vendors/js/tables/datatable/datatables.min.js" type="text/javascript"></script>
<!-- END PAGE VENDOR JS-->
<!-- BEGIN MODERN JS-->
<script src="<%=session.getAttribute("httpURL")%>app-assets/js/core/app-menu.js" type="text/javascript"></script>
<script src="<%=session.getAttribute("httpURL")%>app-assets/js/core/app.js" type="text/javascript"></script>
<script src="<%=session.getAttribute("httpURL")%>app-assets/js/scripts/customizer.js" type="text/javascript"></script>
<!-- END MODERN JS-->
<!-- BEGIN PAGE LEVEL JS-->
<script src="<%=session.getAttribute("httpURL")%>app-assets/js/scripts/tables/datatables/datatable-basic.js"
type="text/javascript"></script>
<!-- END PAGE LEVEL JS-->
<%}%> 

<%
    if ("task-create".equals((String) session.getAttribute("CssAndJs"))) {
%>
<!-- BEGIN VENDOR JS-->
<script src="<%=session.getAttribute("httpURL")%>app-assets/vendors/js/vendors.min.js" type="text/javascript"></script>
<!-- BEGIN VENDOR JS-->
<!-- BEGIN PAGE VENDOR JS-->
<script src="<%=session.getAttribute("httpURL")%>app-assets/vendors/js/forms/repeater/jquery.repeater.min.js"
type="text/javascript"></script>
<script src="<%=session.getAttribute("httpURL")%>app-assets/vendors/js/forms/select/select2.full.min.js" type="text/javascript"></script>
<!-- END PAGE VENDOR JS-->
<!-- BEGIN MODERN JS-->
<script src="<%=session.getAttribute("httpURL")%>app-assets/js/core/app-menu.js" type="text/javascript"></script>
<script src="<%=session.getAttribute("httpURL")%>app-assets/js/core/app.js" type="text/javascript"></script>
<script src="<%=session.getAttribute("httpURL")%>app-assets/js/scripts/customizer.js" type="text/javascript"></script>
<!-- END MODERN JS-->
<!-- BEGIN PAGE LEVEL JS-->
<script src="<%=session.getAttribute("httpURL")%>app-assets/js/scripts/forms/form-repeater.js" type="text/javascript"></script>
<script src="<%=session.getAttribute("httpURL")%>app-assets/js/scripts/forms/select/form-select2.js" type="text/javascript"></script>
<!-- END PAGE LEVEL JS-->
<%}%> 

home-dashboard
<%
    if ("home-dashboard".equals((String) session.getAttribute("CssAndJs"))) {
%>
<!-- BEGIN VENDOR JS-->
<script src="<%=session.getAttribute("httpURL")%>app-assets/vendors/js/vendors.min.js" type="text/javascript"></script>
<!-- BEGIN VENDOR JS-->
<!-- BEGIN PAGE VENDOR JS-->
<script src="<%=session.getAttribute("httpURL")%>app-assets/vendors/js/charts/chart.min.js" type="text/javascript"></script>
<script src="<%=session.getAttribute("httpURL")%>app-assets/vendors/js/charts/raphael-min.js" type="text/javascript"></script>
<script src="<%=session.getAttribute("httpURL")%>app-assets/vendors/js/charts/morris.min.js" type="text/javascript"></script>
<script src="<%=session.getAttribute("httpURL")%>app-assets/vendors/js/charts/jvector/jquery-jvectormap-2.0.3.min.js"
type="text/javascript"></script>
<script src="<%=session.getAttribute("httpURL")%>app-assets/vendors/js/charts/jvector/jquery-jvectormap-world-mill.js"
type="text/javascript"></script>
<script src="<%=session.getAttribute("httpURL")%>app-assets/data/jvector/visitor-data.js" type="text/javascript"></script>
<!-- END PAGE VENDOR JS-->
<!-- BEGIN MODERN JS-->
<script src="<%=session.getAttribute("httpURL")%>app-assets/js/core/app-menu.js" type="text/javascript"></script>
<script src="<%=session.getAttribute("httpURL")%>app-assets/js/core/app.js" type="text/javascript"></script>
<script src="<%=session.getAttribute("httpURL")%>app-assets/js/scripts/customizer.js" type="text/javascript"></script>
<!-- END MODERN JS-->
<!-- BEGIN PAGE LEVEL JS-->
<!--<script src="<%=session.getAttribute("httpURL")%>app-assets/js/scripts/pages/dashboard-sales.js" type="text/javascript"></script>-->
<!-- END PAGE LEVEL JS-->
<%}%>



<%
    if ("khoan".equals((String) session.getAttribute("CssAndJs"))) {
%>
<!-- BEGIN VENDOR JS-->
<script src="<%=session.getAttribute("httpURL")%>app-assets/vendors/js/vendors.min.js" type="text/javascript"></script>
<!-- BEGIN VENDOR JS-->
<!-- BEGIN PAGE VENDOR JS-->
<script src="<%=session.getAttribute("httpURL")%>app-assets/vendors/js/tables/datatable/datatables.min.js" type="text/javascript"></script>
<!-- END PAGE VENDOR JS-->
<!-- BEGIN MODERN JS-->
<script src="<%=session.getAttribute("httpURL")%>app-assets/js/core/app-menu.js" type="text/javascript"></script>
<script src="<%=session.getAttribute("httpURL")%>app-assets/js/core/app.js" type="text/javascript"></script>
<script src="<%=session.getAttribute("httpURL")%>app-assets/js/scripts/customizer.js" type="text/javascript"></script>
<!-- END MODERN JS-->
<!-- BEGIN PAGE LEVEL JS-->
<script src="<%=session.getAttribute("httpURL")%>app-assets/js/scripts/tables/datatables/datatable-basic.js"
type="text/javascript"></script>
<!-- END PAGE LEVEL JS-->


<!-- BEGIN PAGE VENDOR JS-->
<script src="<%=session.getAttribute("httpURL")%>app-assets/vendors/js/charts/chart.min.js" type="text/javascript"></script>
<!-- END PAGE VENDOR JS-->

<!-- BEGIN PAGE LEVEL JS-->
<!--<script src="<%=session.getAttribute("httpURL")%>app-assets/js/scripts/charts/chartjs/line/line.js" type="text/javascript"></script>-->
<script src="<%=session.getAttribute("httpURL")%>app-assets/js/scripts/charts/chartjs/line/line-area.js" type="text/javascript"></script>
<script src="<%=session.getAttribute("httpURL")%>app-assets/js/scripts/charts/chartjs/line/line-logarithmic.js"
type="text/javascript"></script>
<script src="<%=session.getAttribute("httpURL")%>app-assets/js/scripts/charts/chartjs/line/line-multi-axis.js"
type="text/javascript"></script>
<script src="<%=session.getAttribute("httpURL")%>app-assets/js/scripts/charts/chartjs/line/line-skip-points.js"
type="text/javascript"></script>
<script src="<%=session.getAttribute("httpURL")%>app-assets/js/scripts/charts/chartjs/line/line-stacked-area.js"
type="text/javascript"></script>
<!-- END PAGE LEVEL JS-->




<!-- BEGIN PAGE LEVEL JS-->
<!--<script src="<%=session.getAttribute("httpURL")%>app-assets/js/scripts/charts/chartjs/bar/bar.js" type="text/javascript"></script>-->
<script src="<%=session.getAttribute("httpURL")%>app-assets/js/scripts/charts/chartjs/bar/bar-stacked.js" type="text/javascript"></script>
<script src="<%=session.getAttribute("httpURL")%>app-assets/js/scripts/charts/chartjs/bar/bar-multi-axis.js"
type="text/javascript"></script>
<!--<script src="<%=session.getAttribute("httpURL")%>app-assets/js/scripts/charts/chartjs/bar/column.js" type="text/javascript"></script>-->
<script src="<%=session.getAttribute("httpURL")%>app-assets/js/scripts/charts/chartjs/bar/column-stacked.js"
type="text/javascript"></script>
<script src="<%=session.getAttribute("httpURL")%>app-assets/js/scripts/charts/chartjs/bar/column-multi-axis.js"
type="text/javascript"></script>
<!-- END PAGE LEVEL JS-->

<%}%> 



<%
    if ("soDoCongViec".equals((String) session.getAttribute("CssAndJs"))) {
%>
<script src="<%=session.getAttribute("httpURL")%>app-assets/custom/go.js" type="text/javascript"></script>
<script src="<%=session.getAttribute("httpURL")%>app-assets/custom/Figures.js" type="text/javascript"></script>
<script src="<%=session.getAttribute("httpURL")%>app-assets/custom/DrawCommandHandler.js" type="text/javascript"></script>
<%}%> 