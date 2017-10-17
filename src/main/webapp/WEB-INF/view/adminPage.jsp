<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="tempates/header.jsp"%>


<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-4 admin-create">
            <sf:form action="saveProduct" modelAttribute="nullProduct" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="album">Album</label>
                    <sf:input path="productName" id="album" cssClass="form-control"></sf:input>
                </div>
                <div class="form-group">
                    <label for="artist">Artist</label>
                    <sf:input path="artist" id="arist" cssClass="form-control"></sf:input>
                </div>
                <div class="form-group">
                    <label for="genre">Genre</label>
                    <sf:input path="genre" id="genre" cssClass="form-control"></sf:input>
                </div>
                <div class="form-group">
                    <label for="releaseyear">Year</label>
                    <sf:input path="releaseYear" id="releaseyear" cssClass="form-control"></sf:input>
                </div>
                <div class="form-group">
                    <label for="description">Description</label>
                    <form:textarea path="description" rows="5" cols="30" id="description" cssClass="form-control"/>
                </div>
                <div class="form-group">
                    <label for="price">Price</label>
                    <sf:input path="price" id="album" cssClass="form-control"></sf:input>
                </div>
                <div class="form-group">
                    <label for="image">Image</label>
                    <input type="file" class="form-control-file" id="image" name="file">
                </div>
                <button type="submit" class="btn btn-info">Add</button>
                <button type="reset" value="Reset" class="btn btn-info">Reset</button>
                <input type="hidden"
                name="${_csrf.parameterName}"
                value="${_csrf.token}"/>
            </sf:form>
        </div>
    </div>

</div>
<br>
<%@include file="tempates/footer.jsp"%>
