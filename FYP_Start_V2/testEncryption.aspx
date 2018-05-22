<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="testEncryption.aspx.cs" Inherits="FYP_Start_V2.testEncryption" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        </div>
        <asp:Button ID="Button1" runat="server" Text="Encrypt" OnClick="Button1_Click" />
        <asp:Button ID="Button2" runat="server" Text="Decrypt" OnClick="Button2_Click" />
        <p>
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        </p>
        <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
        <p>
            <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
            <asp:FileUpload ID="FileUpload1" runat="server" />
        </p>
    </form>
</body>
</html>
