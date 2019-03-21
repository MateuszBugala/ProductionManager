<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Color - add</title>
    <%@ include file="../dependecies.jsp" %>
</head>
<body>

<%@include file="../loggedHeader.jsp" %>

<div class="w3-display-container w3-theme-l5" style="height:100%">

    <div class="w3-container w3-theme-l4" style="padding-top: 52px">
        <h2>Add a color:</h2>
    </div>

    <%--navigation buttons and notifications--%>
    <div class="w3-container w3-margin">
    </div>

    <%--main content--%>
    <div class="w3-container w3-margin w3-padding-24 w3-col w3-card" style="width:30%">
        <form:form method="post" modelAttribute="productColor">

            <%--dla inputa:
            w3-section=16px top and bottom margin;
            w3-theme-l5=the same color as background
            w3-border-bottom=only bottom border
            ewentualnie : "w3-border-0"--%>
            <label>Color name:</label>
            <form:input path="name" class="w3-input w3-section w3-border-bottom"/>
            <form:errors path="name" cssClass="error-message w3-section" element="div"/>

            <input type="submit" value="Send" class="w3-btn w3-medium w3-block w3-theme w3-large" style="width:80px">

        </form:form>
    </div>
</div>


<div style="position: relative; margin-top:-30.3px">
    <%@include file="../footer.jsp" %>
</div>


</body>
</html>
