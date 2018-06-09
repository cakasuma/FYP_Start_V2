<%@ Page Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="App_DES_Encryption.aspx.cs" Inherits="FYP_Start_V2.App_DES_Encryption" %>

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
            <h1>DES Encryption</h1>

        </header>
        <div class="card">
            <div class="card-header">
                <h2 class="card-title">What is DES Encryption?</h2>
                <small class="card-subtitle">The Data Encryption Standard (DES) is a symmetric-key algorithm for the encryption of electronic data. Although insecure, it was highly influential in the advancement of modern cryptography.</small>
            </div>
        </div>
        <div class="card">
            <div class="card-header">
                <h2 class="card-title">Encryption Test</h2>
                <small class="card-subtitle">test des encryption and see how fast it is to encrypt and decrypt data</small>
            </div>
            <div class="card-block">
                <form method="post" action="App_DES_Encryption.aspx?testencrypt=true" runat="server">
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
                <small class="card-subtitle">DES is an implementation of a Feistel Cipher. It uses 16 round Feistel structure. The block size is 64-bit. Though, key length is 64-bit, DES has an effective key length of 56 bits, since 8 of the 64 bits of the key are not used by the encryption algorithm (function as check bits only).</small>
                <small class="card-subtitle">DES is based on the Feistel Cipher, all that is required to specify DES are: </small>
                <small class="card-subtitle">=> Round function</small>
                <small class="card-subtitle">=> Key schedule</small>
                <small class="card-subtitle">=> Any additional processing − Initial and final permutation</small>
            </div>
            <div class="card-block">
                <img src="demo/img/des_structure.jpg" class="img-fluid figure-img" />
            </div>
        </div>
    </div>
</asp:Content>