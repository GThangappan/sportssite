<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<fics.Models.hntgModal>" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>FICS Dash</title>

    <!-- Bootstrap Core CSS -->
    <link href="../../Css/bootstrap.min.css" rel="stylesheet" type="text/css" />

    <link href="../../Css/myfics.css" rel="stylesheet" type="text/css" />
    <!-- Custom CSS -->
    <link href="../../Css/sb-admin.css" rel="stylesheet" type="text/css" />
    <!-- Custom Fonts -->
    <link href="../../font-awesome-4.6.3/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
</head>

<body>
<!-- jQuery -->
    <script src="../../Scripts/jquery-2.2.4.js" type="text/javascript"></script>
    

    <!-- Bootstrap Core JavaScript -->
    <script src="../../Scripts/bootstrap.min.js" type="text/javascript"></script>
    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
               <a class="navbar-brand"><i><img src="../../img/mainlg.png" width="74" height="26"></i></a>
            </div>
            <!-- Top Menu Items -->
            <ul class="nav navbar-right top-nav">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> <%=Session["user"] %> <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="publicprofile"><i class="fa fa-fw fa-user"></i> Profile</a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="Login"><i class="fa fa-fw fa-power-off"></i> Log Out</a>
                        </li>
                    </ul>
                </li>
            </ul>
            <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
             <div class="collapse navbar-collapse navbar-ex1-collapse">
               <ul class="nav navbar-nav side-nav">
                   <li>
                     <a href="publicprofile"><i class="fa fa-fw fa-user"></i> Profile details</a>
                  </li>
                  <li>
                     <a href="membership"><i class="fa fa-users"></i> MemberShip Details</a>
                  </li>
                  <li>
                     <a href="hostGame"><i class="fa fa-hand-o-right"></i> Post Event</a>
                  </li>
                  <li>
                     <a href="manageGame"><i class="fa fa-bar-chart"></i> Manage Event</a>
                  </li>
                  <li class="active">
                     <a href="huntGames"><i class="fa fa-fw fa-calendar-check-o"></i> Hunt Event</a>
                  </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </nav>

        <div id="page-wrapper">

            <div class="container-fluid">
            <div class="page-header">
            <h2>Hunt your games Here</h2>
            </div>
              <% 
                  foreach (MongoDB.Bson.BsonDocument item in Model.games.FindAll())
                  {
                      String oid = item.GetElement("_id").Value.ToString();
                      String hostedBy = item.GetElement("hostedBy").Value.ToString();
                      String eventName = item.GetElement("eventName").Value.ToString();
                      String country = item.GetElement("country").Value.ToString();
                      String state = item.GetElement("state").Value.ToString();
                      String city = item.GetElement("city").Value.ToString();
                      String location = item.GetElement("location").Value.ToString();
                      String time = item.GetElement("time").Value.ToString();
                      String from = item.GetElement("from").Value.ToString();
                      String to = item.GetElement("to").Value.ToString();
                      String category = item.GetElement("category").Value.ToString();
                      String lastday=item.GetElement("lastdate").Value.ToString();
                      String priceDets = item.GetElement("priceDets").Value.ToString();
                      String no_of_rounds = item.GetElement("no_of_rounds").Value.ToString();
                      String currentDets = item.GetElement("currentDets").Value.ToString();
                      String ratings = item.GetElement("ratings").Value.ToString();
                      String aboutGame = item.GetElement("aboutGame").Value.ToString();
                      String publishedBy = item.GetElement("publishedBy").Value.ToString();
                      String website = item.GetElement("website").Value.ToString();
                      String minplayer=item.GetElement("minNumberPlayer").Value.ToString();
                      String maxplayer=item.GetElement("maxNumberPlayer").Value.ToString();
                      String email = item.GetElement("email").Value.ToString();
                      String mobile = item.GetElement("mobile").Value.ToString();
                      var c=(Convert.ToDateTime(lastday)-Convert.ToDateTime(DateTime.Today.ToString("yyyy-MM-dd"))).TotalDays;
                      if (c > 0 &&!publishedBy.Equals(Session["user"].ToString()))
                      {
                      %>
                      <div class="panel panel-primary col-lg-12">
                        <button class="panel-heading form-control" data-toggle="collapse" data-target="#demo<%=oid %>" onclick="check('<%=oid %>');">
                           <%=eventName%> 
                        </button>
                        <div class="collapse"  id="demo<%=oid %>">
                        <div class="panel-body">
                            <div class="col-lg-6">
                           <table class="table">
                           <tr><td>Hosted By</td><td id="hby-td"><%=hostedBy%></td></tr>
                           <tr><td>On</td><td id="on-td"><%=from%> <%=time%></td></tr>
                           <tr><td>At</td><td id="at-td"><%=location%> <%=city%> <%=state%> <%=country%></td></tr>
                           <tr><td>Categroy</td><td><%=category%></td></tr>
                           <tr><td>Last Day to Register</td><td><%=lastday%></td></tr>
                           <tr><td>About</td><td id="about-td"><%=aboutGame%></td></tr>
                           <tr><td>Price Details</td><td><%=priceDets %></td></tr>
                           <tr><td>Minimum Players</td><td><%=minplayer%></td><td>Maximum Players</td><td><%=maxplayer%></td></tr>
                           </table>
                           </div>
                           <div class="col-sm-6">
                           <div class='row'>
                           <button type="button" class="btn btn-info" id="moredets-btn-<%=oid %>" onclick="moredets('<%=oid %>');" data-toggle="modal" data-target="#mymodal">Host Details</button>
                           <button type="button" class="btn btn-danger" id="cancel-btn-<%=oid %>" onclick="cancelreg('<%=oid %>');" data-toggle="modal" data-target="#myModal">Cancel</button>                           
                           <button type="button" class="btn btn-success" id="part-btn-<%=oid %>" onclick="participate('<%=oid%>');" data-toggle="modal" data-target="#myModal">Participate</button><lable id='<%=oid%>-lbl' style="display:none"></lable></div>                          
                           </div>                           
                       </div>
                       </div>
                      </div>
                       
                  <% }
                  }%>
           </div>
           </div>
    </div>
    <!-- /#wrapper -->
