<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<fics.Models.UserModal>" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>FICS Index</title>
    <link href="../../Content/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="../../font-awesome-4.6.3/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="../../Css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="../../Css/stylish-portfolio.css" rel="stylesheet" type="text/css" />
    <link href="../../Css/myfics.css" rel="stylesheet" type="text/css" />
    <script src="../../Scripts/jquery-2.2.4.min.js" type="text/javascript"></script>
    <script src="../../Scripts/jquery-2.2.4.js" type="text/javascript"></script>
    <script src="../../Scripts/bootstrap.min.js" type="text/javascript"></script>
</head>
<body>
    <!-- Header -->
    <header id="top" class="header">
    
    

    <%using (Html.BeginForm("dsboard", "sUser",FormMethod.Post, new { id = "loginform" }))%>
    <%{ %>
    <div class="col-lg-12" align="center">
        
    </div>
    <div class="">
    <img id="Img1" class="col-lg-6" src="../../images/1.jpg" alt="img1" runat="server" />
    </div>
    <div class="col-lg-6">
    <div class="row">
    <%=Html.ActionLink("Login","Login",new{Controller="sUser"},new{@class="btn btn-success"}) %>
    <%=Html.ActionLink("Register","Registration",new{Controller="sUser"},new{@class="btn btn-primary"}) %>
    </div>
    <div class="row">
    <h1 class="page-header">Login</h1>
    </div>
    <div class="row">
    <div class="col-lg-5">
    <div class="panel-default">
        <div class="panel-body">
            <div class="form-group"><label class="control-label">Username:</label><%=Html.TextBox("userName", Model, new { @class="form-control",@PlaceHolder="UserName",@id="uname", @Required = "true" })%></div>
            <div class="form-group"><label class="control-label">Password:</label><%=Html.TextBox("password", Model, new { @class = "form-control", @Type = "password",@id="pass", @Required="true",@PlaceHolder = "Password"})%></div>
            <div class="alert alert-danger" id="report"></div>
            <div class="form-group"><button type="submit" id="testclick" class="btn btn-success">Login</button> <input type="reset" value="Cancel" class="btn btn-primary" /></div>
        </div>
    </div>
    </div>
    </div>
    </div>
    <%} %>
    
    <script type="text/javascript">

        $(document).ready(function () {
            $("#report").hide();
            $("#testclick").click(function (e) {
                $("#testclick").html("<i class='fa fa-spinner fa-spin'></i> Wait..");
                $.ajax({
                    url: '/sUser/myres',
                    type: "GET",
                    data: { name: $("#uname").val(), pas: $("#pass").val() },
                    async: false,
                    success: function (data) {
                        if (data == "Success") {

                            $("#report").attr("class", "alert alert-success");
                            $("#report").html("<i class='fa fa-check'></i>Login you in");
                            $("#report").show();
                            $("#loginform").submit();
                        }
                        if (data == "Fail") {
                            $("#report").show();
                            $("#report").html("<strong>Invalid!</strong>Username or Password");
                            $("#testclick").html("Login");
                        }
                    },
                    error: function (xhr) {
                        console.log("error");
                        console.log(xhr);
                    }
                });
                e.preventDefault();
            });

        });
    </script>
    </header> 
</body>
</html>
