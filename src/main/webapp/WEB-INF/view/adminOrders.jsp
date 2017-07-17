<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="tempates/header.jsp"%>

<h2>All orders</h2>
<c:forEach var="order" items="${orderList}">

    <div class="customer-info-container">
        <h3>Customer Information:</h3>
        <ul>
            <li>Name: ${order.customerName}</li>
            <li>Email: ${order.customerEmail}</li>
            <li>Phone: ${order.customerPhone}</li>
            <li>Address: ${order.customerAddress}</li>
        </ul>
        <h3>Cart Summary:</h3>
        <ul>
            <li>Amount: <span class="total">${order.amount}</span>

        </ul>
        <br>
        <table>
            <c:forEach items="orderDetails" var="orderDetail">
                <c:if test="${orderDetail.order.id==order.id}">
                    <tr>
                        <td>${orderDetail.product.artist} - ${orderDetail.product.productName}</td>
                        <td>${orderDetail.quantity}</td>
                    </tr>
                </c:if>
            </c:forEach>

        </table>
    </div>
</c:forEach>

<%@include file="tempates/footer.jsp"%>