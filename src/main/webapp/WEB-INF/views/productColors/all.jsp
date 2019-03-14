<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product color - list</title>
    <link rel="stylesheet" href="/css/styles.css">
</head>
<body>
<%--różnica w widoku dla userGroup--%>
<c:choose>
    <c:when test="${userGroup == 2}">
        <button onclick="location.href='http://localhost:8080/'" type="button">HOME</button>

        <h3>Product color list:</h3>

        <table border="1" style="text-align: center">

            <thead>
            <th>LP</th>
            <th>Name</th>
            </thead>

            <tbody>
            <c:forEach items="${productColors}" var="productColor" varStatus="stat">
                <tr>
                    <td>${stat.index+1}</td>
                    <td>${productColor.name}</td>
                </tr>
            </c:forEach>
            </tbody>

        </table>
    </c:when>

    <c:otherwise>
        <button onclick="location.href='http://localhost:8080/'" type="button">HOME</button>

        <h3>Product color list:</h3>

        <table border="1" style="text-align: center">

            <thead>
            <th>LP</th>
            <th>Name</th>
            <th colspan="2">Actions</th>
            </thead>

            <tbody>
            <c:forEach items="${productColors}" var="productColor" varStatus="stat">
                <tr>
                    <td>${stat.index+1}</td>
                    <td>${productColor.name}</td>
                    <td style="width: 50px"><a href="/productColors/edit/${productColor.id}">Edit</a></td>
                    <td style="width: 50px"><a href="/productColors/delete/${productColor.id}"
                                               onclick="return confirm('Are you sure you want to delete this item?');">Delete</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>

        </table>


        <c:if test="${not empty param.error}">
            <h4 style="color: red"><span>Product color cannot be deleted - it has some records in database</span></h4>
        </c:if>
        <c:if test="${not empty param.deleted}">
            <h4 style="color: red"><span>Product color has been deleted</span></h4>
        </c:if>


        <h4><a href="http://localhost:8080/productColors/add">Add a new Product color</a></h4>
    </c:otherwise>
</c:choose>
</body>
</html>
