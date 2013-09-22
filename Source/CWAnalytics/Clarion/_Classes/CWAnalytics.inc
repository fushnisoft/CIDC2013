_CWAnalytics_ EQUATE(1)

  INCLUDE('LoadLibClass.inc'),ONCE
  INCLUDE('CStringClass.inc'),ONCE
  INCLUDE('DotNetSupport.inc'),ONCE

CUSTOM_VAR_SCOPE 	ITEMIZE,PRE()
VISIT 			   		EQUATE(0) ! Zero based for .NET!!
PAGE 					EQUATE 
 					END

!--------------------------------------------------------------------------------
!Class CWAnalytics
!
!--------------------------------------------------------------------------------
CWAnalytics          Class(DotNetSupport),Type,Module('CWAnalytics.Clw'),LINK('CWAnalytics.Clw',1)
! Properties
_LoadLib                &LoadLibClass
! Methods
GetNetProperty			PROCEDURE(STRING pClassName, STRING pPropName) ,STRING,VIRTUAL 
GetFileVersionInfo 	    PROCEDURE(STRING pFileName) ,STRING,VIRTUAL 
Init                   	PROCEDURE(STRING pPiwikUrl, STRING pSiteID, <STRING pAppRootUrl>, <STRING pTokenAuth>, <STRING pVisitorID>) ,BYTE,PROC ,VIRTUAL 
LogEnvironment			PROCEDURE(STRING pProperty) ,VIRTUAL 
PowershellInvoke 	    PROCEDURE(STRING pScript) ,STRING,VIRTUAL 
SetUserAgent			PROCEDURE(STRING pUserAgent) ,VIRTUAL 
SimplePageView         	PROCEDURE(STRING pUrl, STRING pDocumentTitle) ,STRING,PROC ,VIRTUAL 
SetCustomVariable 		PROCEDURE(LONG pID, STRING pName, STRING pValue, LONG pScope = CUSTOM_VAR_SCOPE:VISIT) ,VIRTUAL
                     END ! Class Definition
!_EndOfInclude_
