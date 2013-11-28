@echo off

rem Setups bunch of local environment settings. 
rem Should be properly configured before launch of deploy scripts.
rem @author evarfolomeev

set WAS_HOME=C:\IBM\WebSphere\AppServer
set PROFILE=AppSrv01
set SERVER_NAME=server1
set MODULE_NAME=

rem WebSphere autodeploy directory path
set WORKSPACE=%WAS_HOME%\profiles\%PROFILE%\installableApps
