echo "pinging github to pull latest version"
if ping -c 1 github.com &> /dev/null
then
	echo "pulling latest version"
	rm -r TabPy
	git clone https://github.com/tableau/TabPy.git
else
	echo "cannot reach github at the moment, using current version"
fi
/bin/bash /opt/conda/envs/Tableau-Python-Server/lib/python2.7/site-packages/tabpy_server/startup.sh