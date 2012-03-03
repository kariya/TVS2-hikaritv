@ECHO OFF
set CH_LIST=350,351,352,380,821
set TVS_HOME=c:\Tool\tvs21230
set EXTENSION_ID=mkicbjnlokclljijikfgfjaocbamoofg
set PLUGINDIR=hikaritv
set CSV=../tvdata1.csv
set PORT=10260
set CHROME="%USERPROFILE%/Local Settings/Application Data/Google/Chrome/Application/chrome.exe" --new-window
set JAVA_HOME=C:/Program Files/Java/jre6
set JAVA="%JAVA_HOME%/bin/java"
set JRUBY_JAR=%PLUGINDIR%/jruby-complete-1.6.7.jar
set JRUBY=%JAVA% -jar %JRUBY_JAR%
set CMD=cmd.exe
set NKF=%PLUGINDIR%\nkf32.exe
set TMPCSV=%PLUGINDIR%\tmp.csv
set TMPBAT=%PLUGINDIR%\tmp.bat
set TMPEPG=%PLUGINDIR%\tmp*.tvpi
set EPGDIR=%2


c:
cd %TVS_HOME%\\Plug-In

if "%1" == "fetch" goto fetch
if "%1" == "record" goto record
if "%1" == "list" goto list
goto end

:fetch
@ECHO ON
ECHO %DATE% %TIME%
DEL %TMPCSV%
%CHROME% "chrome-extension://%EXTENSION_ID%/fetch.html?loggerPort=%PORT%&ch=%CH_LIST%"
%JRUBY% %PLUGINDIR%/logger.rb %PORT% %TMPCSV%
%JRUBY% %PLUGINDIR%/genre.rb < %TMPCSV% | %NKF% -s > %CSV%
goto end


:record
@ECHO ON
%JRUBY% %PLUGINDIR%/record.rb %EPG% > %TMPBAT%
echo %CHROME% "chrome-extension://%EXTENSION_ID%/record.html?crid=%%CRID%%" >> %TMPBAT%
%CMD% /c %TMPBAT%
goto end


:list
@ECHO ON
DEL %TMPEPG%
%CHROME% "chrome-extension://%EXTENSION_ID%/list.html?loggerPort=%PORT%"
%JRUBY% %PLUGINDIR%/logger.rb %PORT% %TMPEPG%
IF NOT EXIST %TMPEPG% goto end
FOR %%A IN (%TMPEPG%) DO %NKF% -s --in-place %%A 
COPY %TMPEPG% %EPGDIR%
goto end


:end
rem pause
