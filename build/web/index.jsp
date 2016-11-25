<%@page import="DBConn.Connection"%>
<%@page import="Config.Config"%>
<%
Config.getBase_url(request);
Config.getFile_url(session);
Connection co = new Connection();
co.getIpCall();
%>
<!DOCTYPE html>
<!--
    @author SyasyaAzizan
-->
<html>
    <head>
        <title>e-PHR Home Page</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

        <style type="text/css">
            #footer 
            {
                clear: both;
                text-align: center;
                position: relative;
                right:0;
                /*bottom:0;*/
                left:0;
                padding:rem;
            }
        </style>

        <script type="text/javascript">

//            Login button with id btn-login will call login-modal and login.jsp
//            to authenticate user
//            Sign Up button with id btn-sign-up will call sign-up-modal and 
//            signup.jsp to process the registration process
            $(document).ready(function () 
            {
                $("#btn-login").click(function () 
                {
                    $("#login-modal").modal();
                });
                $("#btn-sign-up").click(function () 
                {
                    $("#sign-up-modal").modal();
                });
            });     
        </script>

    </head>
    <body>
        <div class="container-fluid">
            <!--Header-->
            <div id="header" class="row" align="center">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                     <img src="images/e-phr-banner.jpg" class="img-responsive center-block" alt="Electronic Personalized Health Records" />
                </div>
            </div>
            <div class="row" id="body">
                <div class="col-sm-2 col-xs-2 col-md-2 col-lg-2"></div>
                <div class="col-sm-8 col-xs-8 col-md-8 col-lg-8" id="text" align="middle">
                    <h1 align="center">Welcome to Electronic Personalized Health Records</h1>
                    <br />
                    <!--Navigation-->
                    <button type="button" class="btn btn-default btn-md" id="btn-login">Login</button>
                    <button type="button" class="btn btn-default btn-md" id="btn-sign-up">Sign Up</button>
                    <br /><br />
                    <h3 align="center">
                        "WE ARE PROUD TO PROVIDE HIGH QUALITY <br /> HEALTH CARE MANAGEMENT
                        TO PATIENTS"
                    </h3>
                    <br /><br />
                    <img src="images/image-front.jpg" class="img-responsive center-block" alt="Electronic Personalized Health Records" />
                    <br /><br />
                    <p align="center">Electronic Personalized Health Records [e-PHR] is a web based 
                    system that used by home <br /> user and office based user to monitor 
                    their own lifetime health records.</p>
                </div>
                <div class="col-sm-2 col-xs-2 col-md-2 col-lg-2"></div>
            </div>
            
            
               
            <!--Start Modal-->
            <div class="modal fade" id="login-modal" role="dialog">
                <div class="modal-dialog">
                    <!--Modal Content-->
                    <div class="modal-content">
                        <!--Modal Header-->
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">
                                &times;
                            </button>
                            <h3 align="center"><span class="glyphicon glyphicon-lock"></span>Login</h3>
                        </div>
                        <!--Modal Body-->
                        <div class="modal-body" style="padding:40px 50px;">
                            <form role="form" action="login.jsp">
                                <div class="form-group">
                                    <label for="username"><span class="glyphicon glyphicon-user"></span> Username</label>
                                    <input type="text" class="form-control" id="username" name="username" placeholder="Enter username" required>
                                </div>
                                <div class="form-group">
                                    <label for="psswd"><span class="glyphicon glyphicon-eye-open"></span> Password</label>
                                    <input type="password" class="form-control" id="psswd" name="psswd" placeholder="Enter password" required>
                                </div>
                                <button type="submit" class="btn btn-success btn-block"><span class="glyphicon glyphicon-off"></span> Login</button>
                            </form>
                        </div>
                        <!--Modal Footer-->
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal">
                                <span class="glyphicon glyphicon-remove"></span> Cancel</button>
                            <p>Not a member? <a href="#sign-up-modal">Sign Up</a></p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="sign-up-modal" role="dialog">
                <div class="modal-dialog">
                    <!--Modal Content-->
                    <div class="modal-content">
                        <!--Modal Header-->
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">
                                &times;
                            </button>
                            <h3 align="center"><span class="glyphicon glyphicon-user"></span>Sign Up</h3>
                        </div>
                        <!--Modal Body-->
                        <div class="modal-body" style="padding:40px 50px;">
                            <form role="form" action="signup.jsp">
                                <div class="form-group">
                                    <label for="ic-no"><span class="glyphicons glyphicons-vcard"></span> IC No</label>
                                    <input type="text" class="form-control" name="reg-ic-no" placeholder="Enter IC No" required>
                                </div>
                                <div class="form-group">
                                    <label for="email"><span class="social social-e-mail-envelope"></span> Email</label>
                                    <input type="email" class="form-control" name="reg-email" placeholder="Enter email">
                                </div>
                                <div class="form-group">
                                    <label for="username"><span class="glyphicon glyphicon-user"></span> Username</label>
                                    <input type="text" class="form-control" name="reg-uname" placeholder="Enter username" required>
                                </div>
                                <div class="form-group">
                                    <label for="psswd"><span class="glyphicon glyphicon-eye-open"></span> Password</label>
                                    <input type="password" class="form-control" name="reg-psswd" placeholder="Enter password" required>
                                </div>
                                <button type="submit" class="btn btn-success btn-block"><span class="glyphicon glyphicon-off"></span> Sign Up</button>
                            </form>
                        </div>
                        <!--Modal Footer-->
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal">
                                <span class="glyphicon glyphicon-remove"></span> Cancel</button>
                        </div>
                    </div>
                </div>
            </div>
            <!--End of Modal-->
 
        </div>
    </body>
</html>
