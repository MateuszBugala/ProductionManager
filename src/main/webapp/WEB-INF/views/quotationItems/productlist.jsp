<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Quotation - add items</title>
    <link rel="stylesheet" href="/css/styles.css">
</head>
<body>

<button onclick="location.href='http://localhost:8080/'" type="button">HOME</button>
<button type="button" name="back" onclick="history.back()">Back</button>

<h3>Products list:</h3>

<table border="1" style="text-align: center">

    <thead>
    <th>LP</th>
    <th>Code</th>
    <th>Name</th>
    <th>Group</th>
    <th>Notes</th>
    <th colspan="2">Actions</th>
    </thead>

    <tbody>
    <c:forEach items="${products}" var="product" varStatus="stat">
        <tr>
            <td>${stat.index+1}</td>
            <td>${product.code}</td>
            <td>${product.name}</td>
            <td>${product.productGroup.name}</td>
            <td>${product.notes}</td>

            <td style="width: 50px"><a href="/quotationItems/add/${id}/${product.id}" >Add to quotation</a></td>
            <%--do zmiany--%>
            <td style="width: 50px"><a href="/products/det/${product.id}" >Details</a></td>
        </tr>
    </c:forEach>
    </tbody>

</table>

<%--<h4><a href="http://localhost:8080/quotations/details/${id}">Back to quotation</a></h4>--%>


</body>
</html>