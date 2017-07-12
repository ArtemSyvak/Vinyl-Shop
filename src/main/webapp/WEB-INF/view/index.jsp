<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Администратор
  Date: 25.01.2017
  Time: 19:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>Регистрация</h2>
    <form action="save" method="post">
        <input type="text" name="username">
        <input type="password" name="password">
        <input type="submit">
        <input type="hidden"
               name="${_csrf.parameterName}"
               value="${_csrf.token}"/>
    </form>
    <a href="toLogin">Log in</a>
        <br>

<form action="/logout" method="post">
    <input type="submit" value="Log out">
    <input type="hidden"
           name="${_csrf.parameterName}"
           value="${_csrf.token}"/>
</form>
<security:authorize  access="hasRole('ROLE_ADMIN')">
    <a href="admin/admin_page">admin Page</a>
</security:authorize>



</body>
</html>
