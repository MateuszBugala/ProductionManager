<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Products - details</title>
    <link rel="stylesheet" href="/css/styles.css">
</head>
<body>

<button onclick="location.href='http://localhost:8080/'" type="button">HOME</button>
<button type="button" name="back" onclick="history.back()">Back</button>
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
    <th>Materials</th>
    <th>Notes</th>
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

            <td style="max-width: 400px">
                <c:forEach items="${product.productMaterials}" var="productMaterials" varStatus="stat">
                    ${stat.index+1}. ${productMaterials.name}<br>
                </c:forEach>
            </td>


            <td>${product.notes}</td>
        </tr>
    </tbody>

</table>



</body>
</html>
