<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<fics.Models.profile>" %>
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
               <a class="navbar-brand"><i><img src="../../images/FSSAI_logo.png" width="74" height="26"></i></a>
            </div>
            <!-- Top Menu Items -->
            <ul class="nav navbar-right top-nav">
               <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> <%=Session["user"] %> <b class="caret"></b></a>
                  <ul class="dropdown-menu">
                     <li>
                        <a href="#"><i class="fa fa-fw fa-user"></i> Profile</a>
                     </li>
                     <li class="divider"></li>
                     <li>
                        <a href="#"><i class="fa fa-fw fa-power-off"></i> Log Out</a>
                     </li>
                  </ul>
               </li>
            </ul>
            <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
               <ul class="nav navbar-nav side-nav">
                  <li class="active">
                     <a href="/User/Profile"><i class='fa fa-fw fa-dashboard'></i> Profile</a>
                  </li>
                  <li>
                     <a href="/User/PostProduct"><i class="fa fa-fw fa-bar-chart-o"></i> Post Product</a>
                  </li>
                  <li>
                     <a href="/User/ViewProduct"><i class="fa fa-fw fa-table"></i> View Products</a>
                  </li>
                   </ul>
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
               <div class="row">
                  <div class="col-lg-6">
                     <div class="panel panel-success">
                        <div class="panel-heading">
                           Company details
                        </div>
                        <div class="panel-body">
                           <div class="col-lg-12">
                              <div class="row">
                                 <div class="form-group" id="cmpnydets-div">
                                 <div id="edit-div" style="display:none">
                                        <div class="form-group">Company Name:<input type="text" id="cmpnyName" class="form-control" /></div>                                    
                                        <div class="form-group">Licence No:<input type="text" id="cmpnyLicNo" class="form-control" /></div>
                                        <div class="form-group">Address:<textarea class="form-control" cols="2" id="cmpnyAddress" rows="3"></textarea></div>
                                        <div class="form-group" id="msg-div"><input class="btn btn-primary" type="button" id="pro-submit-btn" value="Submit" /></div>
                                 </div>
                                 <div id="view-div" style="display:none">
                                    <div class="form-group"><label>CompanyName:</label><%= Model.companyName%></div>
                                        <div class="form-group"><label>LicNo:</label><%= Model.licenceNo%></div>
                                        <div class="form-group"><label>Address:</label><%= Model.address%></div>
                                        <div class="form-group"><button id="editdetsbtn" class="btn btn-success"><i class="fa fa-edit"></i> Edit</button></div>                                 </div>
                                    <% if (Model.companyName.Equals(""))
                                       { %>
                                        <script type="text/javascript">
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
                  <div class="col-lg-6">
                     <div class="panel panel-default">
                        <div class="panel-heading">Log details</div>
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
            </div>
            <!-- /.container-fluid -->
         </div>
         <!-- /#page-wrapper -->
      </div>
      <!-- /#wrapper -->
      <script type="text/javascript">
          $(document).ready(function () {
              $("#editdetsbtn").click(function () {
                  $("#view-div").hide();
                  $("#edit-div").show();
              });
              $("#pro-submit-btn").on("click", function () {
                  console.log("hello");
                  $.ajax({
                      url: "/User/updateProfile",
                      method: "post",
                      data: { "companyName": $("#cmpnyName").val(), "licNo": $("#cmpnyLicNo").val(), "address": $("#cmpnyAddress").val() },
                      success: function (data) {
                          $("#msg-div").html("<div class='alert alert-success'><i class='fa fa-check'></i>  Details Changed</div>");
                      },
                      error: function (xhr) {
                          console.log(xhr);
                      }
                  });
              });
          });
      </script>
   </body>
</html>