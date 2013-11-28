@echo off
rem Restart WebShpere Application Server. 


call env/was_set_env
call env/was_login

call %WAS_HOME%\profiles\%PROFILE%\bin\stopServer.bat %SERVER_NAME% -profileName %PROFILE% -user %WAS_ADMIN_LOGIN% -password %WAS_ADMIN_PASS%
call %WAS_HOME%\profiles\%PROFILE%\bin\startServer.bat %SERVER_NAME% -profileName %PROFILE%

