<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<fics.Models.UserModal>" %>
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
            <h2>Welcome to Sports Hunter</h2>
            </div>
            <p>
               The New Dimension of Sports world
            </p>
            </div>
            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="../../Scripts/jquery-2.2.4.js" type="text/javascript"></script>
    

    <!-- Bootstrap Core JavaScript -->
    <script src="../../Scripts/bootstrap.min.js" type="text/javascript"></script>
    

</body>

</html>
