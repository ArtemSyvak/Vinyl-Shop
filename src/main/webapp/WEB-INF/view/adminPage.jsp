<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<sf:form action="saveProduct" modelAttribute="nullProduct" method="post">
    Album
    <br>
    <sf:input path="productName"></sf:input>
    <br>
    Artist
    <br>
    <sf:input path="genre"></sf:input>
    <br>
    Genre
    <br>
    <sf:input path="artist"></sf:input>
    <br>
    Year
    <br>
    <sf:input path="releaseYear"></sf:input>
    <br>
    Description
    <br>
    <sf:input path="description"></sf:input>
    <br>
    Price
    <br>
    <sf:input path="price"></sf:input>
    <%--<br>--%>
    <%--Image--%>
    <%--<br>--%>
    <%--<sf:input path="image"></sf:input>--%>
    <input type="submit" value="Add">
</sf:form>
</body>
</html>
