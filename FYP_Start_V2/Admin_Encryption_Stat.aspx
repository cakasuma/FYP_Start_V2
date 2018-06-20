<%@ Page Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Admin_Encryption_Stat.aspx.cs" Inherits="FYP_Start_V2.Admin_Encryption_Stat" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <div class="content__inner">
            <div class="content__title">
                <h1>Data Encryption Statistics</h1>
            </div>
            <div class="card">
                <div class="card-header">
                    <h1>Encryption / Decryption</h1>
                </div>

                <div class="card-block">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="text-md-left">Encryption</div>
                            <asp:Chart ID="Chart1" runat="server">
                                <Series>
                                    <asp:Series Name="Series1" YValueType="Int32">
                                    </asp:Series>
                                </Series>
                                <ChartAreas>
                                    <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                                </ChartAreas>
                            </asp:Chart>
                        </div>
                        <div class="col-md-6">
                            <div class="text-md-left">Decryption</div>
                            <asp:Chart ID="Chart2" runat="server">
                                <Series>
                                    <asp:Series Name="Series1"></asp:Series>
                                </Series>
                                <ChartAreas>
                                    <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                                </ChartAreas>
                            </asp:Chart>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </form>
</asp:Content>
