<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="tempates/header.jsp"%>


    <%--<c:forEach items="${genreList}" var="gener">--%>
        <%--${gener}--%>
    <%--</c:forEach>--%>


<div class="container" style="margin-top: 10px">
    <div class="row">
        <div class="col-md-1 middle"></div>
        <div class="col-md-3">
            <article>
                <div class="panel-group" id="collapse-group">
                    <div class="panel">
                        <div class="panel-heading">
                            <a href="#edm" data-toggle="collapse" data-parent="#collapse-group">Genres</a>
                        </div>
                        <div class="collapse in " id="edm" >
                            <div class="panel-body " id="styleScroll">
                                <a href="genre/alternative">Alternative</a>
                                <hr>
                                <a href="genre/blues">Blues</a>
                                <hr>
                                <a href="genre/electronic">Electronic</a>
                                <hr>
                                <a href="genre/experimental">Experimental</a>
                                <hr>
                                <a href="genre/indie">Indie</a>
                                <hr>
                                <a href="genre/hiphop">Hip-Hop</a>
                                <hr>
                                <a href="genre/rock">Rock</a>
                                <hr>
                                <a href="genre/chillout">Chillout</a>
                                <hr>
                                <a href="genre/minimal">Minimal</a>
                                <hr>
                                <a href="genre/techno">Techno</a>
                                <hr>
                                <a href="genre/edm">EDM</a>
                                <hr>
                                <a href="genre/drum">Drum</a>
                                <hr>
                                <a href="genre/pop">Pop</a>
                            </div>
                        </div>

                    </div>

                </div>
            </article>
        </div>
        <div class="col-md-1 middle"></div>
        <div class="col-md-7">
            <%--ASIDE--%>
            <div class="container mainContainer">
                <div class="row">
                    <aside>
                        <c:forEach var="gener" items="${genreList}" varStatus="count" step="3">
                            <div class="container mainContainer ">
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="divProduct">
                                            <div class=" container insideProduct">
                                                <div class="row">
                                                    <div class="col-md-10">
                                                        <img src="${gener.image}" style="width: 200px; height: 165px">
                                                    </div>
                                                </div>
                                                <br>
                                                <div class="row rowPadding">
                                                    <b>Artist:</b> <td>${gener.artist}</td><br>
                                                    <b>Album:</b> <td>${gener.productName}</td><br>
                                                    <b>Genre:</b> <td>${gener.genre}</td><br>
                                                    <b>Price:</b> <td>${gener.price}</td>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-2">
                                                        <a href="details-${gener.id}">
                                                            <i class="fa fa-info" aria-hidden="true"></i>
                                                        </a>
                                                    </div>
                                                    <div class="col-md-2">
                                                        <a href="#"><i class="fa fa-lastfm-square" aria-hidden="true"></i></a>
                                                    </div>
                                                    <div class="col-md-3 col-md-offset-4">
                                                            <security:authorize access="hasAnyRole('ROLE_USER', 'ROLE_ADMIN')">
                                                                <a href="${pageContext.request.contextPath}/addToCart?id=${gener.id}">
                                                                    <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                                                                </a>
                                                            </security:authorize>
                                                            <security:authorize access="!hasAnyRole('ROLE_USER')">
                                                                <a href="#registryModal" data-toggle="modal">
                                                                    <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                                                                </a>
                                                                <div class="modal fade" id="registryModal" tabindex="-1">
                                                                    <div class="modal-dialog modal-sm">
                                                                        <div class="modal-content">
                                                                            <div class="modal-header">
                                                                                <button class="close" data-dismiss="modal">x</button>
                                                                            </div>
                                                                            <div class="modal-body">
                                                                                <sf:form action="save" method="post" modelAttribute="nullUser">
                                                                                    Email
                                                                                    <br>
                                                                                    <sf:input path="email"></sf:input>
                                                                                    <sf:errors path="email"></sf:errors>
                                                                                    <br>
                                                                                    Username
                                                                                    <br>
                                                                                    <sf:input path="username"></sf:input>
                                                                                    <sf:errors path="username"></sf:errors>
                                                                                    <br>
                                                                                    Password
                                                                                    <br>
                                                                                    <sf:password path="password"></sf:password>
                                                                                    <sf:errors path="password"></sf:errors>
                                                                                    <br>
                                                                                    <br>
                                                                                    <input type="submit" value="Registry">
                                                                                    <input type="hidden"
                                                                                           name="${_csrf.parameterName}"
                                                                                           value="${_csrf.token}"/>
                                                                                </sf:form>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </security:authorize>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <c:choose>
                                        <c:when test="${genreList[count.index+1] == null}">

                                        </c:when>
                                        <c:otherwise>
                                            <div class="col-md-4">
                                                <div class="divProduct">
                                                    <div class=" container insideProduct">
                                                        <div class="row">
                                                            <div class="col-md-10">
                                                                <img src="${genreList[count.index+1].image}" style="width: 200px; height: 165px">
                                                            </div>
                                                        </div>
                                                        <br>
                                                        <div class="row rowPadding">
                                                            <b>Artist:</b> <td>${gegenreList[count.index+1].artist}</td><br>
                                                            <b>Album:</b> <td>${genreList[count.index+1].productName}</td><br>
                                                            <b>Genre:</b> <td>${genreList[count.index+1].genre}</td><br>
                                                            <b>Price:</b> <td>${genreList[count.index+1].price}</td>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-md-2">
                                                                <a href="details-${genreList[count.index+1].id}">
                                                                    <i class="fa fa-info" aria-hidden="true"></i>
                                                                </a>
                                                            </div>
                                                            <div class="col-md-2">
                                                                <a href="#"><i class="fa fa-lastfm-square" aria-hidden="true"></i></a>
                                                            </div>
                                                            <div class="col-md-3 col-md-offset-4">
                                                                    <security:authorize access="hasAnyRole('ROLE_USER', 'ROLE_ADMIN')">
                                                                        <a href="${pageContext.request.contextPath}/addToCart?id=${genreList[count.index+1].id}">
                                                                            <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                                                                        </a>
                                                                    </security:authorize>
                                                                    <security:authorize access="!hasAnyRole('ROLE_USER')">
                                                                        <a href="#registryModal" data-toggle="modal">
                                                                            <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                                                                        </a>
                                                                        <div class="modal fade" id="registryModal" tabindex="-1">
                                                                            <div class="modal-dialog modal-sm">
                                                                                <div class="modal-content">
                                                                                    <div class="modal-header">
                                                                                        <button class="close" data-dismiss="modal">x</button>
                                                                                    </div>
                                                                                    <div class="modal-body">
                                                                                        <sf:form action="save" method="post" modelAttribute="nullUser">
                                                                                            Email
                                                                                            <br>
                                                                                            <sf:input path="email"></sf:input>
                                                                                            <sf:errors path="email"></sf:errors>
                                                                                            <br>
                                                                                            Username
                                                                                            <br>
                                                                                            <sf:input path="username"></sf:input>
                                                                                            <sf:errors path="username"></sf:errors>
                                                                                            <br>
                                                                                            Password
                                                                                            <br>
                                                                                            <sf:password path="password"></sf:password>
                                                                                            <sf:errors path="password"></sf:errors>
                                                                                            <br>
                                                                                            <br>
                                                                                            <input type="submit" value="Registry">
                                                                                            <input type="hidden"
                                                                                                   name="${_csrf.parameterName}"
                                                                                                   value="${_csrf.token}"/>
                                                                                        </sf:form>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </security:authorize>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:otherwise>
                                    </c:choose>
                                    <c:choose>
                                        <c:when test="${genreList[count.index+2] == null}">

                                        </c:when>
                                        <c:otherwise>
                                            <div class="col-md-4">
                                                <div class="divProduct">
                                                    <div class=" container insideProduct">
                                                        <div class="row">
                                                            <div class="col-md-10">
                                                                <img src="${genreList[count.index+2].image}" style="width: 200px; height: 165px">
                                                            </div>
                                                        </div>
                                                        <br>
                                                        <div class="row rowPadding">
                                                            <b>Artist:</b> <td>${genreList[count.index+2].artist}</td><br>
                                                            <b>Album:</b> <td>${genreList[count.index+2].productName}</td><br>
                                                            <b>Genre:</b> <td>${genreList[count.index+2].genre}</td><br>
                                                            <b>Price:</b> <td>${genreList[count.index+2].price}</td>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-md-2">
                                                                <a href="details-${genreList[count.index+2].id}">
                                                                    <i class="fa fa-info" aria-hidden="true"></i>
                                                                </a>
                                                            </div>
                                                            <div class="col-md-2">
                                                                <a href="#"><i class="fa fa-lastfm-square" aria-hidden="true"></i></a>
                                                            </div>
                                                            <div class="col-md-3 col-md-offset-4">
                                                                    <security:authorize access="hasAnyRole('ROLE_USER', 'ROLE_ADMIN')">
                                                                        <a href="${pageContext.request.contextPath}/addToCart?id=${genreList[count.index+2].id}">
                                                                            <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                                                                        </a>
                                                                    </security:authorize>
                                                                    <security:authorize access="!hasAnyRole('ROLE_USER')">
                                                                        <a href="#registryModal" data-toggle="modal">
                                                                            <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                                                                        </a>
                                                                        <div class="modal fade" id="registryModal" tabindex="-1">
                                                                            <div class="modal-dialog modal-sm">
                                                                                <div class="modal-content">
                                                                                    <div class="modal-header">
                                                                                        <button class="close" data-dismiss="modal">x</button>
                                                                                    </div>
                                                                                    <div class="modal-body">
                                                                                        <sf:form action="save" method="post" modelAttribute="nullUser">
                                                                                            Email
                                                                                            <br>
                                                                                            <sf:input path="email"></sf:input>
                                                                                            <sf:errors path="email"></sf:errors>
                                                                                            <br>
                                                                                            Username
                                                                                            <br>
                                                                                            <sf:input path="username"></sf:input>
                                                                                            <sf:errors path="username"></sf:errors>
                                                                                            <br>
                                                                                            Password
                                                                                            <br>
                                                                                            <sf:password path="password"></sf:password>
                                                                                            <sf:errors path="password"></sf:errors>
                                                                                            <br>
                                                                                            <br>
                                                                                            <input type="submit" value="Registry">
                                                                                            <input type="hidden"
                                                                                                   name="${_csrf.parameterName}"
                                                                                                   value="${_csrf.token}"/>
                                                                                        </sf:form>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </security:authorize>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        </c:forEach>
                    </aside>
                </div>
            </div>
            <%--ASIDE--%>
        </div>
    </div>
</div>


<%@include file="tempates/footer.jsp"%>