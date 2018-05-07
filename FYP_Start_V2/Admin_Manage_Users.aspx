<%@ Page Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Admin_Manage_Users.aspx.cs" Inherits="FYP_Start_V2.Admin_Manage_Users" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
                 <div class="card">
                    <div class="card-header">
                        <h2 class="card-title">View Users</h2>
                        <small class="card-subtitle">display details information about registered users</small>
                    </div>
                     <div class="card-block">
                         <table class="table mb-3">
                            <thead  class="thead-inverse">
                            <tr>
                                <th>#</th>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Contact</th>
                                <th>Verified</th>
                            </tr>
                            </thead>
                            <tbody>
                        <%
                            while (sdr.Read())
                            {
                                int ctr = 1;
                            %>
                            <tr>
                                <th scope="row"><%=ctr %></th>
                                <td><%=sdr["Name"].ToString() %></td>
                                <td><%=sdr["Email"].ToString() %></td>
                                <td><%=sdr["Contact"].ToString() %></td>
                                <td><%=sdr["verified"].ToString() %></td>
                            </tr>
                        <%
                                ctr++;
                            } %>
                            </tbody>
                        </table>
                     </div>
                  </div>
</asp:Content>
