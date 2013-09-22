_DotNetSupport_ EQUATE(1)

  Omit('!!!Docs!!!')
=====================
DotNetSupport Class
=====================

.. _class-dotnetsupport:

.. describe:: DotNetSupport Class()

   Provides support for .Net Framework detection and installation.

!!!Docs!!!

! http://blogs.msdn.com/b/astebner/archive/2008/10/13/8999004.aspx
! http://stackoverflow.com/questions/3005141/custom-installer-needs-to-detect-net-framework
NETFX_SETUPVERIFIER   EQUATE('netfx_setupverifier.exe')


NET_Framework_1_0 EQUATE('.NET Framework 1.0')
NET_Framework_1_1 EQUATE('.NET Framework 1.1')
NET_Framework_1_1_SP1 EQUATE('.NET Framework 1.1 SP1')
NET_Framework_2_0 EQUATE('.NET Framework 2.0')
NET_Framework_2_0_SP1 EQUATE('.NET Framework 2.0 SP1')
NET_Framework_2_0_SP2 EQUATE('.NET Framework 2.0 SP2')
NET_Framework_3_0 EQUATE('.NET Framework 3.0')
NET_Framework_3_0_SP1 EQUATE('.NET Framework 3.0 SP1')
NET_Framework_3_0_SP2 EQUATE('.NET Framework 3.0 SP2')
NET_Framework_3_5 EQUATE('.NET Framework 3.5')
NET_Framework_3_5_SP1 EQUATE('.NET Framework 3.5 SP1')
NET_Framework_4_Client    EQUATE('.NET Framework 4 Client')
NET_Framework_4_Full  EQUATE('.NET Framework 4 Full')
!--------------------------------------------------------------------------------
!Class DotNetSupport
!
!--------------------------------------------------------------------------------
DotNetSupport        Class(),Type,Module('DotNetSupport.Clw'),LINK('DotNetSupport.Clw',1)
! Properties
frameworkOK             BYTE
! Methods
Construct              PROCEDURE   
Destruct               PROCEDURE () ,VIRTUAL 
CheckFramework         PROCEDURE (STRING pFramework) ,BYTE ,VIRTUAL 
InstallFramework       PROCEDURE (STRING pFramework, STRING pSupportPathForInstaller, BYTE pShowMessage=FALSE, BYTE pWaitUntilInstallComplete=TRUE) ,BYTE,PROC ,VIRTUAL 
TrailingSlash          PROCEDURE(STRING pPath),STRING
                     END 
!_EndOfInclude_
