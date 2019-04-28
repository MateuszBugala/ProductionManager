<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <%@ include file="../dependecies.jsp" %>
</head>

<body>

<%--------signin/login layout!--------%>
<div class="w3-display-container w3-theme-l5 bgimg" style="height:100%">

    <div class="w3-container w3-center w3-theme-d1">
        <h2>Log in</h2>
    </div>

    <div class="w3-container w3-margin">
        <c:if test="${not empty param.error}">
            <div class="w3-panel w3-pale-red w3-border w3-display-container">
                        <span onclick="this.parentElement.style.display='none'"
                              class="w3-button w3-large w3-display-topright">×</span>
                <h4 class="w3-center">Incorrect login or password</h4>
            </div>
        </c:if>
    </div>

    <div class="w3-container w3-padding-16 w3-margin w3-col w3-card-4 w3-display-middle w3-theme-l5" style="width:30%">
        <form:form method="post" modelAttribute="user">

            <div class="w3-container w3-padding-16">
                <label>Email address:</label>
                <form:input path="email" class="w3-input w3-theme-l5"/>
                <form:errors path="email" cssClass="w3-text-red" element="div"/>
            </div>

            <div class="w3-container w3-padding-16">
                <label>Password:</label>
                <form:input type="password" path="password" class="w3-input w3-theme-l5"/>
                <form:errors path="password" cssClass="w3-text-red" element="div"/>
            </div>

            <div class="w3-center w3-section">
                <button type="button" class="w3-btn w3-pale-red w3-large w3-margin"  style="width: 30%" onclick="location.href='${pageContext.request.contextPath}/'">Back</button>
                <input type="submit" value="Login" class="w3-btn w3-theme w3-large w3-margin"  style="width: 30%">
            </div>

        </form:form>
    </div>
</div>
<%----------------%>

<div style="position: relative; margin-top:-30.3px">
    <%@include file="../footer.jsp" %>
</div>

</body>
</html>
