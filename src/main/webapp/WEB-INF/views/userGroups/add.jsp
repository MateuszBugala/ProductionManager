<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User group - add</title>
    <link rel="stylesheet" href="/css/styles.css">
</head>
<body>

<button onclick="location.href='${pageContext.request.contextPath}/'" type="button">HOME</button>

<h1>Add a user group:</h1>

<form:form method="post" modelAttribute="userGroup">

    <table>
        <tr>
            <td>User group name:</td>
            <td><form:input path="name"/><br></td>
            <td><form:errors path="name" cssClass="error-message" element="div" /></td>
        </tr>

    </table>

    <input type="submit" value="Send" style="margin-top: 30px">

</form:form>

</body>
</html>
