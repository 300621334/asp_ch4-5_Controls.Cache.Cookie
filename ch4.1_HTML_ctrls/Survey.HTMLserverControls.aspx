<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Survey.HTMLserverControls.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>
<script runat="server">

    void Click(Object s, EventArgs e)
    {
        feedbackLabel.Text = "Your name is: " + name.Value + "<br />";
        feedbackLabel.Text += "Your email is: " + email.Value +"<br />";
        feedbackLabel.Text += "You like to work with:<br />";
        for (int i = 0; i <= serverModel.Items.Count - 1; i++)
        {
            if (serverModel.Items[i].Selected)
            {
                feedbackLabel.Text += " - " + serverModel.Items[i].Text + "<br />";
                //item=optionTag whose "Text" is sent as "Value" to selectTag
            }
        }
        feedbackLabel.Text += "You like .NET: " + likeDotNet.Value;//Aboe, used .Text for same type of tag "Option"!!!
       //ID is for selectTag so we used "Value". If we used ID for optionTag then we use item[i].Text

    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>HTML server controls</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <h1>Take the Survey!</h1>
<!-- Display user name -->
<p>Name:<br />
<input type="text" id="name" runat="server" />
</p>
<!-- Display email -->
<p>
Email:<br />
<input type="text" id="email" runat="server" />
</p>
<!-- Display technology options -->
<p>
Which server technologies do you use?<br />
<!--instead of multiple="Multiple" we use TRUE in ASP but translates. err if comment inside selectTags-->
<select id="serverModel" runat="server" multiple="true"> 
<option>ASP.NET</option>
<option>PHP</option>
<option>JSP</option>
<option>CGI</option>
<option>ColdFusion</option>
</select>
</p>
<!-- Display .NET preference options -->
<p>
Do you like .NET so far?<br />
<select id="likeDotNet" runat="server">
<option>Yes</option>
<option>No</option>
</select>
</p>
<!-- Display confirmation button -->
<p>
<button id="confirmButton" OnServerClick="Click"
runat="server">Confirm</button>
</p>
<!-- Confirmation label -->
<p>
<asp:Label id="feedbackLabel" runat="server" />
</p>
</div>
</form>
</body>
</html>
    </div>
    </form>
</body>
</html>
