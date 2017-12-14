<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<fics.Models.UserModal>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>FICS Index</title>
    <link href="../../Content/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <script src="../../Scripts/jquery-2.2.4.min.js" type="text/javascript"></script>
    <script src="../../Scripts/jquery-2.2.4.js" type="text/javascript"></script>
    <script src="../../Scripts/bootstrap.min.js" type="text/javascript"></script>
</head>
<body>
    <%using (Html.BeginForm("", "User"))%>
    <%{ %>
    <div class="col-lg-6">
    <img id="Img1" class="img-thumbnail" src="../../images/1.jpg" alt="img1" runat="server" />
    </div>
    <div class="col-lg-6">
    <input type="button" id="btnid" value="Testlog" class="btn btn-success"/>
    <%=Html.ActionLink("Login","Loginin",new{Controller="User"},new{@class="btn btn-success"}) %>
    <%=Html.ActionLink("Register","Registration",new{Controller="User"},new{@class="btn btn-primary"}) %>
    </div>
    <div id="mydiv" class="col-lg-></div>
    <%} %>
    
</body>
</html>
