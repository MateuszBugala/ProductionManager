<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Status changed</title>
    <%@ include file="../dependecies.jsp" %>
    <script>
        var timer = setTimeout(function () {
            window.location = '${pageContext.request.contextPath}/quotations/all'
        }, 3000);
    </script>
</head>
<body>
<%@include file="../loggedHeader.jsp" %>

<div class="w3-display-container w3-theme-l5 bgimg" style="height:100%">

    <div class="w3-panel w3-pale-green w3-border w3-display-middle" style="width:80%">
        <h2 class="w3-center">Status of quotation ${id} has been changed!</h2>
    </div>

</div>

<div style="position: relative; margin-top:-30.3px">
    <%@include file="../footer.jsp" %>
</div>

</body>
</html>