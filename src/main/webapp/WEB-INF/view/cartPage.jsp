<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="tempates/header.jsp"%>

<c:choose>
    <c:when test="${cartForm.cartLines[0]==null}">
        <h2 align="center">Your cart is empty :(</h2>
        <br>
        <h2 align="center"><a href="/products" class="btn btn-info">Products</a></h2>
    </c:when>
    <c:otherwise>
        <h2 align="center">Your cart</h2>
        <c:forEach items="${cartForm.cartLines}" var="cartLineInfo" varStatus="varStatus" step="3">
            <div class="container">

                <div class="row">
                    <div class="col-md-4">
                        <div class="card">
                            <div class="card-body">
                                <ul class="nav flex-column">
                                    <li class="nav-item">Id: ${cartLineInfo.productInfo.productId}</li>
                                    <li class="nav-item">Name: ${cartLineInfo.productInfo.productName}</li>
                                    <li class="nav-item">Price: ${cartLineInfo.productInfo.price}</li>
                                    <li class="nav-item">Quantity: ${cartLineInfo.quantity}</li>
                                    <li class="nav-item">Subtotal: ${cartLineInfo.amount}</li>
                                    <li class="nav-item">
                                        <a href="${pageContext.request.contextPath}/removeFromCart?id=${cartLineInfo.productInfo.productId}">
                                           Remove from cart <i class="fa fa-trash" aria-hidden="true"></i>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <c:choose>
                        <c:when test="${cartForm.cartLines[varStatus.index+1] == null}">

                        </c:when>
                        <c:otherwise>
                    <div class="col-md-4">
                        <div class="card">
                            <div class="card-body">
                                <ul class="nav flex-column">
                                    <li class="nav-item">Id: ${cartForm.cartLines[varStatus.index+1].productInfo.productId}</li>
                                    <li class="nav-item">Name: ${cartForm.cartLines[varStatus.index+1].productInfo.productName}</li>
                                    <li class="nav-item">Price: ${cartForm.cartLines[varStatus.index+1].productInfo.price}</li>
                                    <li class="nav-item">Quantity: ${cartForm.cartLines[varStatus.index+1].quantity}</li>
                                    <li class="nav-item">Subtotal: ${cartForm.cartLines[varStatus.index+1].amount}</li>
                                    <li class="nav-item">
                                        <a href="${pageContext.request.contextPath}/removeFromCart?id=${cartForm.cartLines[varStatus.index+1].productInfo.productId}">
                                            Remove from cart <i class="fa fa-trash" aria-hidden="true"></i>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${cartForm.cartLines[varStatus.index+2] == null}">

                        </c:when>
                        <c:otherwise>
                            <div class="col-md-4">
                                <div class="card">
                                    <div class="card-body">
                                        <ul class="nav flex-column">
                                            <li class="nav-item">Id: ${cartForm.cartLines[varStatus.index+2].productInfo.productId}</li>
                                            <li class="nav-item">Name: ${cartForm.cartLines[varStatus.index+2].productInfo.productName}</li>
                                            <li class="nav-item">Price: ${cartForm.cartLines[varStatus.index+2].productInfo.price}</li>
                                            <li class="nav-item">Quantity: ${cartForm.cartLines[varStatus.index+2].quantity}</li>
                                            <li class="nav-item">Subtotal: ${cartForm.cartLines[varStatus.index+2].amount}</li>
                                            <li class="nav-item">
                                                <a href="${pageContext.request.contextPath}/removeFromCart?id=${cartForm.cartLines[varStatus.index+2].productInfo.productId}">
                                                    Remove from cart <i class="fa fa-trash" aria-hidden="true"></i>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </c:forEach>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <ul class="nav flex-column">
                            <li class="nav-item"><h4 align="center">Total quantity: ${cartForm.quantityTotal}</h4></li>
                            <li class="nav-item"><h4 align="center">Total cost: ${cartForm.amountTotal}</h4></li>
                            <li class="nav-item">
                                <form method="POST"
                                      action="${pageContext.request.contextPath}/toUserForm">
                                    <button type="submit" class="btn btn-outline-info btn-block">Create order</button>
                                    <input type="hidden"
                                           name="${_csrf.parameterName}"
                                           value="${_csrf.token}"/>
                                </form>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </c:otherwise>
</c:choose>
<br><br>
<%@include file="tempates/footer.jsp"%>