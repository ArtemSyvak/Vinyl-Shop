<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Nikita
  Date: 12-Jul-17
  Time: 7:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <sf:form modelAttribute="product" action="saveProduct" method="post">
        Name <sf:input path="productName"></sf:input><br>
        Artist: <sf:input path="artist"></sf:input><br>
        Genre: <sf:input path="genre"></sf:input><br>
        Description: <sf:input path="description"></sf:input><br>
        Price: <sf:input path="price"></sf:input><br>
        <input type="submit">
        <input type="hidden"
               name="${_csrf.parameterName}"
               value="${_csrf.token}"/>
    </sf:form>
</body>
</html>
