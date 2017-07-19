<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="tempates/header.jsp"%>

<a href="#">My Orders</a>
<a href="mySettings">My Settings</a>

<c:forEach var="order" items="${list}" >
    <h1>Order #${order.id}</h1>
    <div class="orderInfo">
        <h3>Customer Information:</h3>
        <ul>
            <li>Name: ${order.customerName}</li>
            <li>Email: ${order.customerEmail}</li>
            <li>Phone: ${order.customerPhone}</li>
            <li>Address: ${order.customerAddress}</li>
        </ul>
        <h3>Order Summary:</h3>
        <ul>
            <li>Total: <span class="total">${order.amount}</span>

        </ul>
        <h3>Products:</h3><br>
        <ul>
            <c:forEach var="orderDetail" items="${allOrderDetails}">
                <c:if test="${orderDetail.order.id==order.id}">
                    <div class="orderDetail">
                        <b>Artist:</b> <td>${orderDetail.product.artist}</td><br>
                        <b>Album:</b> <td>${orderDetail.product.productName}</td><br>
                        <b>Genre:</b> <td>${orderDetail.product.genre}</td><br>
                        <b>Release year:</b> <td>${orderDetail.product.releaseYear}</td><br>
                        <b>Price:</b> <td>${orderDetail.product.price}</td>
                        <a href="details-${orderDetail.product.id}">See details</a>
                    </div>
                </c:if>
            </c:forEach>
        </ul>
    </div>
</c:forEach>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>

<%@include file="tempates/footer.jsp"%>