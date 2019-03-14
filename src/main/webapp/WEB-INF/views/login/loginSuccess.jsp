
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Loading</title>
</head>
<body>
<h3>Loading</h3>

<script>
    var timer = setTimeout(function() {
        window.location='http://localhost:8080/dashboard'
    }, 1);
</script>
</body>
</html>
