<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Quotations - edit</title>
    <link rel="stylesheet" href="/css/styles.css">
</head>
<body>

<button onclick="location.href='http://localhost:8080/'" type="button">HOME</button>

<h1>Edit a Quotation:</h1>

        <form:form method="post" modelAttribute="quotation" action="/quotations/edit/${id}">
            <form:hidden path="id"/>
            <%--todo poniższe jest widocznie, nie może tak zostać--%>
            <form:hidden path="customerName"/><br>
            <form:hidden path="deliveryTerm"/><br>
            <form:hidden path="notes"/><br>

            <table>

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
