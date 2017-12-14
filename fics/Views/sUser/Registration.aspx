<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<fics.Models.UserModal>" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Sports Hunt</title>
    <link href="../../Content/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="../../font-awesome-4.6.3/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="../../Css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <script src="../../Scripts/jquery-2.2.4.min.js" type="text/javascript"></script>
    <script src="../../Scripts/jquery-2.2.4.js" type="text/javascript"></script>
    <link href="../../Css/myfics.css" rel="stylesheet" type="text/css" />
    <link href="../../Css/stylish-portfolio.css" rel="stylesheet" type="text/css" />
    <script src="../../Scripts/jquery.validate.min.js" type="text/javascript"></script>
    <script src="../../Scripts/jquery.validate.js" type="text/javascript"></script>
    <script src="../../Scripts/bootstrap.min.js" type="text/javascript"></script>
</head>
<body>
    <header id="top" class="header">
 <%using (Html.BeginForm("Register", "sUser", FormMethod.Post, new { ID = "regform" }))%>
    <%{ %>
    <div class="col-lg-12" align="center">
        
    </div>
    <<div class="">
    <img id="Img1" class="col-lg-6" src="../../images/1.jpg" alt="img1" runat="server" />
    </div>
    <div class="col-lg-6">
    <div class="row">
    <%=Html.ActionLink("Login","Login",new{Controller="sUser"},new{@class="btn btn-success"}) %>
    <%=Html.ActionLink("Register","Registration",new{Controller="sUser"},new{@class="btn btn-primary"}) %>
    </div>
    <div class="row">
    <h1 class="page-header">Registeration</h1>
    </div>
    <div class="row">
    <div class="col-lg-6">
    <div class="panel-default">
        <div class="panel-body">
            <div class="form-group"><label class="control-label">Username:</label><div class="" id="userName-div"><%=Html.TextBox("userName", Model, new { @class="form-control",@PlaceHolder="UserName",@Required="true",@Id="userName"})%><span id="userName-span" /></div></div>
            <div class="form-group"><label class="control-label">Email:</label><div class="" id="email-div"><%=Html.TextBox("email", Model, new { @class = "form-control", @Type = "email", @placeHolder = "E-mail", @Required = "true",@Id="email" })%><span id="email-span" /></div></div>
            <div class="form-group"><label class="control-label">Password:</label><div class="" id="password-div"><%=Html.TextBox("password", Model, new { @class = "form-control", @Type = "password", @PlaceHolder = "Password", @Required = "true",@Id="password" })%><span id="password-span" /></div></div>
            <div class="form-group"><label class="control-label">Confirm Password:</label><div class="" id="cpassword-div"><%=Html.TextBox("cpassword", Model, new { @class = "form-control", @Type = "password", @PlaceHolder = "Confirm Password", @Required = "true",@Id="cpassword" })%><span id="cpassword-span" /></div></div>
            <div class="form-group"><input type="submit" class="btn btn-success" value="Register" id="submit-btn"/>  <input type="reset" class="btn btn-default" value="Cancel" /></div>
        </div>
    </div>
    </div>
    </div>
    </div>
    <%} %>
    <script type="text/javascript">
        $(document).ready(function () {
            $.validator.addMethod("uniqueuserName", function (value, element) {
                var fields = "userName";
                var isSuccess = false;
                $.ajax({
                    url: '/sUser/valCheck',
                    type: "GET",
                    data: { field: fields, val: $("#" + fields).val() },
                    async: false,
                    success: function (data) {
                        if (data == "Success") {
                            changeClass(fields, false);
                            isSuccess = false;
                        }
                        else {
                            changeClass(fields, true);
                            isSuccess = true;
                        }
                    }
                });
                return isSuccess;
            }, "");
            $.validator.addMethod("uniqueemail", function (value, element) {
                var fields = "email";
                var isSuccess = false;
                $.ajax({
                    url: '/sUser/valCheck',
                    type: "GET",
                    data: { field: fields, val: $("#" + fields).val() },
                    async: false,
                    success: function (data) {
                        if (data == "Success") {
                            changeClass(fields, false);
                            isSuccess = false;
                        }
                        else {
                            changeClass(fields, true);
                            isSuccess = true;
                        }
                    }
                });
                return isSuccess;
            }, "");
            $("#regform").validate({
                errorClass: "myerror-class",
                rules: {
                    userName: { required: true, uniqueuserName: true },
                    email: { required: true, email: true, uniqueemail: true },
                    password: { required: true },
                    cpassword: { equalTo: "#password" }
                },
                messages: {
                    userName: { uniqueuserName: "User Name Already Exists" },
                    email: { uniqueemail: "Email Already Exists" }
                }
            });
            $("#cpassword").on("change", function (e) {
                cpasscheck();
            });
            function cpasscheck() {
                if ($("#password").val() == $("#cpassword").val()) {
                    changeClass("cpassword", true);
                }
                else {
                    changeClass("cpassword", false);
                }
            }
            function changeClass(fields, response) {
                if (response == false) {
                    $("#" + fields + "-div").attr("class", "input-group has-error");
                    $("#" + fields + "-span").attr("class", "input-group-addon");
                    $("#" + fields + "-span").html("X");
                }
                if (response == true) {
                    $("#" + fields + "-div").attr("class", "input-group has-success");
                    $("#" + fields + "-span").attr("class", "input-group-addon");
                    $("#" + fields + "-span").html("<i class='fa fa-check'></i>");
                }
            }
        });
    </script>
    </header>
</body>
</html>
