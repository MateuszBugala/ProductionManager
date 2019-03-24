<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Quotation - add items</title>
    <%@ include file="../dependecies.jsp" %>
</head>
<body>
<%@include file="../loggedHeader.jsp" %>

<div class="w3-display-container w3-theme-l5" style="height:100%">

    <div class="w3-container w3-theme-l4" style="padding-top: 52px">
        <h2>Choose products to quote:</h2>
    </div>

    <div class="w3-container w3-margin">

        <div class="w3-bar">
            <button type="button" class="w3-btn w3-pale-red w3-large" style="width: 15%"
                    onclick="history.back()">Back
            </button>

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
                <th colspan="2" style="text-align: center">Actions</th>
            </tr>
            </thead>

            <tbody>
            <c:forEach items="${products}" var="product" varStatus="stat">
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
                    <%--<td style="max-width: 400px">--%>
                        <%--<c:forEach items="${product.productMaterials}" var="productMaterials" varStatus="stat">--%>
                            <%--${stat.index+1}. ${productMaterials.name}<br>--%>
                        <%--</c:forEach>--%>
                    <%--</td>--%>
                    <td>${product.notes}</td>
                    <td style="width: 90px"><a  class="w3-btn w3-theme w3-large" href="/quotationItems/add/${id}/${product.id}">Add to quotation</a></td>
                    <td style="width: 50px"><a href="/products/details/${product.id}">Details</a></td>
                </tr>
            </c:forEach>
            </tbody>

        </table>
    </div>

</div>
<%-------------------------%>

<div style="position: relative; margin-top:-30.3px">
    <%@include file="../footer.jsp" %>
</div>

</body>
</html>
