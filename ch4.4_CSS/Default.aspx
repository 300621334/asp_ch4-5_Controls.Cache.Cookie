<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<script runat="server">
</script>
<html>
<head runat="server">
<title>Testing CSS</title>


<link rel="Stylesheet" type="text/css" href="Styles.css" />
</head>
<body>
<form id="form1" runat="server">
<div>
<p class="title">
Please select a product:</p>
<p>
<asp:DropDownList ID="productsList" CssClass="dropdownmenu" runat="server">
<asp:ListItem Text="Shirt" Selected="true" />
<asp:ListItem Text="Hat" />
<asp:ListItem Text="Pants" />
<asp:ListItem Text="Socks" />
</asp:DropDownList>
</p>
<p>
<asp:TextBox ID="quantityTextBox" CssClass="textbox" runat="server" />
</p>
<p>
<asp:Button ID="addToCartButton" CssClass="button"
Text="Add To Cart" runat="server" />
</p>
</div>
</form>
</body>
</html>
