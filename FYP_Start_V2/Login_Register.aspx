<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login_Register.aspx.cs" Inherits="FYP_Start_V2.Login_Register" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <title></title>
        <meta charset="utf-8">
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
                if (getUrlVars()["nouser"] != null) {
                    swal("Oops", "You are not belong to anyone", "error");
                }
                if (getUrlVars()["loginfailed"] != null) {
                    swal("Oops", "Login Failed", "error");
                }


                if (getUrlVars()["forpasssuccess"] != null) {
                    swal("Success!", "Please check your email to reset the password", "success");
                }

                if (getUrlVars()["forpassfailed"] != null) {
                    swal("Oops!", "I don't think that is the correct email", "error");
                }
                
                if (getUrlVars()["actvationsuccess"] != null) {
                    swal("Congrats!", "Your account is verified", "success");
                }

                if (getUrlVars()["activationfailed"] != null) {
                    swal("Oops", "Login Failed", "error");
                }

                if (getUrlVars()["emailexist"] != null) {
                    swal("Oops", "Email already exists", "error");
                }
                if (getUrlVars()["registrationsuccess"] != null) {
                    swal("Your account has been created!", "Verification link has been sent", "success");
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

            <!-- Login -->
            <div class="login__block active" id="l-login">
                <div class="login__block__header">
                    <i class="zmdi zmdi-account-circle"></i>
                    Hi there! Please Sign in

                    <div class="actions actions--inverse padabs">
                        <div class="dropdown">
                            <i data-toggle="dropdown" class="zmdi zmdi-more-vert actions__item"></i>

                            <div class="dropdown-menu dropdown-menu-right">
                                <a class="dropdown-item" data-ma-action="login-switch" data-ma-target="#l-register" href="#">Create an account</a>
                                <a class="dropdown-item" data-ma-action="login-switch" data-ma-target="#l-forget-password" href="#">Forgot password?</a>
                            </div>
                        </div>
                    </div>
                </div>
                <form method="post" action="Login_Register.aspx?Login=True">
                <div class="login__block__body">
                    <div class="form-group form-group--float form-group--centered">
                        <input type="email" name="emaillog" class="form-control" required>
                        <label>Email Address</label>
                        <i class="form-group__bar"></i>
                    </div>

                    <div class="form-group form-group--float form-group--centered">
                        <input type="password" name="passlog" class="form-control" required>
                        <label>Password</label>
                        <i class="form-group__bar"></i>
                    </div>
                    <button type="submit" class="btn btn--icon login__block__btn"><i class="zmdi zmdi-long-arrow-right"></i></button>
                    
                </div>
                </form>
            </div>

            <!-- Register -->
            <div class="login__block" id="l-register">
                <div class="login__block__header palette-Blue bg">
                    <i class="zmdi zmdi-account-circle"></i>
                    Create an account

                    <div class="actions actions--inverse login__block__actions">
                        <div class="dropdown">
                            <i data-toggle="dropdown" class="zmdi zmdi-more-vert actions__item"></i>

                            <div class="dropdown-menu dropdown-menu-right">
                                <a class="dropdown-item" data-ma-action="login-switch" data-ma-target="#l-login" href="#">Already have an account?</a>
                                <a class="dropdown-item" data-ma-action="login-switch" data-ma-target="#l-forget-password" href="#">Forgot password?</a>
                            </div>
                        </div>
                    </div>
                </div>
                <form method="post" action="Login_Register.aspx?Register=True">
                <div class="login__block__body">
                    <div class="form-group form-group--float form-group--centered">
                        <input type="text" name="namereg" class="form-control" required>
                        <label>Name</label>
                        <i class="form-group__bar"></i>
                    </div>

                    <div class="form-group form-group--float form-group--centered">
                        <input type="email" name="emailreg" class="form-control" required>
                        <label>Email Address</label>
                        <i class="form-group__bar"></i>
                    </div>

                    <div class="form-group form-group--float form-group--centered">
                        <input type="password" name="passreg" id="pass" class="form-control" required>
                        <label>Password</label>
                        <i class="form-group__bar"></i>
                    </div>

                    <div class="form-group form-group--float form-group--centered">
                        <input type="password" id="confirm_pass" class="form-control" required>
                        <label>Confirm Password</label>
                        <i class="form-group__bar"></i>
                    </div>

                    <div class="form-group form-group--float form-group--centered">
                        <input type="text" name="contactreg" class="form-control" required>
                        <label>Contact Number</label>
                        <i class="form-group__bar"></i>
                    </div>

                    <div class="form-group">
                        <label class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" required>
                            <span class="custom-control-indicator"></span>
                            <span class="custom-control-description">Accept the license agreement  </span>

                           
                        </label>
                         <button type="button" class="btn btn--icon" data-toggle="modal" data-target="#modal-small" style="padding:0px"> <i class="zmdi zmdi-info"></i></button>
                    </div>
                    <button type="submit" class="btn btn--icon login__block__btn"><i class="zmdi zmdi-plus"></i></button>
                </div>

                </form>
            </div>
                                       <div class="modal fade" id="modal-small" tabindex="-1">
                                <div class="modal-dialog modal-sm">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title pull-left">license agreement</h5>
                                        </div>
                                        <div class="modal-body">
                                           All your data are private and confidential.
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-link" data-dismiss="modal">Close</button>
                                        </div>
                                    </div>
                                </div>
                            </div>

            <!-- Forgot Password -->
            <div class="login__block" id="l-forget-password">
                <div class="login__block__header palette-Purple bg">
                    <i class="zmdi zmdi-account-circle"></i>
                    Forgot Password?

                    <div class="actions actions--inverse login__block__actions">
                        <div class="dropdown">
                            <i data-toggle="dropdown" class="zmdi zmdi-more-vert actions__item"></i>

                            <div class="dropdown-menu dropdown-menu-right">
                                <a class="dropdown-item" data-ma-action="login-switch" data-ma-target="#l-login" href="#">Already have an account?</a>
                                <a class="dropdown-item" data-ma-action="login-switch" data-ma-target="#l-register" href="#">Create an account</a>
                            </div>
                        </div>
                    </div>
                </div>
                <form method="post" action="Login_Register.aspx?forgotpass=True">
                <div class="login__block__body">
                    <p class="mt-4">Enter your email address to reset your password</p>

                    <div class="form-group form-group--float form-group--centered">
                        <input type="email" class="form-control" name="emailfor" required>
                        <label>Email Address</label>
                        <i class="form-group__bar"></i>
                    </div>

                    <button type="submit" class="btn btn--icon login__block__btn"><i class="zmdi zmdi-check"></i></button>
                </div>
                </form>
            </div>
        </div>

        <!-- Vendors -->
        
        <script src="vendors/bower_components/tether/dist/js/tether.min.js"></script>
        <script src="vendors/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
        <script src="vendors/bower_components/Waves/dist/waves.min.js"></script>
        
        <!-- App functions and actions -->
        <script src="js/app.min.js"></script>
    </body>

</html>
