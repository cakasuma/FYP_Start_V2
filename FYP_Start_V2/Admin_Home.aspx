<%@ Page Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Admin_Home.aspx.cs" Inherits="FYP_Start_V2.Admin_Home" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content__inner">
        <header class="content__title">
            <h1>Hi Administrator</h1>

        </header>
        <div class="data-columns">
            <div class="card todo">
                        <div class="card-header">
                            <h2 class="card-title">User Feedback</h2>
                            <small class="card-subtitle">Here are several feedbacks from the user</small>
                        </div>

                        <div class="listview">
                            <%while (sdr.Read())
                                { %>
                            <div class="listview__item">
                                <label class="custom-control custom-control--char todo__item">
                                    <input class="custom-control-input" type="checkbox" value="">
                                    <span class="custom-control--char__helper"><i class="bg-amber">F</i></span>
                                    <div class="todo__info">
                                        <span><%=sdr["Message"] %></span>
                                        <small><%=sdr["DateCreated"] %></small>
                                    </div>

                                    <div class="listview__attrs">
                                        <span><%=sdr["Name"] %></span>
                                        <span><%=sdr["Email"] %></span>
                                        <span><%=sdr["Title"] %></span>
                                    </div>
                                </label>

                                <div class="actions listview__actions">
                                    <div class="dropdown actions__item">
                                        <i class="zmdi zmdi-more-vert" data-toggle="dropdown"></i>
                                        <div class="dropdown-menu dropdown-menu-right">
                                            <a class="dropdown-item" href="Admin_Home.aspx?deletefeed=<%=sdr["Feedback_Id"] %>">Delete</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%} %>
                            
                        </div>
                    </div>
        </div>
    </div>
</asp:Content>