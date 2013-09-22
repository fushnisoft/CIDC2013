

      Member()
         omit('***$***',_VER_C55)
_ABCDllMode_  EQUATE(0)
_ABCLinkMode_ EQUATE(1)
         ***$***
      Include('Equates.CLW'),ONCE
      Include('Keycodes.CLW'),ONCE
      Include('Errors.CLW'),ONCE
Omit('!!!Docs!!!')

Class Methods
=============

!!!Docs!!!
      Map
      End ! map
      Include('DotNetSupport.inc'),ONCE
!!! <summary>
!!! Generated from procedure template - Source
!!! </summary>
DotNetSupport.Construct PROCEDURE                          ! Declare Procedure

  CODE
!!! <summary>
!!! Generated from procedure template - Source
!!! </summary>
DotNetSupport.Destruct PROCEDURE                           ! Declare Procedure

  CODE
!!! <summary>
!!! Generated from procedure template - Source
!!! </summary>
DotNetSupport.CheckFramework PROCEDURE  (STRING pFramework) !,BYTE ! Declare Procedure
cmd                             CSTRING(255)
errCode                         LONG
runCodeVal                      LONG
err                             CSTRING(255)
NDPKey                          CSTRING(255)
Omit('!!!Docs!!!')

.. _method-dotnetsupport-checkframework:

.. describe:: CheckFramework (*STRING pFramework) ,BYTE

   **pFramework**  Supply one of the "NET_Framework_xxx" equates to specifiy which framework to look for.

   **Return Value**  One of the *LEVEL* equates to indicate success (Level:Benign) or failure (LEVEL:Fatal, Level:Notify).

.. Note:: Currently this only supports NET_Framework_4_Client and NET_Framework_4_Full, if there is a requirement in the future for others then they can be implemented as needed.

!!!Docs!!!

Omit('***')
Exit codes

The verification tool can returns the following exit codes:

    0 - verification completed successfully for the specified product
    1 - the required file setupverifier.ini was not found in the same path as setupverifier.exe
    2 - a product name was passed in that cannot be verified because it does not support installing on the OS that the tool is running on
    3 - a product name was passed in that does not exist in setupverifier.ini
    100 - verification failed for the specified product
    1602 - verification was canceled
*** |

  CODE
  IF InList(pFramework, NET_Framework_4_Client, NET_Framework_4_Full) = FALSE
    ! Detection does not currently support anything other than framework 4
    ! Hopfully we never need to!
    RETURN Level:Fatal
  END
  
  ! Check to see if Framework v4.0 is installed because sometimes LoadLibrary still works even though the framework is not there.
  ! This stops the initial call to InitSmo from failing.
  IF pFramework = NET_Framework_4_Client
    NDPKey = GetReg(REG_LOCAL_MACHINE, 'SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Client', 'Install')
  END
  IF NDPKey <> 1
    NDPKey = GetReg(REG_LOCAL_MACHINE, 'SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full', 'Install')
  END

  IF NDPKey = 1 
    SELF.frameworkOK = TRUE
    RETURN Level:Benign
  ELSE
    RETURN Level:Fatal
  END

! Well... as much as I would like to use this method, clarion doesnt return the exit codes correctly...
  ! Ok, so it turns out this does work but I am still not confortable with it to put it into production.
  ! I got an antivirus warning on RunCode() once and shipping the NETFX_SETUPVERIFIER might be a hassle
  ! Stick with the reg key test for now
  ! If we need to support more than framework 4 then maybe this could be revisited.
!  cmd = '.\' & NETFX_SETUPVERIFIER & ' /q:a /c:"setupverifier.exe /p ' & pFramework & '"'
!  cmd = 'test.bat'
!  Run(cmd, 1)
!  runCodeVal = RunCode()
!  errCode = ErrorCode()
!  err = Error()
!  Stop('CheckFramework Errorcode()=' & errCode & ',RunCode()=' & runCodeVal & ',Error()=' & err)
!  
!  CASE runCodeVal
!  OF 0 ! 0 - verification completed successfully for the specified product
!    SELF.frameworkOK = TRUE
!    RETURN Level:Benign
!  OF 1 OROF 2 OROF 3 OROF 1602
!     1 - the required file setupverifier.ini was not found in the same path as setupverifier.exe
!     2 - a product name was passed in that cannot be verified because it does not support installing on the OS that the tool is running on
!     3 - a product name was passed in that does not exist in setupverifier.ini
!     1602 - verification was canceled
!
!    RETURN Level:Fatal
!  OF 100
!     100 - verification failed for the specified product
!    RETURN Level:Notify
!
!  END
!!! <summary>
!!! Generated from procedure template - Source
!!! </summary>
DotNetSupport.InstallFramework PROCEDURE  (STRING pFramework, STRING pSupportPathForInstaller, BYTE pShowMessage=FALSE, BYTE pWaitUntilInstallComplete=TRUE) !,BYTE,PROC ! Declare Procedure
Omit('!!!Docs!!!')

.. _method-dotnetsupport-installframework:

.. describe:: InstallFramework (STRING pFramework, STRING pSupportPathForInstaller, BYTE pShowMessage=FALSE, BYTE pWaitUntilInstallComplete=TRUE) ,BYTE,PROC ! Declare Procedure

   **pFramework**  Supply one of the "NET_Framework_xxx" equates to specifiy which framework to look for.

   **pShowMessage** If you set this parameter to TRUE then a message will be displayed. 

   **pWaitUntilInstallComplete** Defaults to TRUE, set this to FALSE if you want to run the installer asynchronously.

   **Return Value**  One of the *LEVEL* equates to indicate success (Level:Benign) or failure (LEVEL:Fatal, Level:Notify).

.. Note:: Currently this does not actually perform an installation, I am waiting on discussion of how to proceed.

!!!Docs!!!
installerPath                     CSTRING(2048)

  CODE
  IF InList(pFramework, NET_Framework_4_Client, NET_Framework_4_Full) = FALSE
    ! Detection does not currently support anything other than framework 4
    ! Hopfully we never need to!
    IF pShowMessage = TRUE
      Message(pFramework & ' is not supported.','Install Framework', ICON:Exclamation)
    END
    RETURN Level:Fatal
  END

  IF pShowMessage = TRUE
    IF Message(pFramework & ' will now be installed','Install Framework', ICON:Exclamation, BUTTON:OK + BUTTON:CANCEL) = BUTTON:CANCEL
      RETURN Level:Notify
    END
  END
  
  ! At the moment we only have the one framework installer. If necessary this can be expanded in the future!
  installerPath = SELF.TrailingSlash(pSupportPathForInstaller) & 'DotNetFrameworkInstaller.exe'

  Run('cmd.exe /C "PUSHD ' & pSupportPathForInstaller & ' && ' & installerPath & ' && POPD"', pWaitUntilInstallComplete)
  IF ErrorCode() OR RUNCODE()
    RETURN Level:Fatal
  ELSE
    RETURN Level:Benign
  END

DotNetSupport.TrailingSlash          PROCEDURE(STRING pPath) !,STRING
  CODE
  IF SUB(pPath,LEN(CLIP(pPath))-1,2)='\.'
     RETURN SUB(pPath,1,LEN(CLIP(pPath))-1)
  END
  IF pPath[LEN(CLIP(pPath))]='\'
     RETURN CLIP(pPath)
  END
  RETURN CLIP(pPath) & '\'
