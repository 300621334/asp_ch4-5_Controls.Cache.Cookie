<%@ Page MasterPageFile="~/MasterPage.master" Title="FrontPage" Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<script runat="server">

</script>

<asp:Content runat="server" id="content1" ContentPlaceHolderID="ContentPlaceHolder1">
    <p>
        this is the content1 to be put in ContentPlaceHolder1 of masterPage<br />
        if the asp:content is not there then page displays default content inside placeHolder in masterPage (if such default content is there)
    </p>
</asp:Content>





<%--<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
    </form>
</body>
</html>--%>
