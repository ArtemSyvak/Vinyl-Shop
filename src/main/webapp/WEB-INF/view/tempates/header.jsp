
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
    <link rel="stylesheet" href="/static/styles/main.css">
</head>
<body>

<%--TOP-MENU--%>
<nav class="navbar navbar-default">
    <div class="container">
        <div class="navbar-header">
            <a href="#" class="navbar-brand">Vinyl Shop</a>
        </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li><a href="#">Catalog</a></li>
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
                <security:authorize access="!hasAnyRole('ROLE_ADMIN', 'ROLE_USER')">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                            Sign Up <span class="caret-handle"></span></a>
                        <ul class="dropdown-menu">
                            <sf:form action="save" method="post" modelAttribute="nullUser">
                                <c:lable>Email</c:lable>
                                <br>
                                <sf:input path="email"></sf:input>
                                <sf:errors path="email"></sf:errors>
                                <br>
                                <c:lable>Username</c:lable>
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
                        </ul>
                    </li>
                </security:authorize>

                <security:authorize access="!hasAnyRole('ROLE_USER','ROLE_ADMIN')">
                    <li class="dropdown">
                        <a href="#"class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Log In</a>
                        <ul class="dropdown-menu">
                            <form action="/login" method="post">
                                <input type="text" placeholder="username" name="username">
                                <input type="password" placeholder="password" name="password">
                                <input type="submit" value="Sign In">
                                <input type="hidden"
                                       name="${_csrf.parameterName}"
                                       value="${_csrf.token}"/>
                            </form>
                        </ul>
                    </li>
                </security:authorize>

                <security:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_USER')">
                    <li>
                        <a href="/logout">Log Out</a>
                            <%--УБРАЛ ФОРМУ КОТОРАЯ НИЖЕ,--%>
                            <%--ЧТО Б НОРМ ВЫГЛЯДЕЛО, --%>
                            <%--ИБО КНОПКА ВЫГЛЯДЕЛА КОНЧЕНО, --%>
                            <%--LOGOUT РАБОТАЕТ НОРМАЛЬНО, ПРОВЕРИШЬ))--%>
                            <%--<form action="/logout" method="post">--%>
                            <%--<input type="submit" value="Log out">--%>
                            <%--<input type="hidden"--%>
                            <%--name="${_csrf.parameterName}"--%>
                            <%--value="${_csrf.token}"/>--%>
                            <%--</form>--%>
                    </li>
                </security:authorize>
            </ul>
        </div>
    </div>
</nav>
<%--/TOP-MENU--%>
