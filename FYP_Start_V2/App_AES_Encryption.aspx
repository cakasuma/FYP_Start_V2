<%@ Page Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="App_AES_Encryption.aspx.cs" Inherits="FYP_Start_V2.App_AES_Encryption" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        //function countspeed(time) {
        //    $("#direfresh").html("the speed of enc/dec: '" + time + "'ms");
        //    $("#direfresh").text("the speed of enc/dec: '" + time + "'ms");
        //    $("#direfresh").val("the speed of enc/dec: '" + time + "'ms");
        //}
        function refreshspeed() {
            $("#direfresh").load(location.href + " #direfresh");
        }
        $(document).ready(function () {
            var key = document.getElementById("seckey");
            function validatePassword() {

                if (key.value.length != 8) {
                    key.setCustomValidity("secret must be 8 characters");
                } else {
                    key.setCustomValidity('');
                }
            }

            key.onchange = validatePassword;
            key.onkeyup = validatePassword;
            
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content__inner">
        <header class="content__title">
            <h1>AES Encryption</h1>

        </header>
        <div class="card">
            <div class="card-header">
                <h2 class="card-title">What is AES Encryption?</h2>
                <small class="card-subtitle">The Advanced Encryption Standard, or AES, is a symmetric block cipher chosen by the U.S. government to protect classified information and is implemented in software and hardware throughout the world to encrypt sensitive data.</small>
            </div>
        </div>
        <div class="card">
            <div class="card-header">
                <h2 class="card-title">Encryption Test</h2>
                <small class="card-subtitle">test aes encryption and see how fast it is to encrypt and decrypt data</small>
            </div>
            <div class="card-block">
                <form method="post" action="App_AES_Encryption.aspx?testencrypt=true" runat="server">
                    <div class="col-sm-5">
                        <div class="form-group">
                            <input type="text" id="seckey" name="key" class="form-control form-control-sm" placeholder="enter your secret key" required>
                        </div>
                    </div>
                    <div class="col-sm-5">
                        <div class="form-group">
                            <input type="file" name="fileupload1" id="fileupload1" class="form-control form-control-sm" runat="server" required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-3">
                            <div class="form-group">
                                <input type="submit" name="encryptButton"  class="btn btn-primary" value="Encrypt and download" />
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="form-group">
                            <button class="btn btn-primary" onclick="refreshspeed()">check speed</button>
                            <p class="text-info" id="direfresh">the speed is <%=FYP_Start_V2.Cryptography.encdecspeed %></p>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-5">
                            <div class="form-group">
                                <input type="submit" name="decryptButton" class="btn btn-primary" value="Decrypt and download" />
                            </div>
                        </div>
                    </div>

                </form>
            </div>
        </div>
        <div class="card">
            <div class="card-header">
                <h2 class="card-title">How does it work?</h2>
                <small class="card-subtitle">Symmetric (also known as secret-key) ciphers use the same key for encrypting and decrypting, so the sender and the receiver must both know -- and use -- the same secret key. All key lengths are deemed sufficient to protect classified information up to the "Secret" level with "Top Secret" information requiring either 192- or 256-bit key lengths. There are 10 rounds for 128-bit keys, 12 rounds for 192-bit keys and 14 rounds for 256-bit keys -- a round consists of several processing steps that include substitution, transposition and mixing of the input plaintext and transform it into the final output of ciphertext.</small>
            </div>
            <div class="card-block">
                <img src="demo/img/security-aes_design.jpg" class="img-fluid figure-img" />
            </div>
        </div>
    </div>
</asp:Content>
