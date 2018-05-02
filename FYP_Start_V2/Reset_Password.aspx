<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reset_Password.aspx.cs" Inherits="FYP_Start_V2.Reset_Password" %>

<!DOCTYPE html>
<html lang="en">

<head runat="server">
    <title></title>
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Vendor styles -->
        <link rel="stylesheet" href="vendors/bower_components/material-design-iconic-font/dist/css/material-design-iconic-font.min.css">
        <link rel="stylesheet" href="vendors/bower_components/animate.css/animate.min.css">

        <!-- App styles -->
        <link rel="stylesheet" href="css/app.min.css">
        <script src="vendors/bower_components/jquery/dist/jquery.min.js"></script>
        <script src="js/sweetalert.js"></script>
    <script type="text/javascript">
        function getUrlVars() {
            var vars = [], hash;
            var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
            for (var i = 0; i < hashes.length; i++) {
                hash = hashes[i].split('=');
                vars.push(hash[0]);
                vars[hash[0]] = hash[1];
            }
            return vars;
        }
        $(document).ready(function () {


            if (getUrlVars()["resetsuccess"] != null) {
                swal("Congrats!", "Reset password successful", "success").then((value) => {
                    window.location = "Login_Register.aspx";
                });
            }

            var password = document.getElementById("pass")
                , confirm_password = document.getElementById("confirm_pass");

            function validatePassword() {
                if (password.value != confirm_password.value) {
                    confirm_password.setCustomValidity("Passwords do not match");
                } else {
                    confirm_password.setCustomValidity('');
                }
            }

            password.onchange = validatePassword;
            confirm_password.onkeyup = validatePassword;

        });
    </script>
</head>
<body data-ma-theme="cyan">
    
    <div class="login">
                    <div class="login__block active" id="l-forget-password">
                <div class="login__block__header palette-Purple bg">
                    <i class="zmdi zmdi-account-circle"></i>
                    Reset your Password
                </div>

                <div class="login__block__body">
                    <p class="mt-4">input your new passport and forget about your previous password</p>
                    <form method="post" action="Reset_Password.aspx?reset=true&email=<%=Request.QueryString["email"] %>">
                    <div class="form-group form-group--float form-group--centered">
                        <input id="pass" name="pass" type="password" class="form-control">
                        <label>New Password</label>
                        <i class="form-group__bar"></i>
                    </div>
                    <div class="form-group form-group--float form-group--centered">
                        <input id="confirm_pass" type="password" class="form-control">
                        <label>Confirm Password</label>
                        <i class="form-group__bar"></i>
                    </div>

                    <button type="submit" class="btn btn--icon login__block__btn"><i class="zmdi zmdi-check"></i></button>
                   </form>
                </div>
            </div>
    </div>
 
        <script src="vendors/bower_components/tether/dist/js/tether.min.js"></script>
        <script src="vendors/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
        <script src="vendors/bower_components/Waves/dist/waves.min.js"></script>
        
        <!-- App functions and actions -->
        <script src="js/app.min.js"></script>
</body>
</html>
