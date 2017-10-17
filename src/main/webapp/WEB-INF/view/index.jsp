<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="tempates/header.jsp"%>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-12" style="color: #fff">
            <br>
            <br>
            <br>
            <br>
            <br>
            <h1 align="center">Welcome to the VinylShop</h1>

            <h4 align="center">Enjoy the music!</h4>
            <br>
            <h1 align="center"><a href="/products" class="btn btn-lg btn-outline-info">CHECK IT</a></h1>
        </div>
    </div>
</div>
<video autoplay loop id="video-background" plays-inline>
    <source src="/video/bg-video.mp4" type="video/mp4">
</video>

<%@include file="tempates/footer.jsp"%>