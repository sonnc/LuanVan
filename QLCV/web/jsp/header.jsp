<%-- 
    Document   : head
    Created on : Feb 18, 2021, 2:44:47 PM
    Author     : sonng
--%>
<%@page import="java.util.Properties"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<link rel="apple-touch-icon" href="<%=session.getAttribute("httpURL")%>app-assets/images/ico/apple-icon-120.png">
<link rel="shortcut icon" type="image/x-icon" href="<%=session.getAttribute("httpURL")%>app-assets/images/ico/favicon.ico">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Quicksand:300,400,500,700"
rel="stylesheet">
<link href="https://maxcdn.icons8.com/fonts/line-awesome/1.1/css/line-awesome.min.css"
rel="stylesheet">

<%
    Properties properties = new Properties();
    if (session.getAttribute("user")==null) {
            String l = (String) session.getAttribute("httpURL");
            response.sendRedirect(l+"jsp/login.jsp");
    }else{
        if (!"login".equals(session.getAttribute("CssAndJs"))) {
            properties = (Properties) session.getAttribute("properties");
        }
    }

%>