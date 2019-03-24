<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Quotation Item - edit</title>
    <%@ include file="../../dependecies.jsp" %>
</head>
<body>
<%@include file="../../loggedHeader.jsp" %>

<div class="w3-display-container w3-theme-l5" style="height:100%">

    <div class="w3-container w3-theme-l4" style="padding-top: 52px">
        <h2>Quote line:</h2>
    </div>

    <div class="w3-container w3-margin">

        <div class="w3-bar">
        </div>

    </div>

    <div class="w3-container w3-margin">
        <table class="w3-table w3-striped w3-border w3-bordered w3-hoverable w3-card-4">

            <thead>
            <tr class="w3-light-grey">
                <th>Code</th>
                <th>Name</th>
                <th>Description</th>
                <th>Group</th>
                <th>OuterHeight</th>
                <th>OuterWidth</th>
                <th>OuterLength</th>
                <th>Colors</th>
                <%--<th>Materials</th>--%>
                <th>Notes</th>
            </tr>
            </thead>

            <tbody>
            <tr>
                <td>${product.code}</td>
                <td>${product.name}</td>
                <td>${product.description}</td>
                <td>${product.productGroup.name}</td>
                <td>${product.outerHeight}</td>
                <td>${product.outerWidth}</td>
                <td>${product.outerLength}</td>

                <td style="max-width: 400px">
                    <c:forEach items="${product.productColors}" var="productColors" varStatus="stat">
                        ${stat.index+1}. ${productColors.name}<br>
                    </c:forEach>
                </td>

                <%--<td>${product.productMaterials}</td>--%>

                <td>${product.notes}</td>
            </tr>
            </tbody>

        </table>
    </div>

    <div class="w3-container w3-margin w3-theme-l4">
        <h3 class="w3-center">Change details:</h3>

    </div>

    <div class="w3-container w3-margin">
        <div class="w3-container w3-padding-16 w3-section w3-col w3-card" style="width:30%; margin-left: 35%">
            <form:form method="post" modelAttribute="quotationItem"
                       action="/quotationItems/edit/${quotationItem.quotation.id}/${product.id}">
                <form:hidden path="id"/>

                <div class="w3-container w3-padding-16">
                    <label>Quantity:</label>
                    <form:input path="quantity" class="w3-input w3-theme-l5"/>
                    <form:errors path="quantity" cssClass="w3-text-red" element="div"/>
                </div>

                <div class="w3-container w3-padding-16">
                    <label>Price:</label>
                    <form:input path="price" class="w3-input w3-theme-l5"/>
                    <form:errors path="price" cssClass="w3-text-red" element="div"/>
                </div>

                <div class="w3-container w3-padding-16">
                    <label>Required delivery date:</label>
                    <form:input path="requiredDeliveryDate" type="date" class="w3-input w3-theme-l5"/>
                    <form:errors path="requiredDeliveryDate" cssClass="w3-text-red" element="div"/>
                </div>

                <div class="w3-container w3-padding-16">
                    <label>Actual delivery date:</label>
                    <form:input path="actualDeliveryDate" type="date" class="w3-input w3-theme-l5"/>
                    <form:errors path="actualDeliveryDate" cssClass="w3-text-red" element="div"/>
                </div>

                <div class="w3-container w3-padding-16">
                    <label>Special notes:</label>
                    <form:input path="notes" class="w3-input w3-theme-l5"/>
                    <form:errors path="notes" cssClass="w3-text-red" element="div"/>
                </div>

                <div class="w3-center w3-section">
                    <button type="button" class="w3-btn w3-pale-red w3-large w3-margin"  style="width: 30%" onclick="history.back()">Back</button>
                    <input type="submit" value="Quote line" class="w3-btn w3-theme w3-large w3-margin">
                </div>

            </form:form>
        </div>
    </div>

</div>


<div style="position: relative; margin-top:-30.3px">
    <%@include file="../../footer.jsp" %>
</div>

</body>
</html>
