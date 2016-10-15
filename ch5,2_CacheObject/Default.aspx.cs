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
        string xxx = "Lets say this is a table read from a DataBase";
        string yyy = "A second table";

        
        //cache is alternative to Application State while Cookies to Sesssion State!!!
        //cookie exp on closing browser(like SessionState) UNLESS we set exp in future & make them persistent
        //2 ways to create a Cache. 2nd line sets expiry time to 1 minutes.
        Cache["anyTable"] = xxx;
        Cache.Insert("secondTable", yyy, null, DateTime.MaxValue, TimeSpan.FromMinutes(1) );

        
        
        //chk if a specific Cache doesn't exist then create one.
        if(Cache["anyTable"] == null)
        {
            //read from DB & write to var
            Cache["anyTable"] = xxx;
        }
        else
        {
            //use that cache
        }


        //Now do a Cookie. Read e "Request". Made e 'Response'. 
        HttpCookie myCookie;
        myCookie = Request.Cookies["userID"];//tried to read a cookie
        if(myCookie == null)//if above cookie did not exist then make one
        {
            cookieLbl.Text = "specified cookie not found so just made one.";

            myCookie = new HttpCookie("userID", "Mani");//init a cookie
            myCookie.Expires = DateTime.Now.AddSeconds(10);//set expiry for cookie
            Response.Cookies.Add(myCookie);//added cookie to client's browser

        }
        else
        {
            cookieLbl.Text = "Found specified cookie e value = " + myCookie.Value + " ..    .try again aft 10 sec";
        }




    }


    //Method for onClick
    protected void populateLabels(object sender, EventArgs e)
    {
        string aaa = Cache["anyTable"] as string;
        string bbb = Cache["secondTable"] as string;

        lbl1.Text = aaa;
        lbl2.Text = bbb;
    }
}