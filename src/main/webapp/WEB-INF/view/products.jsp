<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="tempates/header.jsp"%>

<div class="container">
    <div class="row">
        <div class="col-md-4">
            <ul class="list-group" style="margin-top: 10px">
                <li class="list-group-item list-group-item-info"><a class="list-group-link" href="genre/alternative">Alternative</a></li>
                <li class="list-group-item list-group-item-info"><a class="list-group-link" href="genre/blues">Blues</a></li>
                <li class="list-group-item list-group-item-info"><a class="list-group-link" href="genre/electronic">Electronic</a></li>
                <li class="list-group-item list-group-item-info"><a class="list-group-link" href="genre/experimental">Experimental</a></li>
                <li class="list-group-item list-group-item-info"><a class="list-group-link" href="genre/indie">Indie</a></li>
                <li class="list-group-item list-group-item-info"><a class="list-group-link" href="genre/hiphop">Hip-Hop</a></li>
                <li class="list-group-item list-group-item-info"><a class="list-group-link" href="genre/rock">Rock</a></li>
                <li class="list-group-item list-group-item-info"><a class="list-group-link" href="genre/chillout">Chillout</a></li>
                <li class="list-group-item list-group-item-info"><a class="list-group-link" href="genre/minimal">Minimal</a></li>
                <li class="list-group-item list-group-item-info"><a class="list-group-link" href="genre/techno">Techno</a></li>
                <li class="list-group-item list-group-item-info"><a class="list-group-link" href="genre/edm">EDM</a></li>
                <li class="list-group-item list-group-item-info"><a class="list-group-link" href="genre/drum">Drum</a></li>
                <li class="list-group-item list-group-item-info"><a class="list-group-link" href="genre/pop">Pop</a></li>
            </ul>
        </div>
        <div class="col-md-8">
            <div class="row justify-content-center">
                <c:forEach var="product" items="${page.content}" varStatus="count" step="3">
                    <div class="col-md-4">
                        <div class="card" style="width: 15rem;">
                            <img class="card-img-top" src="${product.image}" alt="product image">
                            <div class="card-body">
                                <ul class="nav flex-column">
                                    <li class="nav-item">Artist: ${product.artist}</li>
                                    <li class="nav-item">Album: ${product.productName}</li>
                                    <li class="nav-item">Genre: ${product.genre}</li>
                                    <li class="nav-item">Price: ${product.price}</li>
                                </ul>
                                <ul class="nav row">
                                    <li class="nav-item col-md-2 col-sm-2"><a href="details-${product.id}" class="nav-link">
                                        <i class="fa fa-info" aria-hidden="true"></i></a></li>
                                    <li class="nav-item col-md-6 col-sm-6"><a href="https://www.last.fm/music/${product.artist}" class="nav-link">
                                        <i class="fa fa-lastfm-square" aria-hidden="true"></i></a></li>
                                    <li class="nav-item">&nbsp</li>
                                    <li class="nav-item col-md-3 col-sm-3"><a href="${pageContext.request.contextPath}/addToCart?id=${product.id}" class="nav-link">
                                        <i class="fa fa-shopping-cart" aria-hidden="true"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <c:choose>
                        <c:when test="${page.content[count.index+1] == null}">
                            <div class="col-md-4"></div>
                        </c:when>
                        <c:otherwise>
                            <div class="col-md-4">
                                <div class="card" style="width: 15rem;">
                                    <img class="card-img-top" src="${page.content[count.index+1].image}" alt="product image">
                                    <div class="card-body">
                                        <ul class="nav flex-column">
                                            <li class="nav-item">Artist: ${page.content[count.index+1].artist}</li>
                                            <li class="nav-item">Album: ${page.content[count.index+1].productName}</li>
                                            <li class="nav-item">Genre: ${page.content[count.index+1].genre}</li>
                                            <li class="nav-item">Price: ${page.content[count.index+1].price}</li>
                                        </ul>
                                        <ul class="nav row">
                                            <li class="nav-item col-md-2 col-sm-2"><a href="details-${page.content[count.index+1].id}" class="nav-link">
                                                <i class="fa fa-info" aria-hidden="true"></i></a></li>
                                            <li class="nav-item col-md-6 col-sm-6"><a href="https://www.last.fm/music/${page.content[count.index+1].artist}" class="nav-link">
                                                <i class="fa fa-lastfm-square" aria-hidden="true"></i></a></li>
                                            <li class="nav-item">&nbsp</li>
                                            <li class="nav-item col-md-3 col-sm-3"><a href="${pageContext.request.contextPath}/addToCart?id=${page.content[count.index+1].id}" class="nav-link">
                                                <i class="fa fa-shopping-cart" aria-hidden="true"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${page.content[count.index+2]==null}"><div class="col-md-4"></div></c:when>
                        <c:otherwise>
                            <div class="col-md-4">
                                <div class="card" style="width: 15rem;">
                                    <img class="card-img-top" src="${page.content[count.index+2].image}" alt="product image">
                                    <div class="card-body">
                                        <ul class="nav flex-column">
                                            <li class="nav-item">Artist: ${page.content[count.index+2].artist}</li>
                                            <li class="nav-item">Album: ${page.content[count.index+2].productName}</li>
                                            <li class="nav-item">Genre: ${page.content[count.index+2].genre}</li>
                                            <li class="nav-item">Price: ${page.content[count.index+2].price}</li>
                                        </ul>
                                        <ul class="nav row">
                                            <li class="nav-item col-md-2 col-sm-2"><a href="details-${page.content[count.index+2].id}" class="nav-link">
                                                <i class="fa fa-info" aria-hidden="true"></i></a></li>
                                            <li class="nav-item col-md-6 col-sm-6"><a href="https://www.last.fm/music/${page.content[count.index+2].artist}" class="nav-link">
                                                <i class="fa fa-lastfm-square" aria-hidden="true"></i></a></li>
                                            <li class="nav-item">&nbsp</li>
                                            <li class="nav-item col-md-3 col-sm-3"><a href="${pageContext.request.contextPath}/addToCart?id=${page.content[count.index+2].id}" class="nav-link">
                                                <i class="fa fa-shopping-cart" aria-hidden="true"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </div>
            <div class="row justify-content-center">
                <div class="col-md-4"><h4 align="center">Viewing page ${page.number + 1} of ${page.totalPages}</h4></div>
            </div>
            <div class="row justify-content-center">
                <div class="col-md-4">
                    <h4 align="center">
                        <c:forEach var="i" begin="1" end="${page.totalPages}">
                            <c:choose>
                                <c:when test="${i == page.number + 1}">${i}</c:when>
                                <c:otherwise><a href="?page=${i - 1}">${i}</a></c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </h4>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="tempates/footer.jsp"%>