<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="tempates/header.jsp"%>

<a href="myPage">My Orders</a>
<a href="#">My Settings</a>
<sf:form method="post" modelAttribute="userSet" action="${pageContext.request.contextPath}/saveSettings">
    <table>
        <tr>
            <td>Email:</td>
            <td><sf:input path="email"  value="${userSet.email}"></sf:input></td>
            <br>
        </tr>

        <tr>
            <td>Full name:</td>
            <td><sf:input path="fullName" value="${userSet.fullName}"></sf:input></td>
            <br>
        </tr>
        <tr>
            <td>Phone:</td>
            <td><sf:input path="phone" value="${userSet.phone}"></sf:input></td>
            <br>
        </tr>
        <tr>
            <td>Address:</td>
            <td><sf:input path="address" value="${userSet.address}"></sf:input></td>
            <br>
        </tr>
        <tr>
            <td>Password:</td>
            <td><form:password path="password"></form:password></td>
            <br>
        </tr>
        <%--<tr>--%>
            <%--<td>Password:</td>--%>
            <%--<td><sf:input path="address" type="text" value="${user.address}"></sf:input></td>--%>
            <%--<br>--%>
        <%--</tr>--%>

        <tr>
            <td>&nbsp;</td>
            <td><input type="submit" value="Save changes" /></td>
        </tr>
    </table>
</sf:form>

<br>
<br>
<br>
<br>
<br>

<%@include file="tempates/footer.jsp"%>