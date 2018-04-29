<%@ Page Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="FYP_Start_V2.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
                    <div class="card">
                        <div class="card-header">
                            <h2 class="card-title text-center">Drag and drop file to upload</h2>
                            <small class="card-subtitle text-center">All your files will be encrypted</small>
                        </div>

                        <div class="card-block">
                            
                            <form class="dropzone" id="mDropzone" runat="server"></form>
                        </div>
                        <div class="card-header">
                            <h2 class="card-title text-center">All your files are here</h2>
                            <small class="card-subtitle text-center">Categorized</small>
                        </div>
                        <div style="margin: auto;margin-bottom:30px">
                        <div class="row">
                            
                                <a href="#" class="card-block" style="padding-right:20px;padding:1.1rem"><img style="width:50px;margin-bottom:10px" src="img/documents.png" alt=""><span class="align-bottom" style="padding-bottom:7px;">5</span></a>
                                <a href="#" class="card-block" style="padding-right:20px;padding:1.1rem"><img style="width:50px;margin-bottom:10px" src="img/compressed.png" alt=""><span class="align-bottom" style="padding-bottom:7px;">15</span></a>
                                <a href="#" class="card-block" style="padding-right:20px;padding:1.1rem"><img style="width:50px;margin-bottom:10px" src="img/application.png" alt=""><span class="align-bottom" style="padding-bottom:7px;">1</span></a>
                                <a href="#" class="card-block" style="padding-right:20px;padding:1.1rem"><img style="width:50px;margin-bottom:10px" src="img/images.png" alt=""><span class="align-bottom" style="padding-bottom:7px;">9</span></a>
                                <a href="#" class="card-block" style="padding-right:20px;padding:1.1rem"><img style="width:50px;margin-bottom:10px" src="img/music.png" alt=""><span class="align-bottom" style="padding-bottom:7px;">20</span></a>
                                <a href="#" class="card-block" style="padding-right:20px;padding:1.1rem"><img style="width:50px;margin-bottom:10px" src="img/video.png" alt=""><span class="align-bottom" style="padding-bottom:7px;">3</span></a>
                                <a href="#" class="card-block" style="padding-right:20px;padding:1.1rem"><img style="width:50px;margin-bottom:10px" src="img/misc.png" alt=""><span class="align-bottom" style="padding-bottom:7px;">30+</span></a>
                        </div>
                    </div>
                        </div>
        <script type="text/javascript">

    </script>

</asp:Content>