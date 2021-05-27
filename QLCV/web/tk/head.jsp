<%-- 
    Document   : head
    Created on : Feb 25, 2020, 8:56:13 PM
    Author     : sonng
--%>
<%
    if (session.getAttribute("httpURL") == null) {
        StringBuffer url = new StringBuffer();
        int port = request.getServerPort();
        if (port < 0) {
            port = 80; // Work around java.net.URL bug
        }
        String scheme = request.getScheme();
        url.append(scheme);
        url.append("://");
        url.append(request.getServerName());
        if (("http".equals(scheme) && (port != 80)) || ("https".equals(scheme) && (port != 443))) {
            url.append(':');
            url.append(port);
        }
        url.append(request.getContextPath());
        String URL = url.toString() + "/";
        session.setAttribute("httpURL", URL);
    }
%>
<head>
    <base href="<%=session.getAttribute("httpURL")%>">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <title>TASK & KPI</title>
    <!--<link rel="apple-touch-icon" href="<%=session.getAttribute("httpURL")%>app-assets/images/ico/apple-icon-120.png">-->
    <link rel="shortcut icon" type="image/png" href="<%=session.getAttribute("httpURL")%>app-assets/images/logo/logo.png">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Quicksand:300,400,500,700"
          rel="stylesheet">
    <link href="https://maxcdn.icons8.com/fonts/line-awesome/1.1/css/line-awesome.min.css" rel="stylesheet">

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


</head>
