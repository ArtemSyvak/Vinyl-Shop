<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="tempates/header.jsp"%>

Hello!

<div class="page-title">Confirmation</div>



<div class="customer-info-container">
    <h3>Customer Information:</h3>
    <ul>
        <li>Name: ${wrapper.orderInfo.customerName}</li>
        <li>Surname: ${wrapper.orderInfo.customerSurname}</li>
        <li>Email: ${wrapper.orderInfo.customerEmail}</li>
        <li>Phone: ${wrapper.orderInfo.customerPhone}</li>
        <li>Address: ${wrapper.orderInfo.customerAddress}</li>
    </ul>
    <h3>Order Information:</h3>
    <ul>
        <li>Comment: ${wrapper.orderInfo.comment}</li>
        <li>Payment method: ${wrapper.orderInfo.payment}</li>
    </ul>
    <h3>Cart Summary:</h3>
    <ul>
        <li>Quantity: ${cartInfo.quantityTotal}</li>
        <li>Total: <span class="total">${cartInfo.amountTotal}</span>

    </ul>
</div>

<form method="POST" action="${pageContext.request.contextPath}/confirmOrder">
    <a href="${pageContext.request.contextPath}/myCart">Edit Cart</a>
    <a href="${pageContext.request.contextPath}/toUserForm">Edit Address Info</a>
    <input type="submit" value="Confirm Order">
    <input type="hidden"
           name="${_csrf.parameterName}"
           value="${_csrf.token}"/>
</form>
<br>
<br>
<br>
<%@include file="tempates/footer.jsp"%>