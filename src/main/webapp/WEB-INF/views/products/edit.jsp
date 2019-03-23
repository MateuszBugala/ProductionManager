<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Products - edit</title>
    <%@ include file="../dependecies.jsp" %>
</head>
<body class="w3-theme-l5">

<%@include file="../loggedHeader.jsp" %>

<div class="w3-container w3-theme-l4" style="padding-top: 52px">
    <h2>Edit a product :</h2>
</div>

<div class="w3-container w3-margin">
</div>

<div class="w3-container w3-padding-16 w3-section w3-col w3-card" style="width:30%; margin-left: 35%">
    <form:form method="post" modelAttribute="product" action="/products/edit">
        <form:hidden path="id"/>

        <div class="w3-container w3-padding-16">
            <label>Code:</label>
            <form:input path="code" class="w3-input w3-theme-l5"/>
            <form:errors path="code" cssClass="w3-text-red" element="div"/>
        </div>

        <div class="w3-container w3-padding-16">
            <label>Name:</label>
            <form:input path="name" class="w3-input w3-theme-l5"/>
            <form:errors path="name" cssClass="w3-text-red" element="div"/>
        </div>

        <div class="w3-container w3-padding-16">
            <label for="productGroup">Product group:</label>
            <form:select path="productGroup" name="productGroup" class="w3-select w3-theme-l5">
                <form:option value="0" label="Choose product group"/><br>
                <form:options items="${productGroups}" itemLabel="name" itemValue="id"/><br>
            </form:select><br>
            <form:errors path="productGroup" cssClass="w3-text-red" element="div"/>
        </div>

        <div class="w3-container w3-padding-16">
            <label>Description:</label>
            <form:input path="description" class="w3-input w3-theme-l5"/>
            <form:errors path="description" cssClass="w3-text-red" element="div"/>
        </div>


        <div class="w3-container w3-padding-16">
            <label>Outer height:</label>
            <form:input path="outerHeight" class="w3-input w3-theme-l5"/>
            <form:errors path="outerHeight" cssClass="w3-text-red" element="div"/>
        </div>

        <div class="w3-container w3-padding-16">
            <label>Outer width:</label>
            <form:input path="outerWidth" class="w3-input w3-theme-l5"/>
            <form:errors path="outerWidth" cssClass="w3-text-red" element="div"/>
        </div>

        <div class="w3-container w3-padding-16">
            <label>Outer length:</label>
            <form:input path="outerLength" class="w3-input w3-theme-l5"/>
            <form:errors path="outerLength" cssClass="w3-text-red" element="div"/>
        </div>

        <div class="w3-container w3-padding-16">
            <label for="productColors">Product colors:</label>
            <form:select path="productColors" name="productColors" class="w3-select w3-theme-l5">
                <form:option value="0" label="Choose product colors"/><br>
                <form:options items="${productColors}" itemLabel="name" itemValue="id"/><br>
            </form:select><br>
            <form:errors path="productColors" cssClass="w3-text-red" element="div"/>
        </div>

        <div class="w3-container w3-padding-16">
            <label for="productMaterials">Product materials:</label>
            <form:select path="productMaterials" name="productMaterials" class="w3-select w3-theme-l5">
                <form:option value="0" label="Choose product materials"/><br>
                <form:options items="${productMaterials}" itemLabel="name" itemValue="id"/><br>
            </form:select><br>
            <form:errors path="productMaterials" cssClass="w3-text-red" element="div"/>
        </div>

        <div class="w3-container w3-padding-16">
            <label>Notes:</label>
            <form:input path="notes" class="w3-input w3-theme-l5"/>
            <form:errors path="notes" cssClass="w3-text-red" element="div"/>
        </div>

        <div class="w3-center w3-section">
            <button type="button" class="w3-btn w3-pale-red w3-large w3-margin"  style="width: 30%" onclick="history.back()">Back</button>
            <input type="submit" value="Update" class="w3-btn w3-theme w3-large w3-margin"  style="width: 30%">
        </div>

    </form:form>
</div>

</body>
</html>
