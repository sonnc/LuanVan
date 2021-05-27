<%-- 
    Document   : linkCss
    Created on : Feb 17, 2021, 12:10:03 PM
    Author     : sonng
--%>

<script src="<%=session.getAttribute("httpURL")%>app-assets/js/scripts/sweetalert.min.js" type="text/javascript"></script>

<%
    if ("login".equals((String) session.getAttribute("CssAndJs"))) {
%>
<!-- BEGIN VENDOR CSS-->
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/css/vendors.css">
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/vendors/css/forms/icheck/icheck.css">
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/vendors/css/forms/icheck/custom.css">
<!-- END VENDOR CSS-->
<!-- BEGIN MODERN CSS-->
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/css/app.css">
<!-- END MODERN CSS-->
<!-- BEGIN Page Level CSS-->
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/css/core/menu/menu-types/vertical-menu.css">
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/css/core/colors/palette-gradient.css">
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/css/pages/login-register.css">
<!-- END Page Level CSS-->
<!-- BEGIN Custom CSS-->
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>assets/css/style.css">
<!-- END Custom CSS-->
<%}%>

<%
    if ("home".equals((String) session.getAttribute("CssAndJs"))) {
%>
<!-- BEGIN VENDOR CSS-->
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/css/vendors.css">
<!-- END VENDOR CSS-->
<!-- BEGIN MODERN CSS-->
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/css/app.css">
<!-- END MODERN CSS-->
<!-- BEGIN Page Level CSS-->
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/css/core/menu/menu-types/vertical-menu.css">
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/css/core/colors/palette-gradient.css">
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/css/pages/project.css">
<!-- END Page Level CSS-->
<!-- BEGIN Custom CSS-->
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>assets/css/style.css">
<!-- END Custom CSS-->
<%}%>

<%
    if ("codeset".equals((String) session.getAttribute("CssAndJs"))) {
%>
<!-- BEGIN VENDOR CSS-->
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/css/vendors.css">
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/vendors/css/tables/datatable/datatables.min.css">
<!-- END VENDOR CSS-->
<!-- BEGIN MODERN CSS-->
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/css/app.css">
<!-- END MODERN CSS-->
<!-- BEGIN Page Level CSS-->
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/css/core/menu/menu-types/vertical-menu.css">
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/css/core/colors/palette-gradient.css">
<!-- END Page Level CSS-->
<!-- BEGIN Custom CSS-->
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>assets/css/style.css">
<!-- END Custom CSS-->
<%}%>

<%
    if ("codesetaddnew".equals((String) session.getAttribute("CssAndJs"))) {
%>
<!-- BEGIN VENDOR CSS-->
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/css/vendors.css">
<!-- END VENDOR CSS-->
<!-- BEGIN MODERN CSS-->
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/css/app.css">
<!-- END MODERN CSS-->
<!-- BEGIN Page Level CSS-->
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/css/core/menu/menu-types/vertical-menu.css">
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/css/core/colors/palette-gradient.css">
<!-- END Page Level CSS-->
<!-- BEGIN Custom CSS-->
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>assets/css/style.css">
<!-- END Custom CSS-->
<%}%>

<%
    if ("workspace-create".equals((String) session.getAttribute("CssAndJs"))) {
%>
<!-- BEGIN VENDOR CSS-->
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/css/vendors.css">
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/vendors/css/pickers/daterange/daterangepicker.css">
<!-- END VENDOR CSS-->
<!-- BEGIN MODERN CSS-->
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/css/app.css">
<!-- END MODERN CSS-->
<!-- BEGIN Page Level CSS-->
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/css/core/menu/menu-types/vertical-menu.css">
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/css/core/colors/palette-gradient.css">
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/css/plugins/forms/wizard.css">
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/css/plugins/pickers/daterange/daterange.css">
<!-- END Page Level CSS-->
<!-- BEGIN Custom CSS-->
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>assets/css/style.css">
<!-- END Custom CSS-->
<%}%>

<%
    if ("workspace-action-forward".equals((String) session.getAttribute("CssAndJs"))) {
%>
<!-- BEGIN VENDOR CSS-->
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/css/vendors.css">
<!-- END VENDOR CSS-->
<!-- BEGIN MODERN CSS-->
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/css/app.css">
<!-- END MODERN CSS-->
<!-- BEGIN Page Level CSS-->
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/css/core/menu/menu-types/vertical-menu.css">
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/css/core/colors/palette-gradient.css">
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/css/plugins/animate/animate.css">
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/fonts/simple-line-icons/style.min.css">
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/css/core/colors/palette-callout.css">
<!-- END Page Level CSS-->
<!-- BEGIN Custom CSS-->
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>assets/css/style.css">
<!-- END Custom CSS-->
<%}%>


