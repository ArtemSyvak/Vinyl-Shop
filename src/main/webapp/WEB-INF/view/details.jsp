<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="tempates/header.jsp"%>

hello!
<div class="divProductDetails">
    <b>Artist:</b> <td>${product.artist}</td><br>
    <b>Album:</b> <td>${product.productName}</td><br>
    <b>Genre:</b> <td>${product.genre}</td><br>
    <b>Release year:</b> <td>${product.releaseYear}</td><br>
    <b>Description:</b> <td>${product.description}</td><br>
    <b>Price:</b> <td>${product.price}</td>
    <a href="${pageContext.request.contextPath}/addToCart?id=${product.id}">
        Buy Now</a>

</div>

<%@include file="tempates/footer.jsp"%>