<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Users - edit</title>
    <%@ include file="../dependecies.jsp" %>
</head>

<body>
<%@include file="../loggedHeader.jsp" %>

<%--------edit layout!--------%>
<div class="w3-display-container w3-theme-l5" style="height:100%">

    <div class="w3-container w3-center w3-theme-l4" style="padding-top: 52px">
        <h2>Edit user account</h2>
    </div>

    <div class="w3-container w3-margin">
    </div>

    <div class="w3-container w3-padding-16 w3-margin w3-col w3-card-4 w3-display-middle w3-theme-l5" style="width:30%">
        <form:form method="post" modelAttribute="user" action="/users/edit">
            <form:hidden path="id"/>
            <form:hidden path="userGroup.id"/>

            <div class="w3-container w3-padding-16">
                <label>First name:</label>
                <form:input path="firstName" class="w3-input w3-theme-l5"/>
                <form:errors path="firstName" cssClass="w3-text-red" element="div"/>
            </div>

            <div class="w3-container w3-padding-16">
                <label>Last name:</label>
                <form:input path="lastName" class="w3-input w3-theme-l5"/>
                <form:errors path="lastName" cssClass="w3-text-red" element="div"/>
            </div>

            <div class="w3-container w3-padding-16">
                <label>Email address:</label>
                <form:input path="email" readonly="true" class="w3-input w3-theme-l4 w3-border"/>
            </div>

            <div class="w3-container w3-padding-16">
                <label>User group:</label>
                <form:input path="userGroup.name" readonly="true" class="w3-input w3-theme-l4 w3-border"/>

            </div>

            <div class="w3-center w3-section">
                <button type="button" class="w3-btn w3-pale-red w3-large w3-margin"  style="width: 30%" onclick="history.back()">Back</button>
                <input type="submit" value="Update" class="w3-btn w3-theme w3-large w3-margin"  style="width: 30%">
            </div>

        </form:form>
    </div>
</div>
<%----------------%>


<div style="position: relative; margin-top:-30.3px">
    <%@include file="../footer.jsp" %>
</div

</body>
</html>
