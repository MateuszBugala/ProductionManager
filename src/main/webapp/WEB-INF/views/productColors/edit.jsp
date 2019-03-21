<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product color - edit</title>
    <%@ include file="../dependecies.jsp" %>
</head>
<body>
<%@include file="../loggedHeader.jsp" %>

<div class="w3-display-container w3-theme-l5" style="height:100%">

    <div class="w3-container w3-theme-l4" style="padding-top: 52px">
        <h2>Edit a color:</h2>
    </div>

    <%--navigation buttons and notifications--%>
    <div class="w3-container w3-margin">
    </div>

    <%--main content--%>
    <div class="w3-container w3-padding-16 w3-margin w3-col w3-card" style="width:30%">
        <form:form method="post" modelAttribute="productColor" action="/productColors/edit">
            <form:hidden path="id"/>

            <div class="w3-container w3-padding-16">
                <label>Color name:</label>
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
