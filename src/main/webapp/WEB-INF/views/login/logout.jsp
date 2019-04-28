<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Logout</title>
    <%@ include file="../dependecies.jsp" %>

    <%
        session.invalidate();
    %>

    <script>
        var timer = setTimeout(function () {
            window.location = '${pageContext.request.contextPath}/dashboard'
        }, 2500);
    </script>
</head>

<body>

<div class="w3-display-container w3-theme-l5 bgimg" style="height:100%">

    <div class="w3-panel w3-pale-green w3-border w3-display-middle" style="width:80%">
        <h1 class="w3-center">You have successfully logged out</h1>
    </div>

</div>

<div style="position: relative; margin-top:-30.3px">
    <%@include file="../footer.jsp" %>
</div>

</body>
</html>
