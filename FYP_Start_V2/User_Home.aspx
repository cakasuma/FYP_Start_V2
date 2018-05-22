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
                            <button class="btn btn--float" onclick="countcategory();">Refresh</button>
                            <h2 class="card-title text-center">All your files are here</h2>
                            <small class="card-subtitle text-center">Categorized</small>
                        </div>
                        <div style="margin: auto;margin-bottom:30px">
                        <div class="row" id="wrefresh">
                           
                                <a href="User_Files.aspx?file_category=document&notags=false" class="card-block" style="padding-right:20px;padding:1.1rem"><img style="width:50px;margin-bottom:10px" src="img/documents.png" alt=""><span class="align-bottom" style="padding-bottom:7px;"><%=doc %></span></a>
                                <a href="User_Files.aspx?file_category=compressed&notags=false" class="card-block" style="padding-right:20px;padding:1.1rem"><img style="width:50px;margin-bottom:10px" src="img/compressed.png" alt=""><span class="align-bottom" style="padding-bottom:7px;"><%=com %></span></a>
                                <a href="User_Files.aspx?file_category=application&notags=false" class="card-block" style="padding-right:20px;padding:1.1rem"><img style="width:50px;margin-bottom:10px" src="img/application.png" alt=""><span class="align-bottom" style="padding-bottom:7px;"><%=app %></span></a>
                                <a href="User_Files.aspx?file_category=image&notags=false" class="card-block" style="padding-right:20px;padding:1.1rem"><img style="width:50px;margin-bottom:10px" src="img/images.png" alt=""><span class="align-bottom" style="padding-bottom:7px;"><%=img %></span></a>
                                <a href="User_Files.aspx?file_category=music&notags=false" class="card-block" style="padding-right:20px;padding:1.1rem"><img style="width:50px;margin-bottom:10px" src="img/music.png" alt=""><span class="align-bottom" style="padding-bottom:7px;"><%=mus %></span></a>
                                <a href="User_Files.aspx?file_category=video&notags=false" class="card-block" style="padding-right:20px;padding:1.1rem"><img style="width:50px;margin-bottom:10px" src="img/video.png" alt=""><span class="align-bottom" style="padding-bottom:7px;"><%=vid %></span></a>
                                <a href="User_Files.aspx?file_category=miscellaneous&notags=false" class="card-block" style="padding-right:20px;padding:1.1rem"><img style="width:50px;margin-bottom:10px" src="img/misc.png" alt=""><span class="align-bottom" style="padding-bottom:7px;"><%=msc %></span></a>
                        </div>

                    </div>
                        </div>
        <script type="text/javascript">

    </script>

</asp:Content>