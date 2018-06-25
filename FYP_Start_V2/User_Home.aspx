<%@ Page Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="User_Home.aspx.cs" Inherits="FYP_Start_V2.User_Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
            if (getUrlVars()["verification"] != null) {
                swal("Yes!", "Your account has been verified", "success");
            }
            if (getUrlVars()["verificationfalse"] != null) {
                swal("No!", "Please Verify your account", "warning");
            }
        });

        function countcategory() {
            $("#wrefresh").load(location.href + " #wrefresh");
        }

        Dropzone.autoDiscover = false;
        $(function () {
            // Now that the DOM is fully loaded, create the dropzone, and setup the
            // event listeners
            var myDropzone = new Dropzone("#mDropzone");
            myDropzone.on("queuecomplete", function (file) {
                $("#wrefresh").load(location.href + " #wrefresh");
            });
        })

        //Dropzone.options.filedrop = {
        //    init: function () {
        //        this.on("queuecomplete", function (file) {
        //            $("#wrefresh").load(location.href + " #wrefresh");
        //        });
        //    }
        //};
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
                    <div class="card">
                        
                        <div class="card-header">
                            <h2 class="card-title text-center">Drag and drop file to upload</h2>
                            <small class="card-subtitle text-center">All your files will be encrypted</small>
                        </div>

                        <div class="card-block">
                            
                            <form class="dropzone" id="mDropzone" runat="server" enctype="multipart/form-data"></form>
                        </div>
                          
                        <div class="card-header">
                            <button class="btn btn--float mar-bot-20" onclick="countcategory();">Refresh</button>
                            <h2 class="card-title text-center">All your files are here</h2>
                            <small class="card-subtitle text-center">Categorized</small>
                        </div>
                        <div id="wrefresh" style="margin: auto;margin-bottom:30px">
                        <div class="row">
                            <div class="flex-lg-row-reverse" style="display:grid">
                                <a href="User_Files.aspx?file_category=document&notags=false" class="card-block"><img style="width:50px;" src="img/documents.png" alt=""><span class="align-bottom" style=""><%=doc %></span></a>
                                <span class="text-center">Documents</span>
                            </div>
                            <div class="flex-lg-row-reverse" style="display:grid">
                                <a href="User_Files.aspx?file_category=compressed&notags=false" class="card-block"><img style="width:50px;" src="img/compressed.png" alt=""><span class="align-bottom" style=""><%=com %></span></a>
                                <span class="text-center">Compressed</span>
                            </div>
                            <div class="flex-lg-row-reverse" style="display:grid">
                                <a href="User_Files.aspx?file_category=application&notags=false" class="card-block"><img style="width:50px;" src="img/application.png" alt=""><span class="align-bottom" style="margin-left:1px"><%=app %></span></a>
                                <span class="text-center">Application</span>
                            </div>  
                            <div class="flex-lg-row-reverse" style="display:grid">
                                 <a href="User_Files.aspx?file_category=image&notags=false" class="card-block"><img style="width:50px;" src="img/images.png" alt=""><span class="align-bottom" style=""><%=img %></span></a>
                                <span class="text-center">Image</span>
                            </div> 
                            <div class="flex-lg-row-reverse" style="display:grid">
                                <a href="User_Files.aspx?file_category=music&notags=false" class="card-block"><img style="width:50px;" src="img/music.png" alt=""><span class="align-bottom" style=""><%=mus %></span></a>
                                <span class="text-center">Music</span>
                            </div> 
                            <div class="flex-lg-row-reverse" style="display:grid">
                                <a href="User_Files.aspx?file_category=video&notags=false" class="card-block"><img style="width:50px;" src="img/video.png" alt=""><span class="align-bottom" style=""><%=vid %></span></a>
                                <span class="text-center">Video</span>
                            </div>    
                            <div class="flex-lg-row-reverse" style="display:grid">
                                <a href="User_Files.aspx?file_category=miscellaneous&notags=false" class="card-block"><img style="width:50px;" src="img/misc.png" alt=""><span class="align-bottom" style=""><%=msc %></span></a>
                                <span class="text-center">Miscellaneous</span>
                            </div> 
                                
                        </div>

                    </div>
                        </div>
        <script type="text/javascript">

    </script>

</asp:Content>