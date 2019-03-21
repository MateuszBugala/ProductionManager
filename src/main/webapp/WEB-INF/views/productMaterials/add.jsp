<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product material - add</title>
    <%@ include file="../dependecies.jsp" %>
</head>
<body>

<%@include file="../loggedHeader.jsp" %>

<div class="w3-display-container w3-theme-l5" style="height:100%">

    <div class="w3-container w3-theme-l4" style="padding-top: 52px">
        <h2>Add a product material:</h2>
    </div>

    <div class="w3-container w3-margin">
    </div>

    <div class="w3-container w3-padding-16 w3-margin w3-col w3-card" style="width:30%">
        <form:form method="post" modelAttribute="productMaterial">

            <div class="w3-container w3-padding-16">
                <label>Material name:</label>
                <form:input path="name" class="w3-input w3-theme-l5"/>
                <form:errors path="name" cssClass="w3-text-red" element="div"/>
            </div>

            <input type="submit" value="Send" class="w3-btn w3-block w3-theme w3-large w3-margin"
                   style="width:80px">

        </form:form>
    </div>
</div>


<div style="position: relative; margin-top:-30.3px">
    <%@include file="../footer.jsp" %>
</div>

</body>
</html>
