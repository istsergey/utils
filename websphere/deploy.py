import sys,java
from java.util import Properties
from java.lang import String
from java.io import FileInputStream
lineSep = java.lang.System.getProperty('line.separator')


def isApplicationRunning(applicationName, serverName, nodeName) :
    return AdminControl.completeObjectName("type=Application,name=%s,process=%s,node=%s,*" % (applicationName, serverName, nodeName)) != ""


CELL_NAME = AdminControl.getCell()
NODE_NAME = AdminControl.getNode()
SERVER_NAME = 'server1'
APP_NAME =sys.argv[0]

for app in AdminApp.list().split(lineSeparator):
	if app ==APP_NAME:
		AdminApp.uninstall(APP_NAME)
		#AdminConfig.save()
		break
	 
AdminApp.install('ear/'+APP_NAME+'.ear')
AdminConfig.save()

appManager = AdminControl.queryNames('cell='+CELL_NAME+',node='+NODE_NAME+',type=ApplicationManager,process=server1,*')

started = isApplicationRunning(APP_NAME,SERVER_NAME,NODE_NAME)

if started == 0:
	AdminControl.invoke(appManager,'startApplication',APP_NAME)

 

