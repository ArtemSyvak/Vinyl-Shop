<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="tempates/header.jsp"%>

<h2>Регистрация</h2>



    <%--<form action="save" method="post">--%>
        <%--<input type="text" name="username">--%>
        <%--<input type="password" name="password">--%>
        <%--<input type="submit">--%>
        <%--<input type="hidden"--%>
               <%--name="${_csrf.parameterName}"--%>
               <%--value="${_csrf.token}"/>--%>
    <%--</form>--%>

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


    <a href="toLogin">Log in</a>
<form action="/logout" method="post">
    <input type="submit" value="Log out">
    <input type="hidden"
           name="${_csrf.parameterName}"
           value="${_csrf.token}"/>
</form>
<security:authorize  access="hasRole('ROLE_ADMIN')">
    <a href="admin/admin_page">admin Page</a>
</security:authorize>


<%@include file="tempates/footer.jsp"%>