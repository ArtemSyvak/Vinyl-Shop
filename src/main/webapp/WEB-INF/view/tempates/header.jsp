<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@include file="modals.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>

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
<%--TOP-MENU--%>
<%--<nav class="navbar navbar-inverse" >--%>
    <%--<div class="container">--%>
        <%--<div class="navbar-header">--%>
            <%--<a href="/" class="navbar-brand">Vinyl Shop</a>--%>
        <%--</div>--%>
        <%--<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">--%>
            <%--<ul class="nav navbar-nav">--%>
                <%--<li><a href="products">Catalog</a></li>--%>
                <%--<li><a href="#">Top Sels</a></li>--%>
                <%--<li><a href="#">About Us</a></li>--%>

                <%--<security:authorize  access="hasRole('ROLE_ADMIN')">--%>
                    <%--<li><a href="admin/admin_page">Add Product</a></li>--%>
                    <%--<li><a href="admin/admin_orders">Orders</a></li>--%>
                <%--</security:authorize>--%>

                <%--<form class="navbar-form navbar-left" role="search">--%>
                    <%--<div class="form-group">--%>
                        <%--<i></i>--%>
                        <%--<input type="text" class="form-control" placeholder="Search">--%>
                    <%--</div>--%>
                    <%--&lt;%&ndash;<a type="submit" class="btn btn-default">Submit</a>&ndash;%&gt;--%>
                <%--</form>--%>
                <%--&lt;%&ndash;EMPTY_STEP&ndash;%&gt;--%>
                <%--<security:authorize access="!hasAnyRole('ROLE_USER','ROLE_ADMIN')">--%>
                        <%--<li>--%>
                            <%--&nbsp; 	&nbsp; 	&nbsp; 	&nbsp;--%>
                            <%--&nbsp; 	&nbsp; 	&nbsp; 	&nbsp;--%>
                            <%--&nbsp; 	&nbsp;  &nbsp;  &nbsp;--%>
                            <%--&nbsp; 	&nbsp;   &nbsp;  &nbsp; &nbsp;  &nbsp;--%>
                        <%--</li>--%>
                <%--</security:authorize>--%>
                <%--&lt;%&ndash;EMPTY_STEP&ndash;%&gt;--%>

                <%--<security:authorize access="hasRole('ROLE_USER')">--%>
                    <%--<li><a href="myPage">My Page</a></li>--%>
                <%--</security:authorize>--%>

                <%--&lt;%&ndash;Cart&ndash;%&gt;--%>
                <%--<security:authorize  access="hasRole('ROLE_USER')">--%>
                    <%--<li><a href="myCart">My Cart </a></li>--%>
                <%--</security:authorize>--%>
                <%--&lt;%&ndash;Cart&ndash;%&gt;--%>
                <%--&lt;%&ndash;SIGN_UP&ndash;%&gt;--%>
                <%--<security:authorize access="!hasAnyRole('ROLE_ADMIN', 'ROLE_USER')">--%>
                <%--<li>--%>
                    <%--<a href="#registryModal" data-toggle="modal">Sign Up</a>--%>
                    <%--<div class="modal fade" id="registryModal" tabindex="-1">--%>
                        <%--<div class="modal-dialog modal-sm">--%>
                            <%--<div class="modal-content">--%>
                                <%--<div class="modal-header">--%>
                                    <%--<button class="close" data-dismiss="modal">x</button>--%>
                                    <%--<h4 class="modal-title" align="center">Welcome! Please registry and login, have fun!</h4>--%>
                                <%--</div>--%>
                                <%--<div class="modal-body">--%>
                                    <%--<sf:form action="save" method="post" modelAttribute="nullUser">--%>
                                        <%--Email--%>
                                        <%--<br>--%>
                                        <%--<sf:input path="email"></sf:input>--%>
                                        <%--<sf:errors path="email"></sf:errors>--%>
                                        <%--<br>--%>
                                        <%--Username--%>
                                        <%--<br>--%>
                                        <%--<sf:input path="username"></sf:input>--%>
                                        <%--<sf:errors path="username"></sf:errors>--%>
                                        <%--<br>--%>
                                        <%--Password--%>
                                        <%--<br>--%>
                                        <%--<sf:password path="password"></sf:password>--%>
                                        <%--<sf:errors path="password"></sf:errors>--%>
                                        <%--<br>--%>
                                        <%--<input type="submit" value="Registry">--%>
                                        <%--<input type="hidden"--%>
                                               <%--name="${_csrf.parameterName}"--%>
                                               <%--value="${_csrf.token}"/>--%>
                                    <%--</sf:form>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                <%--</li>--%>
                <%--</security:authorize>--%>
                <%--&lt;%&ndash;SIGN_UP&ndash;%&gt;--%>
                <%--&lt;%&ndash;LOG_IN&ndash;%&gt;--%>
                <%--<security:authorize access="!hasAnyRole('ROLE_USER','ROLE_ADMIN')">--%>
                <%--<li>--%>
                    <%--<a href="#loginModal" data-toggle="modal">Log In</a>--%>
                    <%--<div class="modal fade" id="loginModal" tabindex="-1">--%>
                        <%--<div class="modal-dialog modal-sm">--%>
                            <%--<div class="modal-content">--%>
                                <%--<div class="modal-header">--%>
                                    <%--<button class="close" data-dismiss="modal">x</button>--%>
                                    <%--<h4 class="modal-title" align="center">Log In</h4>--%>
                                <%--</div>--%>
                                <%--<div class="modal-body">--%>
                                    <%--<form action="/login" method="post">--%>
                                        <%--Username--%>
                                        <%--<br>--%>
                                        <%--<input type="text" name="username">--%>
                                        <%--<br>--%>
                                        <%--Password--%>
                                        <%--<br>--%>
                                        <%--<input type="password" name="password">--%>
                                        <%--<br>--%>
                                        <%--<br>--%>
                                        <%--<input type="submit" value="Sign In">--%>
                                        <%--<input type="hidden"--%>
                                               <%--name="${_csrf.parameterName}"--%>
                                               <%--value="${_csrf.token}"/>--%>
                                    <%--</form>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                <%--</li>--%>
                <%--</security:authorize>--%>
                <%--&lt;%&ndash;SIGN_IN&ndash;%&gt;--%>
                <%--&lt;%&ndash;LOGOUT&ndash;%&gt;--%>
                <%--<security:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_USER')">--%>
                    <%--<li>--%>
                        <%--<a href="/logout">Log Out</a>--%>
                    <%--</li>--%>
                <%--</security:authorize>--%>
                <%--&lt;%&ndash;LOGOUT&ndash;%&gt;--%>
            <%--</ul>--%>
        <%--</div>--%>
     <%--</div>--%>
<%--</nav>--%>
<%--/TOP-MENU--%>
<nav class="navbar navbar-expand-lg navbar-light bg-info">
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
                            <input class="form-control mr-sm-2" id="searchInput" type="text" placeholder="Search" aria-label="Search">
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