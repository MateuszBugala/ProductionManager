<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Quotation - sent</title>
    <link rel="stylesheet" href="/css/styles.css">
</head>
<body>

<button onclick="location.href='http://localhost:8080/'" type="button">HOME</button>

<h3>Status of quotation ${id} has been changed!</h3>

<h4><a href="http://localhost:8080/quotations/all">Back to list</a></h4>

<script>
    var timer = setTimeout(function() {
        window.location='http://localhost:8080/quotations/all'
    }, 5000);
</script>


</body>
</html>