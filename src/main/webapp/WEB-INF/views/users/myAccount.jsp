<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User</title>
    <link rel="stylesheet" href="/css/styles.css">
</head>
<body>

<button onclick="location.href='http://localhost:8080/'" type="button">HOME</button>

<h3>User:</h3>

<table border="1" style="text-align: center">

    <thead>
    <th>First name</th>
    <th>Last name</th>
    <th>Email</th>
    <th>Group</th>
    <th colspan="2">Actions</th>
    </thead>

    <tbody>
        <tr>
            <td>${currentUser.firstName}</td>
            <td>${currentUser.lastName}</td>
            <td>${currentUser.email}</td>
            <td>${currentUser.userGroup.name}</td>
            <td style="width: 50px"><a href="/users/edit/${currentUser.id}" >Edit</a></td>
        </tr>
    </tbody>

</table>

<h4><a href="http://localhost:8080/logout">Log out</a></h4>

</body>
</html>
