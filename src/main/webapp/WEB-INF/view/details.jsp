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

    <%--<a href="${pageContext.request.contextPath}/addToCart?id=${product.id}">--%>
        <%--Buy Now</a>--%>

    <security:authorize access="hasAnyRole('ROLE_USER', 'ROLE_ADMIN')">
        <a href="${pageContext.request.contextPath}/addToCart?id=${product.id}">
            <i class="fa fa-shopping-cart" aria-hidden="true"></i>
        </a>
    </security:authorize>
    <security:authorize access="!hasAnyRole('ROLE_USER')">
        <a href="#registryModal" data-toggle="modal">
            <i class="fa fa-shopping-cart" aria-hidden="true"></i>
        </a>
        <div class="modal fade" id="registryModal" tabindex="-1">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <div class="modal-header">
                        <button class="close" data-dismiss="modal">x</button>
                    </div>
                    <div class="modal-body">
                        <sf:form action="save" method="post" modelAttribute="nullUser">
                            Email
                            <br>
                            <sf:input path="email"></sf:input>
                            <sf:errors path="email"></sf:errors>
                            <br>
                            Password
                            <br>
                            <sf:password path="password"></sf:password>
                            <sf:errors path="password"></sf:errors>
                            <br>
                            <br>
                            <input type="submit" value="Registry">
                            <input type="hidden"
                                   name="${_csrf.parameterName}"
                                   value="${_csrf.token}"/>
                        </sf:form>
                    </div>
                </div>
            </div>
        </div>
    </security:authorize>

</div>

<%@include file="tempates/footer.jsp"%>