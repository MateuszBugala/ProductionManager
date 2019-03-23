<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User group - list</title>
    <%@ include file="../dependecies.jsp" %>
</head>
<body>

<%@include file="../loggedHeader.jsp" %>

<div class="w3-display-container w3-theme-l5" style="height:100%">

    <div class="w3-container w3-theme-l4" style="padding-top: 52px">
        <h2>User group list:</h2>
    </div>

    <div class="w3-container w3-margin">
    </div>

    <div class="w3-container w3-margin">
        <table class="w3-table w3-striped w3-border w3-bordered w3-hoverable w3-card-4" style="width:30%">

            <thead>
            <tr class="w3-light-grey">
                <th>LP</th>
                <th>Name</th>
                <th colspan="1">Actions</th>
            </tr>
            </thead>

            <tbody>
            <c:forEach items="${userGroups}" var="userGroup" varStatus="stat">
                <tr>
                    <td>${stat.index+1}</td>
                    <td>${userGroup.name}</td>
                    <td style="width: 50px"><a href="/userGroups/edit/${userGroup.id}" >Edit</a></td>
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
