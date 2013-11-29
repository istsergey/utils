
@echo off

:: user configuration

set HOST=localhost:2809
set WAS_HOME=c:\IBM\Websphere\AppServer

set PROPS_DIR=c:\IBM\Websphere\AppServer\profiles\AppSrv01\properties\


:: properties

set PROPS=
set PROPS=%PROPS% -Dcom.ibm.CORBA.ConfigURL=file:/%PROPS_DIR%/sas.client.props
set PROPS=%PROPS% -Djava.naming.provider.url=corbaname:iiop:%HOST%

:: classpath

set CLASSPATH=
set CLASSPATH=%CLASSPATH%;%WAS_HOME%\java\lib\tools.jar
set CLASSPATH=%CLASSPATH%;%WAS_HOME%\runtimes\com.ibm.ws.admin.client_7.0.0.jar
set CLASSPATH=%CLASSPATH%;%WAS_HOME%\runtimes\com.ibm.ws.ejb.thinclient_7.0.0.jar
set CLASSPATH=%CLASSPATH%;%WAS_HOME%\runtimes\com.ibm.ws.orb_7.0.0.jar
set CLASSPATH=%CLASSPATH%;%WAS_HOME%\java\lib\jconsole.jar

:: start jconsole using was jdk

start %WAS_HOME%\java\bin\javaw.exe -classpath %CLASSPATH% %PROPS% sun.tools.jconsole.JConsole service:jmx:iiop://%HOST%/jndi/JMXConnector 