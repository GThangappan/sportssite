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
                  <li>
                     <a href="/User/Profile"><i class='fa fa-fw fa-dashboard'></i> Profile</a>
                  </li>
                  <li class="active">
                     <a href="/User/PostProduct"><i class="fa fa-fw fa-bar-chart-o"></i> Post Product</a>
                  </li>
                  <li>
                     <a href="/User/ViewProduct"><i class="fa fa-fw fa-table"></i> View Products</a>
                  </li>
                 
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </nav>

        <div id="page-wrapper">

            <div class="container-fluid">
            <div class="row">
            <div class="page-header">
            <h2>Post Products</h2>
            </div>            
            </div>
            <div class="row">
              <div class="col-lg-6">
                     <div class="panel panel-default">
                        <div class="panel-heading">Product details</div>
                        <div class="panel-body">
                           <div class="row">
                              <div class="form-group col-lg-12">
                                 <label>Product Name</label>
                                 <input type="text" id="pName" class="form-control" placeholder="Licenced Name" />
                              </div>
                              <div class="form-group col-lg-12">
                                 <label>Product Licence Number</label>
                                 <input type="text" id="lNumber" class="form-control" placeholder="Valid Number"/>
                              </div>
                              <div class="form-group col-lg-12">
                                 <label>Cargo Number</label>
                                 <input type="text" id="cNumber" class="form-control" placeholder="Valid Cargo Number"/>
                              </div>
                              <div class="form-group col-lg-12">
                                 <label>Port Name</label>
                                 <input type="text" id="port" class="form-control" />
                              </div>
                              <div class="form-group col-lg-12">
                                 <label>Departure Date</label>
                                 <input type="date" id="dDate" class="form-control" />
                              </div>
                              <div class="form-group col-lg-12">
                                 <label>Arival Date</label>
                                 <input type="date" id="aDate" class="form-control" />
                              </div>
                              <div class="form-group col-lg-12">
                                 <label>Product Info</label>
                                 <textarea class="form-control" cols="2" id="pInfo" rows="3" placeholder="Information of Product content"></textarea>
                              </div>
                              <div class="form-group col-lg-12">
                              <button class="btn btn-success" id="postbtn"><i class="fa fa-edit"> </i> Post</button>
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

    <!-- jQuery -->
    <script src="../../Scripts/jquery-2.2.4.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#postbtn").on("click", function () {
                if ($("#pName").val() != "" && $("#lNumber").val() != "" && $("#cNumber").val() != "" && $("#dDate").val() != "" && $("#aDate").val() != "" && $("#pInfo").val() != "" && $("#port").val() != "") {
                    var pName = "" + $("#pName").val();
                    var lNumber = "" + $("#lNumber").val();
                    var cNumber = "" + $("#cNumber").val();
                    var dDate = "" + $("#dDate").val();
                    var aDate = "" + $("#aDate").val();
                    var pInfo = "" + $("#pInfo").val();
                    var port = "" + $("#port").val();
                    $("#postbtn").html("<i class='fa fa-spinner-spin'></i> Post");
                    $.ajax({
                        url: '/User/postpro',
                        type: "GET",
                        data: { pName: pName, lNumber: lNumber, cNumber: cNumber, port: port, dDate: dDate, aDate: aDate, pInfo: pInfo },
                        success: function (data) {
                            if (data == "success") {
                                console.log("hello world");
                                $("#postbtn").html("<i class='fa fa-check'></i> Post");
                            }
                            else {
                                alert("product already inserted enter another licence number");
                                console.log(data);
                            }
                        },
                        error: function (xhr) {
                            console.log("rep");
                        }
                    });
                }
            });
        });
    </script>
    <!-- Bootstrap Core JavaScript -->
    <script src="../../Scripts/bootstrap.min.js" type="text/javascript"></script>
    

</body>

</html>
