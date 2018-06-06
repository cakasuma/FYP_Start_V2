<%@ Page Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="User_Profile.aspx.cs" Inherits="FYP_Start_V2.User_Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content__inner content__inner--sm">
        <header class="content__title">
            <h1>Malinda Hollaway</h1>
            <small>Web/UI Developer, Edinburgh, Scotland</small>

            <div class="actions">
                <div class="dropdown actions__item">
                    <i data-toggle="dropdown" class="zmdi zmdi-more-vert"></i>
                    <div class="dropdown-menu dropdown-menu-right">
                        <a href="Reset_Password.aspx" class="dropdown-item">Change Password</a>
                        <a href="#modal-default" class="dropdown-item" data-toggle="modal" data-target="#modal-default">Change Information</a>
                        <a href="#modal-delete" class="dropdown-item" data-toggle="modal" data-target="#modal-delete">Delete Account</a>
                    </div>
                </div>
            </div>
        </header>

        <div class="modal fade" id="modal-default" tabindex="-1">
            <div class="modal-dialog">
                <form>
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title pull-left">Change information</h5>
                        </div>
                        <div class="modal-body">
                            <div class="form-group form-group--float">
                                <input type="text" name="name" class="form-control">
                                <label>Name</label>
                                <i class="form-group__bar"></i>
                            </div>
                            <div class="form-group form-group--float">
                                <input type="number" name="contact" class="form-control">
                                <label>Contact</label>
                                <i class="form-group__bar"></i>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-link">Save changes</button>
                            <button type="button" class="btn btn-link" data-dismiss="modal">Close</button>
                        </div>

                    </div>
                </form>
            </div>
        </div>
        <div class="modal fade" id="modal-delete" tabindex="-1">
            <div class="modal-dialog">
                <form>
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title pull-left">Delete Account</h5>
                        </div>
                        <div class="modal-body">
                            Are you sure to delete this account, all of the files and privacy data related will be deleted and never recover again.
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-danger">Delete</button>
                            <button type="button" class="btn btn-link" data-dismiss="modal">Close</button>
                        </div>

                    </div>
                </form>
            </div>
        </div>
        <div class="card profile">
            <div class="profile__img">
                <img src="demo/img/contacts/2.jpg" alt="">

                <a href="#" class="zmdi zmdi-camera profile__img__edit"></a>
            </div>

            <div class="profile__info">
                <p>Cras mattis consectetur purus sit amet fermentum. Maecenas sed diam eget risus varius blandit sit amet non magnae tiam porta sem malesuada magna mollis euismod.</p>

                <ul class="icon-list">
                    <li><i class="zmdi zmdi-phone"></i>308-360-8938</li>
                    <li><i class="zmdi zmdi-email"></i>malinda@inbound.plus</li>
                    <li><i class="zmdi zmdi-twitter"></i>@mallinda-hollaway</li>
                </ul>
            </div>
        </div>

    </div>
</asp:Content>
