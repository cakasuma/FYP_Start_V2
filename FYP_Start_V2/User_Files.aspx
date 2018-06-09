<%@ Page Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="User_Files.aspx.cs" Inherits="FYP_Start_V2.User_Files" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="content__inner">
        <header class="content__title">
            <h1>Files</h1>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="User_Home.aspx">Home</a></li>
                <li class="breadcrumb-item"><%=Request.QueryString["file_category"] %></li>
                <li class="breadcrumb-item active">Files</li>
            </ol>
        </header>
        <div class="contacts row">
            <%
                if (Session["Email"] != null)
                {

                
                string email = Session["Email"].ToString();
                string user_id = FYP_Start_V2.Connection.getUserID(email);
                string[] filetags = FYP_Start_V2.Connection.loadTags(user_id);
                while (sdr.Read())
                {
                %>
            <div class="col-xl-2 col-lg-3 col-sm-4 col-6">
                <div class="dropdown actions__item float-right">
                        <i data-toggle="dropdown" class="zmdi zmdi-more-vert"></i>
                        <div class="dropdown-menu dropdown-menu-right">
                            <button class="dropdown-item" data-toggle="modal" data-target="#modal-new-todo">Add Tags</button>
                            <a href="User_Files.aspx?file_category=<%=Request.QueryString["file_category"] %>&notags=<%=Request.QueryString["notags"] %>&delete=true&fileids=<%=sdr["File_Id"] %>" class="dropdown-item">Delete</a>
                        </div>
                    </div>
                <div class="contacts__item">
                    
                    <div class="contacts__img padding-12">
                        <img src="img/Files/<%=sdr["File_Category"].ToString() %>.png" alt="">
                    </div>
                    <div class="contacts__info mar-bot-10">
                        <strong title="<%=sdr["File_Name"].ToString() %>" data-toggle="tooltip" data-placement="bottom"><%=sdr["File_Name"].ToString() %></strong>
                        <small><%=sdr["File_Status"].ToString() %></small>
                    </div>

                    <a href="User_Files.aspx?file_category=<%=Request.QueryString["file_category"] %>&notags=<%=Request.QueryString["notags"] %>&download=true&filename=<%=sdr["File_Name"] %>" class="contacts__btn">Download</a>
                    <div class="todo__labels mar-top-20">
                        <%
                            string[] filetagfiles = FYP_Start_V2.Connection.loadTagsFile(sdr["File_Id"].ToString(), user_id);
                            for (var i = 0; i < filetagfiles.Length; i++)
                            {
                            %>
                        <span class="badge badge-default lb-2"><%=filetagfiles[i] %></span>
                        <%} %>
                    </div>

                </div>

            </div>
                    <div class="modal fade" id="modal-new-todo" tabindex="-1">
                        
                        <div class="modal-dialog modal-sm">
                            <form method="post" action="User_Files.aspx?file_category=<%=Request.QueryString["file_category"] %>&notags=<%=Request.QueryString["notags"] %>&addtags=true">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title">Add tags</h5>
                                </div>
                                <div class="modal-body">
                                    
                                    <div class="form-group">
                                        <select id="tags" class="a form-control js-example-basic-multiple" name="taglabels[]" multiple="multiple">
                                            <option disabled>Select a Label</option>
                                            <%
                                                string[] filetagsfile = FYP_Start_V2.Connection.loadTagsFile(sdr["File_Id"].ToString(), user_id);
                                                for (var i = 0; i < filetags.Length; i++)
                                                {
                                                    if (filetagsfile.Contains(filetags[i]))
                                                    {
                                                %>
                                            <option value="<%=filetags[i] %>" selected="selected"><%=filetags[i] %></option>
                                            <%}
                                            else
                                            {
                                                 %>
                                            <option value="<%=filetags[i] %>"><%=filetags[i] %></option>
                                            <%}
                                                }%>
                                        </select>
                                    </div>
                                </div>
                                <input type="hidden" name="fileid" value="<%=sdr["File_Id"].ToString() %>" />
                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-link">Save</button>
                                    
                                    <button type="button" class="btn btn-link" data-dismiss="modal">Close</button>
                                </div>
                            </div>
                                </form>
                        </div>
                        
                    </div>
            
            <%}
                }
                else
                {
                    Response.Redirect("Login_Register.aspx");
                }
                %>
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/css/select2.min.css">
            <link rel="stylesheet" href="css/tags.css">
            <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/js/select2.min.js"></script>
            <script src="js/tags.js"></script>
            
        </div>
    </div>
    
</asp:Content>
