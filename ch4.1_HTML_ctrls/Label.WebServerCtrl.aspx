<%@ Page MaintainScrollPositionOnPostback="true" Language="C#" AutoEventWireup="true" CodeFile="Label.WebServerCtrl.aspx.cs" Inherits="Label" %>

<%-- MaintainScrollPositionOnPostback=true keeps page scrolling back to top e ea PostBack. Alternate is using anchors or Ajax to update a portion of page only  http://stackoverflow.com/questions/10134963/prevent-page-scrolling-after-postback --%>

<%--You can activate IntelliSense yourself by pressing
Ctrl+Space. Then, once you’ve selected the correct entry, press Tab or Enter to have
the word completed for you.--%>


<!DOCTYPE html>
<script runat="server">
    public void Page_Load(Object s, EventArgs e)
    {
        myLabel.Text = "Hello";
        myLiteral.Text = "<br>asp:Literal doesn't wrap text in span-tag";


        //init & add a btn at PlaceHolder:
        HtmlButton myBtn = new HtmlButton();
        myBtn.InnerText = "btn added at PlaceHolder";
        myPlaceHolder.Controls.Add(myBtn);
    }
    public void ChangeText(object sender, EventArgs e)
    {
        myButton.Text = "Thank You!";
    }
    protected void showCoOrdinates(object sender, ImageClickEventArgs e) //ImageClickEventArgs
    {
        messageLabel.Text = "Coordinate: " + e.X + "," + e.Y;
    }


    protected void hide_Panel(object sender, EventArgs e)
    {
        //myPanel.Visible = false;
        myPanel.Visible = (myPanel.Visible ? false : true);
        //myPanel.Visible = myPanel.Visible ? false : true; //ALso works. exp just before ? is evaluated

    }

    public void multiViewSwitch(Object s, EventArgs e)
    {
        //myMultiView.ActiveViewIndex = (myMultiView.ActiveViewIndex + 1) % 2;
        myMultiView.ActiveViewIndex = myMultiView.ActiveViewIndex==0?1:0;

    }

    void SelectionChanged(Object s, EventArgs e)
    {
        calLabel.Text = "";//empty Label of any previous text. Then go thru collection of day(s) selected
        foreach (DateTime d in myCal.SelectedDates)
        {
            calLabel.Text += d.ToString("D") + "<br />";
        }
    }
</script>



