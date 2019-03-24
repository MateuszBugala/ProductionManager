<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Quotations - add</title>
    <%@ include file="../dependecies.jsp" %>
</head>
<body>

<%@include file="../loggedHeader.jsp" %>

<div class="w3-display-container w3-theme-l5" style="height:100%">

    <div class="w3-container w3-theme-l4" style="padding-top: 52px">
        <h2>Add a quotation:</h2>
    </div>

    <div class="w3-container w3-margin">
    </div>

    <div class="w3-container w3-padding-16 w3-margin w3-col w3-card" style="width:30%">
        <form:form method="post" modelAttribute="quotation">

            <div class="w3-container w3-padding-16">
                <label>Customer name:</label>
                <form:input path="customerName" class="w3-input w3-theme-l5"/>
                <form:errors path="customerName" cssClass="w3-text-red" element="div"/>
            </div>

            <div class="w3-container w3-padding-16">
                <label>Delivery Term:</label>
                <form:input path="deliveryTerm" class="w3-input w3-theme-l5"/>
                <form:errors path="deliveryTerm" cssClass="w3-text-red" element="div"/>
            </div>

            <div class="w3-container w3-padding-16">
                <label>Notes:</label>
                <form:input path="notes" class="w3-input w3-theme-l5"/>
                <form:errors path="notes" cssClass="w3-text-red" element="div"/>
            </div>

            <div class="w3-container w3-padding-16">
                <label>Remarks:</label>
                <form:input path="remarks" class="w3-input w3-theme-l5"/>
                <form:errors path="remarks" cssClass="w3-text-red" element="div"/>
            </div>

            <input type="submit" value="Create" class="w3-btn w3-theme w3-large w3-margin">

        </form:form>
    </div>
</div>

<div style="position: relative; margin-top:-30.3px">
    <%@include file="../footer.jsp" %>
</div>
</body>
</html>
