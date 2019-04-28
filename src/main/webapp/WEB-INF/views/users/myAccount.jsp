<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>My account</title>
    <%@ include file="../dependecies.jsp" %>
</head>

<body>
<%@include file="../loggedHeader.jsp" %>

<%--------my account layout!--------%>
<div class="w3-display-container w3-theme-l5" style="height:100%">

    <div class="w3-container w3-center w3-theme-l4" style="padding-top: 52px">
        <h2>My account</h2>
    </div>

    <div class="w3-container w3-margin">
    </div>

    <div class="w3-container w3-padding-16 w3-margin w3-col w3-card-4 w3-display-middle w3-theme-l5" style="width:30%">

            <div class="w3-container w3-padding-16">
                <div>First name:</div>
                <div class="w3-input w3-theme-l4 w3-border">${currentUser.firstName}</div>
            </div>

            <div class="w3-container w3-padding-16">
                <div>Last name:</div>
                <div class="w3-input w3-theme-l4 w3-border">${currentUser.lastName}</div>
            </div>

            <div class="w3-container w3-padding-16">
                <div>Email address:</div>
                <div class="w3-input w3-theme-l4 w3-border">${currentUser.email}</div>
            </div>

            <div class="w3-container w3-padding-16">
                <div>User group:</div>
                <div class="w3-input w3-theme-l4 w3-border">${currentUser.userGroup.name}</div>
            </div>

            <div class="w3-center w3-section">
                <button type="button" class="w3-btn w3-pale-red w3-large w3-margin"  style="width: 30%" onclick="history.back()">Back</button>
                <button type="button" class="w3-btn w3-theme w3-large w3-margin"  style="width: 30%" onclick="location.href='${pageContext.request.contextPath}/users/edit/${currentUser.id}'">Edit</button>
            </div>

    </div>
</div>
<%----------------%>


<div style="position: relative; margin-top:-30.3px">
    <%@include file="../footer.jsp" %>
</div

</body>
</html>