<!-- Trigger the modal with a button -->
<script type="text/javascript">
    var count = 1;
    function moredets(oid) {
        $.ajax({
            url: "/sUser/moredets",
            method: "post",
            data: { "oid": oid },
            success: function (data) {
                $("#modal-header").html("host Details");
                $("#modal-body").html(data);
            },
            error: function (xhr) {
                console.log("HI" + xhr);
            }
        });
    }
    function check(oid) 
    {        
        console.log("chekcing oid:" + oid+" And user");
        $.ajax({
            url: "/sUser/checkParticipant",
            method: "get",
            contentType: "application/json",
            data: { "gid": oid },
            success: function (data) {
                console.log(data);
                if (data == "no") {
                    showparticipate(oid);
                    $("#cancel-btn-"+oid).hide();
                }
                else {
                    hideparticipate(oid, data);
                    $("#cancel-btn-" + oid).show();
                }
            },
            error: function (xhr) {
                console.log("HI" + xhr);
            }
        });
    }
    function cancelreg(oid) {
        $("#modal-header").html("Cancel registration");
        $("#mod-body").html("<center><h2>Record Deleted successfully</h2></center>");
        $.ajax({
            url: "/sUser/cancelReg",
            method: "post",
            data: {"oid":oid},
            success: function (data) {
                console.log(data);
            },
            error: function (xhr) {
                console.log("HI" + xhr);
            }
        });
    }
    function hideparticipate(oid,data) {
        $("#" + oid + "-lbl").show();
        $("#" + oid + "-lbl").html(data);
        $("#part-btn-" + oid).hide();
    }
    function showparticipate(oid) {
        $("#part-btn-" + oid).show();
    }
    function participate(oid) 
    {
        $("#mod-head").html("Participate");
        $("#mod-body").html("");
        var meth = "<input type='hidden' value='" + oid + "' id='" + oid + "'/>\<div class='alert alert-danger' id='report-"+oid+"'></div>\
                    <div class='form-group col-lg-6'>Queries?<input type='text' id='query-" + oid + "' class='form-control'/></div>\
                    <div class='form-group col-lg-12'><div class='col-lg-4'>Player Name</div><div class='col-lg-5'>Date of Birth</div><div class='col-lg-2'>Age</div>\
                    <div class='col-sm-4'><input type='text' class='form-control' id='p_" + count + "_name' name='p_" + count + "_name' required/></div>\
                    <div class='col-sm-5'><input type='date' class='form-control' id='p_" + count + "_dob' onchange='calcage(" + count + ");' required/></div>\
                    <div class='col-sm-2'><b id='p_" + count + "_age'></b> <input type='hidden' id='" + count + "_age' name='" + count + "_age'/></div>\
                    <div class='col-sm-1'><input type='button' class='btn btn-default' id='p_add' onclick='addparti("+(count)+");' value='+'/></div>\
                    </div>";
        $("#mod-body").append(meth);
        $("#mod-footer").html("<div class='form-group'><button type='button' class='btn btn-primary' onclick='savedets(\"" + oid + "\");'>Save</button><button type='button' class='btn btn-default' data-dismiss='modal'>Close</button></div>");
    }
    function savedets(oid) {
        console.log("hi");
        var nm = [];
        var age = [];
        var ageflag = 0;
        for (i = 0; i < count; i++) {
            nm[i] = $("#p_" + (i+1) + "_name").val();
            age[i] = $("#"+(i + 1) + "_age").val();
        }
        var gid = $("#" + oid).val();
        $.ajax({
            url: "/sUser/addParticipant",
            method: "get",
            contentType: "application/json",
            data: { "name": nm, "age": age, "gid": gid, query: $("#query-" + oid).val() },
            traditional: true,
            success: function (data) {
                if (data == "success") {
                    $("#msg-div").html("");
                    $("#modal").modal('toggle');
                    location.reload();
                }
                $("#report-" + oid).html(data);
            },
            error: function (xhr) {
                console.log("HI" + xhr);
            }
        });
    }
    function addparti(c) {
        count++;
        var te = "<div class='form-group col-lg-12' id='div-"+count+"'><div class='col-lg-4'>Player Name</div><div class='col-lg-5'>Date of Birth</div><div class='col-lg-2'>Age</div>\
                <div class='col-sm-4'><input type='text' class='form-control' id='p_" + count + "_name' required/></div>\
                <div class='col-sm-5'><input type='date' class='form-control' id='p_" + count + "_dob' onchange='calcage(" + count + ");' required/></div>\
                <div class='col-sm-2'><b id='p_" + count + "_age'></b> <input type='hidden' id='" + count + "_age'/></div>\
                <div class='col-sm-1'><input type='button' class='btn btn-info' id='p_add' onclick='delparti("+count+");' value='-'/></div>";
        $("#mod-body").append(te);
    }
    function delparti(c) {
        $("#div-" + count).remove();
        count--;
    }
    function calcage(c) {
        var date = new Date($("#p_" + c + "_dob").val());
        var today = new Date();
        var age = Math.floor((today - date) / (365.25 * 24 * 60 * 60 * 1000));
        $("#p_" + c + "_age").html(age);
        $("#" + c + "_age").val(age);
    }
    function viewplayers(oid) {
        $.ajax({
            url: "/sUser/viewplayers",
            method: "post",
            data: { "oid": oid },
            success: function (data) {
                $("#mod-head").html("Player");
                $("#mod-body").html(data);
            },
            error: function (xhr) {
                console.log("HI" + xhr);
            }
        });
    }
</script>

    <!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content" id="modal">
      <div class="modal-header model-header-info" >
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title" id="mod-head">Modal Header</h4>
      </div>
      <div class="modal-body">
        <div id="mod-body" class="modal-body"></div>        
      </div>
      <div class="mod-footer" id="mod-footer"><button type="button" class="btn btn-default" data-dismiss="modal">Close</button></div>
    </div>

  </div>
</div>  

</body>

</html>
