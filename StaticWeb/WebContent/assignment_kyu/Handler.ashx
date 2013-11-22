<%@ WebHandler Language="C#" Class="Handler" %>

using System;
using System.Web;
using System.Text;

public class Handler : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        string callback = context.Request.QueryString[ "callback" ];
        float duration = float.Parse( context.Request.QueryString[ "duration" ] );
        float distance = float.Parse( context.Request.QueryString[ "distance" ] );
        float classValue = float.Parse( context.Request.QueryString[ "classValue" ] );
        float travelers = float.Parse(context.Request.QueryString["travelers"]);
        float surcharge = String.IsNullOrEmpty(context.Request.QueryString["surcharge"]) ? 0 : float.Parse(context.Request.QueryString["surcharge"]);

        System.Threading.Thread.Sleep( 2000 );
        float total = ((distance * duration * classValue) + surcharge) * travelers;
        
        context.Response.ContentType = "application/json";
        context.Response.ContentEncoding = Encoding.UTF8;
        context.Response.Write( callback + "({total:" + total + "})" );
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}