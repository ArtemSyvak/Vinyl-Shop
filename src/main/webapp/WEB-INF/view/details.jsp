<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="tempates/header.jsp"%>

<%--hello!--%>
<%--<div class="divProductDetails">--%>
    <%--<b>Artist:</b> <td>${product.artist}</td><br>--%>
    <%--<b>Album:</b> <td>${product.productName}</td><br>--%>
    <%--<b>Genre:</b> <td>${product.genre}</td><br>--%>
    <%--<b>Release year:</b> <td>${product.releaseYear}</td><br>--%>
    <%--<b>Description:</b> <td>${product.description}</td><br>--%>
    <%--<b>Price:</b> <td>${product.price}</td>--%>

    <%--&lt;%&ndash;<a href="${pageContext.request.contextPath}/addToCart?id=${product.id}">&ndash;%&gt;--%>
        <%--&lt;%&ndash;Buy Now</a>&ndash;%&gt;--%>

    <%--<security:authorize access="hasAnyRole('ROLE_USER', 'ROLE_ADMIN')">--%>
        <%--<a href="${pageContext.request.contextPath}/addToCart?id=${product.id}">--%>
            <%--<i class="fa fa-shopping-cart" aria-hidden="true"></i>--%>
        <%--</a>--%>
    <%--</security:authorize>--%>
    <%--<security:authorize access="!hasAnyRole('ROLE_USER')">--%>
        <%--<a href="#registryModal" data-toggle="modal">--%>
            <%--<i class="fa fa-shopping-cart" aria-hidden="true"></i>--%>
        <%--</a>--%>
        <%--<div class="modal fade" id="registryModal" tabindex="-1">--%>
            <%--<div class="modal-dialog modal-sm">--%>
                <%--<div class="modal-content">--%>
                    <%--<div class="modal-header">--%>
                        <%--<button class="close" data-dismiss="modal">x</button>--%>
                    <%--</div>--%>
                    <%--<div class="modal-body">--%>
                        <%--<sf:form action="save" method="post" modelAttribute="nullUser">--%>
                            <%--Email--%>
                            <%--<br>--%>
                            <%--<sf:input path="email"></sf:input>--%>
                            <%--<sf:errors path="email"></sf:errors>--%>
                            <%--<br>--%>
                            <%--Password--%>
                            <%--<br>--%>
                            <%--<sf:password path="password"></sf:password>--%>
                            <%--<sf:errors path="password"></sf:errors>--%>
                            <%--<br>--%>
                            <%--<br>--%>
                            <%--<input type="submit" value="Registry">--%>
                            <%--<input type="hidden"--%>
                                   <%--name="${_csrf.parameterName}"--%>
                                   <%--value="${_csrf.token}"/>--%>
                        <%--</sf:form>--%>
                    <%--</div>--%>
                <%--</div>--%>
            <%--</div>--%>
        <%--</div>--%>
    <%--</security:authorize>--%>

<%--</div>--%>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-3">
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
                        <li class="nav-item col-md-5 col-sm-2">

                        </li>
                        <li class="nav-item col-md-3 col-sm-6"><a href="https://www.last.fm/music/${product.artist}" class="nav-link">
                            <i class="fa fa-lastfm-square" aria-hidden="true"></i></a></li>
                        <li class="nav-item">&nbsp</li>
                        <li class="nav-item col-md-3 col-sm-3"><a href="${pageContext.request.contextPath}/addToCart?id=${product.id}" class="nav-link">
                            <i class="fa fa-shopping-cart" aria-hidden="true"></i></a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <ul class="list-group"style="margin-top: 10px">
                <li class="list-group-item">
                    <h4>Description</h4>
                    <hr>
                    <p>${product.description}</p>
                </li>
            </ul>
        </div>
    </div>
</div>

<%@include file="tempates/footer.jsp"%>