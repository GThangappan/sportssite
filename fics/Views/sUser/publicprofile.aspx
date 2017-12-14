<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<fics.Models.profileModal>" %>

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
      <script src="../../Scripts/jquery.validate.min.js" type="text/javascript"></script>
    <script src="../../Scripts/jquery.validate.js" type="text/javascript"></script>
      
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
               <a class="navbar-brand"><i><img src="../../img/mainlg.png" width="74" height="26"/></i></a>
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
                   <li class="active">
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
                  <li>
                     <a href="huntGames"><i class="fa fa-fw fa-calendar-check-o"></i> Hunt Event</a>
                  </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
         </nav>
         <div id="page-wrapper">
            <div class="container-fluid">
               <div class="row">
                  <div class="page-header">
                     <h2>Profile</h2>
                  </div>
               </div>
               <!--Personal details div-->  
               <div class="row">
                  <div class="col-lg-6">
                     <div class="panel panel-success">
                        <div class="panel-heading">
                           Personal Details
                        </div>
                        <div class="panel-body">
                           <div class="col-lg-12">
                              <div class="row">
                                 <div class="form-group" id="personal-dets-div">
                                 <div id="edit-div" style="display:none">
                                 
                                        <form id="perdets-form">
                                        <div class="form-group"><b>FullName:<input type="text" id="full_name" name="full_name" class="form-control" required/></div>                                    
                                        <div class="form-group">Country:<select id="country" name="country" class="form-control" required></select></div>
                                        <div class="form-group">Address:<input type="text" id="address" name="address" class="form-control" required/></div>
                                        <div class="form-group">Mobile number:<input type="number" id="mobilenumber" name="mobilenumber" class="form-control" minlength=5 maxlength=15 required/></div>
                                        <div class="form-group">Social Media Link:<input type="url" id="p_social_link" name="p_social_link" class="form-control" required/></div>
                                        <div class="form-group">Websitelink:<input type="url" id="p_website_link" name="p_website_link" class="form-control" required/></div>
                                        <div class="form-group">About You:<input type="text" id="aboutYou" name="aboutYou" class="form-control" required/></div></b>                                        
                                        <div class="form-group" id="msg-div"><button class="btn btn-primary" type="button" id="pro-submit-btn"><i id="pro-submit-icon" class="fa fa-save"></i> Submit</button></div>
                                        <script type="text/javascript">
                                            $(document).ready(function () {
                                                countries = ["Afghanistan", "Albania", "Algeria", "American Samoa", "Andorra", "Angola", "Anguilla", "Antarctica", "Antigua and Barbuda", "Argentina", "Armenia", "Aruba", "Australia", "Austria", "Azerbaijan", "Bahamas", "Bahrain", "Bangladesh", "Barbados", "Belarus", "Belgium", "Belize", "Benin", "Bermuda", "Bhutan", "Bolivia", "Bosnia and Herzegowina", "Botswana", "Bouvet Island", "Brazil", "British Indian Ocean Territory", "Brunei Darussalam", "Bulgaria", "Burkina Faso", "Burundi", "Cambodia", "Cameroon", "Canada", "Cape Verde", "Cayman Islands", "Central African Republic", "Chad", "Chile", "China", "Christmas Island", "Cocos (Keeling) Islands", "Colombia", "Comoros", "Congo", "Congo, the Democratic Republic of the", "Cook Islands", "Costa Rica", "Cote d'Ivoire", "Croatia (Hrvatska)", "Cuba", "Cyprus", "Czech Republic", "Denmark", "Djibouti", "Dominica", "Dominican Republic", "East Timor", "Ecuador", "Egypt", "El Salvador", "Equatorial Guinea", "Eritrea", "Estonia", "Ethiopia", "Falkland Islands (Malvinas)", "Faroe Islands", "Fiji", "Finland", "France", "France Metropolitan", "French Guiana", "French Polynesia", "French Southern Territories", "Gabon", "Gambia", "Georgia", "Germany", "Ghana", "Gibraltar", "Greece", "Greenland", "Grenada", "Guadeloupe", "Guam", "Guatemala", "Guinea", "Guinea-Bissau", "Guyana", "Haiti", "Heard and Mc Donald Islands", "Holy See (Vatican City State)", "Honduras", "Hong Kong", "Hungary", "Iceland", "India", "Indonesia", "Iran (Islamic Republic of)", "Iraq", "Ireland", "Israel", "Italy", "Jamaica", "Japan", "Jordan", "Kazakhstan", "Kenya", "Kiribati", "Korea, Democratic People's Republic of", "Korea, Republic of", "Kuwait", "Kyrgyzstan", "Lao, People's Democratic Republic", "Latvia", "Lebanon", "Lesotho", "Liberia", "Libyan Arab Jamahiriya", "Liechtenstein", "Lithuania", "Luxembourg", "Macau", "Macedonia, The Former Yugoslav Republic of", "Madagascar", "Malawi", "Malaysia", "Maldives", "Mali", "Malta", "Marshall Islands", "Martinique", "Mauritania", "Mauritius", "Mayotte", "Mexico", "Micronesia, Federated States of", "Moldova, Republic of", "Monaco", "Mongolia", "Montserrat", "Morocco", "Mozambique", "Myanmar", "Namibia", "Nauru", "Nepal", "Netherlands", "Netherlands Antilles", "New Caledonia", "New Zealand", "Nicaragua", "Niger", "Nigeria", "Niue", "Norfolk Island", "Northern Mariana Islands", "Norway", "Oman", "Pakistan", "Palau", "Panama", "Papua New Guinea", "Paraguay", "Peru", "Philippines", "Pitcairn", "Poland", "Portugal", "Puerto Rico", "Qatar", "Reunion", "Romania", "Russian Federation", "Rwanda", "Saint Kitts and Nevis", "Saint Lucia", "Saint Vincent and the Grenadines", "Samoa", "San Marino", "Sao Tome and Principe", "Saudi Arabia", "Senegal", "Seychelles", "Sierra Leone", "Singapore", "Slovakia (Slovak Republic)", "Slovenia", "Solomon Islands", "Somalia", "South Africa", "South Georgia and the South Sandwich Islands", "Spain", "Sri Lanka", "St. Helena", "St. Pierre and Miquelon", "Sudan", "Suriname", "Svalbard and Jan Mayen Islands", "Swaziland", "Sweden", "Switzerland", "Syrian Arab Republic", "Taiwan, Province of China", "Tajikistan", "Tanzania, United Republic of", "Thailand", "Togo", "Tokelau", "Tonga", "Trinidad and Tobago", "Tunisia", "Turkey", "Turkmenistan", "Turks and Caicos Islands", "Tuvalu", "Uganda", "Ukraine", "United Arab Emirates", "United Kingdom", "United States", "United States Minor Outlying Islands", "Uruguay", "Uzbekistan", "Vanuatu", "Venezuela", "Vietnam", "Virgin Islands (British)", "Virgin Islands (U.S.)", "Wallis and Futuna Islands", "Western Sahara", "Yemen", "Yugoslavia", "Zambia", "Zimbabwe"];
                                                for (i = 0; i < countries.length; i++)
                                                    $("#country").append("<option value='" + countries[i] + "'>" + countries[i] + "</option>");
                                            });
                                        </script>
                                        </form>
                                 </div>
                                 <div id="view-div" style="display:none">
                                 <table class="table">
                                        <tr><td>FullName</td><td><b><%=Model.full_name %></b></td></tr>                                    
                                        <tr><td>Country</td><td><b><%=Model.country %></b></td></tr>
                                        <tr><td>Address</td><td><b><%=Model.address %></b></td></tr>
                                        <tr><td>Mobile number</td><td><b><%=Model.mobile_number%></b></td></tr>
                                        <tr><td>Social Media Link</td><td><b><%=Model.p_social_link %></b></td></tr>
                                        <tr><td>Websitelink</td><td><b><%=Model.p_website_link %></b></td></tr>
                                        <tr><td>About You:</td><td><b><%=Model.aboutYou %></b></td></tr>
                                    </table>
                                        <div class="form-group"><button class="btn btn-primary" type="button" id="editdetsbtn"><i id="editdetsbtn-i" class="fa fa-edit"></i> Edit</button></div>
                                    <% if (Model.full_name.Equals("BsonNull")||Model.full_name.Equals(""))
                                       { %>
                                        <script type="text/javascript">
                                            console.log("Testin 123");
                                            $("#view-div").hide();
                                            $("#edit-div").show();
                                        </script>
                                    <%} %>
                                    <%else { %>
                                        <script type="text/javascript">
                                            $("#view-div").show();
                                            $("#edit-div").hide();
                                        </script>                                   
                                    <%} %>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
             </div>             
             <!--Login Details Div-->
             <div class="col-lg-6">
                     <div class="panel panel-default">
                        <div class="panel-heading">Login details</div>
                        <div class="panel-body">
                           <div class="row">
                              <div class="form-group col-lg-6">
                                 <label>Username</label>
                                 <p class="form-control-static"><%=Model.userName %></p>
                              </div>
                              <div class="form-group col-lg-6">
                                 <label>Email</label>
                                 <p class="form-control-static"><%=Model.email %></p>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            <!-- /.container-fluid -->
         </div>
         <!-- /#page-wrapper -->
      </div>
      </div>
      <!-- /#wrapper -->
      <script type="text/javascript">
          $(document).ready(function () {
              $("#editdetsbtn").click(function () {
                  $("#view-div").hide();
                  $("#edit-div").show();
              });
              $("#pro-submit-btn").on("click", function () {
                  if ($("#perdets-form").valid()) {
                      $("#pro-submit-icon").attr("class", "fa-spinner-spin");
                      $.ajax({
                          url: "/sUser/updateProfile",
                          method: "post",
                          data: { "full_name": $("#full_name").val(), "country": $("#country").val(), "address": $("#address").val(), "mobilenumber": $("#mobilenumber").val(), "p_social_link": $("#p_social_link").val(), "p_website_link": $("#p_website_link").val(), "aboutYou": $("#aboutYou").val() },
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
   </body>
</html>