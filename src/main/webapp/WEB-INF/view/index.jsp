<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="tempates/modals.jsp"%>
<%--<%@include file="tempates/header.jsp"%>--%>


<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Vinyl Shop</title>
    <link rel="icon" href="https://cdn2.iconfinder.com/data/icons/gears-wheels-blades/512/music_disk-512.png">
    <%--Bootstrap4--%>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css"
          integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
    <!--Style.CSS  -->
    <link rel="stylesheet" href="/style/main.css">
</head>
<body>




<nav class="navbar navbar-expand-lg navbar-light" style="background-color: transparent;border: 0px">
    <div class="container">
        <a class="navbar-brand" href="/">VinylShop</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link" href="products">Products</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">About</a>
                </li>
                <security:authorize  access="hasRole('ROLE_ADMIN')">
                    <li class="nav-item"><a href="admin/admin_page" class="nav-link">Add Product</a></li>
                    <li class="nav-item"><a href="admin/admin_orders" class="nav-link">Orders</a></li>
                </security:authorize>
            </ul>
            <ul class="navbar-nav">
                <li class="nav-item">
                    <form class="form-inline my-2 my-lg-0">
                        <div id="search">
                            <input class="form-control mr-sm-2" id="searchInput" type="text" placeholder="Search" aria-label="Search" style="background-color: transparent">
                            <label for="searchInput">
                                <i class="fa fa-search" aria-hidden="true"></i>
                            </label>
                        </div>
                    </form>
                </li>
                <li class="nav-item">
                    <a href="myCart" class="nav-link">Cart</a>
                </li>
                <li class="nav-item">
                    <security:authorize access="!hasAnyRole('ROLE_ADMIN', 'ROLE_USER')">
                        <a href="#" class="nav-link" data-toggle="modal" data-target="#login-modal">Login</a>
                    </security:authorize>
                    <security:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_USER')">
                        <div class="dropdown">
                            <a class="btn btn-info dropdown-toggle" style="line-height: 1.5;font-weight: 500;" href="#" role="button"
                               id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Profile
                            </a>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                <a class="dropdown-item" href="myPage"><i class="fa fa-user-o" aria-hidden="true"></i>&nbsp My page</a>
                                <a class="dropdown-item" href="mySettings"><i class="fa fa-cog" aria-hidden="true"></i>&nbsp Settings</a>
                                <a class="dropdown-item" href="/logout"><i class="fa fa-sign-out" aria-hidden="true"></i>&nbsp Log out</a>
                            </div>
                        </div>
                    </security:authorize>
                </li>
            </ul>
        </div>
    </div>
</nav>


<div class="container-fluid">
    <div class="row">
        <div class="col-md-12" style="color: #fff">
            <br>
            <br>
            <br>
            <br>
            <br>
            <h1 align="center">Welcome to the VinylShop</h1>

            <h4 align="center">Enjoy the music!</h4>
            <br>
            <h1 align="center"><a href="/products" class="btn btn-lg btn-outline-light">CHECK IT</a></h1>
        </div>
    </div>
</div>
<video autoplay loop id="video-background" plays-inline>
    <source src="/video/bg-video.mp4" type="video/mp4">
</video>

<%@include file="tempates/footer.jsp"%>