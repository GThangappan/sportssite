<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<fics.Models.productModal>" %>

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
                  <li>
                     <a href="/User/PostProduct"><i class="fa fa-fw fa-bar-chart-o"></i> Post Product</a>
                  </li>
                  <li class="active">
                     <a href="/User/ViewProduct"><i class="fa fa-fw fa-table"></i> Product Status</a>
                  </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </nav>

        <div id="page-wrapper">

            <div class="container-fluid">
            <div class="row">
            <div class="page-header">
            <h2>Products</h2>
            </div>            
            </div>
            <div class="row">
              <div class="col-lg-12">
                     <div class="panel panel-default">
                        <div class="panel-heading">Product details</div>
                        <div class="panel-body">
                           <div class="row">
                           <table class="table table-striped table-bordered table-hover dataTable no-footer">
                           <thead>
                           <tr>
                           <th>Product</th>
                           <th>LicenceNumber</th>
                           <th>Cargo Number</th>
                           <th>Port</th>
                           <th>Departure Date</th>
                           <th>Arrival Date</th>
                           <th>Product Info</th>
                           <th>Inspection</th>
                           <th>Status</th>
                           <th>Report</th>
                           </tr>
                           </thead>
                               <%  String lname = Session["user"].ToString(); 
                                   var query = new MongoDB.Driver.QueryDocument("uname", lname);
                                   foreach (MongoDB.Bson.BsonDocument item in Model.procolect.Find(query)) {
                                   String uname = item.GetElement("uname").Value.ToString();
                                   
                                   if(uname.Equals(lname)){
                                       String pname= item.GetElement("pName").Value.ToString();
                                       String lnumber= item.GetElement("lNumber").Value.ToString();
                                       String cNumber= item.GetElement("cNumber").Value.ToString();
                                       String port= item.GetElement("port").Value.ToString();
                                       String ddate = item.GetElement("dDate").Value.ToString();
                                       String adate = item.GetElement("aDate").Value.ToString();
                                       String pinfo = item.GetElement("pInfo").Value.ToString();
                                       String insDate = item.GetElement("InsDate").Value.ToString();
                                       String status = item.GetElement("Status").Value.ToString();
                                       String report = item.GetElement("Report").Value.ToString();
                                       %>
                                       <tr>
                                       <td><%=pname%></td>
                                       <td><%=lnumber%></td>
                                       <td><%=cNumber%></td>
                                       <td><%=port%></td>
                                       <td><%=ddate%></td>
                                       <td><%=adate%></td>
                                       <td><%=pinfo%></td>
                                       <td><%=insDate%></td>
                                       <td><%=status%></td>
                                       <td><%=report%></td>
                                       </tr>
                              <%
                                   }
                               }                               
                              %>
                             </table> 
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
    <!-- Bootstrap Core JavaScript -->
    <script src="../../Scripts/bootstrap.min.js" type="text/javascript"></script>
    

</body>

</html>
