<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

    <%--<form action="/login" method="post">--%>
        <%--<input type="text" name="username">--%>
        <%--<input type="password" name="password">--%>
        <%--<input type="submit">--%>
        <%--<input type="hidden"--%>
               <%--name="${_csrf.parameterName}"--%>
               <%--value="${_csrf.token}"/>--%>
    <%--</form>--%>

    <sf:form action="/login" method="post" modelAttribute="">

    </sf:form>

</body>
</html>
