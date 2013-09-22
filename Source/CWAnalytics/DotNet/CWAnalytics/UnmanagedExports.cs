using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Drawing;
using System.IO;
using System.Net;
using System.Security.Cryptography;
using System.Text;
using System.Windows.Forms;
using Microsoft.Win32;
using Piwik.Tracker;
using RGiesecke.DllExport;
using System.Management.Automation;
using System.Collections.ObjectModel;

namespace Fushnisoft.CWAnalytics
{
  public class UnmanagedExports
  {

    private static string _piwikUrl;
    private static int _siteID;
    private const int LENGTH_VISITOR_ID = 16;
    private static string _visitorId = string.Empty;
    private static string _tokenAuth;
    private static string _userAgent;
    private static string _appRootUrl;
    private static Dictionary<string, string[]> _visitorCustomVar = new Dictionary<string, string[]>();
    private static Dictionary<string, string[]> _pageCustomVar = new Dictionary<string, string[]>();


    [DllExport("DoTest", CallingConvention = System.Runtime.InteropServices.CallingConvention.StdCall)]
    public static void DoTest(string text)
    {
      Console.Write(text);
    }

    [DllExport("Init", CallingConvention = System.Runtime.InteropServices.CallingConvention.StdCall)]
    public static void Init(string piwikUrl, string siteID, string appRootUrl, string tokenAuth = "", string visitorID = "")
    {
      Console.WriteLine(".NET> ");
      Console.WriteLine(".NET> **********************************************");
      Console.WriteLine(".NET> Inside Fushnisoft.CWAnalytics.UnmanagedExports.Init");
      Console.WriteLine(".NET> **********************************************");
      Console.WriteLine(".NET> ");

      // Clear some previous values if there were set. Just in case this is called twice
      _tokenAuth = "";
      _userAgent = "";
      _visitorId = "";
      _visitorCustomVar.Clear();
      _pageCustomVar.Clear();

      // Setup some defaults to use
      _piwikUrl = piwikUrl;
      _siteID = GetSiteID(siteID);
      if (!appRootUrl.ToLower().Contains("http"))
        _appRootUrl = "http://" + appRootUrl + "/";
      else
        _appRootUrl = appRootUrl;

      if (tokenAuth != "")
        _tokenAuth = tokenAuth;

      _userAgent = GetUserAgent();

      if (tokenAuth != "" && visitorID != "")
      {
        MD5 md5 = new MD5CryptoServiceProvider();
        Byte[] encodedGuidBytes = md5.ComputeHash(ASCIIEncoding.Default.GetBytes(System.Environment.MachineName + visitorID));
        _visitorId = BitConverter.ToString(encodedGuidBytes).Replace("-", "").Substring(0, LENGTH_VISITOR_ID);
      }

      PiwikTracker.URL = _piwikUrl;
    }

    [DllExport("SetUserAgent", CallingConvention = System.Runtime.InteropServices.CallingConvention.StdCall)]
    public static void SetUserAgent(string userAgent = "")
    {
      Console.WriteLine(".NET> SetUserAgent");
      if (userAgent == "")
      {
        _userAgent = GetUserAgent();
      }
      else
      {
        _userAgent = userAgent;
      }
    }

    [DllExport("GetNetProperty", CallingConvention = System.Runtime.InteropServices.CallingConvention.StdCall)]
    public static string GetNetProperty(string className, string propName)
    {
      Console.WriteLine(".NET> GetNetProperty");
      try
      {
        Type t = Type.GetType(className);
        if (t == null)
        {
          Console.WriteLine(".NET> Class ({0}) not found!", className);
          return "";
        }
        return t.GetProperty(propName).GetValue(t, null).ToString();
      }
      catch (Exception e)
      {
        return e.ToString();
      }
    }
    private static string GetUserAgent()
    {
      //WebBrowser browser = new WebBrowser(); <-- not happy if not called in STAThread mode!!
      string ua = "Mozilla/5.0 (compatible; MSIE " +
        GetIEVersion() + ";" + //browser.Version + "; " +
        Environment.OSVersion + ";";
      if (Environment.Is64BitOperatingSystem)
        ua += "WOW64;)";
      return ua;
    }

    private static string GetIEVersion()
    {
      //http://stackoverflow.com/questions/6197794/how-to-get-ie-version-info-in-winform
      //http://support.microsoft.com/kb/969393
      string key = @"Software\Microsoft\Internet Explorer";
      RegistryKey dkey = Registry.LocalMachine.OpenSubKey(key, false);
      if (dkey.GetValue("svcVersion") != null)
      {
        return dkey.GetValue("svcVersion").ToString(); ;
      }
      return dkey.GetValue("Version").ToString();
    }

