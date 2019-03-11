<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User group - list</title>
    <link rel="stylesheet" href="/css/styles.css">
</head>
<body>

<button onclick="location.href='http://localhost:8080/'" type="button">HOME</button>

<h3>User group list:</h3>

<table border="1" style="text-align: center">

    <thead>
    <th>LP</th>
    <th>Name</th>
    <th colspan="2">Actions</th>
    </thead>

    <tbody>
    <c:forEach items="${userGroups}" var="userGroup" varStatus="stat">
        <tr>
            <td>${stat.index+1}</td>
            <td>${userGroup.name}</td>
            <td style="width: 50px"><a href="/userGroups/edit/${userGroup.id}" >Edit</a></td>
            <td style="width: 50px"><a href="/userGroups/delete/${userGroup.id}" onclick="return confirm('Are you sure you want to delete this item?');" >Delete</a></td>
        </tr>
    </c:forEach>
    </tbody>

</table>


<c:if test ="${not empty param.error}">
    <h4 style="color: red"><span>User group cannot be deleted - it has some records in database</span></h4>
</c:if>
<c:if test ="${not empty param.deleted}">
    <h4 style="color: red"><span>User group has been deleted</span></h4>
</c:if>


<h4><a href="http://localhost:8080/userGroups/add">Add a new user group</a></h4>

</body>
</html>
