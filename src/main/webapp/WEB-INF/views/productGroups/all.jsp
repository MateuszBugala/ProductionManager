<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product group - list</title>
    <%@ include file="../dependecies.jsp" %>
</head>
<body>
<%@include file="../loggedHeader.jsp" %>

<c:choose>

    <c:when test="${userGroup == 2}">
        <div class="w3-display-container w3-theme-l5" style="height:100%">

            <div class="w3-container w3-theme-l4" style="padding-top: 52px">
                <h2>Product group list:</h2>
            </div>

            <div class="w3-container w3-margin">
            </div>

            <div class="w3-container w3-margin">
                <table class="w3-table w3-striped w3-border w3-bordered w3-hoverable w3-card-4" style="width:30%">

                    <thead>
                    <tr class="w3-light-grey">
                        <th>LP</th>
                        <th>Name</th>
                    </tr>
                    </thead>

                    <tbody>
                    <c:forEach items="${productGroups}" var="productGroup" varStatus="stat">
                        <tr>
                            <td>${stat.index+1}</td>
                            <td>${productGroup.name}</td>
                        </tr>
                    </c:forEach>
                    </tbody>

                </table>
            </div>
        </div>
    </c:when>

    <c:otherwise>
        <div class="w3-display-container w3-theme-l5" style="height:100%">

            <div class="w3-container w3-theme-l4" style="padding-top: 52px">
                <h2>Product group list:</h2>
            </div>

            <div class="w3-container w3-margin">

                <c:if test="${not empty param.error}">
                    <div class="w3-panel w3-pale-red w3-border w3-display-container">
                        <span onclick="this.parentElement.style.display='none'" class="w3-button w3-large w3-display-topright">×</span>
                        <h4 class="w3-center">Item cannot be deleted - it has some records in database</h4>
                    </div>
                </c:if>

                <c:if test="${not empty param.deleted}">
                    <div class="w3-panel w3-pale-green w3-border w3-display-container">
                        <span onclick="this.parentElement.style.display='none'" class="w3-button w3-large w3-display-topright">×</span>
                        <h4 class="w3-center">Item has been deleted</h4>
                    </div>
                </c:if>

                <a href="http://localhost:8080/productGroups/add" class="w3-btn w3-medium w3-block w3-theme w3-large"
                   style="width:30%">Add a new item</a>
            </div>

            <div class="w3-container w3-margin">
                <table class="w3-table w3-striped w3-border w3-bordered w3-hoverable w3-card-4" style="width:30%">

                    <thead>
                    <tr class="w3-light-grey">
                        <th>LP</th>
                        <th>Name</th>
                        <th colspan="2">Actions</th>
                    </tr>
                    </thead>

                    <tbody>
                    <c:forEach items="${productGroups}" var="productGroup" varStatus="stat">
                        <tr>
                            <td>${stat.index+1}</td>
                            <td>${productGroup.name}</td>
                            <td style="width: 50px"><a href="/productGroups/edit/${productGroup.id}">Edit</a></td>
                            <td style="width: 50px"><a href="/productGroups/delete/${productGroup.id}"
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

<div style="position: relative; margin-top:-30.3px">
    <%@include file="../footer.jsp" %>
</div>

</body>
</html>
