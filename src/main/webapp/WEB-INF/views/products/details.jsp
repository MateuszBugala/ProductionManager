<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Products - details</title>
    <link rel="stylesheet" href="/css/styles.css">
</head>
<body>

<button onclick="location.href='http://localhost:8080/'" type="button">HOME</button>

<h3>Products details:</h3>

<table border="1" style="text-align: center">

    <thead>
    <th>LP</th>
    <th>Code</th>
    <th>Name</th>
    <th>Description</th>
    <th>Group</th>
    <th>OuterHeight</th>
    <th>OuterWidth</th>
    <th>OuterLength</th>
    <th>Colors</th>
    <%--<th>Materials</th>--%>
    <th>Notes</th>
    <th colspan="2">Actions</th>
    </thead>

    <tbody>
        <tr>
            <td>${stat.index+1}</td>
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

            <%--<td>${product.productMaterials}</td>--%>

            <td>${product.notes}</td>
            <td style="width: 50px"><a href="/products/edit/${product.id}" >Edit</a></td>
            <td style="width: 50px"><a href="/products/delete/${product.id}" onclick="return confirm('Are you sure you want to delete this item?');" >Delete</a></td>
        </tr>
    </tbody>

</table>


<c:if test ="${not empty param.error}">
    <h4 style="color: red"><span>product cannot be deleted - it has some records in database</span></h4>
</c:if>
<c:if test ="${not empty param.deleted}">
    <h4 style="color: red"><span>product has been deleted</span></h4>
</c:if>


<h4><a href="http://localhost:8080/products/add">Add a new product</a></h4>

</body>
</html>
