<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Quotations - details</title>
    <%@ include file="../../dependecies.jsp" %>
</head>
<body>
<%@include file="../../loggedHeader.jsp" %>

<c:choose>
    <%--status 1---------------------------------------------------------------------------------%>
    <c:when test="${quotation.status == 1}">

        <div class="w3-display-container w3-theme-l5" style="height:100%">

            <div class="w3-container w3-theme-l4" style="padding-top: 52px">
                <h2>Quotations details:</h2>
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
                        <th>Number</th>
                        <th>Remarks</th>
                        <th>Created By</th>
                        <th>Created on</th>
                        <th>Status</th>
                    </tr>
                    </thead>

                    <tbody>
                    <tr>
                        <td>${quotation.id}</td>
                        <td>${quotation.remarks}</td>
                        <td>${quotation.createdBy.fullName}</td>
                        <td>${quotation.creationTime}</td>
                        <td>${quotation.status}</td>
                    </tr>
                    </tbody>

                </table>
            </div>

                <%--lista QuotationItems--%>

            <div class="w3-container w3-margin w3-theme-l4">
                <h3 class="w3-center">Items in this quotation:</h3>

            </div>
            <div class="w3-container w3-margin">
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
                        </tr>
                    </c:forEach>
                    </tbody>

                </table>
            </div>
        </div>

    </c:when>

    <%--status 2---------------------------------------------------------------------------------%>
    <c:when test="${quotation.status == 2}">

        <div class="w3-display-container w3-theme-l5" style="height:100%">

            <div class="w3-container w3-theme-l4" style="padding-top: 52px">
                <h2>Quotations details:</h2>
            </div>

            <div class="w3-container w3-margin">

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

                    <a href="${pageContext.request.contextPath}/quotations/quoted/${quotation.id}"
                       class="w3-btn w3-medium w3-theme w3-large"
                       style="width:15%">Quotation ready - send</a>
                </div>

            </div>

            <div class="w3-container w3-margin">
                <table class="w3-table w3-striped w3-border w3-bordered w3-hoverable w3-card-4">

                    <thead>
                    <tr class="w3-light-grey">
                        <th>Number</th>
                        <th>Remarks</th>
                        <th>Created By</th>
                        <th>Created on</th>
                        <th>Status</th>
                        <th colspan="1">Actions</th>
                    </tr>
                    </thead>

                    <tbody>
                    <tr>
                        <td>${quotation.id}</td>
                        <td>${quotation.remarks}</td>
                        <td>${quotation.createdBy.fullName}</td>
                        <td>${quotation.creationTime}</td>
                        <td>${quotation.status}</td>

                        <td style="width: 50px"><a href="/quotations/edit/${quotation.id}">Add remarks</a></td>
                    </tr>
                    </tbody>

                </table>
            </div>

                <%--lista QuotationItems--%>

            <div class="w3-container w3-margin w3-theme-l4">
                <h3 class="w3-center">Items in this quotation:</h3>
            </div>

            <div class="w3-container w3-margin">
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
                        <th colspan="1">Actions</th>
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

                            <td style="width: 50px"><a href="/quotationItems/edit/${quotationItem.id}">Quote line</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>

                </table>
            </div>
        </div>

    </c:when>

    <%--status 3---------------------------------------------------------------------------------%>
    <c:when test="${quotation.status == 3}">

        <div class="w3-display-container w3-theme-l5" style="height:100%">

            <div class="w3-container w3-theme-l4" style="padding-top: 52px">
                <h2>Quotations details:</h2>
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
                        <th>Number</th>
                        <th>Remarks</th>
                        <th>Created By</th>
                        <th>Created on</th>
                        <th>Status</th>
                        <th colspan="1">Actions</th>
                    </tr>
                    </thead>

                    <tbody>
                    <tr>
                        <td>${quotation.id}</td>
                        <td>${quotation.remarks}</td>
                        <td>${quotation.createdBy.fullName}</td>
                        <td>${quotation.creationTime}</td>
                        <td>${quotation.status}</td>

                        <td style="width: 50px"><a href="/quotations/edit/${quotation.id}">Add remarks</a></td>
                    </tr>
                    </tbody>

                </table>
            </div>

                <%--lista QuotationItems--%>

            <div class="w3-container w3-margin w3-theme-l4">
                <h3 class="w3-center">Items in this quotation:</h3>
            </div>

            <div class="w3-container w3-margin">
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
                        <th colspan="1">Actions</th>
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
                        </tr>
                    </c:forEach>
                    </tbody>

                </table>
            </div>
        </div>

    </c:when>

    <%--status 4---------------------------------------------------------------------------------%>
    <c:otherwise>

        <div class="w3-display-container w3-theme-l5" style="height:100%">

            <div class="w3-container w3-theme-l4" style="padding-top: 52px">
                <h2>Quotations details:</h2>
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
                        <th>Number</th>
                        <th>Remarks</th>
                        <th>Created By</th>
                        <th>Created on</th>
                        <th>Status</th>
                    </tr>
                    </thead>

                    <tbody>
                    <tr>
                        <td>${quotation.id}</td>
                        <td>${quotation.remarks}</td>
                        <td>${quotation.createdBy.fullName}</td>
                        <td>${quotation.creationTime}</td>
                        <td>${quotation.status}</td>
                    </tr>
                    </tbody>

                </table>
            </div>

                <%--lista QuotationItems--%>

            <div class="w3-container w3-margin w3-theme-l4">
                <h3 class="w3-center">Items in this quotation:</h3>
            </div>

            <div class="w3-container w3-margin">
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
                        </tr>
                    </c:forEach>
                    </tbody>

                </table>
            </div>
        </div>

    </c:otherwise>

</c:choose>

<div style="position: relative; margin-top:-30.3px">
    <%@include file="../../footer.jsp" %>
</div>

</body>
</html>
