      Member()

      Include('Equates.CLW'),ONCE
      Include('Keycodes.CLW'),ONCE
      Include('Errors.CLW'),ONCE

fpInit              LONG,AUTO,NAME('Init')
fpSetUserAgent      LONG,AUTO,NAME('SetUserAgent')
fpSimplePageView    LONG,AUTO,NAME('SimplePageView')
fpSetCustomVariable LONG,AUTO,NAME('SetCustomVariable')
fpGetNetProperty LONG,AUTO,NAME('GetNetProperty')
fpGetFileVersionInfo LONG,AUTO,NAME('GetFileVersionInfo')
fpPowershellInvoke LONG,AUTO,NAME('PowershellInvoke')

  MAP
    MODULE('CWAnalyticsXX.dll') ! Don't have a DLL here with the same name as the inc/clw files!

GetNetProperty PROCEDURE(|
  *CSTRING pClassName, |
  *CSTRING pPropName) ,CSTRING,NAME('GetNetProperty'),PASCAL,RAW,DLL(1)

GetFileVersionInfo  PROCEDURE(|
  *CSTRING pFileName) ,CSTRING,NAME('GetFileVersionInfo'),PASCAL,RAW,DLL(1)

Init PROCEDURE(|
  *CSTRING pPiwikUrl, |
  *CSTRING pSiteID, |
  *CSTRING pAppRootUrl, |
  *CSTRING pTokenAuth, |
  *CSTRING pVisitorID), NAME('Init'),PASCAL,RAW,DLL(1)

PowershellInvoke  PROCEDURE(|
  *CSTRING pScript) ,CSTRING,NAME('PowershellInvoke'),PASCAL,RAW,DLL(1)

SetUserAgent PROCEDURE(|
  *CSTRING pUserAgent),NAME('SetUserAgent'),PASCAL,RAW,DLL(1)

SimplePageView PROCEDURE(|
  *CSTRING pUrl, |
  *CSTRING pDocumentTitle) ,CSTRING,NAME('SimplePageView'),PASCAL,RAW,DLL(1)

SetCustomVariable PROCEDURE(|
  LONG pID, |
  *CSTRING pName, |
  *CSTRING pValue, |
  LONG pScope),NAME('SetCustomVariable'),PASCAL,RAW,DLL(1)

    END
  END

      Include('CWAnalytics.inc'),ONCE

CWAnalytics.GetNetProperty      PROCEDURE(STRING pClassName, STRING pPropName) !,STRING,VIRTUAL 
P1 CStringClass
P2 CStringClass
  CODE

  RETURN GetNetProperty(P1.Str(pClassName), P2.Str(pPropName))
  
CWAnalytics.GetFileVersionInfo      PROCEDURE(STRING pFileName) !,STRING,VIRTUAL 
P1 CStringClass
  CODE
  RETURN GetFileVersionInfo(P1.Str(pFileName))

CWAnalytics.Init     PROCEDURE(STRING pPiwikUrl, STRING pSiteID, <STRING pAppRootUrl>, <STRING pTokenAuth>, <STRING pVisitorID>) !,BYTE,PROC ! Declare Procedure
P1 CStringClass
P2 CStringClass
P3 CStringClass
P4 CStringClass
P5 CStringClass
rv BYTE
  CODE
  rv = Level:Benign

  IF SELF.CheckFramework(NET_Framework_4_Full) <> Level:Benign
    Message('Warning!||The required .NET Framework version is not installed!||' & |
            'Framework Version Required: ' & NET_Framework_4_Full & '||' & |
            'Please contact support for assistance if this error continues to appear', 'CheckFramework', ICON:Exclamation)
    RETURN Level:Fatal
  END

  IF NOT SELF._LoadLib &= NULL
    IF SELF._LoadLib.LibraryLoaded()
      SELF._LoadLib.LlcFreeLibrary()
    END
    Dispose(SELF._LoadLib)
  END
  SELF._LoadLib &= NEW LoadLibClass

  IF NOT SELF._LoadLib &= NULL
    IF SELF._LoadLib.LlcLoadLibrary('CWAnalytics.dll') <> SUCCESS
      rv = Level:Fatal
    END
    IF SELF._LoadLib.LibraryLoaded()
      fpInit = SELF._LoadLib.LlcGetProcAddress('Init')
      fpSetUserAgent = SELF._LoadLib.LlcGetProcAddress('SetUserAgent')
      fpSimplePageView = SELF._LoadLib.LlcGetProcAddress('SimplePageView')
      fpSetCustomVariable = SELF._LoadLib.LlcGetProcAddress('SetCustomVariable')
      fpGetNetProperty = SELF._LoadLib.LlcGetProcAddress('GetNetProperty')
      fpGetFileVersionInfo = SELF._LoadLib.LlcGetProcAddress('GetFileVersionInfo')
      fpPowershellInvoke = SELF._LoadLib.LlcGetProcAddress('PowershellInvoke')

      Init(|
        P1.Str(pPiwikUrl), |
        P2.Str(pSiteID), |
        P3.Str(Choose(Omitted(pAppRootUrl)=TRUE, '', pAppRootUrl)), |
        P4.Str(Choose(Omitted(pTokenAuth)=TRUE, '', pTokenAuth)), |
        P5.Str(Choose(Omitted(pVisitorID)=TRUE, '', pVisitorID)))
    END
  END

  RETURN rv

CWAnalytics.LogEnvironment      PROCEDURE(STRING pProperty) !,VIRTUAL 
  CODE

  SELF.SimplePageView('config/environment/' & pProperty, | 
    'config/environment/' & pProperty & '/' & SELF.GetNetProperty('System.Environment', pProperty) )


CWAnalytics.PowershellInvoke    PROCEDURE(STRING pScript) !,STRING,VIRTUAL 
P1 CStringClass
  CODE
  RETURN PowershellInvoke(P1.Str(pScript))

CWAnalytics.SetUserAgent PROCEDURE(STRING pUserAgent)
P1 CStringClass
  CODE

  SetUserAgent(P1.Str(pUserAgent))

CWAnalytics.SimplePageView PROCEDURE  (STRING pUrl, STRING pDocumentTitle) !,STRING,PROC ! Declare Procedure
P1 CStringClass
P2 CStringClass
RS CStringClass
  CODE
  IF SELF._LoadLib &= NULL
    RETURN 'SELF._LoadLib &= NULL'
  END
  IF SELF._LoadLib.LibraryLoaded() = FALSE
    RETURN 'SELF._LoadLib.LibraryLoaded() = FALSE'
  END
  RS.Str(SimplePageView(P1.Str(pUrl), P2.Str(pDocumentTitle)))
  IF RS.Len() = 0
    RETURN 'OK!'
  ELSE
    RETURN RS.Str()
  END

CWAnalytics.SetCustomVariable PROCEDURE(LONG pID, STRING pName, STRING pValue, LONG pScope = CUSTOM_VAR_SCOPE:VISIT) 
P1 CStringClass
P2 CStringClass
P3 CStringClass
  CODE

  SetCustomVariable(P1.Str(pID),P2.Str(pName),P3.Str(pValue), pScope)