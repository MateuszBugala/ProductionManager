<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Quotations - details</title>
    <%@ include file="../../dependecies.jsp" %>
</head>
<body>
<%@include file="../../loggedHeader.jsp" %>

<div class="w3-display-container w3-theme-l5" style="height:100%">

    <div class="w3-container w3-theme-l4" style="padding-top: 52px">
        <h2>Quotations details:</h2>
    </div>

    <div class="w3-container w3-margin">

        <c:if test="${not empty param.error}">
            <div class="w3-panel w3-pale-red w3-border w3-display-container">
                        <span onclick="this.parentElement.style.display='none'"
                              class="w3-button w3-large w3-display-topright">×</span>
                <h4 class="w3-center">Item cannot be deleted - it has some records in database</h4>
            </div>
        </c:if>

        <c:if test="${not empty param.deleted}">
            <div class="w3-panel w3-pale-green w3-border w3-display-container">
                        <span onclick="this.parentElement.style.display='none'"
                              class="w3-button w3-large w3-display-topright">×</span>
                <h4 class="w3-center">Item has been deleted</h4>
            </div>
        </c:if>

        <c:if test="${not empty param.noItems}">
            <div class="w3-panel w3-pale-red w3-border w3-display-container">
                        <span onclick="this.parentElement.style.display='none'"
                              class="w3-button w3-large w3-display-topright">×</span>
                <h4 class="w3-center">Quotation with no items cannot be sent</h4>
            </div>
        </c:if>

        <c:if test="${not empty param.sent}">
            <div class="w3-panel w3-pale-red w3-border w3-display-container">
                        <span onclick="this.parentElement.style.display='none'"
                              class="w3-button w3-large w3-display-topright">×</span>
                <h4 class="w3-center">You cannot delete items if quotation has status > 2</h4>
            </div>
        </c:if>

        <c:if test="${not empty param.emptyPrice}">
            <div class="w3-panel w3-pale-red w3-border w3-display-container">
                        <span onclick="this.parentElement.style.display='none'"
                              class="w3-button w3-large w3-display-topright">×</span>
                <h4 class="w3-center">Please fill in prices and actual DD for each line</h4>
            </div>
        </c:if>

        <div class="w3-bar">

            <a href="${pageContext.request.contextPath}/quotations/all"
               class="w3-btn w3-pale-red w3-large"
               style="width:15%">Back</a>
            <a href="${pageContext.request.contextPath}/quotations/sent/${quotation.id}"
               class="w3-btn w3-medium w3-theme w3-large"
               style="width:15%">Set status to 2</a>
            <a href="${pageContext.request.contextPath}/quotations/quoted/${quotation.id}"
               class="w3-btn w3-medium w3-theme w3-large"
               style="width:15%">Set status to 3</a>
            <a href="${pageContext.request.contextPath}/quotations/approved/${quotation.id}"
               class="w3-btn w3-medium w3-theme w3-large"
               style="width:15%">Set status to 4</a>
        </div>

    </div>

    <div class="w3-container w3-margin">
        <table class="w3-table w3-striped w3-border w3-bordered w3-hoverable w3-card-4">

            <thead>
            <tr class="w3-light-grey">
                <th>Number</th>
                <th>Customer Name</th>
                <th>Delivery Term</th>
                <th>Notes</th>
                <th>Remarks</th>
                <th>Created By</th>
                <th>Created on</th>
                <th>Status</th>
                <th colspan="2">Actions</th>
            </tr>
            </thead>

            <tbody>
            <tr>
                <td>${quotation.id}</td>
                <td>${quotation.customerName}</td>
                <td>${quotation.deliveryTerm}</td>
                <td>${quotation.notes}</td>
                <td>${quotation.remarks}</td>
                <td>${quotation.createdBy.fullName}</td>
                <td>${quotation.creationTime}</td>
                <td>${quotation.status}</td>


                <td style="width: 50px"><a href="/quotations/edit/${quotation.id}">Edit</a></td>
                <td style="width: 50px"><a href="/quotations/delete/${quotation.id}"
                                           onclick="return confirm('Are you sure you want to delete this item?');">Delete</a>
                </td>
            </tr>
            </tbody>

        </table>
    </div>

    <%--lista QuotationItems--%>

    <div class="w3-container w3-margin w3-theme-l4">
        <h3 class="w3-center">Items in this quotation:</h3>

    </div>
    <div class="w3-container w3-margin">
        <a href="${pageContext.request.contextPath}/quotations/addItem/${quotation.id}"
           class="w3-btn w3-medium w3-theme w3-large"
           style="width:30%; margin-left: 35%">Add products to this quotation</a>
    </div>

    <div class="w3-container w3-margin">
        <table class="w3-table w3-striped w3-border w3-bordered w3-hoverable w3-card-4"
               style="width:80%; margin-left: 10%">

            <thead>
            <tr class="w3-light-grey">
                <th>LP</th>
                <th>Product name</th>
                <th>Qty</th>
                <th>Price</th>
                <th>Required DD</th>
                <th>Actual DD</th>
                <th>Notes</th>
                <th colspan="2">Actions</th>
            </tr>
            </thead>

            <tbody>
            <c:forEach items="${quotationItems}" var="quotationItem" varStatus="stat">
                <tr>
                    <td>${stat.index+1}</td>
                    <td>${quotationItem.product.name}</td>
                    <td>${quotationItem.quantity}</td>
                    <td>${quotationItem.price}</td>
                    <td>${quotationItem.requiredDeliveryDate}</td>
                    <td>${quotationItem.actualDeliveryDate}</td>
                    <td>${quotationItem.notes}</td>

                    <td style="width: 50px"><a href="/quotationItems/edit/${quotationItem.id}">Edit line</a>
                    </td>
                    <td style="width: 50px"><a
                            href="/quotationItems/delete/${quotation.id}/${quotationItem.id}">Delete
                        line</a></td>
                </tr>
            </c:forEach>
            </tbody>

        </table>
    </div>
</div>

<div style="position: relative; margin-top:-30.3px">
    <%@include file="../../footer.jsp" %>
</div>

</body>
</html>
