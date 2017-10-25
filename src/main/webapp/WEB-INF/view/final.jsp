<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="tempates/header.jsp"%>

<h2>Thank you for your shopping!</h2><br>
<h2>Your order is #${order.orderId}</h2><br>
<h2><a href="products">Go back to the catalog</a></h2>

<%@include file="tempates/footer.jsp"%>