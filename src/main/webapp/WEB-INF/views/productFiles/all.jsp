<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Files</title>
    <link rel="stylesheet" href="/css/styles.css">
</head>
<body>

<button onclick="location.href='http://localhost:8080/'" type="button">HOME</button>

<h3>Files:</h3>

<table border="1" style="text-align: center">

    <thead>
    <th>LP</th>
    <th>fileName</th>
    <th>fileDescription</th>
    <th colspan="3">Actions</th>
    </thead>

    <tbody>
    <c:forEach items="${files}" var="file" varStatus="stat">
        <tr>
            <td>${stat.index+1}</td>
            <td>${file.fileName}</td>
            <td>${file.fileDescription}</td>

            <td style="width: 50px"><a href="/files/download/${file.id}" >Download</a></td>
            <td style="width: 50px"><a href="/files/view/${file.id}" >View</a></td>
            <td style="width: 50px"><a href="/files/delete/${file.id}" >Delete</a></td>
        </tr>
    </c:forEach>
    </tbody>

</table>

<h4><a href="http://localhost:8080/files/add/${productId}">Add a new file to this product</a></h4>

</body>
</html>
