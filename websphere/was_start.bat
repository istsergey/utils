@echo off

rem Starts WebShpere Application Server. 
rem @author evarfolomeev

call env/was_set_env
start %WAS_HOME%\profiles\%PROFILE%\bin\startServer.bat %SERVER_NAME% -profileName %PROFILE%