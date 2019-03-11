<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Users - list</title>
    <link rel="stylesheet" href="/css/styles.css">
</head>
<body>

<button onclick="location.href='http://localhost:8080/'" type="button">HOME</button>

<h3>Users list:</h3>

<table border="1" style="text-align: center">

    <thead>
    <th>LP</th>
    <th>First name</th>
    <th>Last name</th>
    <th>Email</th>
    <th>Group</th>
    <th colspan="2">Actions</th>
    </thead>

    <tbody>
    <c:forEach items="${users}" var="user" varStatus="stat">
        <tr>
            <td>${stat.index+1}</td>
            <td>${user.firstName}</td>
            <td>${user.lastName}</td>
            <td>${user.email}</td>
            <td>${user.userGroup.name}</td>
            <td style="width: 50px"><a href="/users/edit/${user.id}" >Edit</a></td>
            <td style="width: 50px"><a href="/users/delete/${user.id}" onclick="return confirm('Are you sure you want to delete this item?');" >Delete</a></td>
        </tr>
    </c:forEach>
    </tbody>

</table>


<c:if test ="${not empty param.error}">
    <h4 style="color: red"><span>User cannot be deleted - it has some records in database</span></h4>
</c:if>
<c:if test ="${not empty param.deleted}">
    <h4 style="color: red"><span>User has been deleted</span></h4>
</c:if>


<h4><a href="http://localhost:8080/users/add">Add a new user</a></h4>

</body>
</html>
