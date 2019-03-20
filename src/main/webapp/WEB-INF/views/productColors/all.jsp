<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product color - list</title>
    <%--<link rel="stylesheet" href="/css/styles.css">--%>
    <%@ include file="../dependecies.jsp" %>
</head>
<body>

<%@include file="../loggedHeader.jsp" %>
<%--różnica w widoku dla userGroup--%>
<c:choose>
    <c:when test="${currentUserGroup == 2}">
        <div class="w3-display-container w3-theme-l5" style="height:100%">

            <div class="w3-container w3-theme-l4" style="padding-top: 52px"> <%--padding to fit header height--%>
                <h2>Product color list:</h2>
            </div>

            <div class="w3-container w3-margin <%--w3-responsive--%>">
                <table class="w3-table w3-striped w3-border w3-bordered w3-hoverable w3-card-4" style="width:30%">

                    <thead>
                    <tr class="w3-light-grey">
                        <th>LP</th>
                        <th>Name</th>
                    </tr>
                    </thead>

                    <tbody>
                    <c:forEach items="${productColors}" var="productColor" varStatus="stat">
                        <tr>
                            <td>${stat.index+1}</td>
                            <td>${productColor.name}</td>
                        </tr>
                    </c:forEach>
                    </tbody>

                </table>
            </div>
        </div>
    </c:when>

    <c:otherwise>

        <div class="w3-display-container w3-theme-l5" style="height:100%">

            <div class="w3-container w3-theme-l4" style="padding-top: 52px"> <%--padding to fit header height--%>
                <h2>Product color list:</h2>
            </div>

            <div class="w3-container w3-margin">

                <c:if test="${not empty param.error}">
                    <h4 style="color: red">
                        <span>Item cannot be deleted - it has some records in database</span>
                    </h4>
                </c:if>
                <c:if test="${not empty param.deleted}">
                    <h4 style="color: red"><span>Item has been deleted</span></h4>
                </c:if>


                <a href="http://localhost:8080/productColors/add" class="w3-btn w3-medium w3-block w3-theme w3-large" style="width:30%">Add a new Product color</a>
            </div>

            <div class="w3-container w3-margin <%--w3-responsive--%>">
                <table class="w3-table w3-striped w3-border w3-bordered w3-hoverable w3-card-4" style="width:30%">

                    <thead>
                    <tr class="w3-light-grey">
                        <th>LP</th>
                        <th>Name</th>
                        <th colspan="2">Actions</th>
                    </tr>
                    </thead>

                    <tbody>
                    <c:forEach items="${productColors}" var="productColor" varStatus="stat">
                        <tr>
                            <td>${stat.index+1}</td>
                            <td>${productColor.name}</td>
                            <td style="width: 50px"><a href="/productColors/edit/${productColor.id}">Edit</a></td>
                            <td style="width: 50px"><a href="/productColors/delete/${productColor.id}"
                                                       onclick="return confirm('Are you sure you want to delete this item?');">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>

                </table>
            </div>
        </div>

    </c:otherwise>
</c:choose>

<div style="position: relative; margin-top:-30.3px"> <%--margin fit to footer height--%>
    <%@include file="../footer.jsp" %>
</div>


</body>
</html>
