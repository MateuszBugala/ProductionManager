<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<title>Production Manager App</title>
<meta charset="text/html;charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/css/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">

<body>
<%--przekierowanie dla zalogowanych użytkowników--%>
<c:choose>
    <c:when test="${currentUser != null}">
        <script>
            var timer = setTimeout(function() {
                window.location='http://localhost:8080/dashboard'
            }, 1);
        </script>
    </c:when>

    <c:otherwise>
        <div class="bgimg w3-display-container w3-text-white">
            <div class="w3-display-topmiddle w3-jumbo">
                <p>Production Manager App</p>
            </div>
            <div class="w3-display-middle w3-container w3-xlarge">
                <p>
                    <button onclick="location.href='/login/'" class="w3-button w3-black w3-xxlarge">Log in</button>
                </p>
                <p>
                    <button onclick="location.href='/users/add'" class="w3-button w3-black w3-xxlarge">Create an user
                    </button>
                </p>
            </div>

        </div>

        <div class="w3-display-left w3-container w3-large">
            <h4><a href="http://localhost:8080/productGroups/all" class="w3-button w3-black w3-large">Product group</a>
            </h4>
            <h4><a href="http://localhost:8080/productColors/all" class="w3-button w3-black w3-large">Product color</a>
            </h4>
            <h4><a href="http://localhost:8080/productMaterials/all" class="w3-button w3-black w3-large">Product
                material</a></h4>
            <h4><a href="http://localhost:8080/products/all" class="w3-button w3-black w3-large">Products</a></h4>
            <h4><a href="http://localhost:8080/quotations/all" class="w3-button w3-black w3-large">Quotation</a></h4>
            <h4><a href="http://localhost:8080/users/all" class="w3-button w3-black w3-large">Users</a></h4>
        </div>
    </c:otherwise>

</c:choose>
</body>
</html>

