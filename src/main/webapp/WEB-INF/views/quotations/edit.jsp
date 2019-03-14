<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Quotations - edit</title>
    <link rel="stylesheet" href="/css/styles.css">
</head>
<body>

<button onclick="location.href='http://localhost:8080/'" type="button">HOME</button>

<h1>Edit a Quotation:</h1>

<form:form method="post" modelAttribute="quotation" action="/quotations/edit">
    <form:hidden path="id"/>

    <table>
        <tr>
            <td>CustomerName:</td>
            <td><form:input path="customerName"/><br></td>
            <td><form:errors path="customerName" cssClass="error-message" element="div" /></td>
        </tr>

        <tr>
            <td>Delivery Term:</td>
            <td><form:input path="deliveryTerm"/><br></td>
            <td><form:errors path="deliveryTerm" cssClass="error-message" element="div" /></td>
        </tr>

        <tr>
            <td>Notes:</td>
            <td><form:input path="notes"/><br></td>
            <td><form:errors path="notes" cssClass="error-message" element="div" /></td>
        </tr>

        <tr>
            <td>Remarks:</td>
            <td><form:input path="remarks"/><br></td>
            <td><form:errors path="remarks" cssClass="error-message" element="div" /></td>
        </tr>

    </table>

    <input type="submit" value="Send" style="margin-top: 30px">

</form:form>

</body>
</html>
