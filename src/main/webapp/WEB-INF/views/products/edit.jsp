<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Products - edit</title>
    <link rel="stylesheet" href="/css/styles.css">
</head>
<body>

<button onclick="location.href='http://localhost:8080/'" type="button">HOME</button>

<h1>Edit a product:</h1>

<form:form method="post" modelAttribute="product" action="/products/edit">
    <form:hidden path="id"/>

    <table>
        <tr>
            <td>Code:</td>
            <td><form:input path="code"/><br></td>
            <td><form:errors path="code" cssClass="error-message" element="div" /></td>
        </tr>

        <tr>
            <td>Name:</td>
            <td><form:input path="name"/><br></td>
            <td><form:errors path="name" cssClass="error-message" element="div" /></td>
        </tr>

        <tr>
            <td>Description:</td>
            <td><form:input path="description"/><br></td>
            <td><form:errors path="description" cssClass="error-message" element="div" /></td>
        </tr>

        <tr>
            <td>Product group:</td>
            <td><form:select path="productGroup" cssStyle="width: 230px">
                <form:option value="0" label="Choose product group"/><br>
                <form:options items="${productGroups}" itemLabel="name" itemValue="id"/><br>
            </form:select><br></td>
            <td><form:errors path="productGroup" cssClass="error-message" element="div"/></td>
        </tr>

        <tr>
            <td>Outer Height:</td>
            <td><form:input path="outerHeight"/><br></td>
            <td><form:errors path="outerHeight" cssClass="error-message" element="div" /></td>
        </tr>

        <tr>
            <td>Outer Width:</td>
            <td><form:input path="outerWidth"/><br></td>
            <td><form:errors path="outerWidth" cssClass="error-message" element="div" /></td>
        </tr>

        <tr>
            <td>Outer Length:</td>
            <td><form:input path="outerLength"/><br></td>
            <td><form:errors path="outerLength" cssClass="error-message" element="div" /></td>
        </tr>

        <tr>
            <td>Product colors:</td>
            <td><form:select path="productColors" cssStyle="width: 230px">
                <form:option value="0" label="Choose product colors"/><br>
                <form:options items="${productColors}" itemLabel="name" itemValue="id"/><br>
            </form:select><br></td>
            <td><form:errors path="productColors" cssClass="error-message" element="div"/></td>
        </tr>

        <tr>
            <td>Product materials:</td>
            <td><form:select path="productMaterials" cssStyle="width: 230px">
                <form:option value="0" label="Choose product materials"/><br>
                <form:options items="${productMaterials}" itemLabel="name" itemValue="id"/><br>
            </form:select><br></td>
            <td><form:errors path="productMaterials" cssClass="error-message" element="div"/></td>
        </tr>

        <tr>
            <td>Notes:</td>
            <td><form:input path="notes"/><br></td>
            <td><form:errors path="notes" cssClass="error-message" element="div" /></td>
        </tr>


    </table>

    <input type="submit" value="Send" style="margin-top: 30px">

</form:form>

</body>
</html>
