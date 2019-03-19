<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Users - add</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="/css/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">


</head>


<c:if test ="${not empty param.duplicatedemail}">
    <h4 style="color: red"><span>There is already user with such email - please user other address</span></h4>
</c:if>

<form:form method="post" modelAttribute="user">
<div class="container" style="width: 50%; margin-left: 25%">

    <h1>Create an user</h1>
    <p>Please fill in this form to create an account.</p>
    <hr>


    <label for="firstName"><b>First name:</b></label>
    <form:input path="firstName" placeholder="Enter first name" name="firstName" />
    <form:errors path="firstName" cssClass="error-message" element="div" />

    <label for="lastName"><b>Last name:</b></label>
    <form:input path="lastName" placeholder="Enter last name" name="lastName" />
    <form:errors path="lastName" cssClass="error-message" element="div" />

    <label for="email"><b>Email:</b></label>
    <form:input path="email" placeholder="Enter email" name="email" />
    <form:errors path="email" cssClass="error-message" element="div" />

    <label for="password"><b>Password:</b></label>
    <form:input type="password" path="password" placeholder="Enter password" name="password" />
    <form:errors path="password" cssClass="error-message" element="div" />

    <label for="userGroup"><b>User group:</b></label>
    <form:select path="userGroup" name="userGroup" class="w3-select">
        <form:option value="0" label="Choose user group"/><br>
        <form:options items="${userGroups}" itemLabel="name" itemValue="id"/><br>
    </form:select><br>
    <form:errors path="userGroup" cssClass="error-message" element="div"/>

    <div class="clearfix" style="margin-top: 80px">
        <button type="button" class="cancelbtn" onclick="location.href='http://localhost:8080/'">Back</button>
        <button type="submit" class="signupbtn">Create</button>
    </div>
</div>
</form:form>



</body>
</html>
