<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Users - list</title>
    <%@ include file="../dependecies.jsp" %>
</head>
<body>

<%@include file="../loggedHeader.jsp" %>

<div class="w3-display-container w3-theme-l5" style="height:100%">

    <div class="w3-container w3-theme-l4" style="padding-top: 52px">
        <h2>Users list:</h2>
    </div>

    <div class="w3-container w3-margin">

        <c:if test="${not empty param.error}">
            <div class="w3-panel w3-pale-red w3-border w3-display-container">
                <span onclick="this.parentElement.style.display='none'"
                      class="w3-button w3-large w3-display-topright">×</span>
                <h4 class="w3-center">User cannot be deleted - it has some records in database</h4>
            </div>
        </c:if>

        <c:if test="${not empty param.deleted}">
            <div class="w3-panel w3-pale-green w3-border w3-display-container">
                <span onclick="this.parentElement.style.display='none'"
                      class="w3-button w3-large w3-display-topright">×</span>
                <h4 class="w3-center">User has been deleted</h4>
            </div>
        </c:if>

        <div class="w3-container w3-center">
            <a href="http://localhost:8080/users/add"
               class="w3-btn w3-medium w3-theme w3-large"
               style="width:30%">Create a new user</a>
        </div>
    </div>

    <div class="w3-container w3-margin">
        <table class="w3-table w3-striped w3-border w3-bordered w3-hoverable w3-card-4">

            <thead>
            <tr class="w3-light-grey">
                <th>LP</th>
                <th>First name</th>
                <th>Last name</th>
                <th>Email</th>
                <th>Group</th>
                <th colspan="2">Actions</th>
            </tr>
            </thead>

            <tbody>
            <c:forEach items="${users}" var="user" varStatus="stat">
                <tr>
                    <td>${stat.index+1}</td>
                    <td>${user.firstName}</td>
                    <td>${user.lastName}</td>
                    <td>${user.email}</td>
                    <td>${user.userGroup.name}</td>
                    <td style="width: 50px"><a href="/users/edit/${user.id}">Edit</a></td>
                    <td style="width: 50px"><a href="/users/delete/${user.id}"
                                               onclick="return confirm('Are you sure you want to delete this item?');">Delete</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>

        </table>
    </div>
</div>

<div style="position: relative; margin-top:-30.3px">
    <%@include file="../footer.jsp" %>
</div>

</body>
</html>