<html>
<head runat="server">
    <title>Label-Web Control</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="myLabel" Text="aaa" runat="server"></asp:Label>
            <asp:Literal ID="myLiteral" runat="server"></asp:Literal>

            <p>SingleLine TextBox has col while Rows don't work:
                <asp:TextBox TextMode="SingleLine" Rows="30" Columns="30" Text="TextMode-SingleLine" ID="singleLineTextBox" runat="server"></asp:TextBox></p>
            <%--For TextMode=password the Text att doesn't produce any value att in HTML, so box stays empty.--%>
            <p>Password:
                <asp:TextBox TextMode="Password" Columns="30" runat="server" ID="pwdTextBox" Text="TextMode-password"></asp:TextBox></p>
            <%--If nothing bw opening & closing tags then can use shorthand slash within the opening tag & skip the closing tag--%>
            <p>Comments:multilineTextBox has col & rows:
                <asp:TextBox TextMode="MultiLine" Columns="30" Rows="5" runat="server" ID="multilineTextBox" />
            </p>
            <%--onClick & onServerClick both in a tag http://stackoverflow.com/questions/4830095/asp-net-button-onserverclick-only-works-when-onclick-isnt-defined --%>
            <%--http://www.dreamincode.net/forums/topic/57937-onclick-vs-onserverclick/--%>
            <p>
                <asp:Button OnClick="ChangeText" Text="Register" runat="server" ID="myButton" />
            </p>
            <p></p>
            <p>
                <asp:ImageButton ID="myImgButton" ImageUrl="btn.png" runat="server" OnClick="showCoOrdinates" /></p>
            <p>
                <asp:Label ID="messageLabel" runat="server" /></p>
            <p>
                <asp:LinkButton ID="myLinkButon" Text="LinkButton-is just a text that behaves as a btn. If type='Submit' then it will probaby submit the form!!" runat="server" /></p>
            <p>
                <asp:HyperLink NavigateUrl="http://google.com" runat="server" ID="myLink">This text URL could be made into an Image Url by using>> ImageUrl="~/btn.png"<< in which case the text is demoted to acting as the image’s alternate text</asp:HyperLink></p>
            <p>
                <asp:CheckBox Text="It's a CheckBox e att like checked & OnCheckedChanged" Checked="True" OnCheckedChanged="ChangeText" runat="server" ID="questionCheck" />
            </p>
            <p></p>
            <p>
                <asp:RadioButton OnCheckedChanged="ChangeText" GroupName="City" Text="San Diego" ID="sanDiego" runat="server" /><br />
                <asp:RadioButton GroupName="City" Text="Boston" ID="boston" runat="server" /><br />
                <asp:RadioButton GroupName="City" Text="Phoenix" ID="phoenix" runat="server" /><br />
                <asp:RadioButton GroupName="City" Text="Seattle" ID="seattle" runat="server" />
            </p>
            <p>
                <asp:Image ToolTip="ToolTip" ImageUrl="~/btn.png" AlternateText="image of button" runat="server" ID="myImage" />
            </p>


            <p> Hover over top-left corner of btn & see status-bar shows _doPostBack coz HotSpotMode="PostBack" att in asp:ImageMap....HotSpotMode="PostBack" OnClick="ChangeText"  cause ALL hotSpots to raise Click(instead of navigate to URL!) event UNLESS overriden by a latter Mode. </p>
            <p>
                <asp:ImageMap HotSpotMode="PostBack" OnClick="ChangeText" ImageUrl="~/btn.png" AlternateText="aaa" ToolTip="ImageMap" ID="myImageMap" runat="server">
                    <%--X & Y in HotSpot are the coords of ctr of circle, with respect to image--%>
                    <asp:CircleHotSpot HotSpotMode="Navigate" NavigateUrl="~/btn.png" Radius="30" X="0" Y="0" />
                    <asp:CircleHotSpot Radius="30" X="70" Y="70" />
                    
                </asp:ImageMap>
            </p>



            <p>On Page_Load() etc ANY element/tag/control/btn can be added at asp:placeholder control. While in asp:Label we could just add text!!!. I'm adding a btn below</p>
            <p>
                <asp:PlaceHolder ID="myPlaceHolder" runat="server"></asp:PlaceHolder>
            </p>


            <b>"Panel"</b> is like a div & contains other controls. It's a block that could be hid as a unit etc.<br>
            <b>"MultiView"</b> ctrl (p-133) is similar to panel; contains other controls; but stores more pages(views) & we can select 'ActiveViewIndex' to show only one page. <br>
            <b>"Wizard"</b> control(see documentation) is a more advanced version of the MultiView control. It can display one or more pages at a time.
            <p>
                <asp:Panel ID="myPanel" runat="server">
                    Name:
                    <asp:TextBox runat="server"></asp:TextBox><br />
                    pwd:
                    <asp:TextBox TextMode="Password" runat="server"></asp:TextBox><br />
                </asp:Panel>
                <br />

                <%--btn to hide panel above--%>
                <asp:Button Text="hidePanel" OnClick="hide_Panel" ID="hidePanel" runat="server" />
            </p>
            <p>
                <asp:MultiView ActiveViewIndex="0" runat="server" ID="myMultiView" >
                    <asp:View  runat="server" ID="view0"><p>This is first view of MultiView - index=0</p></asp:View>
                    <asp:View  runat="server" ID="view1"><p>Second view of MultiView...</p></asp:View>
                </asp:MultiView>
                <asp:Button Text="MultiView Switch" runat="server" ID="btnMultiView" OnClick="multiViewSwitch" />
            </p>


            All of following Lists (except BulletList) fire <b>"onSelectedIndexChanged"</b> e  AutoPostBack="True",, 
            <br>
            DropDownList:
            <p>
                <asp:DropDownList ID="ddlFavColor" runat="server">
                    <asp:ListItem Text="Red" Value="red" />
                    <asp:ListItem Text="Blue" Value="blue" />
                    <asp:ListItem Text="Green" Value="green" />
                </asp:DropDownList>
            </p>


            <p> ListBox control equates to the HTML select element with either the multiple or size attribute set ( size would need to be set to a value of 2 or more)</p>
       ListBox: 
            <p>
                <asp:ListBox ID="listTechnologies" runat="server" SelectionMode="Multiple">
                    <asp:ListItem Text="ASP.NET" Value="aspnet" />
                    <asp:ListItem Text="JSP" Value="jsp" />
                    <asp:ListItem Text="PHP" Value="php" />
                    <asp:ListItem Text="CGI" Value="cgi" />
                    <asp:ListItem Text="ColdFusion" Value="cf" />
                </asp:ListBox>
            </p>


            RadioButtonList: grouped auto e-out GroupName:
            <p>
                <asp:RadioButtonList ID="favoriteColor" runat="server">
                    <asp:ListItem Text="Red" Value="red" />
                    <asp:ListItem Text="Blue" Value="blue" />
                    <asp:ListItem Text="Green" Value="green" />
                </asp:RadioButtonList>
            </p>



            CheckBoxList:    
            <p>
                <asp:CheckBoxList ID="favoriteFood" runat="server">
                    <asp:ListItem Text="Pizza" Value="pizza" />
                    <asp:ListItem Text="Tacos" Value="tacos" />
                    <asp:ListItem Text="Pasta" Value="pasta" />
                </asp:CheckBoxList>
            </p>


           p-118: BulletedList: ... has  <b>DisplayMode</b> , which can be Text (the default), or HyperLink , which will render the list items as links. When DisplayMode is set to HyperLink , you can use the onClick event. FirstBulletNumber="3"/"c" starts from 3/c... <b>BulletStyle</b> can be
