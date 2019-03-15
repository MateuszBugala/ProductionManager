<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Quotations - details</title>
    <link rel="stylesheet" href="/css/styles.css">
</head>
<body>

<button onclick="location.href='../../../..'" type="button">HOME</button>
<button type="button" name="back" onclick="history.back()">Back</button>

<h3>Quotations details:</h3>

<c:choose>
    <%--status 1---------------------------------------------------------------------------------%>
    <c:when test="${quotation.status == 1}">
        <table border="1" style="text-align: center">

            <thead>
            <th>Number</th>
            <th>Customer Name</th>
            <th>Delivery Term</th>
            <th>Notes</th>
            <th>Remarks</th>
            <th>Created By</th>
            <th>Created on</th>
            <th>Status</th>
            <th colspan="2">Actions</th>
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

        <%--lista QuotationItems--%>

        <br><br>
        <h3>Items in this quotation:</h3>
        <h4><a href="/quotations/addItem/${quotation.id}">Add products to this quotation</a></h4>
        <table border="1" style="text-align: center">

            <thead>
            <th>LP</th>
            <th>Product name</th>
            <th>Qty</th>
            <th>Price</th>
            <th>Required DD</th>
            <th>Actual DD</th>
            <th>Notes</th>
            <th colspan="2">Actions</th>
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

                    <td style="width: 50px"><a href="/quotationItems/edit/${quotationItem.id}">Edit line</a></td>
                    <td style="width: 50px"><a href="/quotationItems/delete/${quotation.id}/${quotationItem.id}">Delete
                        line</a></td>
                </tr>
            </c:forEach>
            </tbody>

        </table>

        <c:if test="${not empty param.error}">
            <h4 style="color: red"><span>Item cannot be deleted - it has some records in database</span></h4>
        </c:if>
        <c:if test="${not empty param.deleted}">
            <h4 style="color: red"><span>Item has been deleted</span></h4>
        </c:if>
        <c:if test="${not empty param.noItems}">
            <h4 style="color: red"><span>Quotation with no items cannot be sent</span></h4>
        </c:if>

        <button onclick="location.href='http://localhost:8080/quotations/sent/${quotation.id}'" type="button">Send to
            Production Department
        </button>
    </c:when>

    <%--status 2---------------------------------------------------------------------------------%>
    <c:when test="${quotation.status == 2}">
        <table border="1" style="text-align: center">

            <thead>
            <th>Number</th>
            <th>Customer Name</th>
            <th>Delivery Term</th>
            <th>Notes</th>
            <th>Remarks</th>
            <th>Created By</th>
            <th>Created on</th>
            <th>Status</th>
            <th colspan="1">Actions</th>
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
            </tr>
            </tbody>

        </table>

        <%--lista QuotationItems--%>

        <br><br>
        <h3>Items in this quotation:</h3>
        <h4><a href="/quotations/addItem/${quotation.id}">Add products to this quotation</a></h4>
        <table border="1" style="text-align: center">

            <thead>
            <th>LP</th>
            <th>Product name</th>
            <th>Qty</th>
            <th>Price</th>
            <th>Required DD</th>
            <th>Actual DD</th>
            <th>Notes</th>
            <th colspan="2">Actions</th>
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

                    <td style="width: 50px"><a href="/quotationItems/edit/${quotationItem.id}">Edit line</a></td>
                    <td style="width: 50px"><a href="/quotationItems/delete/${quotation.id}/${quotationItem.id}">Delete
                        line</a></td>
                </tr>
            </c:forEach>
            </tbody>

        </table>

        <c:if test="${not empty param.error}">
            <h4 style="color: red"><span>Item cannot be deleted - it has some records in database</span></h4>
        </c:if>
        <c:if test="${not empty param.deleted}">
            <h4 style="color: red"><span>Item has been deleted</span></h4>
        </c:if>
    </c:when>

    <%--status 3---------------------------------------------------------------------------------%>
    <c:when test="${quotation.status == 3}">
        <table border="1" style="text-align: center">

            <thead>
            <th>Number</th>
            <th>Customer Name</th>
            <th>Delivery Term</th>
            <th>Notes</th>
            <th>Remarks</th>
            <th>Created By</th>
            <th>Created on</th>
            <th>Status</th>
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
            </tr>
            </tbody>

        </table>

        <%--lista QuotationItems--%>

        <br><br>
        <h3>Items in this quotation:</h3>
        <h4><a href="/quotations/addItem/${quotation.id}">Add products to this quotation</a></h4>
        <table border="1" style="text-align: center">

            <thead>
            <th>LP</th>
            <th>Product name</th>
            <th>Qty</th>
            <th>Price</th>
            <th>Required DD</th>
            <th>Actual DD</th>
            <th>Notes</th>
            <th colspan="2">Actions</th>
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

                    <td style="width: 50px"><a href="/quotationItems/edit/${quotationItem.id}">Edit line</a></td>
                    <td style="width: 50px"><a href="/quotationItems/delete/${quotation.id}/${quotationItem.id}">Delete
                        line</a></td>
                </tr>
            </c:forEach>
            </tbody>

        </table>

        <c:if test="${not empty param.error}">
            <h4 style="color: red"><span>Item cannot be deleted - it has some records in database</span></h4>
        </c:if>
        <c:if test="${not empty param.deleted}">
            <h4 style="color: red"><span>Item has been deleted</span></h4>
        </c:if>

        <button onclick="location.href='http://localhost:8080/quotations/approved/${quotation.id}'" type="button">
            Approve quotation
        </button>

    </c:when>

    <%--status 4---------------------------------------------------------------------------------%>
    <c:otherwise>
        <table border="1" style="text-align: center">

            <thead>
            <th>Number</th>
            <th>Customer Name</th>
            <th>Delivery Term</th>
            <th>Notes</th>
            <th>Remarks</th>
            <th>Created By</th>
            <th>Created on</th>
            <th>Status</th>
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
            </tr>
            </tbody>

        </table>

        <%--lista QuotationItems--%>

        <br><br>
        <h3>Items in this quotation:</h3>
        <h4><a href="/quotations/addItem/${quotation.id}">Add products to this quotation</a></h4>
        <table border="1" style="text-align: center">

            <thead>
            <th>LP</th>
            <th>Product name</th>
            <th>Qty</th>
            <th>Price</th>
            <th>Required DD</th>
            <th>Actual DD</th>
            <th>Notes</th>
            <th colspan="2">Actions</th>
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

                    <td style="width: 50px"><a href="/quotationItems/edit/${quotationItem.id}">Edit line</a></td>
                    <td style="width: 50px"><a href="/quotationItems/delete/${quotation.id}/${quotationItem.id}">Delete
                        line</a></td>
                </tr>
            </c:forEach>
            </tbody>

        </table>

        <c:if test="${not empty param.error}">
            <h4 style="color: red"><span>Item cannot be deleted - it has some records in database</span></h4>
        </c:if>
        <c:if test="${not empty param.deleted}">
            <h4 style="color: red"><span>Item has been deleted</span></h4>
        </c:if>

    </c:otherwise>

</c:choose>

</body>
</html>
