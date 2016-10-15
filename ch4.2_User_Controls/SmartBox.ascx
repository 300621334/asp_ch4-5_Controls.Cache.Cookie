<%@ Control ClassName="SmartBox" Language="C#" AutoEventWireup="true" %>
<%--Inherits="SmartBox" tells that in codeBehind.cs file there's an explictly defined C#-class by this name. If NO codeBehind.cs files is used and I deleted in here & C# is defined in-line in script-tag then coz i deleted .cs file so had to delete CodeFile="" and Inherits="" attributes.  In such case (inLine script) ClassName="SmartBox" att in directive "control" gives a name to implicitly generated C# class --%>

<script runat="server">//err if no runat inside script-tag
    public String LabelText //prop of userCtrl
    {
        set
        {
            myLabel.Text = value;
        }
    }

    public String Text//another readOnly prop of userCtrl
    {
        get
        {
            return myTextBox.Text;
        }
    }
</script>


<p>
    <asp:Label runat="server" ID="myLabel" Width="150" />
    <asp:TextBox Width="200" MaxLength="20" runat="server" ID="myTextBox" />
</p>
