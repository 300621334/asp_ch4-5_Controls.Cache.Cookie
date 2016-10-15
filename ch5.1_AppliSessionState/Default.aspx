<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<script>
  
</script>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <p>p-182</p>
        <asp:button OnClick="appStateRead" ID="btn1" runat="server" Text="read Application State" /><br />
        <asp:Label ID="lbl1" runat="server" /><br />
        <asp:button OnClick="secondState" ID="btn3" runat="server" Text="chk if 2nd state is there?" /><br />

        <asp:button OnClick="removeAll" ID="btn2" runat="server" Text="now Remove ALL lingering app states" /><br />

        <p> - - - - - - - - -p-184 : View Counter - - - - - - - - - -</p>
        <asp:Label ID="lbl2" runat="server" ></asp:Label>

        <asp:Label ID="lbl3" runat="server" ></asp:Label>



    
    </div>
    </form>
</body>
</html>
