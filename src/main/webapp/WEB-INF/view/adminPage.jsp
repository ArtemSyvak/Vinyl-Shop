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
    Hi! you are ADMIN!!!!!

    <sf:form action="saveProduct" modelAttribute="product" method="post">
        Price
        <br>
        <sf:input path="price"></sf:input>
        <br>
        Artist
        <br>
        <sf:input path="artist"></sf:input>
        <br>
        Album
        <br>
        <sf:input path="album"></sf:input>
        <br>
        Description
        <br>
        <sf:input path="description"></sf:input>
        <br>
        <%--Order--%>
        <%--<br>--%>
        <%--<sf:input path="order"></sf:input>--%>
        <%--<br>--%>
        <br>
        <input type="submit" value="Save!!!">
    </sf:form>

</body>
</html>
