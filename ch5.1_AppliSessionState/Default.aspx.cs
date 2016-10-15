using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Application["siteName"] = "this is Application State";
        Session["siteName"] = "this is Session State";



        //page counter - lock/unlock coz if 2 users simultaneously request page, counter might +1 instead of +2
        if (Application["PageCounter"] != null && (int)Application["PageCounter"] >= 10)
        {
            Application.Remove("PageCounter");
        }
        if (Application["PageCounter"] == null)
        {
            Application["PageCounter"] = 1;
        }
        else
        {
            Application.Lock();
            Application["PageCounter"] = (int)Application["PageCounter"] + 1;
            Application.UnLock();
        }

        //counter for Session State doesn't need lock/unlock since it save info about only one user.
        //Session.Timeout = 15; //default is 20 minutes o inactivity aft w Session info is cleared from server. Can be done anywhere in code but commonly done in Global.asax whose Session_Start method runs before first request to page is processed
        if (Session["PageCounter"] != null && (int)Session["PageCounter"] >= 10)
        {
            Session.Remove("PageCounter");
        }
        if (Session["PageCounter"] == null)
        {
            Session["PageCounter"] = 1;
        }
        else
        {
            //Application.Lock();//not needed
            Session["PageCounter"] = (int)Session["PageCounter"] + 1;
            //Application.UnLock();//not needed
        }

        // lbl2.Text += Application["PageCounter"] as string;
        lbl2.Text = "How many visits by ALL users: " + Convert.ToString( Application["PageCounter"] );
        lbl3.Text = "How many visits by a single user: " + Convert.ToString(Session["PageCounter"]);

    }



    protected void appStateRead(object sender, EventArgs e)
    {
        string siteName = Application["siteName"] as string;
        //or can CAST as:-  lbl1.Text = (string)Application["siteName"];

        if (siteName != null)
        {
            lbl1.Text = siteName;
        }

        //save a second state that's NOT inside Page_Load & try to disply it AFT removeAll.
        Application["anotherState"] = "a 2nd state NOT inside Page_Load hence removable";
               
    }



    protected void removeAll(object sender, EventArgs e)
    {
        lbl1.Text = "";

        Application.RemoveAll(); //AppState added on Page_Load doesn't remove coz PostBack restores it
        //to remove only certain state(s)//Application.Remove("siteName");

    }

    protected void secondState(object sender, EventArgs e)
    {
        //try displaying siteName & anotherState both aftr removeAll()
        string siteName = Application["siteName"] as string;
        lbl1.Text = siteName;
        

        string secondState = Application["anotherState"] as string;
        lbl1.Text += (secondState != null) ? "<br>"+secondState : "<br>***gone***";
    }

}