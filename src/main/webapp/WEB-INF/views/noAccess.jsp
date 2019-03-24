
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Access denied</title>
    <%@ include file="dependecies.jsp" %>
    <script>
        var timer = setTimeout(function() {
            history.back()
        }, 1000);
    </script>
</head>
<body>

<div class="w3-display-container w3-theme-l5 bgimg" style="height:100%">

    <div class="w3-panel w3-pale-red w3-border w3-display-middle" style="width:80%">
        <h2 class="w3-center">You don't have access to this site!</h2>
    </div>

</div>


<div style="position: relative; margin-top:-30.3px">
    <%@include file="footer.jsp" %>
</div>

</body>
</html>
