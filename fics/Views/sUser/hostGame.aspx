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
                  <li class="active">
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
        <script src="../../Scripts/jquery.validate.js" type="text/javascript"></script>
        <script src="../../Scripts/jquery.validate.min.js" type="text/javascript"></script>
        
        <div id="page-wrapper">

            <div class="container-fluid">
            <div class="row">
            <div class="page-header">
            <h2>Host Your Game here</h2>
            </div>
            <div id="host-game-div" class="form-group col-lg-6" id="personal-dets-div">            
                              <div id="edit-div">                                 
                                        <form id="game-dets-form"><b>
                                        <div class="form-group col-lg-6">Hosted by<div class="col-lg-12"> Me <input type="radio" name="hby" id="byme" class="" value="me" checked/> -(or)- My club <input type="radio" name="hby" id="byclub" class="" value="club"/></div></div>
                                        <div class="form-group col-lg-12">Sport:<input type="text" id="sport" name="sport-name" class="form-control" required/></div>
                                        <div class="form-group col-lg-6">Country:<select id="country" name="country" class="form-control" required></select></div>  
                                        <div class="form-group col-lg-6">State:<input type="text" id="state" name="state" class="form-control" required/></div>
                                        <div class="form-group col-lg-6">City:<input type="text" id="city" name="city" class="form-control" required/></div>                                      
                                        <div class="form-group col-lg-12">Location:<input type="text" id="location" name="location" class="form-control" required/></div>
                                        <div class="form-group col-lg-6">From:<input type="date" id="from" name="from" class="form-control" required/></div>
                                        <div class="form-group col-lg-6">To:<input type="date" id="to" name="to" class="form-control" required/></div>
                                        <div class="form-group col-lg-6">Last Date To Register:<input type="date" id="lastdate" name="lastdate" class="form-control" required/></div>
                                        <div class="form-group col-lg-6">Time:<input type="text" id="time" name="time" class="form-control" required/></div>
                                        <div class="form-group col-lg-12">Category:<select id="category" name="category" class="form-control" required><option value="under-14">Under 14</option><option value="under-20">Under 20</option><option value="open">Open</option><option value="special">Speacialy Challenged</option></select></div>
                                        <div class="form-group col-lg-6">Minimam Player/Team:<input type="number" id="minplayer" name="minplayer" class="form-control" required minvalue=1/></div>
                                        <div class="form-group col-lg-6">Maximam Player/Team:<input type="number" id="maxplayer" name="maxplayer" class="form-control" required minvalue=1/></div>
                                        <div class="form-group col-lg-6">Price Details:<input type="text" id="price-dets" name="price-dets" class="form-control" required/></div>                                      
                                        <div class="form-group col-lg-12" id="msg-div"><button class="btn btn-primary" type="button" id="det-submit-btn"><i id="det-submit-icon" class="fa fa-save"></i> Submit</button><a href="membership" class="btn btn-default"><i class="fa fa-close"></i>Cancel</a></div>                                        
                                        </b>
                                        <script type="text/javascript">
                                        $(document).ready(function () {
                                                countries = ["Afghanistan", "Albania", "Algeria", "American Samoa", "Andorra", "Angola", "Anguilla", "Antarctica", "Antigua and Barbuda", "Argentina", "Armenia", "Aruba", "Australia", "Austria", "Azerbaijan", "Bahamas", "Bahrain", "Bangladesh", "Barbados", "Belarus", "Belgium", "Belize", "Benin", "Bermuda", "Bhutan", "Bolivia", "Bosnia and Herzegowina", "Botswana", "Bouvet Island", "Brazil", "British Indian Ocean Territory", "Brunei Darussalam", "Bulgaria", "Burkina Faso", "Burundi", "Cambodia", "Cameroon", "Canada", "Cape Verde", "Cayman Islands", "Central African Republic", "Chad", "Chile", "China", "Christmas Island", "Cocos (Keeling) Islands", "Colombia", "Comoros", "Congo", "Congo, the Democratic Republic of the", "Cook Islands", "Costa Rica", "Cote d'Ivoire", "Croatia (Hrvatska)", "Cuba", "Cyprus", "Czech Republic", "Denmark", "Djibouti", "Dominica", "Dominican Republic", "East Timor", "Ecuador", "Egypt", "El Salvador", "Equatorial Guinea", "Eritrea", "Estonia", "Ethiopia", "Falkland Islands (Malvinas)", "Faroe Islands", "Fiji", "Finland", "France", "France Metropolitan", "French Guiana", "French Polynesia", "French Southern Territories", "Gabon", "Gambia", "Georgia", "Germany", "Ghana", "Gibraltar", "Greece", "Greenland", "Grenada", "Guadeloupe", "Guam", "Guatemala", "Guinea", "Guinea-Bissau", "Guyana", "Haiti", "Heard and Mc Donald Islands", "Holy See (Vatican City State)", "Honduras", "Hong Kong", "Hungary", "Iceland", "India", "Indonesia", "Iran (Islamic Republic of)", "Iraq", "Ireland", "Israel", "Italy", "Jamaica", "Japan", "Jordan", "Kazakhstan", "Kenya", "Kiribati", "Korea, Democratic People's Republic of", "Korea, Republic of", "Kuwait", "Kyrgyzstan", "Lao, People's Democratic Republic", "Latvia", "Lebanon", "Lesotho", "Liberia", "Libyan Arab Jamahiriya", "Liechtenstein", "Lithuania", "Luxembourg", "Macau", "Macedonia, The Former Yugoslav Republic of", "Madagascar", "Malawi", "Malaysia", "Maldives", "Mali", "Malta", "Marshall Islands", "Martinique", "Mauritania", "Mauritius", "Mayotte", "Mexico", "Micronesia, Federated States of", "Moldova, Republic of", "Monaco", "Mongolia", "Montserrat", "Morocco", "Mozambique", "Myanmar", "Namibia", "Nauru", "Nepal", "Netherlands", "Netherlands Antilles", "New Caledonia", "New Zealand", "Nicaragua", "Niger", "Nigeria", "Niue", "Norfolk Island", "Northern Mariana Islands", "Norway", "Oman", "Pakistan", "Palau", "Panama", "Papua New Guinea", "Paraguay", "Peru", "Philippines", "Pitcairn", "Poland", "Portugal", "Puerto Rico", "Qatar", "Reunion", "Romania", "Russian Federation", "Rwanda", "Saint Kitts and Nevis", "Saint Lucia", "Saint Vincent and the Grenadines", "Samoa", "San Marino", "Sao Tome and Principe", "Saudi Arabia", "Senegal", "Seychelles", "Sierra Leone", "Singapore", "Slovakia (Slovak Republic)", "Slovenia", "Solomon Islands", "Somalia", "South Africa", "South Georgia and the South Sandwich Islands", "Spain", "Sri Lanka", "St. Helena", "St. Pierre and Miquelon", "Sudan", "Suriname", "Svalbard and Jan Mayen Islands", "Swaziland", "Sweden", "Switzerland", "Syrian Arab Republic", "Taiwan, Province of China", "Tajikistan", "Tanzania, United Republic of", "Thailand", "Togo", "Tokelau", "Tonga", "Trinidad and Tobago", "Tunisia", "Turkey", "Turkmenistan", "Turks and Caicos Islands", "Tuvalu", "Uganda", "Ukraine", "United Arab Emirates", "United Kingdom", "United States", "United States Minor Outlying Islands", "Uruguay", "Uzbekistan", "Vanuatu", "Venezuela", "Vietnam", "Virgin Islands (British)", "Virgin Islands (U.S.)", "Wallis and Futuna Islands", "Western Sahara", "Yemen", "Yugoslavia", "Zambia", "Zimbabwe"];
                                                for (i = 0; i < countries.length; i++)
                                                    $("#country").append("<option value='" + countries[i] + "'>" + countries[i] + "</option>");
                                            });
                                            </script>
                                 </div>
                        </div> 
                        <div class="col-lg-6">
                        <div class="form-group col-lg-12"><b>About the Game:</b><textarea class="form-control" id="aboutgame" rows=6 required></textarea></div>
                        </div> 
                        </form>          
            </div>
            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->
    <% if (Model.teamname.Equals("") || Model.teamname.Equals("BsonNull"))
       { %>
           <script type="text/javascript">
               $(document).ready(function () {
                   $("#byclub").attr("disabled", true);
                   $("#byme").attr("checked", true);
               });
           </script>
        <%} %>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#det-submit-btn").on("click", function () {
                if ($("#game-dets-form").valid())
                    if (datecheck()) {
                        if (minmaxcheck()) {
                            {
                                $("#det-submit-icon").attr("class", "fa fa-spinner-spin");
                                $.ajax({
                                    url: "/sUser/updateGame",
                                    method: "post",
                                    data: { "hby": $("[name='hby']:checked").val(), "sport": $("#sport").val(), "country": $("#country").val(), "state": $("#state").val(), "city": $("#city").val(), "location": $("#location").val(), "from": $("#from").val(), "to": $("#from").val(), "time": $("#time").val(), "category": $("#category").val(), "price_dets": $("#price-dets").val(), "minPlayer": "" + $("#minplayer").val(), "maxPlayer": "" + $("#maxplayer").val(), "aboutgame": $("#aboutgame").val(), "lastdate": $("#lastdate").val() },
                                    success: function (data) {
                                        console.log(data);
                                        $("#msg-div").html("<div class='alert alert-success'><i class='fa fa-check'></i>  Details Saved</div>");
                                    },
                                    error: function (xhr) {
                                        console.log("HI" + xhr);
                                    }
                                });
                            }
                        } 
                    }
            });
            });
            function minmaxcheck() {
                var mm = $("#maxplayer").val() - $("#minplayer").val();
                if (mm < 0) {
                    alert("Minimum Maximum Players are not entered Correctlye");
                    return false;
                }
                return true;
            }
        function datecheck() {
            var from = new Date($("#from").val());
            var to = new Date($("#to").val());
            var last = new Date($("#lastdate").val());
            var cdate = new Date();
            var cf = from -cdate;
            var ft = to - from;
            var lf = from - last;
            console.log(cf);
            console.log(ft);
            console.log(lf);
            if(cf>0&&ft>0&&lf>0){            
             return true;
            }
            alert("Dates are not Entered Correctly please Ensure it");
            return false;
        }
    </script>
</body>

</html>
