@echo off

:repete

call env/was_login.bat
call env/config.bat

echo Choose deployment option:
echo.
echo      1. Only deploy
echo      2. Make and deploy 
echo.
set /P OPTION=Enter the option number: 

if %OPTION%==1 (set IsMake=0)
if %OPTION%==2 (set IsMake=1)
if [%IsMake%]==[] exit

echo Choose module:
echo.
echo      1. Module1
echo.
SET /P NUM_MODULE=Enter the module number? 

if %NUM_MODULE%==1 ( 
	if %IsMake%==1 (
		call mvn -f %DIR_PROJECT%\pom.xml clean install -T 1C
		echo Exit Code = %ERRORLEVEL%
		if not "%ERRORLEVEL%" == "0" exit /b
	)
	copy %VEC_CALC_PATH% %DIR_EAR%
	set APP_NAME=%VEC_CALC%
)


if [%APP_NAME%]==[] exit

if exist "%WAS_PROFILE%\bin\wsadmin.bat" goto runScript
echo Application Server profile installation dir is not defined correctly. Define WAS_PROFILE environment variable.
goto done

:runScript
call %WAS_PROFILE%\bin\wsadmin.bat -user %WAS_ADMIN_LOGIN% -password %WAS_ADMIN_PASS% -lang jython -f deploy.py %APP_NAME% 

set /P REPETE=Repete deployment? (Y/N):   
if /i {%REPETE%}=={y} (goto :repete)

:done