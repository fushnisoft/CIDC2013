using System;
using System.IO;
using Fushnisoft.CWAnalytics;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace Tests
{
  [TestClass]
  public class UnmanagedExportsTests
  {
    [TestMethod]
    public void DoTest_DoesSomething()
    {
      using (StringWriter sw = new StringWriter())
      {
        Console.SetOut(sw);

        string expected = string.Format("Ploeh{0}", Environment.NewLine);
        UnmanagedExports.DoTest(expected);
        Assert.AreEqual<string>(expected, sw.ToString());
      }
    }
  }
}
