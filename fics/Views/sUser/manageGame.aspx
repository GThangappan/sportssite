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



    <script src="../../Scripts/jquery-2.2.4.js" type="text/javascript"></script>
    <script src="../../Scripts/bootstrap.min.js" type="text/javascript"></script>
    <script src="../../Scripts/jquery.validate.js" type="text/javascript"></script>
    <script src="../../Scripts/jquery.validate.min.js" type="text/javascript"></script>

    
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
                  <li class="active">
                     <a href="manageGame"><i class="fa fa-bar-chart"></i> Manage Event</a>
                  </li>
                  <li>
                     <a href="huntGames"><i class="fa fa-fw fa-calendar-check-o"></i> Hunt Event</a>
                  </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </nav>

        <div id="page-wrapper">

            <div class="container-fluid">
            <div class="page-header">
            <h2>Your Posted Games</h2>
            </div>
              <%
                  foreach (MongoDB.Bson.BsonDocument item in Model.games.FindAll())
                  {
                      String pby = item.GetElement("publishedBy").Value.ToString();
                      String uname = Session["user"].ToString();
                      if (pby.Equals(uname))
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
                          String priceDets = item.GetElement("priceDets").Value.ToString();
                          String no_of_rounds = item.GetElement("no_of_rounds").Value.ToString();
                          String currentDets = item.GetElement("currentDets").Value.ToString();
                          String ratings = item.GetElement("ratings").Value.ToString();
                          String aboutGame = item.GetElement("aboutGame").Value.ToString();
                          String publishedBy = item.GetElement("publishedBy").Value.ToString();
                          String website = item.GetElement("website").Value.ToString();
                          String email = item.GetElement("email").Value.ToString();
                          String mobile = item.GetElement("mobile").Value.ToString();
                      %>
                      <div class="panel panel-primary col-lg-12">
                        <button class="panel-heading form-control" data-toggle="collapse" data-target="#demo<%=oid %>">
                           <%=eventName%>
                        </button>
                        <div class="collapse"  id="demo<%=oid %>">
                        <div class="panel-body">
                            <div class="col-lg-6">
                           <table class="table">
                           <tr><td>Hosted By</td><td id="hby-td"><%=hostedBy%></td></tr>
                           <tr><td>On</td><td id="on-td"><%=from%> <%=time%></td></tr>
                           <tr><td>At</td><td id="at-td"><%=location%><%=city%><%=state%><%=country%></td></tr>
                           <tr><td>About</td><td id="about-td"><%=aboutGame%></td></tr>
                           </table>
                           </div>
                            <div class="col-sm-6">
                           <div class='row'><input type="button" class="btn btn-info" value="Edit Details" onclick="editdets('<%=oid %>')"/>
                           <input type="button" class="btn btn-primary" value="View Teams" onclick="viewteams('<%=oid %>');" />
                           <input type="button" class="btn btn-danger" value="Cancel Event" onclick="cancelEvent('<%=oid %>');" data-toggle="modal" data-target="##myModal"/>
                           </div>                          
                           </div>
                           
                           <div class="col-lg-12" id="view-teams-div-<%=oid %>" style="display:none">
                           <h3>Registerd Teams</h3>
                           <hr />
                           <table class="table"><th>Registered By</th><th>Status</th><th>Rating</th>
                            <%
                               foreach (MongoDB.Bson.BsonDocument team in Model.teams.FindAll())
                               {
                                   String gid = team.GetElement("gameid").Value.ToString();
                                   String _id = team.GetElement("_id").Value.ToString();
                                   String feedback=team.GetElement("feeback").Value.ToString();
                                   String status=team.GetElement("status").Value.ToString();
                                   String regby=team.GetElement("regby").Value.ToString();                                   
                                   if (gid.Equals(oid))
                                   {
                                      %>                                 
                                      <tr><td><%=regby %></td><td><%=status %></td><td><%=feedback %></td>
                                      <td><input type="button" class="btn btn-primary" value="Profile" onclick="userprofile('<%=regby %>');" data-toggle="modal" data-target="#myModal"/>
                                      <input type="button" class="btn btn-info" value="Queries" onclick="ansQuery('<%=regby %>','<%=gid %>');" data-toggle="modal" data-target="#myModal"/>
                                      <input type="button" class="btn btn-success" value="Approval" onclick="approval('<%=regby %>','<%=_id%>','<%=status %>');" data-toggle="modal" data-target="#myModal"/></td>
                                      </tr>
                                      <%}
                               }
                            %>
                               </table>
                               </div>
                           <div class="col-lg-12" id="<%=oid%>-edit-div" style="display:none">
                            <div id="host-game-div" class="form-group">
                            <h3>Edit Details</h3>
                            <hr />            
                                <div id="edit-div">                                 
                                        <form id="game-dets-form-<%=oid %>" method="post" action="manageGame"><b>
                                        <div class="col-lg-6">
                                        <input type="hidden" id="gid" value="<%=oid %>" />
                                        <div class="form-group col-lg-12">Sport:<input type="text" id="sport-<%=oid%>" name="sport-name" class="form-control" required/></div>
                                        <div class="form-group col-lg-6">Country:<select id="country-<%=oid%>" name="country" class="form-control" required></select></div>  
                                        <div class="form-group col-lg-6">State:<input type="text" id="state-<%=oid%>" name="state" class="form-control" required/></div>
                                        <div class="form-group col-lg-6">City:<input type="text" id="city-<%=oid%>" name="city" class="form-control" required/></div>                                      
                                        <div class="form-group col-lg-6">Location:<input type="text" id="location-<%=oid%>" name="location" class="form-control" required/></div>
                                        <div class="form-group col-lg-6">Minimum Players/Team<input class="form-control" type="number" id="minplayer-<%=oid %>" minvalue=1/></div>
                                        <div class="form-group col-lg-6">Maximum Players/Team<input class="form-control" type="number" id="maxplayer-<%=oid %>" minvalue=1/></div>
                                        <div class="form-group col-lg-12">About Game<textarea class="form-control" id="aboutgame-<%=oid %>" rows=3></textarea></div>
                                        </div>
                                        <div class="col-lg-6">
                                        <div class="form-group col-lg-6">From:<input type="date" id="from-<%=oid%>" name="from" class="form-control" required/></div>
                                        <div class="form-group col-lg-6">To:<input type="date" id="to-<%=oid%>" name="to" class="form-control" required/></div>
                                        <div class="form-group col-lg-6">Time:<input type="text" id="time-<%=oid%>" name="time" class="form-control" required/></div>
                                        <div class="form-group col-lg-6">Last Date:<input type="date" id="lastdate-<%=oid %>" name="lastdate" class="form-control" required/></div>
                                        </div>
                                        <div class="col-lg-6">
                                        <div class="form-group col-lg-12">Category:<select id="category-<%=oid%>" name="category" class="form-control" required><option value="under-14">Under-14</option><option value="under-20">Under-20</option><option value="open">Open</option><option value="special">Specialy Challeged</option></select></div>
                                        <div class="form-group col-lg-6">Price Details:<input type="text" id="price-dets-<%=oid%>" name="price-dets" class="form-control" required/></div>                                      
                                        
                                        </div>
                                        <div class="form-group col-lg-12" id="msg-div"><button class="btn btn-primary" type="button" id="det-submit-btn-<%=oid%>" onclick="savedets('<%=oid%>');"><i id="det-submit-icon" class="fa fa-save"></i> Submit</button><a href="manageGame" class="btn btn-default"><i class="fa fa-close"></i>Cancel</a></div>                                        
                                        </b></form>
                                        <script type="text/javascript">
                                            $(document).ready(function () {
                                                countries = ["Afghanistan", "Albania", "Algeria", "American Samoa", "Andorra", "Angola", "Anguilla", "Antarctica", "Antigua and Barbuda", "Argentina", "Armenia", "Aruba", "Australia", "Austria", "Azerbaijan", "Bahamas", "Bahrain", "Bangladesh", "Barbados", "Belarus", "Belgium", "Belize", "Benin", "Bermuda", "Bhutan", "Bolivia", "Bosnia and Herzegowina", "Botswana", "Bouvet Island", "Brazil", "British Indian Ocean Territory", "Brunei Darussalam", "Bulgaria", "Burkina Faso", "Burundi", "Cambodia", "Cameroon", "Canada", "Cape Verde", "Cayman Islands", "Central African Republic", "Chad", "Chile", "China", "Christmas Island", "Cocos (Keeling) Islands", "Colombia", "Comoros", "Congo", "Congo, the Democratic Republic of the", "Cook Islands", "Costa Rica", "Cote d'Ivoire", "Croatia (Hrvatska)", "Cuba", "Cyprus", "Czech Republic", "Denmark", "Djibouti", "Dominica", "Dominican Republic", "East Timor", "Ecuador", "Egypt", "El Salvador", "Equatorial Guinea", "Eritrea", "Estonia", "Ethiopia", "Falkland Islands (Malvinas)", "Faroe Islands", "Fiji", "Finland", "France", "France Metropolitan", "French Guiana", "French Polynesia", "French Southern Territories", "Gabon", "Gambia", "Georgia", "Germany", "Ghana", "Gibraltar", "Greece", "Greenland", "Grenada", "Guadeloupe", "Guam", "Guatemala", "Guinea", "Guinea-Bissau", "Guyana", "Haiti", "Heard and Mc Donald Islands", "Holy See (Vatican City State)", "Honduras", "Hong Kong", "Hungary", "Iceland", "India", "Indonesia", "Iran (Islamic Republic of)", "Iraq", "Ireland", "Israel", "Italy", "Jamaica", "Japan", "Jordan", "Kazakhstan", "Kenya", "Kiribati", "Korea, Democratic People's Republic of", "Korea, Republic of", "Kuwait", "Kyrgyzstan", "Lao, People's Democratic Republic", "Latvia", "Lebanon", "Lesotho", "Liberia", "Libyan Arab Jamahiriya", "Liechtenstein", "Lithuania", "Luxembourg", "Macau", "Macedonia, The Former Yugoslav Republic of", "Madagascar", "Malawi", "Malaysia", "Maldives", "Mali", "Malta", "Marshall Islands", "Martinique", "Mauritania", "Mauritius", "Mayotte", "Mexico", "Micronesia, Federated States of", "Moldova, Republic of", "Monaco", "Mongolia", "Montserrat", "Morocco", "Mozambique", "Myanmar", "Namibia", "Nauru", "Nepal", "Netherlands", "Netherlands Antilles", "New Caledonia", "New Zealand", "Nicaragua", "Niger", "Nigeria", "Niue", "Norfolk Island", "Northern Mariana Islands", "Norway", "Oman", "Pakistan", "Palau", "Panama", "Papua New Guinea", "Paraguay", "Peru", "Philippines", "Pitcairn", "Poland", "Portugal", "Puerto Rico", "Qatar", "Reunion", "Romania", "Russian Federation", "Rwanda", "Saint Kitts and Nevis", "Saint Lucia", "Saint Vincent and the Grenadines", "Samoa", "San Marino", "Sao Tome and Principe", "Saudi Arabia", "Senegal", "Seychelles", "Sierra Leone", "Singapore", "Slovakia (Slovak Republic)", "Slovenia", "Solomon Islands", "Somalia", "South Africa", "South Georgia and the South Sandwich Islands", "Spain", "Sri Lanka", "St. Helena", "St. Pierre and Miquelon", "Sudan", "Suriname", "Svalbard and Jan Mayen Islands", "Swaziland", "Sweden", "Switzerland", "Syrian Arab Republic", "Taiwan, Province of China", "Tajikistan", "Tanzania, United Republic of", "Thailand", "Togo", "Tokelau", "Tonga", "Trinidad and Tobago", "Tunisia", "Turkey", "Turkmenistan", "Turks and Caicos Islands", "Tuvalu", "Uganda", "Ukraine", "United Arab Emirates", "United Kingdom", "United States", "United States Minor Outlying Islands", "Uruguay", "Uzbekistan", "Vanuatu", "Venezuela", "Vietnam", "Virgin Islands (British)", "Virgin Islands (U.S.)", "Wallis and Futuna Islands", "Western Sahara", "Yemen", "Yugoslavia", "Zambia", "Zimbabwe"];
                                                gid = $("#gid").val();
                                                for (i = 0; i < countries.length; i++)
                                                    $("#country-" + gid).append("<option value='" + countries[i] + "'>" + countries[i] + "</option>");
                                            });
                                            </script>
                                    </div>
                            </div> 
                           </div>     
                         </div>                                                 
                       </div>
                       </div>
                  <%}%>                            
                  <%}%>     
                                                          
                 </div>
              </div>
        <!-- /#page-wrapper -->   
    </div>
    <script type="text/javascript">        
        function editdets(oid) {
            $("#" + oid + "-edit-div").show();
            $("#view-teams-div-" + oid).hide();
        }
        function userprofile(regby) {
            $.ajax({
                url: "/sUser/moreUserdets",
                method: "post",
                data: { "regby": regby },
                success: function (data) {
                    $("#modal-header").html("User Details");
                    $("#mod-body").html(data);
                },
                error: function (xhr) {
                    console.log("HI" + xhr);
                }
            });
        }
        function cancelEvent(oid) {
            $.ajax({
                url: "/sUser/cancelEvent",
                method: "post",
                data: { "oid": oid },
                success: function (data) {
                    $("#modal-header").html("Cancel Event");
                    $("#mod-body").html(data);
                },
                error: function (xhr) {
                    console.log("HI" + xhr);
                }
            });
        }
        function approval(regby, oid,status) {
            var vals = "<div class='form-group col-sm-12'>\
                        <div class='col-sm-4'><input type='radio' value='selected' id='select-"+oid+"' name='approve-"+oid+"'/>Selected</div>\
                        <div class='col-sm-4'><input type='radio' value='not-selected' id='not-select-" + oid + "' name='approve-"+oid+"'/>Not-Selected</div>\
                        <div class='col-sm-4'><input type='radio' value='waiting' id='waiting-" + oid + "' name='approve-"+oid+"'/>Waiting</div>\
                        <div class='col-sm-6'>Message to Player<input type='text' class='form-control' id='msg-" + oid + "'/></div>\
                        </div>";

            $("#mod-body").html(vals);
            if (status == "selected") {
                $("#select-" + oid).attr("checked",true);
            }
            if (status == "not-selected") {
                $("#not-select-" + oid).attr("checked", true);
            }
            if (status == "waiting") {
                $("#waiting-" + oid).attr("checked", true);
            }
            $("#mod-footer").html("<div class='form-group'><input type='button' value='submit' class='btn btn-primary'/ onclick='approve(\"" + oid + "\");' data-dismiss='modal'/></div>");
        }
        function approve(oid) {
            console.log($("[name='approve-" + oid + "']:checked").val());
            console.log($("#msg-" + oid).val());
            $.ajax({
                url: "/sUser/approval",
                method: "post",
                data: { "oid": oid, "status": $("[name='approve-" + oid + "']:checked").val(), "msg": $("#msg-" + oid).val() },
                success: function (data) {
                    console.log(data);
                    location.reload();
                },
                error: function (xhr) {
                    console.log("HI" + xhr);
                }
            });
        }
        function viewteams(oid) {
            $("#view-teams-div-"+oid).show();
            $("#" + oid + "-edit-div").hide();
            var t = "";
        }
        function savedets(oid) {
            if ($("#game-dets-form-" + oid).valid()) {
                if (datecheck(oid)&&minmaxcheck(oid)) {                 
                 var s = [];
                 s[0] = oid;
                 s[1] = $("#sport-" + oid).val();
                 s[2] = $("#country-" + oid).val();
                 s[3] = $("#state-" + oid).val();
                 s[4] = $("#city-" + oid).val();
                 s[5] = $("#location-" + oid).val();
                 s[6] = $("#from-" + oid).val();
                 s[7] = $("#to-" + oid).val();
                 s[8] = $("#time-" + oid).val();
                 s[9] = $("#category-" + oid).val();
                 s[10] = $("#price-dets-" + oid).val();
                 s[11] = $("#minplayer-" + oid).val();
                 s[12] = $("#maxplayer-" + oid).val();
                 s[13] = $("#aboutgame-" + oid).val();
                 s[14] = $("#lastdate-" + oid).val();
                 $.ajax({
                    url: "/sUser/editGameDets",
                    method: "get",
                    contentType: "application/json",
                    data: { "s": s },
                    traditional: true,
                    success: function (data) {
                        console.log(data);
                        location.reload();
                    },
                    error: function (xhr) {
                        console.log("HI" + xhr);
                    }
                });
               }
            }
    }
    function datecheck(oid) {
        var from = new Date($("#from-" + oid).val());
        var to = new Date($("#to-"+oid).val());
        var last = new Date($("#lastdate-" + oid).val());
        var cdate = new Date();
        var cf = from - cdate;
        var ft = to - from;
        var lf = from - last;
        console.log(cf);
        console.log(ft);
        console.log(lf);
        if (cf > 0 && ft > 0 && lf > 0) {
            return true;
        }
        alert("Dates are not Entered Correctly please Ensure it");
        return false;
    }
    function minmaxcheck(oid) {
                var mm = $("#maxplayer-"+oid).val() - $("#minplayer-"+oid).val();
                if (mm < 0) {
                    alert("Minimum Maximum Players are not entered Correctly");
                    return false;
                }
                return true;
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
        <div id="mod-body"></div>        
      </div>
      <div class="mod-footer" id="mod-footer"><button type="button" class="btn btn-default" data-dismiss="modal">Close</button></div>
    </div>

  </div>
</div>  

</body>

</html>
