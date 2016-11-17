# TabPy-docker

Steps to create container:

1. `docker run -ti continuumio/miniconda:latest /bin/bash`

2. Then inside the container run:
```
git clone https://github.com/tableau/TabPy.git
cd /TabPy
/bin/bash -c "source setup.sh"
```
install and exit out (^C)

3. cd to root directory and create "start.sh":
`cat > start.sh` and the write:
```
cd /opt/conda/envs/Tableau-Python-Server/lib/python2.7/site-packages/tabpy_server
/bin/bash startup.sh 9004
```

if you want to install new packages just run:
`source activate Tableau-Python-Server`
then `pip install` whatever you want

 to run the container use this line:
`docker run -ti --rm -p 9004:9004 emhemh/tabpy:latest /bin/bash start.sh`

![TabPy](https://github.com/erichannell/TabPy-docker/blob/master/tabpy.gif "TabPy")
