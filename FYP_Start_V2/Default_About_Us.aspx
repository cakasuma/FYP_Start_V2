<%@ Page Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="Default_About_Us.aspx.cs" Inherits="FYP_Start_V2.Default_About_Us" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content__inner">
        <header class="content__title">
            <h1>About Us</h1>
        </header>
        <div class="card">
            <div class="card-header">
                <h2 class="card-title">What is AFMOS System?</h2>

            </div>
            <div class="card-block">
                The Associated File Manager Online System (AFMOS) is a development project created by Mustofa Ghaleb Amami to fulfil Final Year Project in Asia Pacific University. 
                This application aim the student to easily managed their files with using sortion by tags/label. while users also able to try several encryption provided.
                The servers are uploaded on Azure Cloud to become robust and efficient infrastructure befitting better application.
                Furthermore, this application used AES Encryption to encrypt the files and Hash for User password.
            </div>
        </div>
        <div class="data-columns">
            <div class="card widget-contacts">
                <div class="card-header">
                    <h2 class="card-title">Contact Information</h2>
                    <small class="card-subtitle">Associated File Manager Online System</small>
                </div>
                <div class="card-block">
                    <ul class="icon-list">
                        <li><i class="zmdi zmdi-phone"></i>+60182655318</li>
                        <li><i class="zmdi zmdi-email"></i>amammustofa@gmail.com</li>
                        <li><i class="zmdi zmdi-facebook-box"></i>amam_ghaleb</li>
                        <li><i class="zmdi zmdi-twitter"></i>@amammustofa (twitter.com/amammustofa)</li>
                        <li><i class="zmdi zmdi-pin"></i>
                            <address>
                                1/149 Endah Promenade Condominium Sri Petaling Malaysia
                            </address>
                        </li>
                    </ul>
                </div>

                <a class="widget-contacts__map" href="#">
                    <img src="demo/img/widgets/map.png" alt="">
                </a>
            </div>
        </div>
    </div>
</asp:Content>
