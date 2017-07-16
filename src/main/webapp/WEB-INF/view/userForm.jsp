<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="tempates/header.jsp"%>

<form:form method="POST" modelAttribute="userInfo"
           action="${pageContext.request.contextPath}/toConfirmOrder">

    <table>
        <tr>
            <td>Name *</td>
            <td><form:input path="name" /></td>
            <%--<td><form:errors path="name" class="error-message" /></td>--%>
        </tr>

        <tr>
            <td>Phone *</td>
            <td><form:input path="phone" /></td>
            <%--<td><form:errors path="phone" class="error-message" /></td>--%>
        </tr>

        <tr>
            <td>Address *</td>
            <td><form:input path="address" /></td>
            <%--<td><form:errors path="address" class="error-message" /></td>--%>
        </tr>

        <tr>
            <td>&nbsp;</td>
            <td><input type="submit" value="Submit" /> <input type="reset"
                                                              value="Reset" /></td>
        </tr>
    </table>

</form:form>

<%@include file="tempates/footer.jsp"%>