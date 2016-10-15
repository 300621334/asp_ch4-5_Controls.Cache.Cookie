<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>

<asp:Label ID="lbl1" runat="server" /><br>
<asp:Label ID="lbl2" runat="server" /><br>
<asp:Button OnClick="populateLabels" Text="populate labels" ID="btn1" runat="server" /><br>
<asp:Label ID="cookieLbl" runat="server" /><br>

    
    </div>
    </form>
</body>
</html>
