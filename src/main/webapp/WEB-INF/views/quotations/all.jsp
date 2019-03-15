<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Quotations - list</title>
    <link rel="stylesheet" href="/css/styles.css">
</head>
<body>

<button onclick="location.href='http://localhost:8080/'" type="button">HOME</button>

<h3>Quotations list:</h3>

<table border="1" style="text-align: center">

    <thead>
    <th>Number</th>
    <%--produkcja nie powinna widzieć poniższego--%>
    <%--<th>Customer Name</th>--%>
    <th>Created By</th>
    <th>Status</th>
    <th colspan="1">Actions</th>
    </thead>

    <tbody>
    <c:forEach items="${quotations}" var="quotation" varStatus="stat">
        <tr>
            <td>${quotation.id}</td>
            <%--<td>${quotation.customerName}</td>--%>
            <td>${quotation.createdBy.fullName}</td>
            <td>${quotation.status}</td>

            <%--<td style="width: 50px"><a href="/quotations/add/${product.id}" >Add to quotation</a></td>--%>
            <td style="width: 50px"><a href="/quotations/details/${quotation.id}" >Details</a></td>
        </tr>
    </c:forEach>
    </tbody>

</table>

<h4><a href="http://localhost:8080/quotations/add">Add a new quotation</a></h4>

</body>
</html>
