    PROGRAM

    Include('ConsoleSupport.inc'),ONCE
    Include('CWAnalytics.inc'),ONCE

    MAP
Main    PROCEDURE()
    END
    CODE
    Main()

! ----------------------------------------------------------------------------------
Main        PROCEDURE()
Console         ConsoleSupport
Analytics       CWAnalytics
TempCS          CStringClass
    CODE

    IF Console.Init()
        Halt()
    END
    Console.Prefix = 'CIDC >'
  
    Console.WriteLine('Hi Folks')

    Analytics.Init( 'http://piwik.local', 1, 'ConsoleTest')
  
    Console.WriteLine('Some sample page view actions')
    Analytics.SimplePageView('console/Init', 'console/Start of the Console Program')
    Console.WriteLine('Set Custom Variables') 
    Analytics.SetCustomVariable(1, 'Edition', 'Free')
    Analytics.SetCustomVariable(2, 'Version', '9')
    Analytics.SetCustomVariable(3, 'Build', '10371')
    TempCS.Str( Analytics.PowershellInvoke(|
        '[System.Diagnostics.FileVersionInfo]::GetVersionInfo(''' & |
        LongPath() & '\ClaRUN.dll'').FileVersion') |
        )
    Console.WriteLine('Powershell says ClaRun.dll FileVersion is: ')
    Console.WriteLine(TempCS.Str())
    Analytics.SetCustomVariable(4, 'ClaRun', TempCS.Str())
    
    Console.WriteLine('Log Envirnonment Data')
    Analytics.LogEnvironment('CurrentDirectory')
    Analytics.LogEnvironment('OSVersion')
    Analytics.LogEnvironment('Is64BitOperatingSystem')
    Analytics.LogEnvironment('Is64BitProcess')
    Analytics.LogEnvironment('ProcessorCount')
    Analytics.LogEnvironment('WorkingSet')
    Analytics.LogEnvironment('GetCommandLineArgs')
  
    Analytics.SetCustomVariable(1, 'page/Test', '1234', CUSTOM_VAR_SCOPE:PAGE)
  
    LOOP 10 TIMES
        Analytics.SimplePageView('ratings/random', 'ratings/random/' & Choose(Random(1, 5), 'Boring', 'OK I guess', 'Average', 'Noice', 'Awesome!'))
    END

    Analytics.SimplePageView('console/End', 'console/End of the Console Program')

    Console.WriteLine('Finished!!')
  ! =======================
    Console.ReadKey()