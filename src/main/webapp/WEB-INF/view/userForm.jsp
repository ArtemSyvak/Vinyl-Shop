<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="tempates/header.jsp"%>

<sf:form method="post" action="toConfirmOrder" modelAttribute="wrapper">

    <div class="container" style="margin-top: 10px">
        <div class="row justify-content-center">
            <div class="col-md-3 delivery-info">
                <br>
                <h5 align="center">Enter delivery information:</h5>
                <div class="form-group">
                    <label for="customerName">First name *</label>
                    <sf:input path="orderInfo.customerName" value="${orderInfo.customerName}" id="customerName" cssClass="form-control"/>
                    <sf:errors path="orderInfo.customerName"></sf:errors>
                </div><div class="form-group">
                    <label for="customerSurname">Surname *</label>
                    <sf:input path="orderInfo.customerSurname" value="${orderInfo.customerSurname}" id="customerSurname" cssClass="form-control"/>
                    <sf:errors path="orderInfo.customerSurname"></sf:errors>
                </div>
                <div class="form-group">
                    <label for="customerPhone">Phone</label>
                    <sf:input path="orderInfo.customerPhone" value="${orderInfo.customerPhone}" id="customerPhone" cssClass="form-control"/>
                    <sf:errors path="orderInfo.customerPhone"></sf:errors>
                </div>
                <div class="form-group">
                    <label for="customerAddress">Address *</label>
                    <sf:input path="orderInfo.customerAddress" value="${orderInfo.customerAddress}" id="customerAddress" cssClass="form-control"/>
                    <sf:errors path="orderInfo.customerAddress"></sf:errors>
                </div>
                <div class="form-group">
                    <label for="customerEmail">Email *</label>
                    <sf:input path="orderInfo.customerEmail" value="${orderInfo.customerEmail}" id="customerEmail" cssClass="form-control" name="email"/>
                    <sf:errors path="orderInfo.customerEmail"></sf:errors>
                </div>
                <div class="form-group">
                    <label for="comment">Comment to order*</label>
                    <sf:input path="orderInfo.comment" value="${orderInfo.comment}" id="comment" cssClass="form-control"/>
                    <sf:errors path="orderInfo.comment"></sf:errors>
                </div>
                <div class="form-group">
                    <label for="payment">Payment method (Privat24, nalozhka)</label>
                    <sf:input path="orderInfo.payment" value="${orderInfo.payment}" id="payment" cssClass="form-control"/>
                    <sf:errors path="orderInfo.payment"></sf:errors>
                </div>

                <security:authorize  access="!hasRole('ROLE_USER')">
                    <div class="form-group">
                        <div class="col-auto">
                            <label data-toggle="collapse" data-target="#collapseOne" class="custom-control custom-checkbox mb-2 mr-sm-2 mb-sm-0">
                                <span class="custom-control-description">Would you like to register in our shop?</span>
                                <span class="custom-control-indicator"></span>
                                <input type="checkbox" class="custom-control-input"/>
                            </label>
                        </div>
                        <div id="collapseOne" class="panel-collapse collapse in">
                            <label for="setPassword">Password *</label>
                            <sf:input path="nullUser.password" name="password" value="${nullUser.password}" id="setPassword" cssClass="form-control"
                                      type="password"/>
                            <sf:errors path="nullUser.password"></sf:errors>
                        </div>

                    </div>
                </security:authorize>

                <button type="submit" class="btn btn-info">Enter</button>
                <button type="reset" class="btn btn-info">Reset</button>
                <input type="hidden"
                       name="${_csrf.parameterName}"
                       value="${_csrf.token}"/>
            </div>
        </div>
    </div>


    <%--//------------------------------------------------------------------%>
    <%--<sf:form method="post" modelAttribute="orderInfo" action="toConfirmOrder">--%>

        <%--<div class="container" style="margin-top: 10px">--%>
            <%--<div class="row justify-content-center">--%>
                <%--<div class="col-md-3 delivery-info">--%>
                    <%--<br>--%>
                    <%--<h5 align="center">Enter delivery information:</h5>--%>
                    <%--<div class="form-group">--%>
                        <%--<label for="customerName">First name *</label>--%>
                        <%--<sf:input path="customerName" value="${orderInfo.customerName}" id="customerName" cssClass="form-control"/>--%>
                        <%--<sf:errors path="customerName"></sf:errors>--%>
                    <%--</div><div class="form-group">--%>
                    <%--<label for="customerSurname">Surname *</label>--%>
                    <%--<sf:input path="customerSurname" value="${orderInfo.customerSurname}" id="customerSurname" cssClass="form-control"/>--%>
                    <%--<sf:errors path="customerSurname"></sf:errors>--%>
                <%--</div>--%>
                    <%--<div class="form-group">--%>
                        <%--<label for="customerPhone">Phone</label>--%>
                        <%--<sf:input path="customerPhone" value="${orderInfo.customerPhone}" id="customerPhone" cssClass="form-control"/>--%>
                        <%--<sf:errors path="customerPhone"></sf:errors>--%>
                    <%--</div>--%>
                    <%--<div class="form-group">--%>
                        <%--<label for="customerAddress">Address *</label>--%>
                        <%--<sf:input path="customerAddress" value="${orderInfo.customerAddress}" id="customerAddress" cssClass="form-control"/>--%>
                        <%--<sf:errors path="customerAddress"></sf:errors>--%>
                    <%--</div>--%>
                    <%--<div class="form-group">--%>
                        <%--<label for="customerEmail">Email *</label>--%>
                        <%--<sf:input path="customerEmail" value="${orderInfo.customerEmail}" id="customerEmail" cssClass="form-control"/>--%>
                        <%--<sf:errors path="customerEmail"></sf:errors>--%>
                    <%--</div>--%>
                        <%--&lt;%&ndash;<div class="form-group">&ndash;%&gt;--%>
                        <%--&lt;%&ndash;Would you like to register in our shop?&ndash;%&gt;--%>
                        <%--&lt;%&ndash;<label for="setPassword">Password *</label>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;<sf:input path="password" value="${nullUser.password}" id="setPassword" cssClass="form-control"&ndash;%&gt;--%>
                        <%--&lt;%&ndash;type="password"/>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;<sf:errors path="password"></sf:errors>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;</div>&ndash;%&gt;--%>

                    <%--<button type="submit" class="btn btn-info">Enter</button>--%>
                    <%--<button type="reset" class="btn btn-info">Reset</button>--%>
                    <%--<input type="hidden"--%>
                           <%--name="${_csrf.parameterName}"--%>
                           <%--value="${_csrf.token}"/>--%>
                <%--</div>--%>
            <%--</div>--%>
        <%--</div>--%>




</sf:form>

<%@include file="tempates/footer.jsp"%>