<%
    if ("workspace-summary".equals((String) session.getAttribute("CssAndJs"))) {
%>
<!-- BEGIN VENDOR CSS-->
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/css/vendors.css">
<!-- END VENDOR CSS-->
<!-- BEGIN MODERN CSS-->
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/css/app.css">
<!-- END MODERN CSS-->
<!-- BEGIN Page Level CSS-->
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/css/core/menu/menu-types/vertical-menu.css">
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/css/core/colors/palette-gradient.css">
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/css/pages/project.css">
<!-- END Page Level CSS-->
<!-- BEGIN Custom CSS-->
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>assets/css/style.css">
<!-- END Custom CSS-->
<%}%>

<%
    if ("workspace-dashboard".equals((String) session.getAttribute("CssAndJs"))) {
%>
<!-- BEGIN VENDOR CSS-->
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/css/vendors.css">
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/vendors/css/weather-icons/climacons.min.css">
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/fonts/meteocons/style.css">
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/vendors/css/charts/morris.css">
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/vendors/css/charts/chartist.css">
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/vendors/css/charts/chartist-plugin-tooltip.css">
<!-- END VENDOR CSS-->
<!-- BEGIN MODERN CSS-->
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/css/app.css">
<!-- END MODERN CSS-->
<!-- BEGIN Page Level CSS-->
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/css/core/menu/menu-types/vertical-menu.css">
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/css/core/colors/palette-gradient.css">
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/fonts/simple-line-icons/style.css">
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/css/core/colors/palette-gradient.css">
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/css/pages/timeline.css">
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/css/pages/dashboard-ecommerce.css">
<!-- END Page Level CSS-->
<!-- BEGIN Custom CSS-->
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>assets/css/style.css">
<!-- END Custom CSS-->
<%}%>


<%
    if ("KPI".equals((String) session.getAttribute("CssAndJs"))) {
%>
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/css/vendors.css">
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/css/app.css">
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/css/core/menu/menu-types/vertical-overlay-menu.css">
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/css/core/colors/palette-gradient.css">
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/vendors/css/cryptocoins/cryptocoins.css">
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/vendors/css/forms/icheck/icheck.css">
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/vendors/css/forms/icheck/custom.css">
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/vendors/js/gallery/photo-swipe/photoswipe.css">
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/vendors/js/gallery/photo-swipe/default-skin/default-skin.css">
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/css/pages/users.css">
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/css/pages/timeline.css">
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/css/pages/login-register.css">
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/css/pages/project.css">
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/vendors/css/tables/datatable/dataTables.bootstrap4.min.css">
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/vendors/css/tables/extensions/rowReorder.dataTables.min.css">
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/vendors/css/tables/extensions/responsive.dataTables.min.css">
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/vendors/css/ui/jquery-ui.min.css">

<!--block lai do lam loi sweeralert2-->
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/vendors/css/forms/selects/select2.min.css">
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/vendors/css/forms/toggle/bootstrap-switch.min.css">
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/vendors/css/forms/toggle/switchery.min.css">
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/css/plugins/forms/switch.css">
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/fonts/simple-line-icons/style.min.css">
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/css/core/colors/palette-switch.css">
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/vendors/css/editors/summernote.css">
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/vendors/css/editors/codemirror.css">
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/vendors/css/editors/theme/monokai.css">
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/vendors/css/pickers/daterange/daterangepicker.css">
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/vendors/css/pickers/pickadate/pickadate.css">
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/css/plugins/pickers/daterange/daterange.css">
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/css/custom.css">
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/css/sweetalert.css">
<script src="<%=session.getAttribute("httpURL")%>app-assets/js/scripts/sweetalert.min.js" type="text/javascript"></script>
<%}%> 


<%
    if ("KPI2".equals((String) session.getAttribute("CssAndJs"))) {
%>
<!-- BEGIN VENDOR CSS-->
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/css/vendors.css">
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/vendors/css/weather-icons/climacons.min.css">
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/fonts/meteocons/style.css">
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/vendors/css/charts/morris.css">
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/vendors/css/charts/chartist.css">
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/vendors/css/charts/chartist-plugin-tooltip.css">
<!-- END VENDOR CSS-->
<!-- BEGIN MODERN CSS-->
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/css/app.css">
<!-- END MODERN CSS-->
<!-- BEGIN Page Level CSS-->
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/css/core/menu/menu-types/vertical-menu.css">
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/css/core/colors/palette-gradient.css">
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/fonts/simple-line-icons/style.css">
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/css/core/colors/palette-gradient.css">
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/css/pages/timeline.css">
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/css/pages/dashboard-ecommerce.css">
<!-- END Page Level CSS-->
<!-- BEGIN Custom CSS-->
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>assets/css/style.css">
<!-- END Custom CSS-->
<%}%>

