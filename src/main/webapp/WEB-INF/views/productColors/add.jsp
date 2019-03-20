<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Color - add</title>
    <%@ include file="../dependecies.jsp" %>
</head>
<body>

<%@include file="../loggedHeader.jsp" %>

<%--------------------%>

<%--<h1>Add a color:</h1>--%>

<%--<form:form method="post" modelAttribute="productColor">--%>

    <%--<table>--%>
        <%--<tr>--%>
            <%--<td>Product color name:</td>--%>
            <%--<td><form:input path="name"/><br></td>--%>
            <%--<td><form:errors path="name" cssClass="error-message" element="div" /></td>--%>
        <%--</tr>--%>

    <%--</table>--%>

    <%--<input type="submit" value="Send" style="margin-top: 30px">--%>

<%--</form:form>--%>



<%--------------------%>

<div class="w3-display-container w3-theme-l5" style="height:100%">

    <div class="w3-container w3-theme-l4" style="padding-top: 52px"> <%--padding to fit header height--%>
        <h2>Add a color:</h2>
    </div>

    <div class="w3-container w3-margin">
    </div>

    <div class="w3-container w3-margin">
<form:form method="post" modelAttribute="productColor">
        <table class="w3-table w3-striped w3-border w3-bordered w3-hoverable w3-card-4" style="width:50% ">

            <tr>
                <td>Product color name:</td>
                <td><form:input path="name"/><br></td>
                <td><form:errors path="name" cssClass="error-message" element="div" /></td>
            </tr>


        </table>
    <input type="submit" value="Send" class="w3-btn w3-medium w3-block w3-theme w3-large" style="width:30%">

</form:form>
    </div>
</div>


<div style="position: relative; margin-top:-30.3px"> <%--margin fit to footer height--%>
    <%@include file="../footer.jsp" %>
</div>
<%--------------------%>

</body>
</html>
