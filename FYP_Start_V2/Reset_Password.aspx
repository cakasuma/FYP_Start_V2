<%@ Page Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="Reset_Password.aspx.cs" Inherits="FYP_Start_V2.Reset_Password" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="js/sweetalert.js"></script>
    <script src="js/reset.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
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
</asp:Content>
