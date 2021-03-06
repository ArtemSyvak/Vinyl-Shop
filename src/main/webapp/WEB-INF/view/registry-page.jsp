<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="tempates/header.jsp"%>

    <div class="container">
        <div class="row justify-content-center"><h2>Create an account in Vinyl Shop!</h2></div>
        <div class="row justify-content-center">
            <div class="col-md-3">
                <sf:form action="save" method="post" modelAttribute="nullUser">
                    <div class="form-group">
                        <label for="createFirstname">First Name</label>
                        <sf:input path="firstname" id="createFirstname" cssClass="form-control" placeholder='First Name'></sf:input>
                        <sf:errors path="firstname"></sf:errors>
                    </div>
                    <div class="form-group">
                        <label for="createSurname">Surname</label>
                        <sf:input path="surname" id="createSurname" cssClass="form-control" placeholder='surname'></sf:input>
                        <sf:errors path="surname"></sf:errors>
                    </div>
                    <div class="form-group">
                        <label for="createEmail">Email address</label>
                        <sf:input path="email" id="createEmail" cssClass="form-control" placeholder='Email'></sf:input>
                        <sf:errors path="email"></sf:errors>
                    </div>
                    <div class="form-group">
                        <label for="createPassword">Password</label>
                        <sf:input path="password" id="createPassword" cssClass="form-control" placeholder='Password' type='password'></sf:input>
                        <sf:errors path="password"></sf:errors>
                    </div>
                    <div class="form-group">
                        <label for="createPhone">Phone</label>
                        <sf:input path="phone" id="createPhone" cssClass="form-control" placeholder='Phone' type='Phone'></sf:input>
                        <sf:errors path="phone"></sf:errors>
                    </div>
                    <button type="submit" class="btn btn-outline-info btn-block">Create an account</button>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                </sf:form>
            </div>
        </div>
        <div class="row justify-content-center">
            <div class="col-md-1"><a href="#" class="social-enter"><i class="fa fa-facebook" aria-hidden="true"></i></a></div>
            <div class="col-md-1"><a href="#" class="social-enter"><i class="fa fa-google" aria-hidden="true"></i></a></div>
        </div>
    </div>

<%@include file="tempates/footer.jsp"%>
