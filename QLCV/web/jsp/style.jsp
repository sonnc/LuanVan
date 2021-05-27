<%-- 
    Document   : style
    Created on : Feb 14, 2021, 5:38:29 PM
    Author     : sonng
--%>
<%@taglib prefix="s" uri="/struts-tags"%>


<%
    String showHiden = (String) session.getAttribute("");
%>
<!--NOI DUNG CHUNG-->
    <!-- BEGIN VENDOR CSS-->
    <link rel="stylesheet" type="text/css" href="../../../app-assets/css/vendors.css">
    <link rel="stylesheet" type="text/css" href="../../../app-assets/vendors/css/tables/datatable/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" type="text/css" href="../../../app-assets/vendors/css/tables/extensions/rowReorder.dataTables.min.css">
    <link rel="stylesheet" type="text/css" href="../../../app-assets/vendors/css/tables/extensions/responsive.dataTables.min.css">
    <link rel="stylesheet" type="text/css" href="../../../app-assets/vendors/css/forms/icheck/icheck.css">
    <link rel="stylesheet" type="text/css" href="../../../app-assets/vendors/css/forms/icheck/custom.css">
    <link rel="stylesheet" type="text/css" href="../../../app-assets/vendors/css/ui/jquery-ui.min.css">
    <link rel="stylesheet" type="text/css" href="../../../app-assets/vendors/css/forms/selects/select2.min.css">
    <!-- END VENDOR CSS-->

<% 
if (showHiden!=null && showHiden.equals("content_1")) {
        
    }
%>


  <!-- BEGIN MODERN CSS-->
  <link rel="stylesheet" type="text/css" href="../../../app-assets/css/app.css">
  <!-- END MODERN CSS-->
  <!-- BEGIN Page Level CSS-->
  <link rel="stylesheet" type="text/css" href="../../../app-assets/css/core/menu/menu-types/vertical-menu.css">
  <link rel="stylesheet" type="text/css" href="../../../app-assets/css/core/colors/palette-gradient.css">
  <!-- END Page Level CSS-->
  <!-- BEGIN Custom CSS-->
  <link rel="stylesheet" type="text/css" href="../../../assets/css/style.css">
  <!-- END Custom CSS-->
