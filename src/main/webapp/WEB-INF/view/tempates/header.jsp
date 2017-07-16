<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Vinyl Shop</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css
      " integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css
      " integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
    <!--Style.CSS  -->
    <link rel="stylesheet" href="/style/main.css">
</head>
<body>

<%--TOP-MENU--%>
<nav class="navbar navbar-inverse" >
    <div class="container">
        <div class="navbar-header">
            <a href="#" class="navbar-brand">Vinyl Shop</a>
        </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li><a href="products">Catalog</a></li>
                <li><a href="#">Top Sels</a></li>
                <li><a href="#">About Us</a></li>

                <security:authorize  access="hasRole('ROLE_ADMIN')">
                    <li><a href="admin/admin_page">Add Product </a></li>
                </security:authorize>

                <form class="navbar-form navbar-left" role="search">
                    <div class="form-group">
                        <i></i>
                        <input type="text" class="form-control" placeholder="Search">
                    </div>
                    <button type="submit"class="btn btn-default">Submit</button>
                </form>
                <%--Cart--%>
                <security:authorize  access="hasRole('ROLE_USER')">
                    <li><a href="myCart">My Cart </a></li>
                </security:authorize>
                <%--Cart--%>
                <%--SIGN_UP--%>
                <security:authorize access="!hasAnyRole('ROLE_ADMIN', 'ROLE_USER')">
                <li>
                    <a href="#registryModal" data-toggle="modal">Sign Up</a>
                    <div class="modal fade" id="registryModal" tabindex="-1">
                        <div class="modal-dialog modal-sm">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button class="close" data-dismiss="modal">x</button>
                                    <h4 class="modal-title" align="center">Registration</h4>
                                </div>
                                <div class="modal-body">
                                    <sf:form action="save" method="post" modelAttribute="nullUser">
                                        Email
                                        <br>
                                        <sf:input path="email"></sf:input>
                                        <sf:errors path="email"></sf:errors>
                                        <br>
                                        Username
                                        <br>
                                        <sf:input path="username"></sf:input>
                                        <sf:errors path="username"></sf:errors>
                                        <br>
                                        Password
                                        <br>
                                        <sf:password path="password"></sf:password>
                                        <sf:errors path="password"></sf:errors>
                                        <br>
                                        <input type="submit" value="Registry">
                                        <input type="hidden"
                                               name="${_csrf.parameterName}"
                                               value="${_csrf.token}"/>
                                    </sf:form>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>
                </security:authorize>
                <%--SIGN_UP--%>
                <%--LOG_IN--%>
                <security:authorize access="!hasAnyRole('ROLE_USER','ROLE_ADMIN')">
                <li>
                    <a href="#loginModal" data-toggle="modal">Log In</a>
                    <div class="modal fade" id="loginModal" tabindex="-1">
                        <div class="modal-dialog modal-sm">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button class="close" data-dismiss="modal">x</button>
                                    <h4 class="modal-title" align="center">Log In</h4>
                                </div>
                                <div class="modal-body">
                                    <form action="/login" method="post">
                                        Username
                                        <br>
                                        <input type="text" name="username">
                                        <br>
                                        Password
                                        <br>
                                        <input type="password" name="password">
                                        <br>
                                        <input type="submit" value="Sign In">
                                        <input type="hidden"
                                               name="${_csrf.parameterName}"
                                               value="${_csrf.token}"/>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>
                </security:authorize>
                <%--SIGN_IN--%>
                <%--LOGOUT--%>
                <security:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_USER')">
                    <li>
                        <a href="/logout">Log Out</a>
                    </li>
                </security:authorize>
                <%--LOGOUT--%>
            </ul>
        </div>
     </div>
</nav>
<%--/TOP-MENU--%>
