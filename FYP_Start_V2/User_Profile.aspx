<%@ Page Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="User_Profile.aspx.cs" Inherits="FYP_Start_V2.User_Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content__inner content__inner--sm">
        <header class="content__title">
            <h1><%=User_Name %></h1>
            <small><%=User_Type %></small>

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
                <form method="post" action="User_Profile.aspx?changeinfo=true">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title pull-left">Change information</h5>
                        </div>
                        <div class="modal-body">
                            <div class="form-group form-group--float">
                                <input type="text" name="name" class="form-control" value="<%=User_Name %>">
                                <label>Name</label>
                                <i class="form-group__bar"></i>
                            </div>
                            <div class="form-group form-group--float">
                                <input type="number" name="contact" class="form-control" value="<%=User_Contact %>">
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
                <form method="post" action="User_Profile.aspx?deleteaccount=true">
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
                <%if (User_Photo == "")
                    { %>
                <img src="img/guestmd.png" alt="">
                <%}
                    else
                    {%>
                <img src="img/<%=User_Photo %>" alt="">
                <%} %>
                <a href="#modal-img" data-toggle="modal" data-target="#modal-img" class="zmdi zmdi-camera profile__img__edit"></a>
            </div>


            <div class="profile__info">
                <p>Here are several information regarding this user</p>

                <ul class="icon-list">
                    <li><i class="zmdi zmdi-phone"></i><%=User_Contact %></li>
                    <li><i class="zmdi zmdi-email"></i><%=User_Email %></li>
                    <li><i class="zmdi zmdi-account"></i><%=User_Type %></li>
                </ul>
            </div>
        </div>
        <div class="modal fade" id="modal-img" tabindex="-1">
            <div class="modal-dialog">
                <form method="post" action="User_Profile.aspx?uploadimage=true" runat="server">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title pull-left">Upload image</h5>
                        </div>
                        <div class="modal-body">
                            <div>
                                <%if (User_Photo == "")
                                    { %>
                                <img src="img/guestmd.png" class="img-thumbnail rounded-circle" id="preview" />
                                <%}
                                else
                                { %>
                                <img src="img/<%=User_Photo %>" class="img-thumbnail rounded-circle" id="preview" />
                                <%} %>
                            </div>
                            <div class="form-group">

                                <input type="file" name="fileUpload1" id="fileUpload1" class="form-control" runat="server" />
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary">Upload</button>
                            <button type="button" class="btn btn-link" data-dismiss="modal">Close</button>
                        </div>

                    </div>
                </form>
            </div>
        </div>
    </div>
    <script type="text/javascript">

        function readURL(input) {

            if (input.files && input.files[0]) {

                var reader = new FileReader();



                reader.onload = function (e) {


                    $('#preview').attr('src', e.target.result);

                }

                reader.readAsDataURL(input.files[0]);

            }

        }

        $("#ContentPlaceHolder1_fileUpload1").change(function () {

            readURL(this);

        });

    </script>
</asp:Content>
