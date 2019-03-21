<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Production Manager</title>
    <%@ include file="dependecies.jsp" %>
</head>
<body id="myPage">


<c:choose>
    <c:when test="${sessionScope.logged != null}">
        <%@include file="loggedHeader.jsp" %>
    </c:when>
    <c:otherwise>
        <%@include file="header.jsp" %>
    </c:otherwise>
</c:choose>

<!-- Image -->
<div class="w3-display-container w3-animate-opacity">
    <img src="../../css/background.jpg" alt="bgr" style="width:100%;">

    <div class="w3-display-topmiddle w3-jumbo w3-text-white">
        <p>Production Manager App</p>
    </div>

    <div class="w3-container w3-display-middle w3-margin-bottom">
        <p>
            <button onclick="location.href='/login/'" class="w3-button w3-xxxlarge w3-theme w3-hover-teal">Log in</button>
        </p>
        <p>
            <button onclick="location.href='/users/add'" class="w3-button w3-xxxlarge w3-theme w3-hover-teal">Create an account
            </button>
        </p>

    </div>
</div>


<!-- Description -->
<div class="w3-row-padding w3-padding-64 w3-theme-l1" id="work">

    <div class="w3-quarter">
        <h2>How it works</h2>
        <h3>Using this application is easy. Create account as Sales and try:</h3>
    </div>

    <div class="w3-quarter">
        <div class="w3-card w3-white">
            <img src="#" alt=" " style="width:100%">
            <div class="w3-container">
                <h3>1. Create products or use existing ones</h3>
                <h4>Add all details like:</h4>
                <p>- materials and groups</p>
                <p>- dimensions</p>
                <p><strong>- you can add files like photos or PDFs</strong></p>

            </div>
        </div>
    </div>

    <div class="w3-quarter">
        <div class="w3-card w3-white">
            <img src="#" alt=" " style="width:100%">
            <div class="w3-container">
                <h3>2. Create a quotation and add products</h3>
                <h4>You need to fill in:</h4>
                <p>- required delivery dates</p>
                <p>- quantites</p>
                <p>- other details</p>

            </div>
        </div>
    </div>

    <div class="w3-quarter">
        <div class="w3-card w3-white">
            <img src="#" alt=" " style="width:100%">
            <div class="w3-container">
                <h3>3. Send quotation to Production department</h3>
                <p>- you will <strong>recieve an email when the quotation is ready</strong></p>
                <p>- you can negotiate with Production</p>
                <p>- once you approve the prices and conditions your quotation is stored in database for further reference</p>
                <p></p>

            </div>
        </div>
    </div>

</div>



<%@ include file="footer.jsp" %>

</body>
</html>
