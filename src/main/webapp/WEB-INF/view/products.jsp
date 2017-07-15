<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:forEach var="product" items="${page.content}">
    <div style="width: 400px; height: 300px; background-color: beige"><tr>
        <b>Artist:</b> <td>${product.artist}</td><br>
        <b>Album:</b> <td>${product.productName}</td><br>
        <b>Genre:</b> <td>${product.genre}</td><br>
        <b>Release year:</b> <td>${product.releaseYear}</td><br>
        <b>Description:</b> <td>${product.description}</td><br>
        <b>Price:</b> <td>${product.price}</td>

    </tr>
    </div>
</c:forEach>


<div><h3>Viewing page ${page.number + 1} of ${page.totalPages}</h3></div>
<div>
    <h3><c:forEach var="i" begin="1" end="${page.totalPages}">
        <c:choose>
            <c:when test="${i == page.number + 1}">${i}</c:when>
            <c:otherwise><a href="?page=${i - 1}">${i}</a></c:otherwise>
        </c:choose>
    </c:forEach>
    </h3>
</div>

<%@include file="tempates/footer.jsp"%>