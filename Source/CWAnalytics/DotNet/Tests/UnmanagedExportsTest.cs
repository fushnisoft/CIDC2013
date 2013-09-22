using Fushnisoft.CWAnalytics;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;

namespace Tests
{
    
    
    /// <summary>
    ///This is a test class for UnmanagedExportsTest and is intended
    ///to contain all UnmanagedExportsTest Unit Tests
    ///</summary>
  [TestClass()]
  public class UnmanagedExportsTest
  {


    private TestContext testContextInstance;

    /// <summary>
    ///Gets or sets the test context which provides
    ///information about and functionality for the current test run.
    ///</summary>
    public TestContext TestContext
    {
      get
      {
        return testContextInstance;
      }
      set
      {
        testContextInstance = value;
      }
    }

    #region Additional test attributes
    // 
    //You can use the following additional attributes as you write your tests:
    //
    //Use ClassInitialize to run code before running the first test in the class
    //[ClassInitialize()]
    //public static void MyClassInitialize(TestContext testContext)
    //{
    //}
    //
    //Use ClassCleanup to run code after all tests in a class have run
    //[ClassCleanup()]
    //public static void MyClassCleanup()
    //{
    //}
    //
    //Use TestInitialize to run code before running each test
    //[TestInitialize()]
    //public void MyTestInitialize()
    //{
    //}
    //
    //Use TestCleanup to run code after each test has run
    //[TestCleanup()]
    //public void MyTestCleanup()
    //{
    //}
    //
    #endregion


    /// <summary>
    ///A test for Init
    ///</summary>
    [TestMethod()]
    public void InitTest()
    {
      try
      {
        string piwikUrl = "http://analytics.fushinoft.com/";
        string siteID = "1";
        string appRootUrl = "example";
        string tokenAuth = "";
        string visitorID = "";
        UnmanagedExports.Init(piwikUrl, siteID, appRootUrl, tokenAuth, visitorID);
      }
      catch (Exception e)
      {
        Assert.Fail(e.Message);
      }
    }
  }
}
