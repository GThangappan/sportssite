<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<fics.Models.memModal>" %>
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
    <!-- Bootstrap Core JavaScript -->
    
    <script src="../../Scripts/bootstrap.min.js" type="text/javascript"></script>
    <script src="../../Scripts/bootstrap.min.js" type="text/javascript"></script>
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
                  <li class="active">
                     <a href="membership"><i class="fa fa-users"></i> MemberShip Details</a>
                  </li>
                  <li>
                     <a href="hostGame"><i class="fa fa-hand-o-right"></i> Post Event</a>
                  </li>
                  <li>
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
        <input type="hidden" id="type" value="" />
        <input type="hidden" id="mval" value="" />
        <!--old -dets-->
        <div id="view-det" style="display:none" class="col-lg-6">
            <div class="panel panel-success">
                        <div class="panel-heading">
                           Member Ship details
                        </div>
            <div class="panel-body">
            <table class="table">
                <tr><td>Team name</td><td><b><%=Model.teamname %></b></td></tr>                                    
                <tr><td>Type</td><td><b><%=Model.teamtype %></b></td></tr>
                <tr><td>Sports</td><td><b><%=Model.sporttype %></b></td></tr>
                <tr><td>Country</td><td><b><%=Model.teamcountry%></b></td></tr>
                <tr><td>Address</td><td><b><%=Model.teamaddress %></b></td></tr>
                <tr><td>Websitelink</td><td><a href='<%=Model.teamsite %>' target="_blank"><%=Model.teamsite %></a></b></td></tr>
                <tr><td>Social Media Link</td><td><a href='<%=Model.teamsocial %>' target="_blank"><%=Model.teamsite %></a></td></tr>
                <tr><td>Manager Name</td><td><%=Model.p_name %></td></tr>
                <tr><td>Manager Email</td><td><%=Model.p_email %></td></tr>
                <tr><td>Manager Mobile</td><td><%=Model.p_mobile %></td></tr>
            </table>
            
            <div class="form-group"><button class="btn btn-primary" type="button" id="edit-dets-btn"><i id="editdetsbtn-i" class="fa fa-edit"></i> Edit</button></div>
            </div>
        </div>
       </div>
        <!--edit-dets--->        
           <div class="row" id="edit-dets" style="display:none">
                  <div class="col-lg-6">
                     <div class="panel panel-success"><b>
                        <div class="panel-heading" id="panel-heading">
                           Club Details
                        </div>
                        </b>
                        <div class="panel-body">
                           <div class="col-lg-12">
                              <div class="row">
                                 <div class="form-group" id="personal-dets-div">
                                 <div id="edit-div">                                 
                                        <form id="club-dets-form">
                                        <div class="form-group"><div id="c-title">Clubname:</div><input type="text" id="club-name" name="club-name" class="form-control" required/></div>                                    
                                        <div class="form-group">Sport:<input type="text" id="sport" name="sport-name" class="form-control" required/></div>
                                        <div class="form-group">Country:<select id="country" name="country" class="form-control" required></select></div>                                        
                                        <div class="form-group">Address:<input type="text" id="address" name="address" class="form-control" required/></div>
                                        <div class="form-group">Website:<input type="url" id="website" name="address" class="form-control"/></div>
                                        <div class="form-group">Social Media Link:<input type="url" id="social-link" name="social-link" class="form-control" required/></div>
                                        <div class="form-groupt"><input type="checkbox" id="i-am-manager"/> I am the manager  (or)</div>
                                        <div id="manager-dets">
                                        <div class="form-group">Manager name:<input type="text" id="manager-name" class="form-control" required/></div>
                                        <div class="form-group">Manager email<input type="email" id="manager-email" class="form-control" required/></div>
                                        <div class="form-group">Manager mobile<input type="number" id="manager-mobile" class="form-control" minLength=5 maxlength=15 required/></div>
                                        </div>
                                        <div class="form-group" id="msg-div"><button class="btn btn-primary" type="button" id="det-submit-btn"><i id="det-submit-icon" class="fa fa-save"></i> Submit</button><a href="membership" class="btn btn-default"><i class="fa fa-close"></i>Cancel</a></div>
                                        <script type="text/javascript">
                                            $(document).ready(function () {
                                                countries = ["Afghanistan", "Albania", "Algeria", "American Samoa", "Andorra", "Angola", "Anguilla", "Antarctica", "Antigua and Barbuda", "Argentina", "Armenia", "Aruba", "Australia", "Austria", "Azerbaijan", "Bahamas", "Bahrain", "Bangladesh", "Barbados", "Belarus", "Belgium", "Belize", "Benin", "Bermuda", "Bhutan", "Bolivia", "Bosnia and Herzegowina", "Botswana", "Bouvet Island", "Brazil", "British Indian Ocean Territory", "Brunei Darussalam", "Bulgaria", "Burkina Faso", "Burundi", "Cambodia", "Cameroon", "Canada", "Cape Verde", "Cayman Islands", "Central African Republic", "Chad", "Chile", "China", "Christmas Island", "Cocos (Keeling) Islands", "Colombia", "Comoros", "Congo", "Congo, the Democratic Republic of the", "Cook Islands", "Costa Rica", "Cote d'Ivoire", "Croatia (Hrvatska)", "Cuba", "Cyprus", "Czech Republic", "Denmark", "Djibouti", "Dominica", "Dominican Republic", "East Timor", "Ecuador", "Egypt", "El Salvador", "Equatorial Guinea", "Eritrea", "Estonia", "Ethiopia", "Falkland Islands (Malvinas)", "Faroe Islands", "Fiji", "Finland", "France", "France Metropolitan", "French Guiana", "French Polynesia", "French Southern Territories", "Gabon", "Gambia", "Georgia", "Germany", "Ghana", "Gibraltar", "Greece", "Greenland", "Grenada", "Guadeloupe", "Guam", "Guatemala", "Guinea", "Guinea-Bissau", "Guyana", "Haiti", "Heard and Mc Donald Islands", "Holy See (Vatican City State)", "Honduras", "Hong Kong", "Hungary", "Iceland", "India", "Indonesia", "Iran (Islamic Republic of)", "Iraq", "Ireland", "Israel", "Italy", "Jamaica", "Japan", "Jordan", "Kazakhstan", "Kenya", "Kiribati", "Korea, Democratic People's Republic of", "Korea, Republic of", "Kuwait", "Kyrgyzstan", "Lao, People's Democratic Republic", "Latvia", "Lebanon", "Lesotho", "Liberia", "Libyan Arab Jamahiriya", "Liechtenstein", "Lithuania", "Luxembourg", "Macau", "Macedonia, The Former Yugoslav Republic of", "Madagascar", "Malawi", "Malaysia", "Maldives", "Mali", "Malta", "Marshall Islands", "Martinique", "Mauritania", "Mauritius", "Mayotte", "Mexico", "Micronesia, Federated States of", "Moldova, Republic of", "Monaco", "Mongolia", "Montserrat", "Morocco", "Mozambique", "Myanmar", "Namibia", "Nauru", "Nepal", "Netherlands", "Netherlands Antilles", "New Caledonia", "New Zealand", "Nicaragua", "Niger", "Nigeria", "Niue", "Norfolk Island", "Northern Mariana Islands", "Norway", "Oman", "Pakistan", "Palau", "Panama", "Papua New Guinea", "Paraguay", "Peru", "Philippines", "Pitcairn", "Poland", "Portugal", "Puerto Rico", "Qatar", "Reunion", "Romania", "Russian Federation", "Rwanda", "Saint Kitts and Nevis", "Saint Lucia", "Saint Vincent and the Grenadines", "Samoa", "San Marino", "Sao Tome and Principe", "Saudi Arabia", "Senegal", "Seychelles", "Sierra Leone", "Singapore", "Slovakia (Slovak Republic)", "Slovenia", "Solomon Islands", "Somalia", "South Africa", "South Georgia and the South Sandwich Islands", "Spain", "Sri Lanka", "St. Helena", "St. Pierre and Miquelon", "Sudan", "Suriname", "Svalbard and Jan Mayen Islands", "Swaziland", "Sweden", "Switzerland", "Syrian Arab Republic", "Taiwan, Province of China", "Tajikistan", "Tanzania, United Republic of", "Thailand", "Togo", "Tokelau", "Tonga", "Trinidad and Tobago", "Tunisia", "Turkey", "Turkmenistan", "Turks and Caicos Islands", "Tuvalu", "Uganda", "Ukraine", "United Arab Emirates", "United Kingdom", "United States", "United States Minor Outlying Islands", "Uruguay", "Uzbekistan", "Vanuatu", "Venezuela", "Vietnam", "Virgin Islands (British)", "Virgin Islands (U.S.)", "Wallis and Futuna Islands", "Western Sahara", "Yemen", "Yugoslavia", "Zambia", "Zimbabwe"];
                                                for (i = 0; i < countries.length; i++)
                                                    $("#country").append("<option value='" + countries[i] + "'>" + countries[i] + "</option>");
                                                $("#det-submit-btn").on("click", function () {
                                                    if ($("#club-dets-form").valid()) {
                                                        $("#det-submit-icon").attr("class", "fa fa-spinner-spin");
                                                        $.ajax({
                                                            url: "/sUser/updateMembership",
                                                            method: "post",
                                                            data: { "type":$("#type").val(),"club_name": $("#club-name").val(), "sport_name": $("#sport").val(), "country": $("#country").val(), "address": $("#address").val(), "website": $("#website").val(), "social_link": $("#social-link").val(),"mval":$("#mval").val(),"m_name":$("#manager_name").val(),"m_email":$("#manager_email").val(),"m_mobile":$("#manager_mobile").val() },
                                                            success: function (data) {
                                                                console.log(data);
                                                                $("#msg-div").html("<div class='alert alert-success'><i class='fa fa-check'></i>  Details Saved</div>");
                                                            },
                                                            error: function (xhr) {
                                                                console.log(xhr);
                                                            }
                                                        });              
                                                    }
                                                });
                                            });
                                        </script>
                                        </form>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
             </div>                          
          </div>
        <!--new-dets-->
            <div class="col-md-9" id="new-dets" style="display:none">
                   <div class="headline margin-bottom-30"><h2>Add new club, team, company, school, or university</h2></div>

	                    <div class="row">
                        <div class="col-md-offset-1 col-md-4 col-sm-6">
                            <div class="servive-block servive-block-u">            
                                <i class="fa fa-trophy fa-4x"></i>
                                <h2 class="heading-md">Club</h2>
                                <input type="button" id="add-club-btn" class="btn btn-default" value="Add club"/>
                            </div>
                        </div>
                        <div class="col-md-4 col-sm-6">
                            <div class="servive-block servive-block-u">
                                <i class="fa fa-users fa-4x"></i>
                                <h2 class="heading-md">Team</h2>
                                <input type="button" id="add-team-btn" class="btn btn-default" value="Add team"/>
                            </div>
                        </div>
                    </div>
                    <div class="row margin-bottom-20">
                        <div class="col-md-offset-1 col-md-8 col-sm-12" style="padding-bottom: 20px; border-bottom: 1px dotted #4f91cd">
                            <small>A sports club or team is a group of people playing single or multi-sports, who wear the same club or team colours and bear the same name. The club or team is formed to encourage sports practice (training) and coaching, the organisation of sports events and participation (competing) in sports leagues, championships, races, and tournaments. Clubs or teams have a formal structure (constitution), offer paid or complimentary membership and they have a relationship with the respective sports federation, sports council and/or local and federal sports authorities. A club or team may be either an amateur or professional and/or commercial or non-commercial entity.</small>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-offset-1 col-md-4 col-sm-6">
                            <div class="servive-block servive-block-u">
                                <i class="fa fa-briefcase fa-4x"></i>
                                <h2 class="heading-md">Company</h2>
                                <input type="button" id="add-company-btn" class="btn btn-default" value="Add company"/>
                            </div>
                        </div>
                        <div class="col-md-4 col-sm-6">
                            <div class="servive-block servive-block-u">
                                <i class="fa fa-graduation-cap fa-4x"></i>
                                <h2 class="heading-md">School or university</h2>
                                <input type="button" id="add-univ-btn" class="btn btn-default" value="Add school / university"/>
                            </div>
                        </div>
                    </div>
                    <div class="row margin-bottom-20">
                        <div class="col-md-offset-1 col-md-8 col-sm-12"><small>A company or school/university is a group of people belonging to a club or team which represents the company or school/university. A company can also be classified as an sports event organiser.</small></div>
                    </div>

                </div>
                <script type="text/javascript">
                    $(document).ready(function () {
                        $("#add-club-btn").on("click", function () {
                            $("#type").val("Club");
                            $("#panel-heading").html("Club details");
                            $("#c-title").html("Club name");
                            $("#edit-dets").show();
                            $("#new-dets").hide();
                        });
                        $("#add-team-btn").on("click", function () {
                            $("#type").val("Team");
                            $("#panel-heading").html("Team details");
                            $("#c-title").html("Team name");
                            $("#edit-dets").show();
                            $("#new-dets").hide();
                        });
                        $("#add-univ-btn").on("click", function () {
                            $("#type").val("University");
                            $("#panel-heading").html("University /School details");
                            $("#c-title").html("University/school Name");
                            $("#edit-dets").show();
                            $("#new-dets").hide();
                        });
                        $("#add-company-btn").on("click", function () {
                            $("#type").val("Company");
                            $("#panel-heading").html("Company Details");
                            $("#c-title").html("Company Name");
                            $("#edit-dets").show();
                            $("#new-dets").hide();
                        });
                        $("#i-am-manager").on("change", function () {
                            if (this.checked) {
                                $("#manager-dets").hide();
                                $("#mval").val("true");
                            }
                            else {
                                $("#manager-dets").show();
                                $("#mval").val("false");
                            }
                        });
                        $("#edit-dets-btn").on("click", function () {
                            $("#edit-dets").show();
                            $("#view-det").hide();
                        });
                    });
                </script>
        </div>
        <!-- /#page-wrapper -->
      
    <!-- /#wrapper -->

    <!-- jQuery -->
    
    <% if (Model.teamname.Equals("") || Model.teamname.Equals("BsonNull"))
       { %>
           <script type="text/javascript">
               $(document).ready(function () {
                  $("#new-dets").show();
               });
           </script>
        <%} %>
        <%else
        { %>
           <script type="text/javascript">
               $(document).ready(function () {
                  $("#view-det").show();
               });
            </script>
        <%} %>
      </div>  
</body>

</html>


