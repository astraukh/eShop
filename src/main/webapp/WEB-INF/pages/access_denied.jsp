<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8" />
    <!--[if lt IE 9]><script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js"></script><![endif]-->
    <title>Access is denied</title>
    <style>
        <%@include file="/css/eShop_stylesheet.css"%>
    </style>

<body>

<div class="wrapper">

    <header class="header">

    </header><!-- .header-->

    <div class="middle">

        <div class="container">
            <main class="content">
                <br>
                <br>
                <br>
                <h1>Access is denied!</h1>
            </main><!-- .content -->
        </div><!-- .container-->

        <aside class="left-sidebar">
            <ul class="main-menu">

                <li><a href="<c:url value="/registration"/>">Registration</a></li>

                <li><a href="<c:url value="/login"/>">Login</a></li>
            </ul>
        </aside><!-- .left-sidebar -->

    </div><!-- .middle-->

</div><!-- .wrapper -->

</body>
</html>

