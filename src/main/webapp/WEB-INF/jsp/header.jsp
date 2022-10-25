<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <!-- jQuert -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <!-- CDN dataTables -->
    <link rel="stylesheet" type="text/css" href="../../resources/static/DataTables/datatables.css">

    <link href="../../resources/static/css/header.css" rel="stylesheet"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    <link href="../../resources/static/css/list.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/boxicons/2.1.0/css/boxicons.min.css"
          integrity="sha512-pVCM5+SN2+qwj36KonHToF2p1oIvoU3bsqxphdOIWMYmgr4ZqD3t5DjKvvetKhXGc/ZG5REYTT6ltKfExEei/Q=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/5.3.45/css/materialdesignicons.css"
          integrity="sha256-NAxhqDvtY0l4xn+YVa6WjAcmd94NNfttjNsDmNatFVc=" crossorigin="anonymous"/>
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.2/dist/leaflet.css"
          integrity="sha256-sA+zWATbFveLLNqWO2gtiw3HL/lh1giY/Inf1BJ0z14="
          crossorigin=""/>
    <script src="https://unpkg.com/leaflet@1.9.2/dist/leaflet.js"
            integrity="sha256-o9N1jGDZrf5tS+Ft4gbIK7mYMipq9lqpVJ91xHSyKhg="
            crossorigin=""></script>
    <!-- fullcalendar -->
    <link href='../../resources/static/fullcalendar/lib/main.css' rel='stylesheet' />
    <script src='../../resources/static/fullcalendar/lib/main.js'></script>

    <script src="../../resources/static/js/calendar.js"></script>

    <title>${param.title}</title>
</head>

<!-- Navbar -->
<nav class="navbar navbar-expand-md">
    <!-- Container wrapper -->
    <div class="container-fluid justify-content-md-start ml-auto justify-content-center">

        <!-- Navbar brand -->
        <a class="navbar-brand nav-item mt-2 mt-md-0" href="${pageContext.request.contextPath}/">
            <img
                    src="https://zupimages.net/up/22/41/5la4.jpg"
                    height="45"
                    alt="rosa logo"
                    loading="lazy"
                    class=" d-md-block"
            />
        </a>
        <!-- Collapse button -->
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <!-- nav bar collapse parent -->
        <div class="collapse navbar-collapse" id="navbarTogglerDemo02">

        <!-- Left links -->
        <ul class="navbar-nav d-flex flex-column flex-md-row justify-content-center align-items-center justify-content-md-start  mr-auto">
            <li class="nav-item">
                <a class="nav-link" style="color: #891919" href="${pageContext.request.contextPath}/">Dashboard</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" style="color: #891919" href="${pageContext.request.contextPath}/companies/all">Companies</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" style="color: #891919" href="${pageContext.request.contextPath}/prospects/all">Prospects</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" style="color: #891919"
                   href="${pageContext.request.contextPath}/clients/all">Clients</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" style="color: #891919" href="${pageContext.request.contextPath}/calendar">Calendar</a>
            </li>
        </ul>
        <!-- Left links -->
    </div>
    <!-- Right elements -->
    <div class="ml-1 mr-auto d-flex align-items-center flex-lg-row flex-md-column flex-sm-column">

        <!-- Login and co -->
        <sec:authorize access="!isAuthenticated()">
            <a
                    class="nav-link nav-item p-2"
                    href="${pageContext.request.contextPath}/signin"
                    role="button"
                    aria-expanded="false"
                    style="color: #891919"
            >
                Login
            </a>
            <a
                    class="nav-link nav-item p-1"
                    href="${pageContext.request.contextPath}/register"
                    role="button"
                    aria-expanded="false"
                    style="color: #891919"
            >
                Register
            </a>
        </sec:authorize>
        <sec:authorize access="isAuthenticated()">
            <!-- Avatar -->

            <a
                    class="nav-link nav-item ml-1"
                    href="${pageContext.request.contextPath}/account"
                    role="button"
                    aria-expanded="false"
            >
                <i class="bi bi-person-circle" style="font-size: 2rem; color: #CE2626;"></i>
            </a>
            <a
                    class="nav-link nav-item p-2 ml-1"
                    href="${pageContext.request.contextPath}/logout"
                    role="button"
                    aria-expanded="false"
                    style="color: #891919"
            >
                Logout
            </a>
        </sec:authorize>

    </div>
    <!-- Right elements -->
    </div>
</nav>
<!-- Navbar -->

<body class="bg-light">