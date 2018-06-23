<%@ Page Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="Login_Register.aspx.cs" Inherits="FYP_Start_V2.Login_Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="js/sweetalert.js"></script>
    <script src="js/loginregister.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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

                    <div class="form-group form-group--float form-group--centered">
                        <input type="password" name="seckey" id="seckey" class="form-control" required>
                        <label>Secret Key (Please <strong>remember</strong> this key to unlock you files)</label>
                        <i class="form-group__bar"></i>
                    </div>

                    <div class="form-group form-group--float form-group--centered">
                        <input type="password" id="conseckey" class="form-control" required>
                        <label>Confirm Secret Key</label>
                        <i class="form-group__bar"></i>
                    </div>
                    <div class="form-group">
                        <label class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" required>
                            <span class="custom-control-indicator"></span>
                            <span class="custom-control-description">Accept the license agreement  </span>


                        </label>
                        <button type="button" class="btn btn--icon" data-toggle="modal" data-target="#modal-small" style="padding: 0px"><i class="zmdi zmdi-info"></i></button>
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


</asp:Content>



