<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product material - add</title>
    <link rel="stylesheet" href="/css/styles.css">
</head>

<body>

<%--poniższe rozróżnienie nie jest potrzebne bo jest blokada na kontrolerze--%>
<c:choose>

    <c:when test="${userGroup == 2}">
        You don't have access to this site!
        <script>
            var timer = setTimeout(function() {
                history.back()
            }, 2000);
        </script>
    </c:when>

    <c:otherwise>
        <button onclick="location.href='http://localhost:8080/'" type="button">HOME</button>

        <h1>Add a material:</h1>

        <form:form method="post" modelAttribute="productMaterial">

            <table>
                <tr>
                    <td>Product material name:</td>
                    <td><form:input path="name"/><br></td>
                    <td><form:errors path="name" cssClass="error-message" element="div"/></td>
                </tr>

            </table>

            <input type="submit" value="Send" style="margin-top: 30px">

        </form:form>
    </c:otherwise>

</c:choose>
</body>

</html>
