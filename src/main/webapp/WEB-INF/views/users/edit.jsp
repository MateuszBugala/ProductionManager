<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Users - add</title>
    <link rel="stylesheet" href="/css/styles.css">
</head>
<body>

<button onclick="location.href='http://localhost:8080/'" type="button">HOME</button>

<h1>Add a user:</h1>

<form:form method="post" modelAttribute="user" action="/users/edit">
    <form:hidden path="id"/>

    <table>
        <tr>
            <td>First name:</td>
            <td><form:input path="firstName"/><br></td>
            <td><form:errors path="firstName" cssClass="error-message" element="div" /></td>
        </tr>

        <tr>
            <td>Last name:</td>
            <td><form:input path="lastName"/><br></td>
            <td><form:errors path="lastName" cssClass="error-message" element="div" /></td>
        </tr>

        <tr>
            <td>Email:</td>
            <td><form:input path="email"/><br></td>
            <td><form:errors path="email" cssClass="error-message" element="div" /></td>
        </tr>

        <tr>
            <td>User group:</td>
            <td><form:select path="userGroup" cssStyle="width: 230px">
                <form:option value="0" label="Choose user group"/><br>
                <form:options items="${userGroups}" itemLabel="name" itemValue="id"/><br>
            </form:select><br></td>
            <td><form:errors path="userGroup" cssClass="error-message" element="div"/></td>
        </tr>


    </table>

    <input type="submit" value="Send" style="margin-top: 30px">

</form:form>

</body>
</html>
