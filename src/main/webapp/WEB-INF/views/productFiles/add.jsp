<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Upload File</title>
    <%@ include file="../dependecies.jsp" %>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
</head>

<body>
<%@include file="../loggedHeader.jsp" %>

<div class="w3-display-container w3-theme-l5" style="height:100%">

    <div class="w3-container w3-theme-l4" style="padding-top: 52px">
        <h2>Add a file:</h2>
    </div>

    <div class="w3-container w3-margin">
    </div>

    <div class="w3-container w3-padding-16 w3-margin w3-col w3-card" style="width:30%">
        <form id="fileUploadForm" method="post" action="/files/add/${productId}" enctype="multipart/form-data">

            <div class="w3-container w3-padding-16">
                <label>Description:</label>
                <input id="fileDescription" type="text" name="description" size="65" class="w3-input w3-theme-l5"/>
            </div>

            <div class="w3-container w3-padding-16">
                <label>File:</label>
                <input id="pickUpFileAttachment" type="file" name="attachedFile"/>
                <div id="fileUploadErr" class="w3-text-red">Choose file</div>
            </div>

            <input type="submit" id="fileUploadBtn" value="Upload" class="w3-btn w3-block w3-theme w3-large w3-margin"
                   style="width:120px">

        </form>
    </div>
</div>

<div style="position: relative; margin-top:-30.3px">
    <%@include file="../footer.jsp" %>
</div>

<script type="text/javascript">
    $(document).ready(function () {
        $("#fileUploadErr").hide();

        // Hide The Error Message When The Attachment Btn Is Clicked.
        $('#pickUpFileAttachment').click(function (eObj) {
            $("#fileUploadErr").hide();
        });

        // Validating Whether The Attachment Is Uploaded Or Not.
        $('#fileUploadBtn').click(function (eObj) {
            var file = $("#pickUpFileAttachment").map(function () {
                return $(this).val().trim() ? true : false;
            }).get();
            if (file.includes(true)) {
                // Do Nothing...!
            } else {
                $("#fileUploadErr").show();
                eObj.preventDefault();
            }
        });
    });
</script>

</body>
</html>