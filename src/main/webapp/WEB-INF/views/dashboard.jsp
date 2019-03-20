<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<title>Production Manager App</title>
<%--<meta charset="text/html;charset=UTF-8">--%>
<%--<meta name="viewport" content="width=device-width, initial-scale=1">--%>
<%--<link rel="stylesheet" href="../../css/w3.css">--%>
<%--<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">--%>
<%@ include file="dependecies.jsp" %>
<body class="bgimg">

<%@include file="loggedHeader.jsp" %>

<div class="w3-display-container w3-text-white">
    <div class="w3-display-topmiddle w3-jumbo">
        <p>Production Manager App</p>
    </div>
</div>


<div class="w3-display-middle w3-container w3-large">

    <a href="http://localhost:8080/products/all" class="w3-button w3-theme w3-jumbo">Products</a>
    <a href="http://localhost:8080/quotations/all" class="w3-button w3-theme w3-jumbo">Quotations</a>
    <%--różnica w widoku dla userGroup----------------------------------%>
    <c:choose>
        <c:when test="${currentUserGroup == 3}">
            <a href="http://localhost:8080/users/all" class="w3-button w3-theme w3-jumbo">Users</a>
        </c:when>
        <c:otherwise>
        </c:otherwise>
    </c:choose>

    <div class="w3-container w3-large">
    <p><a href="http://localhost:8080/productGroups/all" class="w3-button w3-theme w3-xxlarge">Product groups</a></p>
    <p><a href="http://localhost:8080/productColors/all" class="w3-button w3-theme w3-xxlarge">Product colors</a></p>
    <p><a href="http://localhost:8080/productMaterials/all" class="w3-button w3-theme w3-xxlarge">Product materials</a></p>  <p><a href="#" class="w3-button w3-theme w3-xxlarge"></a></p>
    </div>
</div>

</body>
</html>