    [DllExport("SimplePageView", CallingConvention = System.Runtime.InteropServices.CallingConvention.StdCall)]
    public static string SimplePageView(string url, string documentTitle)
    {
      Console.WriteLine(".NET> SimplePageView");
      try
      {
        var piwikTracker = new PiwikTracker(_siteID);
        if (!url.ToLower().Contains("http"))
        {
          piwikTracker.setUrl(_appRootUrl + url);
        }
        else
        {
          piwikTracker.setUrl(url);
        }
        piwikTracker.setTokenAuth(_tokenAuth);
        Rectangle res = Screen.PrimaryScreen.Bounds;
        piwikTracker.setResolution(res.Width, res.Height);
        if (_visitorId != string.Empty)
          piwikTracker.setVisitorId(_visitorId);

        foreach (var pair in _visitorCustomVar)
        {
          Console.WriteLine(".NET> Add _visitorCustomVar key: {0}, name: {1}, value: {2} ", pair.Key, pair.Value[0], pair.Value[1]);
          piwikTracker.setCustomVariable(int.Parse(pair.Key), pair.Value[0], pair.Value[1]);
        }
        foreach (var pair in _pageCustomVar)
        {
          Console.WriteLine(".NET> Add _pageCustomVar key: {0}, name: {1}, value: {2} ", pair.Key, pair.Value[0], pair.Value[1]);
          piwikTracker.setCustomVariable(int.Parse(pair.Key), pair.Value[0], pair.Value[1], CustomVar.Scopes.page);
        }

        piwikTracker.setUserAgent(_userAgent);
        var response = piwikTracker.doTrackPageView(documentTitle);
        return displayResponse(response);
      }
      catch (Exception e)
      {
        return e.ToString();
      }
    }

    [DllExport("SetCustomVariable", CallingConvention = System.Runtime.InteropServices.CallingConvention.StdCall)]
    public static void SetCustomVariable(int id, string name, string value, CustomVar.Scopes scope = CustomVar.Scopes.visit)
    {
      Console.WriteLine(".NET> SetCustomVariable");
      Console.WriteLine(".NET> scope=" + scope.ToString());
      string stringId = Convert.ToString(id);
      string[] customVar = { name, value };

      switch (scope)
      {
        case CustomVar.Scopes.page:
          if (_pageCustomVar.ContainsKey(stringId))
            _pageCustomVar[stringId] = customVar;
          else
            _pageCustomVar.Add(stringId, customVar);
          break;

        case CustomVar.Scopes.visit:
          if (_visitorCustomVar.ContainsKey(stringId))
            _visitorCustomVar[stringId] = customVar;
          else
            _visitorCustomVar.Add(stringId, customVar);
          break;

        default:
          throw new Exception("Unimplemented scope");
      }
    }

    [DllExport("PowershellInvoke", CallingConvention = System.Runtime.InteropServices.CallingConvention.StdCall)]
    public static string PowershellInvoke(string command)
    {
      PowerShell ps = PowerShell.Create(); 
      ps.AddScript(command);
      string rs = string.Empty;
      Collection<PSObject> results = ps.Invoke();
      foreach (PSObject result in results)
      {
        rs += result + System.Environment.NewLine;
      }
      return rs;
    }


    [DllExport("GetFileVersionInfo", CallingConvention = System.Runtime.InteropServices.CallingConvention.StdCall)]
    public static string GetFileVersionInfo(string fileName)
    {
      Console.WriteLine(".NET> GetFileVersionInfo");
      try
      {
        FileVersionInfo  vi = FileVersionInfo.GetVersionInfo(fileName);
        return vi.FileVersion;
      }
      catch (Exception e)
      {
        return e.ToString();
      }
    }

    private static int GetSiteID(string siteID)
    {
      try
      {
        if (siteID.Contains("http"))
        {
          using (WebClient client = new WebClient())
          {
            string s = client.DownloadString(siteID);
            return int.Parse(s);
          }
        }
      }
      catch 
      {
        return 0;
      }

      return int.Parse(siteID);
    }

    private static string displayResponse(HttpWebResponse response)
    {
      StringBuilder sb = new StringBuilder();
      sb.AppendLine(response.StatusCode.ToString());
      Stream receiveStream = response.GetResponseStream();
      Encoding encode = System.Text.Encoding.GetEncoding("utf-8");
      // Pipes the stream to a higher level stream reader with the required encoding format. 
      StreamReader readStream = new StreamReader(receiveStream, encode);
      sb.AppendLine("\r\nResponse stream received.");
      Char[] read = new Char[256];
      // Reads 256 characters at a time.    
      int count = readStream.Read(read, 0, 256);
      sb.AppendLine("HTML...\r\n");
      while (count > 0)
      {
        // Dumps the 256 characters on a string and displays the string to the console.
        String str = new String(read, 0, count);
        sb.AppendLine(str);
        count = readStream.Read(read, 0, 256);
      }
      // Releases the resources of the response.
      response.Close();
      // Releases the resources of the Stream.
      readStream.Close();
      return sb.ToString();
    }

  }


}
