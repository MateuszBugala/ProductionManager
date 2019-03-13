<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product group - list</title>
    <link rel="stylesheet" href="/css/styles.css">
</head>
<body>

<button onclick="location.href='http://localhost:8080/'" type="button">HOME</button>

<h3>Product group list:</h3>

<table border="1" style="text-align: center">

    <thead>
    <th>LP</th>
    <th>Name</th>
    <th colspan="2">Actions</th>
    </thead>

    <tbody>
    <c:forEach items="${productGroups}" var="productGroup" varStatus="stat">
        <tr>
            <td>${stat.index+1}</td>
            <td>${productGroup.name}</td>
            <td style="width: 50px"><a href="/productGroups/edit/${productGroup.id}" >Edit</a></td>
            <td style="width: 50px"><a href="/productGroups/delete/${productGroup.id}" onclick="return confirm('Are you sure you want to delete this item?');" >Delete</a></td>
        </tr>
    </c:forEach>
    </tbody>

</table>


<c:if test ="${not empty param.error}">
    <h4 style="color: red"><span>Product group cannot be deleted - it has some records in database</span></h4>
</c:if>
<c:if test ="${not empty param.deleted}">
    <h4 style="color: red"><span>Product group has been deleted</span></h4>
</c:if>


<h4><a href="http://localhost:8080/productGroups/add">Add a new product group</a></h4>

</body>
</html>
