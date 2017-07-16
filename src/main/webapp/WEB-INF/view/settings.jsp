<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="tempates/header.jsp"%>

<a href="myPage">My Orders</a>
<a href="#">My Settings</a>

Email: <input type="text" value="${user.email}">



<%@include file="tempates/footer.jsp"%>