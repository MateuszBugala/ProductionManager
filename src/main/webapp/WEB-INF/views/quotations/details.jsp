<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Quotations - details</title>
    <link rel="stylesheet" href="/css/styles.css">
</head>
<body>

<button onclick="location.href='http://localhost:8080/'" type="button">HOME</button>

<h3>Quotations details:</h3>

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

            <td style="width: 50px"><a href="/quotationItems/edit/${quotationItem.id}" >Edit line</a></td>
            <td style="width: 50px"><a href="/quotationItems/delete/${quotation.id}/${quotationItem.id}" >Delete line</a></td>
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



<h4><a href="http://localhost:8080/quotations/all">Back to list</a></h4>

<button onclick="location.href='http://localhost:8080/quotations/sent/${quotation.id}'" type="button">Send to Production Department</button>

</body>
</html>
