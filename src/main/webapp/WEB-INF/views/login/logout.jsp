
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<h2>You have successfully logged out</h2>


<%
    session.invalidate();
%>

<script>
    var timer = setTimeout(function() {
        window.location='http://localhost:8080'
    }, /*2000*/ 50);
</script>


</body>
</html>
