<%@ Page Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="Default_Feedback.aspx.cs" Inherits="FYP_Start_V2.Default_Feedback" %>

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
            if (getUrlVars()["submittrue"] != null) {
                swal("Great!", "Your feedback has been submitted", "success");
            }
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content__inner">
        <header class="content__title">
            <h1>Feedback Form</h1>
        </header>
        <div class="card">
            <div class="card-header">
                <h2 class="card-title">Any Enquiry?</h2>
                <small class="card-subtitle">Send us anything that you want to share. your experience, or feedback regarding our system</small>
            </div>

            <div class="card-block">
                <form method="post" action="Default_Feedback.aspx?feedback=true">
                    <div class="form-group">
                        <label class="form-control-label">Title</label>
                        <input type="text" name="title" class="form-control" />
                        <i class="form-group__bar"></i>
                    </div>
                    <br />
                    <div class="form-group">
                        <label class="form-control-label">Name</label>
                        <input type="text" name="name" class="form-control" />
                        <i class="form-group__bar"></i>
                    </div>
                    <br />
                    <div class="form-group">
                        <label class="form-control-label">Email</label>
                        <input type="email" name="email" class="form-control" />
                        <i class="form-group__bar"></i>
                    </div>
                    <br />
                    <div class="form-group">
                        <textarea class="form-control textarea-autosize" name="message" placeholder="Leave a message"></textarea>
                        <i class="form-group__bar"></i>
                    </div>

                    <br>
                    <div class="form-group">
                        <input type="submit" class="btn btn-info" value="Submit" />
                    </div>
                </form>
            </div>
        </div>
    </div>
</asp:Content>
