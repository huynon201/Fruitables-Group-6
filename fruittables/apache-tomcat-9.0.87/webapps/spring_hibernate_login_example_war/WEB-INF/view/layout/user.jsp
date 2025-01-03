    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    <%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>

    <!DOCTYPE html>
    <html lang="zxx">

    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Ogani Template">
        <meta name="keywords" content="Ogani, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title><decorator:title default="Master-layout"/></title>
<%--        <c:url var="url" value="/WEB-INF/resource"/>--%>
        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

        <!-- Css Styles -->
        <link rel="stylesheet" href="<c:url value="/resource/user/css/bootstrap.min.css"/>"  type="text/css">
        <link rel="stylesheet" href="<c:url value="/resource/user/css/font-awesome.min.css"/>" type="text/css">
        <link rel="stylesheet" href="<c:url value="/resource/user/css/elegant-icons.css"/>" type="text/css">
        <link rel="stylesheet" href="<c:url value="/resource/user/css/nice-select.css"/>" type="text/css">
        <link rel="stylesheet" href="<c:url value="/resource/user/css/jquery-ui.min.css"/>" type="text/css">
        <link rel="stylesheet" href="<c:url value="/resource/user/css/owl.carousel.min.css"/>" type="text/css">
        <link rel="stylesheet" href="<c:url value="/resource/user/css/slicknav.min.css"/>" type="text/css">
        <link rel="stylesheet" href="<c:url value="/resource/user/css/style.css"/>" type="text/css">
    </head>

    <body>
    <%@include file="/WEB-INF/view/layout/user/header.jsp"%>
    <decorator:body />
    <%@include file="/WEB-INF/view/layout/user/footer.jsp"%>
    <!-- Js Plugins -->
    <script src="<c:url value="/resource/user/js/jquery-3.3.1.min.js"/>"></script>
    <script src="<c:url value="/resource/user/js/bootstrap.min.js"/>"></script>
    <script src="<c:url value="/resource/user/js/jquery.nice-select.min.js"/>"></script>
    <script src="<c:url value="/resource/user/js/jquery-ui.min.js"/>"></script>
    <script src="<c:url value="/resource/user/js/jquery.slicknav.js"/>"></script>
    <script src="<c:url value="/resource/user/js/mixitup.min.js"/>"></script>
    <script src="<c:url value="/resource/user/js/owl.carousel.min.js"/>"></script>
    <script src="<c:url value="/resource/user/js/main.js"/>"></script>
    <decorator:getProperty property="page.script"/>
    </body>
    </html>