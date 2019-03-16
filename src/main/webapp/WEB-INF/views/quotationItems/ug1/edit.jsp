<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Quotation Item - edit</title>
    <link rel="stylesheet" href="/css/styles.css">
</head>
<body>

<button onclick="location.href='http://localhost:8080/'" type="button">HOME</button>

<h1>Edit item:</h1>
<%--TEST-----------------%>
quotationId:
${quotationItem.quotation.id}
productId:
${product.id}
<%--TEST-----------------%>
<table border="1" style="text-align: center">

    <thead>
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

        <%--<td>${product.productMaterials}</td>--%>

        <td>${product.notes}</td>
    </tr>
    </tbody>
</table>

<form:form method="post" modelAttribute="quotationItem"
           action="/quotationItems/edit/${quotationItem.quotation.id}/${product.id}">
    <form:hidden path="id"/>

    <table>
        <tr>
            <td>Quantity:</td>
            <td><form:input path="quantity"/><br></td>
            <td><form:errors path="quantity" cssClass="error-message" element="div"/></td>
        </tr>

        <form:hidden path="price"/>

        <tr>
            <td>Required Delivery Date:</td>
            <td><form:input type="date" path="requiredDeliveryDate"/><br></td>
            <td><form:errors path="requiredDeliveryDate" cssClass="error-message" element="div"/></td>
        </tr>

        <form:hidden path="actualDeliveryDate"/>

        <tr>
            <td>Notes:</td>
            <td><form:input path="notes"/><br></td>
            <td><form:errors path="notes" cssClass="error-message" element="div"/></td>
        </tr>


    </table>

    <input type="submit" value="Save changes" style="margin-top: 30px">

</form:form>

</body>
</html>