<%
    if ("tasklist-create".equals((String) session.getAttribute("CssAndJs"))) {
%>
<!-- BEGIN VENDOR CSS-->
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/css/vendors.css">
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/vendors/css/forms/selects/selectivity-full.min.css">
<!-- END VENDOR CSS-->
<!-- BEGIN MODERN CSS-->
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/css/app.css">
<!-- END MODERN CSS-->
<!-- BEGIN Page Level CSS-->
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/css/core/menu/menu-types/vertical-menu.css">
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/css/core/colors/palette-gradient.css">
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/css/plugins/forms/selectivity/selectivity.css">
<!-- END Page Level CSS-->
<!-- BEGIN Custom CSS-->
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>assets/css/style.css">
<!-- END Custom CSS-->
<%}%> 


<%
    if ("tasklist-create-raci".equals((String) session.getAttribute("CssAndJs"))) {
%>
<!-- BEGIN VENDOR CSS-->
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/css/vendors.css">
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/vendors/css/forms/selects/selectivity-full.min.css">
<!-- END VENDOR CSS-->
<!-- BEGIN MODERN CSS-->
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/css/app.css">
<!-- END MODERN CSS-->
<!-- BEGIN Page Level CSS-->
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/css/core/menu/menu-types/vertical-menu.css">
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/css/core/colors/palette-gradient.css">
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/css/plugins/forms/selectivity/selectivity.css">
<!-- END Page Level CSS-->
<!-- BEGIN Custom CSS-->
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>assets/css/style.css">
<!-- END Custom CSS-->
<%}%> 


<%
    if ("view_task".equals((String) session.getAttribute("CssAndJs"))) {
%>
  <!-- BEGIN VENDOR CSS-->
  <link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/css/vendors.css">
  <link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/vendors/css/tables/datatable/datatables.min.css">
  <!-- END VENDOR CSS-->
  <!-- BEGIN MODERN CSS-->
  <link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/css/app.css">
  <!-- END MODERN CSS-->
  <!-- BEGIN Page Level CSS-->
  <link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/css/core/menu/menu-types/vertical-menu.css">
  <link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/css/core/colors/palette-gradient.css">
  <!-- END Page Level CSS-->
  <!-- BEGIN Custom CSS-->
  <link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>assets/css/style.css">
  <!-- END Custom CSS-->
<%}%> 
<%
    if ("task-create".equals((String) session.getAttribute("CssAndJs"))) {
%>
  <!-- BEGIN VENDOR CSS-->
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/css/vendors.css">
<!-- END VENDOR CSS-->
<!-- BEGIN MODERN CSS-->
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/css/app.css">
 <link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/vendors/css/forms/selects/select2.min.css">
<!-- END MODERN CSS-->
<!-- BEGIN Page Level CSS-->
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/css/core/menu/menu-types/vertical-menu.css">
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/css/core/colors/palette-gradient.css">
<!-- END Page Level CSS-->
<!-- BEGIN Custom CSS-->
<link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>assets/css/style.css">
<!-- END Custom CSS-->
<%}%> 



<%
    if ("home-dashboard".equals((String) session.getAttribute("CssAndJs"))) {
%>
<!-- BEGIN VENDOR CSS-->
  <link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/css/vendors.css">
  <!-- END VENDOR CSS-->
  <!-- BEGIN MODERN CSS-->
  <link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/css/app.css">
  <!-- END MODERN CSS-->
  <!-- BEGIN Page Level CSS-->
  <link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/css/core/menu/menu-types/vertical-menu.css">
  <link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/css/core/colors/palette-gradient.css">
  <link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/vendors/css/charts/jquery-jvectormap-2.0.3.css">
  <link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/vendors/css/charts/morris.css">
  <link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/fonts/simple-line-icons/style.css">
  <link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/css/core/colors/palette-gradient.css">
  <!-- END Page Level CSS-->
  <!-- BEGIN Custom CSS-->
  <link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>assets/css/style.css">
  <!-- END Custom CSS-->
<%}%> 



<%
    if ("khoan".equals((String) session.getAttribute("CssAndJs"))) {
%>
  <!-- BEGIN VENDOR CSS-->
  <link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/css/vendors.css">
  <link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/vendors/css/tables/datatable/datatables.min.css">
  <!-- END VENDOR CSS-->
  <!-- BEGIN MODERN CSS-->
  <link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/css/app.css">
  <!-- END MODERN CSS-->
  <!-- BEGIN Page Level CSS-->
  <link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/css/core/menu/menu-types/vertical-menu.css">
  <link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>app-assets/css/core/colors/palette-gradient.css">
  <!-- END Page Level CSS-->
  <!-- BEGIN Custom CSS-->
  <link rel="stylesheet" type="text/css" href="<%=session.getAttribute("httpURL")%>assets/css/style.css">
  <!-- END Custom CSS-->
<%}%> 