■ Numbered (1, 2, 3, …)
■ LowerAlpha (a, b, c, …)
■ UpperAlpha (A, B, C, …)
■ LowerRoman (i, ii, iii, …)
■ UpperRoman (I, II, III, …)
■ Circle
■ Disc
■ Square
■ CustomImage (BulletStyleImageUrl="")
       
        
         <p>
             <asp:BulletedList DisplayMode="HyperLink" BulletStyle="LowerRoman" ID="BulletedList1" runat="server">
                 <asp:ListItem Text="Pizza" Value="http://google.com" />
                 <asp:ListItem Text="Tacos" Value="http://hotmail.com" />
                 <asp:ListItem Text="Pasta" Value="pasta" />
             </asp:BulletedList>
         </p>

            Book-p-121:
            <p>
                <asp:Calendar OnSelectionChanged="SelectionChanged" SelectionMode="DayWeekMonth" ShowGridLines="true" DayNameFormat="Full" FirstDayOfWeek="Monday" NextPrevFormat="FullMonth" SelectWeekText="Choose a week" runat="server" ID="myCal"></asp:Calendar>
            </p>
            <p>
                <h1>You selected these dates:</h1>
                <asp:Label ID="calLabel" runat="server" />
            </p>


            AdRotator: Rotates The Ads i.e. to place ads (specified in XML file) randomly across the page. XML file must have only one ROOT node e.g. "Advertisements" and as many child nodes "Ad" and property-nodes"URL" & attributes inside each tag. Refresh page & see one ad appears more fr than other.
            <p><asp:AdRotator AdvertisementFile="~/ads.xml" runat="server" ID="adRotator" /> </p>


            

            <p>
                <b>TreeView</b> can pull its data from various sources. p-129 for details. <b>menu</b> ctrl is similar to TreeView but diff appearance.<br />
            It goes along with <B>SiteMapDataSource</B> ctrl which reads "Web.sitemap" file, but doesn't generate any HTML<br />
                ShowStartingNode=false causes parent node to not show up.

                
                <asp:SiteMapDataSource ShowStartingNode="false" runat="server" id="mySiteMapDataSource"/>
                <asp:TreeView runat="server" ID="myTreeView" DataSourceID="mySiteMapDataSource" />
            </p>

            <p>
                <B>SiteMapPath</B> uses data pulled by it's own SiteMapDataSource or elsewhere on page, and display BREAD-CRUMBs.  if you don’t have a file named Default.aspx in the directory, the root node link won’t work<br>
                <asp:SiteMapPath PathSeparator=" > " DataSourceID="mySiteMapDataSource" runat="server" ID="mySiteMapPath" />
            </p>

            <p></p>

            <p></p>

            <p></p>

            <p></p>

            <p></p>

            <p></p>

            <p></p>

            <p></p>

            <p></p>

            <p></p>
            <p></p>

            <p></p>

            <p></p>

            <p></p>

            <p></p>

            <p></p>

            <p></p>

            <p></p>

            <%--    ID=""  runat ="server"    --%>



            <br />
            <br />
            <br />
            <br />
        </div>
    </form>
</body>
</html>
