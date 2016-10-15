<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>
<%@ Register TagPrefix="uc" TagName="SmartBox" Src="SmartBox.ascx" %>

<!DOCTYPE html>
<script runat="server">
    protected void Page_Load(Object s, EventArgs e)
    {
        //alternate to LabelText="UserControlLabel1 inside uc:SmartBox
        uc1.LabelText = "UserControlLabel1";

    }
    protected void displayTxt(object s, EventArgs e)
    {
        txt1.Text = uc1.Text;
    }


</script>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Web Controls</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    Customized controls  have the file extension of a web user control is .ascx<br />
        ASP = Active Server Pages... "x" indicates .NET <br />
        ASC = Active Server Control!!!
      
        <p> 
            <uc:SmartBox runat="server" ID="uc1" />
            <asp:Button ID="btn1" runat="server" Text="What did you type" OnClick="displayTxt" /> <br />
            <asp:Label ID="txt1" runat="server" />
        </p>
        <p>  </p>
        <p>  </p>
        <p>  </p>
        <p>  </p>
        <p>  </p>
        <p>  </p>
        <p>  </p>










    </div>
    </form>
</body>
</html>
