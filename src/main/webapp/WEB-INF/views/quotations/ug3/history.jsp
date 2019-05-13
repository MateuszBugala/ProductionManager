<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Quotations - history</title>
    <%@ include file="../../dependecies.jsp" %>
</head>
<body>
<%@include file="../../loggedHeader.jsp" %>

<div class="w3-display-container w3-theme-l5" style="height:100%">

    <div class="w3-container w3-theme-l4" style="padding-top: 52px">
        <h2>Quotations history:</h2>
    </div>

    <div class="w3-container w3-margin">

        <div class="w3-bar">

            <a href="${pageContext.request.contextPath}/quotations/all"
               class="w3-btn w3-pale-red w3-large"
               style="width:15%">Back</a>
        </div>

    </div>

    <div class="w3-container w3-margin">
        <table class="w3-table w3-striped w3-border w3-bordered w3-hoverable w3-card-4">

            <thead>
            <tr class="w3-light-grey">
                <th>Status</th>
                <th>Time of change</th>
            </tr>
            </thead>

            <tbody>
            <tr>
                <td>1 - created</td>
                <td>${quotation.creationTime}</td>
            </tr>
            <tr>
                <td>2 - sent to production</td>
                <td>${quotation.creationTimeStat2}</td>
            </tr>
            <tr>
                <td>3 - quoted</td>
                <td>${quotation.creationTimeStat3}</td>
            </tr>
            <tr>
                <td>4 - approved</td>
                <td>${quotation.creationTimeStat4}</td>
            </tr>
            </tbody>

        </table>
    </div>

</div>

<div style="position: relative; margin-top:-30.3px">
    <%@include file="../../footer.jsp" %>
</div>

</body>
</html>
