<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="tempates/header.jsp"%>

<sf:form method="post" modelAttribute="userInfo" action="toConfirmOrder">

    <div class="container" style="margin-top: 10px">
        <div class="row justify-content-center">
            <div class="col-md-3 delivery-info">
                <br>
                <h5 align="center">Enter delivery information:</h5>
                <div class="form-group">
                    <label for="name">Name *</label>
                    <sf:input path="name" value="${userInfo.name}" id="name" cssClass="form-control"/>
                    <sf:errors path="name"></sf:errors>
                </div>
                <div class="form-group">
                    <label for="phone">Phone</label>
                    <sf:input path="phone" value="${userInfo.phone}" id="phone" cssClass="form-control"/>
                    <sf:errors path="phone"></sf:errors>
                </div>
                <div class="form-group">
                    <label for="address">Address *</label>
                    <sf:input path="address" value="${userInfo.phone}" id="address" cssClass="form-control"/>
                    <sf:errors path="address"></sf:errors>
                </div>
                <button type="submit" class="btn btn-info">Enter</button>
                <button type="reset" class="btn btn-info">Reset</button>
                <input type="hidden"
                       name="${_csrf.parameterName}"
                       value="${_csrf.token}"/>
            </div>
        </div>
    </div>

</sf:form>

<%@include file="tempates/footer.jsp"%>