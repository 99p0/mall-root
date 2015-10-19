<%@ page pageEncoding="UTF-8"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" /><c:set var="titleComm" value="从艺网 商品销售中心" /><c:set var="charismaPath" value="${ctx}/resources/plug-in/charisma/" />
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="format-detection" content="telephone=no">
    <meta name="format-detection" content="email=no">
    <meta name="author" content="final.young@hotmail.com">
    <meta name="copyright" content="CongYi.Inc. Copyright (c) 2015">
    <meta http-equiv="Cache-Control" content="no-siteapp" ><!-- 通过傻逼百度手机打开网页时，傻逼百度可能会对你的网页进行转码，往你页面贴上它的广告，非常之恶心 -->
    <meta http-equiv="window-target" content="_top" >
    <meta name="description" content="" >
    <meta name="keywords" content="" >
    <link rel="icon" href="http://images.congyi.cc/favicon.ico">
    <link href="${charismaPath}css/bootstrap-cerulean.min.css" rel="stylesheet" id="bs-css">
    <link href="${charismaPath}bower_components/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
    <link href="${charismaPath}css/charisma-app.css" rel="stylesheet">
    <%--<link href='${charismaPath}bower_components/fullcalendar/dist/fullcalendar.css' rel='stylesheet'>
    <link href='${charismaPath}bower_components/fullcalendar/dist/fullcalendar.print.css' rel='stylesheet' media='print'>--%>
    <%--<link href='${charismaPath}bower_components/chosen/chosen.min.css' rel='stylesheet'>--%>
    <%--<link href='${charismaPath}bower_components/colorbox/example3/colorbox.css' rel='stylesheet'>--%>
    <link href='${charismaPath}bower_components/responsive-tables/responsive-tables.css' rel='stylesheet'>
    <%--<link href='${charismaPath}bower_components/bootstrap-tour/build/css/bootstrap-tour.min.css' rel='stylesheet'>--%>
    <%--<link href='${charismaPath}css/jquery.noty.css' rel='stylesheet'>
    <link href='${charismaPath}css/noty_theme_default.css' rel='stylesheet'>--%>
    <%--<link href='${charismaPath}css/elfinder.min.css' rel='stylesheet'>
    <link href='${charismaPath}css/elfinder.theme.css' rel='stylesheet'>--%>
    <%--<link href='${charismaPath}css/jquery.iphone.toggle.css' rel='stylesheet'>--%>
    <%--<link href='${charismaPath}css/uploadify.css' rel='stylesheet'>--%>
    <link href='${charismaPath}css/animate.min.css' rel='stylesheet'>
    <%--<script src="${charismaPath}bower_components/jquery/jquery.min.js"></script>--%>
    <script src="${charismaPath}js/jquery-1.11.3.min.js"></script>
    <!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]><script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script><script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script><![endif]-->
    <script type="text/javascript">var appPath =  "${ctx}",cookiePath = appPath || "/", charismaPath = '${charismaPath}';</script>
    <%-- 引用说明：  <%@ include file="/WEB-INF/views/jsp/commons/common.jsp" %> --%>