<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <%--<meta name="viewport" content="width=device-width, initial-scale=1">--%>
    <%--<link rel="stylesheet" href="/css/w3.css">--%>
    <%--<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">--%>

    <%@ include file="../dependecies.jsp" %>

</head>
<body class="bgimg">

<form:form method="post" modelAttribute="user">
    <div class="container" style="width: 50%; margin-left: 25%">

        <h1>Log in</h1>
        <p>Please fill in your credentials</p>
        <hr>

        <label for="email"><b>Email:</b></label>
        <form:input path="email" placeholder="Enter email" name="email" cssClass="inpt"/>
        <form:errors path="email" cssClass="error-message" element="div"/>

        <label for="password"><b>Password:</b></label>
        <form:input type="password" path="password" placeholder="Enter password" name="password" cssClass="inpt"/>
        <form:errors path="password" cssClass="error-message" element="div"/>

        <c:if test="${not empty param.error}">
            <h3 style="color: red; text-align: center"><span>Incorrect login or password</span></h3>
        </c:if>

        <div class="clearfix" style="margin-top: 80px">
            <button type="button" class="cancelbtn" onclick="location.href='http://localhost:8080/'">Back</button>
            <button type="submit" class="signupbtn">Log in</button>
        </div>
    </div>
</form:form>


</body>
</html>
