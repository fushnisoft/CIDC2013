using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Fushnisoft.CWAnalytics;

namespace TestConsole
{
  class Program
  {
    [STAThread]
    static void Main(string[] args)
    {
      Console.WriteLine("******** Testing CWAnalytics ********");
      Console.WriteLine("Environment.CurrentDirectory=" + UnmanagedExports.GetNetProperty("System.Environment", "CurrentDirectory"));
      Console.WriteLine("CWAnalytics.dll Version=" + UnmanagedExports.PowershellInvoke(
        "[System.Diagnostics.FileVersionInfo]::GetVersionInfo('" + @"c:\Dev\CIDC2013\Downloads\InvoiceApp\CWAnalytics.dll'" + ").FileVersion"));
      Console.ReadKey();
      return;
      string piwikUrl = "http://piwik.local";
      string siteID = "1";
      string appRootUrl = "example";
      string tokenAuth = "";
      string visitorID = "";
      UnmanagedExports.Init(piwikUrl, siteID, appRootUrl, tokenAuth, visitorID);
      UnmanagedExports.SetCustomVariable(1, "fred", "1234");
      UnmanagedExports.SetCustomVariable(2, "xxx", "1234");

      UnmanagedExports.SetCustomVariable(1, "p-fred", "1234", Piwik.Tracker.CustomVar.Scopes.page);
      UnmanagedExports.SetCustomVariable(2, "p-xxx", "1234", Piwik.Tracker.CustomVar.Scopes.page);

      Console.WriteLine(UnmanagedExports.SimplePageView("firstTextXX", "/hi/there"));

      UnmanagedExports.SetCustomVariable(1, "fred", "333");
      UnmanagedExports.SetCustomVariable(2, "xxx", "555");

      UnmanagedExports.SetCustomVariable(1, "p2-fred", "6667", Piwik.Tracker.CustomVar.Scopes.page);
      UnmanagedExports.SetCustomVariable(2, "p2-xxx", "1234", Piwik.Tracker.CustomVar.Scopes.page);

      Console.WriteLine(UnmanagedExports.SimplePageView("firstTextYY", "/hi/Yo"));

      Console.ReadKey();
    }
  }
}
