<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="tempates/header.jsp"%>

<sf:form method="post" modelAttribute="userInfo" action="toConfirmOrder">
<h2>Enter delivery information:</h2>

            Name *
            <br>
            <sf:input path="name" value="${userInfo.name}"/>
            <br>
            <sf:errors path="name"></sf:errors>
            <br>
            Phone
            <br>
            <td><sf:input path="phone" value="${userInfo.phone}"/></td>
            <sf:errors path="phone"></sf:errors>
            <br>
            Address*
            <br>
            <sf:input path="address" value="${userInfo.address}"/>
            <sf:errors path="address"></sf:errors>

            &nbsp;
             <br>
             <input type="submit" value="Submit" />
             <input type="reset" value="Reset" />
            <input type="hidden"
                   name="${_csrf.parameterName}"
                   value="${_csrf.token}"/>
</sf:form>

<%@include file="tempates/footer.jsp"%>