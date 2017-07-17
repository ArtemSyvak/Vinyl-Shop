<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="tempates/header.jsp"%>

<sf:form method="POST" modelAttribute="userInfo"
           action="${pageContext.request.contextPath}/toConfirmOrder">

    <table>
        <tr>
            <td>Name *</td>
            <td><sf:input path="name" /></td>
            <br>
            <sf:errors path="name"></sf:errors>
            <%--<td><form:errors path="name" class="error-message" /></td>--%>
        </tr>

        <tr>
            <td>Phone *</td>
            <td><sf:input path="phone" /></td>
            <br>
            <sf:errors path="phone"></sf:errors>
            <%--<td><form:errors path="phone" class="error-message" /></td>--%>
        </tr>

        <tr>
            <td>Address *</td>
            <td><sf:input path="address" /></td>
            <br>
            <sf:errors path="address"></sf:errors>
            <%--<td><form:errors path="address" class="error-message" /></td>--%>
        </tr>

        <tr>
            <td>&nbsp;</td>
            <td><input type="submit" value="Submit" /> <input type="reset"
                                                              value="Reset" /></td>
        </tr>
    </table>

</sf:form>

<%@include file="tempates/footer.jsp"%>