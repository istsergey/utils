@echo off

rem Stops WebShpere Application Server. 
rem @author evarfolomeev

call env/was_set_env
call env/was_login

start %WAS_HOME%\profiles\%PROFILE%\bin\stopServer.bat %SERVER_NAME% -profileName %PROFILE% -user %WAS_ADMIN_LOGIN% -password %WAS_ADMIN_PASS%