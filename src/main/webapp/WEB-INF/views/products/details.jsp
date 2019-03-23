<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Products - details</title>
    <%@ include file="../dependecies.jsp" %>
</head>
<body>
<%@include file="../loggedHeader.jsp" %>

<div class="w3-display-container w3-theme-l5" style="height:100%">

    <div class="w3-container w3-theme-l4" style="padding-top: 52px">
        <h2>Products details:</h2>
    </div>

    <div class="w3-container w3-margin">

        <c:if test="${not empty param.error}">
            <div class="w3-panel w3-pale-red w3-border w3-display-container">
                <span onclick="this.parentElement.style.display='none'"
                      class="w3-button w3-large w3-display-topright">×</span>
                <h4 class="w3-center">Item cannot be deleted - it has some records in database</h4>
            </div>
        </c:if>

        <c:if test="${not empty param.deleted}">
            <div class="w3-panel w3-pale-green w3-border w3-display-container">
                <span onclick="this.parentElement.style.display='none'"
                      class="w3-button w3-large w3-display-topright">×</span>
                <h4 class="w3-center">Item has been deleted</h4>
            </div>
        </c:if>

        <c:if test="${not empty param.quoted}">
            <div class="w3-panel w3-pale-red w3-border w3-display-container">
                <span onclick="this.parentElement.style.display='none'"
                      class="w3-button w3-large w3-display-topright">×</span>
                <h4 class="w3-center">Product has been quoted and cannot be edited<br>Please create a new product</h4>
            </div>
        </c:if>

        <div class="w3-bar">
            <button type="button" class="w3-btn w3-pale-red w3-large" style="width: 15%"
                    onclick="history.back()">Back
            </button>
            <a href="http://localhost:8080/products/add" class="w3-btn w3-medium w3-theme w3-large"
               style="width:15%">Add a new product</a>
        </div>

    </div>

    <div class="w3-container w3-margin">
        <table class="w3-table w3-striped w3-border w3-bordered w3-hoverable w3-card-4">

            <thead>
            <tr class="w3-light-grey">
                <th>Code</th>
                <th>Name</th>
                <th>Description</th>
                <th>Group</th>
                <th>OuterHeight</th>
                <th>OuterWidth</th>
                <th>OuterLength</th>
                <th>Colors</th>
                <th>Materials</th>
                <th>Notes</th>
                <th colspan="3">Actions</th>
            </tr>
            </thead>

            <tbody>
            <tr>
                <td>${product.code}</td>
                <td>${product.name}</td>
                <td>${product.description}</td>
                <td>${product.productGroup.name}</td>
                <td>${product.outerHeight}</td>
                <td>${product.outerWidth}</td>
                <td>${product.outerLength}</td>
                <td style="max-width: 400px">
                    <c:forEach items="${product.productColors}" var="productColors" varStatus="stat">
                        ${stat.index+1}. ${productColors.name}<br>
                    </c:forEach>
                </td>
                <td style="max-width: 400px">
                    <c:forEach items="${product.productMaterials}" var="productMaterials" varStatus="stat">
                        ${stat.index+1}. ${productMaterials.name}<br>
                    </c:forEach>
                </td>
                <td>${product.notes}</td>
                <td style="width: 40px"><a href="/products/edit/${product.id}">Edit</a></td>
                <%--<td><a href="/files/add/${product.id}" >Add files</a></td>--%>
                <td style="width: 40px"><a href="/files/all/${product.id}">Attached files</a></td>
                <td style="width: 40px"><a href="/products/delete/${product.id}"
                                           onclick="return confirm('Are you sure you want to delete this item?');">Delete</a>
                </td>
            </tr>
            </tbody>

        </table>
    </div>

</div>

<div style="position: relative; margin-top:-30.3px">
    <%@include file="../footer.jsp" %>
</div>

</body>
</html>
