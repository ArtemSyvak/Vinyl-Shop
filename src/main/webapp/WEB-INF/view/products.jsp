<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="tempates/header.jsp"%>

<c:forEach var="product" items="${page.content}" varStatus="count" step="3">

    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <div class="divProduct">
                <b>Artist:</b> <td>${product.artist}</td><br>
                <b>Album:</b> <td>${product.productName}</td><br>
                <b>Genre:</b> <td>${product.genre}</td><br>
                <b>Release year:</b> <td>${product.releaseYear}</td><br>
                <b>Price:</b> <td>${product.price}</td>
                    <a href="${pageContext.request.contextPath}/addToCart?id=${product.id}">
                        Buy Now</a>
                    <a href="details-${product.id}">See details</a>
                </div>
            </div>
            <c:choose>
                <c:when test="${page.content[count.index+1] == null}">

                </c:when>
                <c:otherwise>
                    <div class="col-md-4">
                        <div class="divProduct">
                            <b>Artist:</b> <td>${page.content[count.index+1].artist}</td><br>
                            <b>Album:</b> <td>${page.content[count.index+1].productName}</td><br>
                            <b>Genre:</b> <td>${page.content[count.index+1].genre}</td><br>
                            <b>Release year:</b> <td>${page.content[count.index+1].releaseYear}</td><br>
                            <b>Price:</b> <td>${page.content[count.index+1].price}</td>
                            <a href="${pageContext.request.contextPath}/addToCart?id=${page.content[count.index+1].id}">
                                Buy Now</a>
                            <a href="details-${page.content[count.index+1].id}">See details</a>
                        </div>
                    </div>
                </c:otherwise>
            </c:choose>
            <c:choose>
                <c:when test="${page.content[count.index+2] == null}">

                </c:when>
                <c:otherwise>
                    <div class="col-md-4">
                        <div class="divProduct">
                            <b>Artist:</b> <td>${page.content[count.index+2].artist}</td><br>
                            <b>Album:</b> <td>${page.content[count.index+2].productName}</td><br>
                            <b>Genre:</b> <td>${page.content[count.index+2].genre}</td><br>
                            <b>Release year:</b> <td>${page.content[count.index+2].releaseYear}</td><br>
                            <b>Price:</b> <td>${page.content[count.index+2].price}</td>
                            <a href="${pageContext.request.contextPath}/addToCart?id=${page.content[count.index+2].id}">
                                Buy Now</a>
                            <a href="details-${page.content[count.index+2].id}">See details</a>
                        </div>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</c:forEach>

<div align="center"><h3>Viewing page ${page.number + 1} of ${page.totalPages}</h3></div>
<div class="pageCounter">
    <h3 align="center"><c:forEach var="i" begin="1" end="${page.totalPages}">
        <c:choose>
            <c:when test="${i == page.number + 1}">${i}</c:when>
            <c:otherwise><a href="?page=${i - 1}">${i}</a></c:otherwise>
        </c:choose>
    </c:forEach>
    </h3>
</div>

<%@include file="tempates/footer.jsp"%>