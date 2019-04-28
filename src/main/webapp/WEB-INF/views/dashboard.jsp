<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<title>Production Manager App</title>
<%@ include file="dependecies.jsp" %>
<body class="bgimg">

<%@include file="loggedHeader.jsp" %>

<div class="w3-display-container w3-text-white">
    <div class="w3-display-topmiddle w3-jumbo">
        <p>Production Manager App</p>
    </div>
</div>

<c:choose>
    <c:when test="${currentUserGroup != 3}">

        <div class="w3-display-middle w3-container w3-large">

            <a href="${pageContext.request.contextPath}/products/all" class="w3-button w3-theme w3-xxxlarge">Products</a>
            <a href="${pageContext.request.contextPath}/quotations/all" class="w3-button w3-theme w3-xxxlarge">Quotations</a>


            <div class="w3-container w3-large">
                <p><a href="${pageContext.request.contextPath}/productColors/all" class="w3-button w3-theme w3-xxlarge">Product
                    colors</a>
                </p>
                <p><a href="${pageContext.request.contextPath}/productMaterials/all" class="w3-button w3-theme w3-xxlarge">Product
                    materials</a></p>
                <p><a href="${pageContext.request.contextPath}/productGroups/all" class="w3-button w3-theme w3-xxlarge">Product
                    groups</a>
                </p>
            </div>
        </div>

    </c:when>

    <c:otherwise>
        <div class="w3-display-middle w3-container w3-large">

            <div class="w3-bar">

                <a href="${pageContext.request.contextPath}/products/all" class="w3-button w3-theme w3-xxlarge" style="width:250px">Products</a>
                <a href="${pageContext.request.contextPath}/quotations/all" class="w3-button w3-theme w3-xxlarge"
                   style="width:250px">Quotations</a>
                <a href="${pageContext.request.contextPath}/users/all" class="w3-button w3-theme w3-xxlarge" style="width:250px">Users</a>

            </div>

            <div class="w3-container w3-large w3-margin">
                <div class="w3-bar">

                    <a href="${pageContext.request.contextPath}/productColors/all" class="w3-button w3-theme w3-xxlarge">Product
                        colors</a>
                    <a href="${pageContext.request.contextPath}/userGroups/all" class="w3-button w3-theme w3-xxlarge" style="margin-left: 22%">User groups</a>
                </div>

                <p><a href="${pageContext.request.contextPath}/productMaterials/all" class="w3-button w3-theme w3-xxlarge">Product
                    materials</a></p>
                <p><a href="${pageContext.request.contextPath}/productGroups/all" class="w3-button w3-theme w3-xxlarge">Product
                    groups</a>
                </p>
            </div>
        </div>

    </c:otherwise>

</c:choose>

</body>
</html>

